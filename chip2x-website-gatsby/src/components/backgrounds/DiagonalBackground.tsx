import * as React from "react"

export type Props = {
  color?: string
}

export default function ProjectDetailHeader({ color = "black" }: Props) {
  return (
    <svg viewBox="0 0 1600 600" version="1.1" xmlns="http://www.w3.org/2000/svg">
      <g
        id="graphics-/-backgrounds-/-patterns-/-diagonalBg"
        stroke="none"
        stroke-width="1"
        fill="none"
        fill-rule="evenodd">
        <polygon id="background" fill={color} points="0 0 1600 0 1600 160 0 360"></polygon>
      </g>
    </svg>
  )
}
