import {Menu} from "../../data/hooks";
import {SubmenuItem} from "./SubmenuItem";

/**
 * Interface for the menu item component
 */
interface MenuItemProps {
    value: Menu;
}

/**
 * Menu item component. Displays the item and submenus if there are any.
 * Receives a menu item as a prop.
 */
export function MenuItem({value}: MenuItemProps) {
    // Check if the menu has any submenus
    const hasSubmenus = value.submenu.length > 0;

    return <a href={value.link} className="item">
        {value.title}

        {
            hasSubmenus && <div className="submenu">
                {
                    value.submenu.map(submenu => <SubmenuItem key={submenu.id} value={submenu}/>)
                }
            </div>
        }
    </a>
}