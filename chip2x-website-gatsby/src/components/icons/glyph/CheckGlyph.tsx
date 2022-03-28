import * as React from "react"
import { GlyphProps } from "./types"

export default function CheckGlyph({ className, color = "black", size = 16 }: GlyphProps) {
  return (
    <svg className={className} width={size} height={size} viewBox="0 0 16 16">
      <path
        d="M13.6 4.105a1.132 1.132 0 010 1.6L7.346 11.96l-.009.008-.091.092a1.332 1.332 0 01-1.95-.07L2.734 9.031A.954.954 0 014.08 7.685L6.16 9.49l5.87-5.415c.446-.413 1.139-.4 1.569.03z"
        fill={color}
        fillRule="evenodd"
      />
    </svg>
  )
}
