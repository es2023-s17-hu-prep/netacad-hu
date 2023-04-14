import {useSliderElements} from "../../data/hooks";
import {Slide} from "./Slide";
import {SliderControls} from "./Controls/SliderControls";
import {useSlider} from "./useSlider";

/**
 * Component for fetching and displaying the slider section.
 */
export function Slider() {
    // Fetch the data
    const slider = useSliderElements();
    const {ref, currentSlide, setSlide, next, previous} = useSlider(slider.length);

    return <div className="slider">
        <div className="slides" ref={ref}>
            {slider.map(slide => <Slide key={slide.id} value={slide}/>)}
        </div>

        <SliderControls currentSlide={currentSlide} onChange={setSlide} onNext={next} onPrev={previous} count={slider.length}/>
    </div>
}