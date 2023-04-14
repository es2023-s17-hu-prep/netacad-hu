import {createRef, RefObject, useEffect, useState} from "react";

/**
 * Interface used by useSlider hook
 */
type UseSliderReturn = {
    ref: RefObject<HTMLDivElement>;
    currentSlide: number;
    next(): void;
    previous(): void;
    setSlide(s: number): void
}

/**
 * Hook for the slider component
 * @param steps total count of slider steps
 */
export function useSlider(steps: number): UseSliderReturn {
    const ref = createRef<HTMLDivElement>();

    const [slide, setSlide] = useState(0);

    useEffect(() => {
        const interval = setInterval(() => nextSlide(), 4000)
        return () => clearInterval(interval);
    }, [steps, nextSlide]);


    useEffect(() => {
        ref.current?.scrollTo({left: slide * ref.current?.clientWidth, behavior: 'smooth'});
    }, [slide, ref]);

    function nextSlide() {
        setSlide(s => s + 1 === steps ? 0 : s + 1);
    }

    function prevSlide() {
        setSlide(s => s === 0 ? steps - 1 : s - 1);
    }

    return {
        currentSlide: slide, ref, setSlide, next: nextSlide, previous: prevSlide
    }
}