import * as React from "react"
import { useEffect } from "react"
import { PageProps as GatsbyPageProps, graphql } from "gatsby"
import { cx } from "@emotion/css"
import * as Color from "color"
import { renderToStaticMarkup } from "react-dom/server"

import theme from "../../constants/theme"
import { IStyleOverride } from "../../data/_componentTypes"
import { mainMenu, contactDetails } from "../../data/siteConfig"
import { ISkill, sharedData } from "../../data/shared"
import { IProject, IContentSection, ITool, projectDetailData } from "../../data/projects"

import {
  Layout,
  SEO,
  ProjectSectionContent,
  DiagonalBackground,
  CallToActionSection,
} from "../../components"
import { bullet } from "../../assets/graphics"

type ISanityProjectProps = {
  data: {
    sanityProject: IProject
  }
}

type Props = GatsbyPageProps & ISanityProjectProps & {}

/**
 * ProjectDetail
 */
export default function ProjectDetailPage({ data }: Props) {
  const project = data.sanityProject

  useEffect(() => {
    console.log(project)
  }, [])

  return (
    <Layout
      mainMenu={mainMenu}
      contactDetails={contactDetails}
      navBarStyle={{
        theme: project.theme ?? "dark",
        navBarColor: project.backgroundColor ?? theme.colors.accent1,
      }}>
      <SEO title={project.title} />
      <HeaderSection
        title={project.title}
        description={project.description}
        coverImageUrl={project.headerImage?.asset?.url ?? project.coverImage?.asset?.url}
        backgroundColor={project.backgroundColor ?? theme.colors.accent1}
      />
      <ContentSections
        sections={project.contentSections}
        client={project.client}
        skills={project.skills}
        tools={project.tools}
      />
      <CallToActionSection
        title={sharedData.callToActionSection.title}
        subTitle={sharedData.callToActionSection.subTitle}
        text1={sharedData.callToActionSection.text1}
        moreButton={sharedData.callToActionSection.moreButton}
      />
    </Layout>
  )
}

export const query = graphql`
  query ($id: String) {
    sanityProject(id: { eq: $id }, showOnWebsite: { eq: true }) {
      id
      title
      slug {
        current
      }
      description
      publishDate
      contentSections {
        sectionType
        _rawContent(resolveReferences: { maxDepth: 10 })
      }
      subTitle
      coverImage {
        asset {
          url
        }
      }
      headerImage {
        asset {
          url
        }
      }
      client
      category {
        title
      }
      skills {
        title
      }
      tools {
        title
        iconImage {
          asset {
            url
          }
        }
      }
      backgroundColor
      theme
    }
  }
`

/**
 * HeaderSection
 */
type HeaderSectionProps = {
  title: string
  description: string
  coverImageUrl?: string
  backgroundColor: string
}

function HeaderSection({ title, description, coverImageUrl, backgroundColor }: HeaderSectionProps) {
  let svgString = encodeURIComponent(
    renderToStaticMarkup(<DiagonalBackground color={Color(backgroundColor).lighten(0.1).hex()} />)
  )
  let backgroundDataUri = `url("data:image/svg+xml,${svgString}")`

  return (
    <section className={cx("flex flex-col items-center")}>
      <div
        className={cx("flex flex-col justify-center items-center", "w-full")}
        css={{ backgroundColor: Color(backgroundColor).lighten(0.1).hex() }}>
        <div
          className={cx(
            "flex flex-col justify-center items-center",
            "px-20 md:px-40 lg:px-60 xl:px-80",
            "py-40 md:py-60",
            "xl:max-w-1600"
          )}>
          {textGroup()}
        </div>
      </div>

      <div
        className={cx("flex flex-col justify-center items-center", "w-full", "bg-bg1")}
        css={{
          background: backgroundDataUri,
          backgroundPosition: `top center`,
          backgroundRepeat: "no-repeat",
          backgroundSize: `100%`,
        }}>
        <div
          className={cx(
            "flex flex-col justify-center items-center",
            "px-20 md:px-40 lg:px-60 xl:px-80",
            "xl:max-w-1600"
          )}>
          {imageGroup()}
        </div>
      </div>
    </section>
  )

  function textGroup() {
    return (
      <div className={cx("flex flex-col items-center", "md:w-10/12")}>
        <h1 className={cx("text-md md:text-md2 text-altText1_60", "w-full")}>{title}</h1>
        <div className="h-10" />
        <p className={cx("text-lg md:text-lg3 lg:text-xl text-altText1", "resetLeading", "w-full")}>
          {description}
        </p>
      </div>
    )
  }

  function imageGroup() {
    if (!coverImageUrl) {
      return null
    }

    return (
      <div className="flex">
        <img src={coverImageUrl} alt={title} />
      </div>
    )
  }
}

/**
 * ContentSections
 */
type ContentSectionsProps = {
  sections: IContentSection[]
  client?: string
  skills?: ISkill[]
  tools?: ITool[]
}

function ContentSections({ sections, client, skills, tools }: ContentSectionsProps) {
  if (sections && sections.length === 0) {
    return null
  }

  return (
    <div className={cx("flex flex-col items-center")}>
      {sections.map((section, index) => {
        if (!section._rawContent || section._rawContent.length === 0) {
          return null
        }

        return (
          <section
            key={index}
            className={cx(
              "px-40 md:px-60 lg:px-80",
              "py-40 md:py-60 lg:py-80",
              "xl:max-w-1600",
              "bg-bg1"
            )}>
            {section.sectionType === "header" ? headerSection(section) : contentSection(section)}
          </section>
        )
      })}
    </div>
  )

  function headerSection(section: IContentSection) {
    return (
      <div className={cx("flex md:relative flex-col md:flex-row")}>
        <ProjectSectionContent blocks={section._rawContent} sectionType="header" />
        {summarySideBar()}
      </div>
    )
  }

  function summarySideBar() {
    return (
      <aside className={cx("md:absolute left-0 top-0", "md:w-4/12", "md:pr-40")}>
        {clientSection(client)}
        {whatSection(skills)}
        {toolsSection(tools)}
      </aside>
    )

    function clientSection(client?: string) {
      if (!client) {
        return null
      }

      return (
        <div className={cx("pb-30")}>
          {sectionHeader(projectDetailData.titles.client)}
          <p className={cx("text-sm3 text-text1")}>{client}</p>
        </div>
      )
    }

    function whatSection(skills?: ISkill[]) {
      if (!skills || skills.length === 0) {
        return null
      }

      return (
        <div className={cx("pb-30")}>
          {sectionHeader(projectDetailData.titles.what)}
          <ul>
            {skills.map(skill => {
              return listItem(skill.title)
            })}
          </ul>
        </div>
      )
    }

    function toolsSection(tools?: ITool[]) {
      if (!tools || tools.length === 0) {
        return null
      }

      return (
        <div className={cx("pb-30")}>
          {sectionHeader(projectDetailData.titles.tools)}
          <ul className={cx("flex flex-wrap", "pt-4")}>
            {tools.map(tool => (
              <img className="w-24 h-24 mr-4" src={tool.iconImage.asset.url} alt={tool.title} />
            ))}
          </ul>
        </div>
      )
    }

    function sectionHeader(title: string) {
      return (
        <h3 className={cx("font-medium text-sm2 text-text3 uppercase tracking-wide_md")}>
          {title}
        </h3>
      )
    }

    function listItem(title: string) {
      return (
        <li className={cx("leading-normal")} css={{ listStyle: `disc inside url(${bullet})` }}>
          <span className={cx("text-sm3 text-text1")} css={{ marginLeft: 4, marginTop: 4 }}>
            {title}
          </span>
        </li>
      )
    }
  }

  function contentSection(section: IContentSection) {
    return <ProjectSectionContent blocks={section._rawContent} sectionType="content" />
  }
}
