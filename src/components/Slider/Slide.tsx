import {SliderElement} from "../../data/hooks";

/**
 * Interface for the slide component
 */
interface SlideProps {
    value: SliderElement;
}

/**
 * Component for displaying a slide in the slider.
 * Receives the slider element as a prop
 */
export function Slide({value}: SlideProps) {
    // class for reversing the order of the text and image if necessary
    const className = `slide ${value.isFeauturedImageLeft ? "reverse" : ""}`

    return <div className={className}>
        <div className="description">
            <h6>{value.title}</h6>
            <p dangerouslySetInnerHTML={{__html: value.content}}/>
        </div>
        <img src={value.featuredImage.url} alt={value.title}/>
    </div>
}