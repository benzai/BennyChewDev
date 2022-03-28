import * as React from "react"
import { useStaticQuery, graphql } from "gatsby"
import Helmet from "react-helmet"

import * as appIcons from "../../assets/appicons"

type Props = {
  title: string
  description?: string
  lang?: string
}

export default function SEO({ title, description = "", lang = "en" }: Props) {
  const { site } = useStaticQuery(
    graphql`
      query {
        site {
          siteMetadata {
            title
            description
            author
          }
        }
      }
    `
  )

  const metaDescription = description || site.siteMetadata.description

  return (
    <Helmet
      htmlAttributes={{
        lang,
      }}
      title={title}
      titleTemplate={`${site.siteMetadata.title} | %s`}
      meta={[
        {
          name: `description`,
          content: metaDescription,
        },
        {
          property: `og:title`,
          content: title,
        },
        {
          property: `og:description`,
          content: metaDescription,
        },
        {
          property: `og:type`,
          content: `website`,
        },
        {
          name: `twitter:card`,
          content: `summary`,
        },
        {
          name: `twitter:creator`,
          content: site.siteMetadata.author,
        },
        {
          name: `twitter:title`,
          content: title,
        },
        {
          name: `twitter:description`,
          content: metaDescription,
        },
        // Facebook
        { property: `og:url`, content: site.siteMetadata.websiteUrl },
        { property: `og:type`, content: `website` },
        { property: `og:title`, content: site.siteMetadata.company },
        {
          property: `og:description`,
          content: description,
        },
        {
          property: `og:image`,
          content: `${site.siteMetadata.websiteUrl}/${appIcons.twitterCard}`,
        },
        { property: `og:image:width`, content: `1200` },
        { property: `og:image:height`, content: `600` },
        // Twitter
        { name: `twitter:card`, content: `summary_large_image` },
        { name: `twitter:title`, content: site.siteMetadata.company },
        {
          name: `twitter:description`,
          content: description,
        },
        { name: `twitter:site`, content: site.siteMetadata.twitterHandle },
        { name: `twitter:creator`, content: site.siteMetadata.twitterHandle },
        {
          name: `twitter:image:src`,
          content: `${site.siteMetadata.websiteUrl}/${appIcons.facebookCard}`,
        },
        // Microsoft
        { name: `msapplication-TileColor`, content: `#ffffff` },
        {
          name: `msapplication-TileImage`,
          content: `${appIcons.msIcon144}`,
        },
      ]}
      link={[
        // Favicon
        {
          rel: `shortcut icon`,
          type: `image/x-icon`,
          href: `${appIcons.favicon}`,
        },
        // Apple
        {
          rel: `apple-touch-icon`,
          sizes: `57x57`,
          type: `image/png`,
          href: `${appIcons.appleIcon57}`,
        },
        {
          rel: `apple-touch-icon`,
          sizes: `60x60`,
          type: `image/png`,
          href: `${appIcons.appleIcon60}`,
        },
        {
          rel: `apple-touch-icon`,
          sizes: `72x72`,
          type: `image/png`,
          href: `${appIcons.appleIcon72}`,
        },
        {
          rel: `apple-touch-icon`,
          sizes: `76x76`,
          type: `image/png`,
          href: `${appIcons.appleIcon76}`,
        },
        {
          rel: `apple-touch-icon`,
          sizes: `114x114`,
          type: `image/png`,
          href: `${appIcons.appleIcon114}`,
        },
        {
          rel: `apple-touch-icon`,
          sizes: `120x120`,
          type: `image/png`,
          href: `${appIcons.appleIcon120}`,
        },
        {
          rel: `apple-touch-icon`,
          sizes: `144x144`,
          type: `image/png`,
          href: `${appIcons.appleIcon144}`,
        },
        {
          rel: `apple-touch-icon`,
          sizes: `152x152`,
          type: `image/png`,
          href: `${appIcons.appleIcon152}`,
        },
        {
          rel: `apple-touch-icon`,
          sizes: `180x180`,
          type: `image/png`,
          href: `${appIcons.appleIcon180}`,
        },
        // Android
        {
          rel: `icon`,
          sizes: `128x128`,
          type: `image/png`,
          href: `${appIcons.androidIcon128}`,
        },
        {
          rel: `icon`,
          sizes: `192x192`,
          type: `image/png`,
          href: `${appIcons.androidIcon192}`,
        },
      ]}
    />
  )
}
