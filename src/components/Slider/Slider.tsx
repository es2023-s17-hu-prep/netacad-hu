import {useSliderElements} from "../../data/hooks";
import {Slide} from "./Slide";
import {SliderControls} from "./Controls/SliderControls";

/**
 * Component for fetching and displaying the slider section.
 */
export function Slider() {
    // Fetch the data
    const slider = useSliderElements();

    return <div className="slider">
        {slider.map(slide => <Slide key={slide.id} value={slide}/>)}

        <SliderControls count={slider.length} />
    </div>
}