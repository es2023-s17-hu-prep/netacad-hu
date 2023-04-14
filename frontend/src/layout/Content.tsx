import {Slider} from "../components/Slider/Slider";
import {News} from "../components/News/News";
import {DashboardElements} from "../components/DashboardElements";

/**
 * Component for displaying the main content of the page
 */
export function Content() {
    return <>
        <Slider/>
        <News />
        <DashboardElements />
    </>
}