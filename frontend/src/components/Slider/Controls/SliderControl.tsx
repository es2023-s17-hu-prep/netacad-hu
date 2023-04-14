interface SliderControlProps {
    active: boolean;
    onClick(): void
}

/**
 * Component for displaying a slide step
 */
export function SliderControl({active, onClick}: SliderControlProps) {
    const className = `step ${active ? "active" : ""}`;
    return <button onClick={onClick} className={className} />
}