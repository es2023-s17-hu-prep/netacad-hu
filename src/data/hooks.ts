import { ReactElement } from "react";
import { useQuerySubscription, StructuredText } from "react-datocms";
import { render } from 'datocms-structured-text-to-html-string';

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
	postType: {name: string};
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

export const useData = (): Data => {
	const { data: datoData, error, status: datoStatus } = useQuerySubscription({
		query: query,
		variables: { first: 10 },
		token: apiToken,
	  });
	if (error) console.log({error})
	const data: DatoData = datoData;
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
		const postType =  PostType[post.postType.name as keyof typeof PostType]
		const content = post.content ? render(post.content) : null;
		const headlineLong = post.headlineLong ? render(post.headlineLong) : null;
		const headlineShort = post.headlineShort ? render(post.headlineShort) : null;
		return {...post, content, headlineShort, headlineLong, postType}
	}) : [];
	return { menus, posts, dashboardElements, sliderElements, status, error };
};

export const useMenus = () => {
	const { menus } = useData();
	return menus;
};

export const usePages = () => {
	const pages = usePosts(PostType.page);
	return pages;
};

export const useNews = () => {
	const news = usePosts(PostType.news);
	return news;
};

export const useDashboardElements = () => {
	const { dashboardElements } = useData(); 
	return dashboardElements;
}

export const useSliderElements = () => {
	const { sliderElements } = useData(); 
	return sliderElements;
}

export const useStatus = () => {
	const { status } = useData();
	return status;
}

export const useError = () => {
	const { error } = useData();
	return error;
}

const usePosts = (postType: PostType) => {
	const { posts } = useData();
	const postFilteredByPostType = posts ? posts.filter((post) => post.postType === postType) : [];
	const post = postFilteredByPostType ? postFilteredByPostType.map((post) => {
		const {postType, ...rest} = post
		return rest
		  }) : [];
  
	return post;
}
