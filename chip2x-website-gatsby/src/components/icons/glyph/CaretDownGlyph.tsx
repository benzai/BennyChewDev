import * as React from "react"
import { GlyphProps } from "./types"

export default function CaretDownGlyph({ className, color = "black", size = 16 }: GlyphProps) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 16 16">
      <path
        stroke={color}
        strokeWidth={2}
        d="M3 6l4.95 4.95L12.899 6"
        fill="none"
        fillRule="evenodd"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  )
}
