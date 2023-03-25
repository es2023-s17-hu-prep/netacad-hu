import {DashboardElement} from "./data/hooks";

/**
 * Interface for the DashboardItem
 */
interface DashboardItemProps {
    value: DashboardElement;
}

/**
 * Component for displaying a dashboard element
 * Receives the element as a prop
 */
export function DashboardItem({value}: DashboardItemProps) {
    return <article>
        <img src={value.featuredImage.url} alt={value.title} />
        <div className="content">
            <h6>{value.title}</h6>
            <p dangerouslySetInnerHTML={{__html: value.content}}/>
        </div>
    </article>
}