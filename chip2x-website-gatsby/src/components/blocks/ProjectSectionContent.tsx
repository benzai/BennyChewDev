import * as React from "react"
import cx from "classnames"

import theme from "../../constants/theme"

import BlockContent from "@sanity/block-content-to-react"

type IBlockProps = {
  children: any[]
  node: {
    style: string
  }
}

type IImagesGridProps = {
  node: {
    layouts?: IImageLayout[]
  }
}

type IImageLayout = {
  layoutType: string
  images?: IImage[]
}

type IImage = {
  image: {
    asset: {
      url: string
    }
  }
  showBorder?: boolean
}

/**
 * ProjectSectionContent
 */
type Props = {
  blocks: any[]
  sectionType: "header" | "content"
}

export default function ProjectSectionContent({ blocks = [], sectionType = "content" }: Props) {
  const heading2 = (children: any[]) => (
    <div className={cx("flex", sectionType === "header" ? "justify-end" : "justify-center")}>
      <h2 className={cx("w-full md:w-8/12", "text-md3 md:text-lg2 text-text1", "pb-16 md:pb-30")}>
        {children}
      </h2>
    </div>
  )

  const heading3 = (children: any[]) => (
    <div className={cx("flex", sectionType === "header" ? "justify-end" : "justify-center")}>
      <h3 className={cx("w-full md:w-8/12", "text-md3 md:text-lg text-text1", "pb-20 md:pb-30")}>
        {children}
      </h3>
    </div>
  )

  const body = (children: any[]) => (
    <div className={cx("flex", sectionType === "header" ? "justify-end" : "justify-center")}>
      <p
        className={cx(
          "w-full md:w-8/12",
          "text-sm3 md:text-md text-text2",
          "leading-relaxed md:leading-relaxed",
          "pb-40 md:pb-48"
        )}>
        {children}
      </p>
    </div>
  )

  const list = (children: any[]) => <ul className="list-disc pl-18 py-8">{children}</ul>

  const listItem = (children: any[]) => (
    <li className="text-sm md:text-md4 text-text2 leading-relaxed py-4">{children}</li>
  )

  const link = (href: string, children: any[]) => (
    <a className="text-accent1" href={href} target="_blank">
      {children}
    </a>
  )

  const serializers = {
    types: {
      block: ({ children, node }: IBlockProps) => {
        switch (node.style) {
          case "h2":
            return heading2(children)
          case "h3":
            return heading3(children)
          case "normal":
            return body(children)
          default:
            return body(children)
        }
      },

      imagesGrid: ({ node }: IImagesGridProps) => {
        let hasLayouts = node.layouts?.length > 0

        const gapStyle = "gap-10 md:gap-20 lg:gap-30"
        const bottomPaddingStyle = "pb-10 md:pb-20 lg:pb-30 last:pb-0"

        return (
          <div className={cx("py-40 md:py-60")}>
            {hasLayouts &&
              node.layouts.map(layout => {
                return (
                  <div className={cx("grid grid-cols-1", gapStyle, bottomPaddingStyle)}>
                    {imagesLayout(layout)}
                  </div>
                )
              })}
          </div>
        )

        function imagesLayout(layout: IImageLayout) {
          switch (layout.layoutType) {
            case "full":
              return (
                <div className={cx("grid grid-cols-1", gapStyle, bottomPaddingStyle)}>
                  {images(layout.images)}
                </div>
              )

            case "grid2":
              return (
                <div
                  className={cx("grid grid-cols-1 md:grid-cols-2", gapStyle, bottomPaddingStyle)}>
                  {images(layout.images)}
                </div>
              )

            case "grid3":
              return (
                <div
                  className={cx("grid grid-cols-1 md:grid-cols-3", gapStyle, bottomPaddingStyle)}>
                  {images(layout.images)}
                </div>
              )

            case "grid4":
              return (
                <div
                  className={cx("grid grid-cols-1 md:grid-cols-4", gapStyle, bottomPaddingStyle)}>
                  {images(layout.images)}
                </div>
              )

            default:
              return (
                <div className={cx("grid grid-cols-1", gapStyle, bottomPaddingStyle)}>
                  {images(layout.images)}
                </div>
              )
          }
        }

        function images(images?: IImage[]) {
          let hasImages = images && images.length > 0
          return (
            hasImages &&
            images.map(imageNode => {
              let showBorder = imageNode.showBorder && imageNode.showBorder === true
              let roundedCorners = false
              return (
                <img
                  key={imageNode.image.asset.url}
                  src={imageNode.image.asset.url}
                  className={cx(
                    "w-full",
                    "object-contain",
                    roundedCorners && "rounded-md",
                    showBorder && "shadow-outline"
                  )}
                />
              )
            })
          )
        }
      },
    },
    list: props => {
      return list(props.children)
    },
    listItem: props => {
      return listItem(props.children)
    },
    marks: {
      link: props => {
        return link(props.mark.href, props.children)
      },
    },
  }

  const imageOptions = {}

  return (
    <BlockContent
      projectId={process.env.SANITY_PROJECT_ID}
      dataset={process.env.SANITY_DATASET}
      blocks={blocks}
      serializers={serializers}
      imageOptions={imageOptions}
    />
  )
}
