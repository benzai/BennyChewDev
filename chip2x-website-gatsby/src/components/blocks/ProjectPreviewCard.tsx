import * as React from "react"
import { Link } from "gatsby"
import cx from "classnames"

import theme from "../../constants/theme"

/**
 * ProjectPreviewCard
 */
type Props = {
  slug: string
  title: string
  subTitle?: string
  coverImageUrl?: string
  accentColor?: string
}

export default function ProjectPreviewCard({
  slug,
  title,
  subTitle,
  coverImageUrl,
  accentColor = "black",
}: Props) {
  let _subTitle = subTitle && (
    <p
      className={cx(
        "font-medium text-xs md:text-sm text-altText1_60 uppercase tracking-wide_md",
        "resetLeading"
      )}>
      {subTitle}
    </p>
  )

  return (
    <Link
      to={`/projects/${slug}`}
      css={{
        ":hover .container": {
          boxShadow: `inset 0px 0px 0px 3px ${accentColor}`,
          transition: `all 0.2s ease-in-out`,
        },
      }}>
      <div className={cx("container", "bg-bg3", "rounded-sm md:rounded-md")}>
        <figure className={cx("aspect-w-4 aspect-h-3")}>
          <img className="object-contain w-full" src={coverImageUrl} alt={title} />
        </figure>

        <figcaption
          className={cx(
            "flex items-center",
            "h-64 md:h-80 lg:h-90 xl:h-100",
            "rounded-sm md:rounded-md"
          )}
          css={{ backgroundColor: accentColor }}>
          <div className={cx("flex flex-col gap-4 md:gap-6", "px-12 md:px-20")}>
            {_subTitle}
            <h3
              className={cx(
                "text-md md:text-md2 lg:text-md3 xl:text-lg text-altText1",
                "resetLeading"
              )}>
              {title}
            </h3>
          </div>
        </figcaption>
      </div>
    </Link>
  )
}
