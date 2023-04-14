import {TopMenu} from "../components/Menu/TopMenu";
import {Logo} from "../components/Logo";
import {useShrinkingHeader} from "../hooks/useShrinkingHeader";

/**
 * Component for displaying the header bar
 */
export function Header() {
    // Shrinking header ref
    const header = useShrinkingHeader();

    return <header ref={header}>
        <Logo/>
        <TopMenu/>
    </header>
}