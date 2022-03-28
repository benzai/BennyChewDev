import * as React from "react"
import { GlyphProps } from "./types"

export default function CaretUpGlyph({ className, color = "black", size = 16 }: GlyphProps) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 16 16">
      <path
        stroke={color}
        strokeWidth={2}
        d="M3 9.95L7.95 5l4.949 4.95"
        fill="none"
        fillRule="evenodd"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  )
}
