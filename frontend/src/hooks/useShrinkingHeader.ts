import {createRef, RefObject, useEffect} from "react";

/**
 * Hook for a shrinking header effect. Returns a ref that should be attached to the shrinking element.
 * @param threshold Shrink threshold in pixels
 */
export function useShrinkingHeader(threshold: number = 100): RefObject<HTMLDivElement> {
    const header = createRef<HTMLDivElement>()
    useEffect(() => {
        const listener = () => {
            if (window.scrollY > threshold) {
                header.current?.classList.add('shrink')
            } else {
                header.current?.classList.remove('shrink')
            }
        }
        document.addEventListener('scroll', listener);
        return () => document.removeEventListener('scroll', listener);
    }, [header, threshold]);
    return header;
}