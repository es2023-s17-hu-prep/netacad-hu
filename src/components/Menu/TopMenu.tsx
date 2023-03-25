import {useMenus} from "../../data/hooks";
import {MenuItem} from "./MenuItem";

/**
 * Component for fetching and displaying the top navigation bar
 */
export function TopMenu() {
    // Fetch the data
    const menus = useMenus();

    return <div className="menu">
        {menus.map(menu => <MenuItem key={menu.id} value={menu}/>)}
    </div>
}