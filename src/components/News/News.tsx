import {useNews} from "../../data/hooks";
import {Article} from "./Article";

/**
 * Component for fetching and displaying the news section
 */
export function News() {
    // Fetch the data
    const news = useNews();

    return <section className="news">
        <h1>NetAcad Hírek</h1>

        <div className="news-grid">
            {news.map(article => <Article key={article.id} value={article}/>)}
        </div>
    </section>
}