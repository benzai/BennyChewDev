import * as React from "react"
import cx from "classnames"

import theme from "../../constants/theme"
import { ISharedData } from "../../data/shared"

import { patternWhatApps, patternWhatUX } from "../../assets/graphics"
import { Button } from "../../components"

/**
 * CallToActionSection
 */
type Props = {
  title: string
  subTitle?: string
  text1: string
  moreButton: {
    title: string
    route: string
  }
  backgroundColor?: "bg-bg1" | "bg-bg2" | "bg-bg3" | "bg-altBg1"
  alternateColor?: "bg-bg1" | "bg-bg2" | "bg-bg3" | "bg-altBg1"
}

export default function CallToActionSection({
  title,
  subTitle,
  text1,
  moreButton,
  backgroundColor = "bg-bg1",
  alternateColor = "bg-bg3",
}: Props) {
  return (
    <section className={cx(backgroundColor)}>
      <div
        css={{
          display: `grid`,
          alignItems: `flex-end`,
          gridTemplateColumns: `1fr`,
          gridTemplateRows: `1fr`,
        }}>
        <div className={cx("m-20 md:m-40 lg:m-80")} css={{ gridColumn: 1, gridRow: 1, zIndex: 10 }}>
          {card()}
        </div>
        {alternateShape()}
      </div>
    </section>
  )

  function card() {
    return (
      <div
        className={cx(
          "wrapper",
          "flex flex-col items-center",
          "py-40 md:py-60 lg:py-100 xl:py-160",
          "bg-altBg1 rounded-md"
        )}
        css={[
          {
            backgroundImage: `url(${patternWhatApps}), url(${patternWhatUX})`,
            backgroundPosition: `top right, bottom left`,
            backgroundRepeat: "no-repeat",
            backgroundSize: `0`,
            [theme.mq(theme.screens.md)]: {
              backgroundSize: `200px, 200px`,
            },
          },
        ]}>
        <article className={cx("md:w-8/12 lg:w-6/12")}>
          {subTitle && (
            <p
              className={cx(
                "text-sm2 md:text-sm3 text-accent3 uppercase tracking-wide_md text-center",
                "mb-4"
              )}>
              {subTitle}
            </p>
          )}

          <h2
            className={cx(
              "font-medium text-lg md:text-lg2 lg:text-lg3 xl:text-xl text-altText1 text-center"
            )}>
            {title}
          </h2>

          <div className="h-20 md:h-40" />

          <p className={cx("text-sm3 md:text-md lg:text-md2 text-altText1_60 text-center")}>
            {text1}
          </p>

          <div className="h-40 md:h-60" />

          <div className={cx("px-40 md:px-80")}>
            <Button
              to={moreButton.route}
              title={moreButton.title}
              size="xl"
              frameColor={theme.colors.accent1}
              frameHoverOpacity={0.2}
              flexible={true}
            />
          </div>
        </article>
      </div>
    )
  }

  function alternateShape() {
    return (
      <div className={cx(alternateColor)} css={{ gridColumn: 1, gridRow: 1, height: `50%` }}></div>
    )
  }
}
