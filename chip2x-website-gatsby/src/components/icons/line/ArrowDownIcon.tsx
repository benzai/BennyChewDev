import * as React from "react"
import { IconProps } from "./types"

export default function ArrowDownIcon({ color = "black", size = 24, strokeWidth = 2 }: IconProps) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24">
      <g
        stroke={color}
        strokeWidth={strokeWidth}
        fill="none"
        fillRule="evenodd"
        strokeLinecap="round"
        strokeLinejoin="round">
        <path d="M12 5v14M19 12l-7 7-7-7" />
      </g>
    </svg>
  )
}
