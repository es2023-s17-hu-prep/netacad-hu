import {SliderControl} from "./SliderControl";

/**
 * Interface for the slide controls component
 */
interface SlideControlsProps {
    count: number;
}

/**
 * Component for displaying the slider controls
 * Receives the count of slides as a prop.
 */
export function SliderControls({count}: SlideControlsProps) {
    // Create an array with length = count
    const slides = Array.from({length: count});

    return <div className="controls">
        <button>«</button>
        <div className="steps">
            {slides.map((_, index) => <SliderControl key={index}/>)}
        </div>
        <button>»</button>
    </div>
}