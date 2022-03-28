import * as React from "react"
import { IconProps } from "./types"

export default function GlobeIcon({ color = "black", size = 24, strokeWidth = 2 }: IconProps) {
  return (
    <svg width={size} height={size} viewBox="0 0 24 24">
      <g
        transform="translate(2 2)"
        stroke={color}
        strokeWidth={strokeWidth}
        fill="none"
        fillRule="evenodd"
        strokeLinecap="round"
        strokeLinejoin="round">
        <circle cx={10} cy={10} r={10} />
        <path d="M0 10h20M10 0a15.3 15.3 0 014 10 15.3 15.3 0 01-4 10 15.3 15.3 0 01-4-10 15.3 15.3 0 014-10h0z" />
      </g>
    </svg>
  )
}
