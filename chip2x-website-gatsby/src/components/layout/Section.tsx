import * as React from "react"
import { cx } from "@emotion/css"
import * as Color from "color"

import theme from "../../constants/theme"
import { IStyleOverride } from "../../data/_componentTypes"

/**
 * Section
 */
type Props = IStyleOverride & {
  id?: string
  display?: "block" | "flex"
  justifyContent?: "flex-start" | "center" | "flex-end" | "space-between"
  alignItems?: "flex-start" | "center" | "flex-end"
  paddingX?: IPaddingX
  paddingY?: IPaddingY
  backgroundColor?: "bg-bg1" | "bg_bg2" | "bg_bg3" | "bg-accent1" | "bg-accent2" | "bg_altBg1"
  children?: React.ReactNode
}

type IPaddingX = "md" | "sm" | "none"
type IPaddingY = "md" | "md_top" | "sm" | "sm_top" | "none"

export default function Section({
  id,
  display = "block",
  justifyContent,
  alignItems,
  paddingX = "md",
  paddingY = "md",
  backgroundColor = "bg-bg1",
  children,
  ...props
}: Props) {
  const xPaddings: Record<IPaddingX, string> = {
    md: "px-20 md:px-40 lg:px-60 xl:px-80",
    sm: "px-10 md:px-20 lg:px-40",
    none: "px-0",
  }

  const yPaddings: Record<IPaddingY, string> = {
    md: "py-40 md:py-60 lg:py-80",
    md_top: "pt-40 md:pt-60 lg:pt-80",
    sm: "py-30 md:py-40 lg:py-60",
    sm_top: "pt-30 md:pt-40 lg:pt-60",
    none: "py-0",
  }

  return (
    <section
      id={id}
      className={cx(xPaddings[paddingX], yPaddings[paddingY], backgroundColor, props._className)}
      css={[{ display, justifyContent, alignItems }, props._css]}>
      {children}
    </section>
  )
}
