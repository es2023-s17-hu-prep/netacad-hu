import {useDashboardElements} from "../data/hooks";
import {DashboardItem} from "../DashboardItem";

/**
 * Component for fetching and displaying dashboard elements
 */
export function DashboardElements() {
    const elements = useDashboardElements();
    return <section className="dashboard-elements">
        <h2>Bejegyzések</h2>
        {elements.map(el => <DashboardItem key={el.id} value={el}/>)}
    </section>;
}