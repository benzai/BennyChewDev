import * as React from "react"
import { IconProps } from "./types"

export default function CheckIcon({ color = "black", size = 24, strokeWidth = 2 }: IconProps) {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke={color}
      strokeWidth={strokeWidth}
      strokeLinecap="round"
      strokeLinejoin="round">
      <path d="M20 6L9 17l-5-5" />
    </svg>
  )
}
