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
}
      `;
interface Data {
	allMenus: Menu[];
	allPosts: PostDato[];
}

interface Menu {
	id: string;
	title: string;
	link: string;
	submenu: Submenu[];
}

interface Submenu {
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

interface Post extends Omit<PostDato, 'postType'> {
	postType: PostType;
}

enum PostType {
	page = "page",
	news = "news"
}

export const useData = (): {menus: Menu[], posts: Post[]} => {
	const { data: datoData } = useQuerySubscription({
		query: query,
		variables: { first: 10 },
		token: apiToken,
	  });
	const data: Data = datoData;
	const menus = data?.allMenus;
	const posts = data ? data?.allPosts.map((post) => {
		const postType =  PostType[post.postType.name as keyof typeof PostType]
		const content = post.content ? render(post.content) : null;
		return {...post, content, postType}
	}) : [];
	return { menus, posts: posts };
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

const usePosts = (postType: PostType) => {
	const { posts } = useData();
	const postFilteredByPostType = posts ? posts.filter((post) => post.postType === postType) : [];
	const post = postFilteredByPostType ? postFilteredByPostType.map((post) => {
		const {postType, ...rest} = post
		return rest
		  }) : [];
  
	return post;
}