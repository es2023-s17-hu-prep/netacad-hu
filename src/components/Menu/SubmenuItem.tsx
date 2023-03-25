import {Submenu} from "../../data/hooks";

/**
 * Interface for the submenu item component
 */
interface SubmenuItemProps {
    value: Submenu;
}

/**
 * Component for displaying submenu items
 * Receives the submenu item as a prop
 */
export function SubmenuItem({value}: SubmenuItemProps) {
    return <a href={value.link} className="submenu-item">
        {value.title}
    </a>
}