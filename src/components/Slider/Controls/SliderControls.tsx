import {SliderControl} from "./SliderControl";

/**
 * Interface for the slide controls component
 */
interface SlideControlsProps {
    count: number;
    currentSlide: number;
    onNext(): void;
    onPrev(): void;
    onChange(step: number): void
}

/**
 * Component for displaying the slider controls
 * Receives the count of slides as a prop.
 */
export function SliderControls({count, currentSlide, onPrev, onNext, onChange}: SlideControlsProps) {
    // Create an array with length = count
    const slides = Array.from({length: count});

    return <div className="controls">
        <button onClick={onPrev}>«</button>
        <div className="steps">
            {slides.map((_, index) => <SliderControl onClick={() => onChange(index)} active={index===currentSlide} key={index}/>)}
        </div>
        <button onClick={onNext}>»</button>
    </div>
}