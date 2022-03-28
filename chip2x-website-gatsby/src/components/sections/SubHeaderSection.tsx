import * as React from "react"
import { cx } from "@emotion/css"
import * as Color from "color"

import theme from "../../constants/theme"
import { IStyleOverride } from "../../data/_componentTypes"

import { Button } from "../../components"
import { patternWaves } from "../../assets/graphics"

/**
 * SubHeaderSection
 */
type Props = IStyleOverride & {
  title: string
  subTitle?: string
  titleType?: "heading" | "callout"
  backgroundColor?: "bg-bg1" | "bg-bg2" | "bg-bg3"
  children?: React.ReactNode
}

export default function SubHeaderSection({
  title,
  subTitle,
  titleType = "heading",
  backgroundColor = "bg-bg1",
  children,
  ...props
}: Props) {
  return (
    <section className={cx("px-20 md:px-40 lg:px-60 xl:px-80", "pt-40", backgroundColor)}>
      <div className={cx("wrapper")}>
        <div className={cx("flex flex-col")}>
          <div className={cx("flex", "pb-40 lg:pb-60")}>
            <div className={cx("lg:w-1/12")} />

            <article className={cx("md:w-8/12 max-w-700", "flex flex-col")}>
              {subTitle && (
                <p
                  className={cx(
                    "text-sm2 md:text-sm3 text-accent1 uppercase tracking-wide_md",
                    "w-full",
                    "mb-4"
                  )}>
                  {subTitle}
                </p>
              )}

              {titleType === "heading" ? (
                <h1
                  className={cx(
                    "font-medium text-lg2 md:text-xl lg:text-xl2 xl:text-xl3 text-text1"
                  )}>
                  {title}
                </h1>
              ) : titleType === "callout" ? (
                <h1 className={cx("text-md2 md:text-lg lg:text-lg2 text-text1", "mt-8")}>
                  {title}
                </h1>
              ) : null}
            </article>
          </div>

          {children}
        </div>
      </div>
    </section>
  )
}
