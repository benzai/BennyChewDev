import * as React from "react"
import { IconProps } from "./types"

export default function EmailIcon({ color = "black", size = 24, strokeWidth = 2 }: IconProps) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24">
      <g
        stroke={color}
        strokeWidth={strokeWidth}
        fill="none"
        fillRule="evenodd"
        strokeLinecap="round"
        strokeLinejoin="round">
        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" />
        <path d="M22 6l-10 7L2 6" />
      </g>
    </svg>
  )
}
