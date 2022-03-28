import * as React from "react"
import { Link } from "gatsby"
import cx from "classnames"
import * as Color from "color"

import theme from "../../constants/theme"

type Props = {
  onClick?: () => void
  to?: string
  title: string
  icon?: string
  size?: "sm" | "md" | "lg" | "xl"
  textColor?: string
  frameColor?: string
  frameHoverOpacity?: number
  roundness?: "none" | "normal" | "round"
  flexible?: boolean
}

function ViewModel({
  title,
  size = "md",
  textColor = "white",
  frameColor = "black",
  frameHoverOpacity = 0.4,
  roundness = "normal",
  flexible = false,
}: Props) {
  const _sizes = {
    sm: {
      height: 40,
      sidePadding: 12,
      fontSize: 16,
    },
    md: {
      height: 48,
      sidePadding: 16,
      fontSize: 20,
    },
    lg: {
      height: 60,
      sidePadding: 20,
      fontSize: 20,
    },
    xl: {
      height: 80,
      sidePadding: 20,
      fontSize: 24,
    },
  }

  const _borderRadius = {
    none: 0,
    normal: 12,
    round: 1000,
  }

  const buttonWidth = flexible ? "100%" : "auto"
  const buttonHeight = _sizes[size].height
  const sidePadding = _sizes[size].sidePadding
  const fontSize = _sizes[size].fontSize
  const frameHoverColor = Color(frameColor).lighten(frameHoverOpacity).hex()
  const borderRadius = _borderRadius[roundness]

  return {
    title,
    buttonWidth,
    buttonHeight,
    sidePadding,
    fontSize,
    textColor,
    frameColor,
    frameHoverColor,
    borderRadius,
  }
}

/**
 * Button
 */
export default function Button(props: Props) {
  const viewModel = ViewModel(props)

  return (
    <Link
      onClick={props.onClick}
      to={props.to}
      css={{
        cursor: "pointer",
        display: "inline-block",
        backgroundColor: viewModel.frameColor,
        "&:hover": {
          backgroundColor: viewModel.frameHoverColor,
        },
        width: viewModel.buttonWidth,
        height: viewModel.buttonHeight,
        borderRadius: viewModel.borderRadius,
        paddingLeft: viewModel.sidePadding,
        paddingRight: viewModel.sidePadding,
      }}>
      <div className="flex justify-center items-center h-full">
        {/* {_icon()} */}
        <div
          css={{
            fontSize: viewModel.fontSize,
            color: viewModel.textColor,
            letterSpacing: "-0.01em",
            textAlign: "center",
            verticalAlign: "middle",
            lineHeight: `1em`,
          }}>
          {viewModel.title}
        </div>
      </div>
    </Link>
  )
}
