import {createContext, useContext, useEffect, useState} from "react";
import {useQuerySubscription} from "react-datocms";
import {render} from 'datocms-structured-text-to-html-string';

const apiToken = "1ec4b2655bdf27fe8b5c97c43c3e80";
const query = `query {
    allMenus {
      id
      title
      submenu {
        id
        title
        link
      }
    }
    allPosts {
      id
      postType {
        name
      }
      name
      title
      subtitle
      content {
        value
      }
      featuredImage {
        url
      }
      headlineLong {
        value
      }
      headlineShort {
        value
      }
      headlineIsNotDisplaying
      date
    }
	allDashboardElements {
		id
		title
		content {
		  value
		}
		featuredImage {
		  url
		}
	  }
	  allSliderElements {
		id
		title
		content {
		  value
		}
		featuredImage {
		  url
		}
		isFeauturedImageLeft
	  }	  
}
      `;

interface DatoData {
    allMenus: Menu[];
    allPosts: PostDato[];
    allDashboardElements: DashboardElement[];
    allSliderElements: SliderElement[];
}

const emptyDatoData: DatoData = {
    allMenus: [],
    allDashboardElements: [],
    allPosts: [],
    allSliderElements: [],
}

interface Data {
    menus: Menu[];
    posts: Post[];
    sliderElements: SliderElement[];
    dashboardElements: DashboardElement[];
    status: Status;
    error: object | null;
}

export interface DashboardElement {
    id: string;
    title: string;
    content: any;
    featuredImage: any;
}

export interface SliderElement extends DashboardElement {
    isFeauturedImageLeft: boolean;
}

export interface Menu {
    id: string;
    title: string;
    link: string;
    submenu: Submenu[];
}

export interface Submenu {
    id: string;
    title: string;
    link: string;
}

interface PostDato {
    id: string;
    postType: { name: string };
    slag: string;
    name: string;
    title: string;
    subtitle: string;
    featuredImage: any;
    headlineLong: any;
    headlineShort: any;
    content: any;
    headlineIsNotDisplaying: boolean;
    date: string;
}

export interface Post extends Omit<PostDato, 'postType'> {
    postType: PostType;
}

export enum PostType {
    page = "page",
    news = "news"
}

export enum Status {
    connecting = "connecting",
    connected = "connected",
    closed = "closed"
}

const emptyData: Data = {
    menus: [],
    posts: [],
    sliderElements: [],
    dashboardElements: [],
    status: Status.closed,
    error: null
};

export const DataContext = createContext<Data>(emptyData);

export const useData = (): Data => {
    const {data: datoData, error, status: datoStatus} = useQuerySubscription({
        query: query,
        token: apiToken,
    });
    if (error) {
        console.log({error})
        return emptyData
    }
    const data: DatoData = datoData ?? emptyDatoData;
    const menus = data?.allMenus;
    const status: Status = datoStatus === "connecting" ? Status.connecting : datoStatus === "connected" ? Status.connected : Status.closed;

    const dashboardElements = data ? data.allDashboardElements.map((dashboardElement) => {
        const content = dashboardElement.content ? render(dashboardElement.content) : null;
        return {...dashboardElement, content}
    }) : [];

    const sliderElements = data ? data.allSliderElements.map((sliderElement) => {
        const content = sliderElement.content ? render(sliderElement.content) : null;
        return {...sliderElement, content}
    }) : [];

    const posts = data ? data?.allPosts.map((post) => {
        const postType = PostType[post.postType.name as keyof typeof PostType]
        const content = post.content ? render(post.content) : null;
        const headlineLong = post.headlineLong ? render(post.headlineLong) : null;
        const headlineShort = post.headlineShort ? render(post.headlineShort) : null;
        return {...post, content, headlineShort, headlineLong, postType}
    }) : [];

    return {menus, posts, dashboardElements, sliderElements, status, error};
};

interface MenuResponse {
    id: string;
    title: string;
    link: string;
    sub_menu_items: { id: string; title: string; link: string }[]
}

function useApi<T>(url: string): T[] {
    const [data, setData] = useState<T[]>([]);

    async function loadData() {
        const result = await fetch("http://localhost:8000/api/" + url);
        const d = await result.json() as T[];
        setData(d);
    }

    useEffect(() => {
        loadData()
    }, [url]);
    return data;
}

export const useMenus = (): Menu[] => {
    const menu = useApi<MenuResponse>("menu");
    return menu.map(m => ({
        id: m.id,
        title: m.title,
        link: m.link,
        submenu: m.sub_menu_items.map(s => ({id: s.id, title: s.title, link: s.link}))
    }));
};

export const usePages = () => {
    const pages = usePosts(PostType.page);
    return pages;
};

export const useNews = () => {
    const news = usePosts(PostType.news);
    return news.slice(0, 3);
};

interface DashboardElementResponse {
	id: string;
	title: string;
	featured_image: string;
	content: string;
}

export const useDashboardElements = (): DashboardElement[] => { 
    const dashboardElements = useApi<DashboardElementResponse>("dashboard_elements")
    return dashboardElements.map(e => ({
		id: e.id,
		title: e.title,
		content: e.content,
		featuredImage: {
			url: e.featured_image
		}
	}));
}

interface SliderResponse {
    id: string;
    title: string;
    content: string;
    featured_image: string;
    is_featured_image_left: boolean;
}

export const useSliderElements = (): SliderElement[] => {
    const slider = useApi<SliderResponse>("slider");
    return slider.map((s): SliderElement => ({
        id: s.id,
        title: s.title,
        content: s.content,
        featuredImage: {url: s.featured_image},
        isFeauturedImageLeft: s.is_featured_image_left
    }));
}

export const useStatus = () => {
    const {status} = useContext(DataContext);
    return status;
}

export const useError = () => {
    const {error} = useContext(DataContext);
    return error;
}

interface PostResponse {
    id: string;
    name: string;
    type: PostType;
    slug: string;
    content: string;
    title: string;
    subtitle: string;
    featured_image: string;
    headline_long: string;
    headline_short: string;
	date: string;
	headline_is_not_displaying: boolean;
}

const usePosts = (postType: PostType): Post[] => {
    const posts = useApi<PostResponse>("posts");
    const postFilteredByPostType = posts ? posts.filter((post) => post.type === postType) : [];
	return postFilteredByPostType ? postFilteredByPostType.map((post) => ({
		postType: post.type,
		slag: post.slug,
		headlineLong: post.headline_long,
		headlineShort: post.headline_short,
		featuredImage: {url: post.featured_image},
		headlineIsNotDisplaying: post.headline_is_not_displaying,
		...post,
	})) : [];
}
