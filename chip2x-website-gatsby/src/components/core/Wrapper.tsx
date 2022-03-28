import * as React from "react"
import cx from "classnames"

type Props = {
  style?: React.CSSProperties
  children?: React.ReactNode
  isFullHeight?: boolean
  hasSidePadding?: boolean
  showDebugBg?: boolean
}

export default function Wrapper({
  style,
  children,
  isFullHeight = true,
  hasSidePadding = true,
  showDebugBg = false,
}: Props) {
  return (
    <div
      className={cx(
        "max-w-page m-auto",
        isFullHeight ? "h-full" : "h-auto",
        hasSidePadding ? "px-20 md:px-30 lg:px-30" : null,
        showDebugBg ? "bg-yellow-500" : null,
        style
      )}>
      {children}
    </div>
  )
}
