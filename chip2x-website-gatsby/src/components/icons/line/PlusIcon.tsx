import * as React from "react"
import { IconProps } from "./types"

export default function PlusIcon({ color = "black", size = 24, strokeWidth = 2 }: IconProps) {
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
      <path d="M12 5v14M5 12h14" />
    </svg>
  )
}
