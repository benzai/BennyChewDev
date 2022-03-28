import * as React from "react"
import { useEffect } from "react"
import { PageProps as GatsbyPageProps, graphql, Link } from "gatsby"
import cx from "classnames"

import theme from "../constants/theme"
import { mainMenu, contactDetails } from "../data/siteConfig"
import { sharedData } from "../data/shared"
import { IProject, projectsData } from "../data/projects"

import {
  Layout,
  SEO,
  Button,
  ProjectPreviewCard,
  SubHeaderSection,
  CallToActionSection,
} from "../components"

type IAllSanityProjectProps = {
  data: {
    allSanityProject: {
      edges: IProjectEdge[]
    }
  }
}

type IProjectEdge = {
  node: IProject
}

type Props = GatsbyPageProps & IAllSanityProjectProps & {}

/**
 * Projects
 */
export default function ProjectsPage({ data }: Props) {
  const projects = data.allSanityProject.edges

  useEffect(() => {}, [])

  return (
    <Layout mainMenu={mainMenu} contactDetails={contactDetails}>
      <SEO title={projectsData.page.title} />
      <SubHeaderSection
        title={projectsData.projectsSection.title}
        subTitle={projectsData.projectsSection.subTitle}
      />
      <ProjectsSection projects={projects} />
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
  query {
    allSanityProject(
      filter: { showOnWebsite: { eq: true } }
      sort: { fields: publishDate, order: DESC }
    ) {
      edges {
        node {
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
    }
  }
`

/* -------------------------------------------------------------------------------- */

/**
 * ProjectsSection
 */
type ProjectsSectionProps = {
  projects?: IProjectEdge[]
}

function ProjectsSection({ projects }: ProjectsSectionProps) {
  if (!projects || projects.length === 0) {
    return null
  }

  return (
    <section
      className={cx("px-20 md:px-40 lg:px-60 xl:px-80", "py-40 md:py-60 lg:py-80", "bg-bg1")}>
      <div
        className={cx("grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-12 md:gap-20 lg:gap-30")}>
        {projects.map(({ node }) => {
          return (
            <ProjectPreviewCard
              key={node.id}
              slug={node.slug.current}
              title={node.title}
              subTitle={node.subTitle}
              coverImageUrl={node.coverImage?.asset?.url}
              accentColor={node.backgroundColor}
            />
          )
        })}
      </div>
    </section>
  )
}
