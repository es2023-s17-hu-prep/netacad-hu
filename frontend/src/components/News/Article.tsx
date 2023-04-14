import {Post} from "../../data/hooks";

/**
 * Interface for the Article component
 */
interface ArticleProps {
    value: Omit<Post, 'postType'>;
}

/**
 * Component for displaying a news article
 * Receives the article as a prop
 */
export function Article({value}: ArticleProps) {
    return <article>
        <img src={value.featuredImage.url} alt=""/>
        <div className="news-content">
            <h2>{value.title}</h2>
            <h3>{value.subtitle}</h3>
            <p dangerouslySetInnerHTML={{__html: value.headlineShort}}/>
            <span className="meta">
                <span>{value.name} | {value.date}</span>
                <button>Olvasás »</button>
            </span>
        </div>
    </article>
}