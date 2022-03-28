import * as React from "react"
import { Link } from "gatsby"
import cx from "classnames"
import * as Color from "color"

import theme from "../../constants/theme"

/**
 * IconButton
 */
type Props = {
  style?: React.CSSProperties
  type?: "link" | "button"
  to?: string
  onClick?: () => void
  icon: React.ReactElement
  size?: "sm" | "md" | "lg"
  iconColor?: string
  frameColor?: string
  frameHoverOpacity?: number
}

export default function IconButton({
  style,
  type = "link",
  to = "/",
  onClick,
  icon,
  size = "md",
  iconColor = "white",
  frameColor = "black",
  frameHoverOpacity = 0.5,
}: Props) {
  const _sizes = {
    sm: {
      frame: 40,
      icon: 20,
    },
    md: {
      frame: 48,
      icon: 24,
    },
    lg: {
      frame: 60,
      icon: 24,
    },
  }

  const _icon = React.cloneElement(icon, {
    size: _sizes[size].icon,
    color: iconColor,
  })

  const _css = {
    cursor: "pointer",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: frameColor,
    "&:hover": {
      backgroundColor: Color(frameColor).lighten(frameHoverOpacity).hex(),
    },
    width: _sizes[size].frame,
    height: _sizes[size].frame,
    borderRadius: 1000,
  }

  return type === "link" ? gatsbyLink(_icon, _css) : button(_icon, _css)

  function gatsbyLink(children: React.ReactElement, css: any) {
    return (
      <Link style={style} to={to} css={css}>
        {children}
      </Link>
    )
  }

  function button(children: React.ReactElement, css: any) {
    return (
      <button style={style} onClick={onClick} css={css}>
        {children}
      </button>
    )
  }
}
