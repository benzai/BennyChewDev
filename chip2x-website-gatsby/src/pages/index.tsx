import * as React from "react"
import { useEffect } from "react"
import { PageProps as GatsbyPageProps, graphql, Link } from "gatsby"
import { cx } from "@emotion/css"
import * as Color from "color"

import theme from "../constants/theme"
import { IStyleOverride } from "../data/_componentTypes"
import { mainMenu, contactDetails } from "../data/siteConfig"
import { ISkill, sharedData } from "../data/shared"
import { homeData, IServicePreview } from "../data/home"
import { servicesData } from "../data/services"
import { IProject } from "../data/projects"

import { patternArrowsBL, patternArrowsTR, patternWaves } from "../assets/graphics"
import {
  Layout,
  SEO,
  Button,
  IconButton,
  ArrowDownIcon,
  ProjectPreviewCard,
  CallToActionSection,
} from "../components"
import { IService } from "../data/services"

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
 * Home
 */
export default function IndexPage({ data }: Props) {
  const projects = data.allSanityProject.edges

  useEffect(() => {}, [])

  return (
    <Layout mainMenu={mainMenu} contactDetails={contactDetails}>
      <SEO title={homeData.page.title} />
      <HeroHeaderSection />
      <ProjectsSection projects={projects} />
      <WhatSection
        title={homeData.whatSection.title}
        text1={homeData.whatSection.text1}
        services={servicesData.servicesSection.services}
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
  query {
    allSanityProject(
      filter: { showOnWebsite: { eq: true } }
      sort: { fields: publishDate, order: DESC }
      limit: 6
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
 * HeroHeaderSection
 */
type HeroHeaderSectionProps = IStyleOverride & {}

function HeroHeaderSection({ ...props }: HeroHeaderSectionProps) {
  return (
    <section
      className={cx(
        "md:h-screen-exclNavBar-md lg:h-screen-exclNavBar-lg",
        "px-20 md:px-40 lg:px-60 xl:px-80",
        "bg-bg1",
        props._className
      )}
      css={{
        backgroundImage: `url(${patternArrowsBL}), url(${patternArrowsTR})`,
        backgroundPosition: `bottom left, top right`,
        backgroundRepeat: "no-repeat",
        backgroundSize: `60px, 60px`,
        [theme.mq(theme.screens.md)]: {
          backgroundSize: `80px, 80px`,
        },
        [theme.mq(theme.screens.lg)]: {
          backgroundSize: `120px, 120px`,
        },
        [theme.mq(theme.screens.xl)]: {
          backgroundSize: `160px, 160px`,
        },
      }}>
      <div className={cx("flex flex-col justify-between", "w-full h-full")}>
        <div className={cx("flex flex-col md:flex-row items-center", "h-full")}>
          {textPane()}
          {imagePane()}
        </div>

        <div className={cx("flex flex-col items-center", "")}>{moreButton()}</div>
      </div>
    </section>
  )

  function textPane() {
    return (
      <div
        className={cx("flex flex-col items-center", "md:w-6/12", "pt-40 md:pt-0", "mb-60 md:mb-0")}>
        <article className={cx("flex flex-col", "md:max-w-640")}>
          <h1
            className={cx("mb-20 md:mb-30 lg:mb-40")}
            dangerouslySetInnerHTML={{ __html: homeData.headerSection.title }}
          />
          <p className={cx("text-md2 md:text-md3 xl:text-lg text-text1", "lg:pr-80 xl:pr-0")}>
            {homeData.headerSection.text1}
          </p>
        </article>
      </div>
    )
  }

  function imagePane() {
    return (
      <div className={cx("hidden md:flex justify-center items-center", "md:w-6/12")}>
        <img
          className={cx("lg:max-h-600 xl:max-h-800", "p-40", "")}
          src={homeData.headerSection.coverImageUrl}
          alt={homeData.headerSection.title}
        />
      </div>
    )
  }

  function moreButton() {
    return (
      <div className={cx("flex flex-col items-center", "pb-20")}>
        <h2
          className={cx(
            "font-medium text-sm text-text3 uppercase tracking-wide_sm",
            "resetLeading",
            "pb-8"
          )}>
          {homeData.headerSection.moreButton.title}
        </h2>
        <IconButton
          to={homeData.headerSection.moreButton.route}
          icon={<ArrowDownIcon />}
          size="lg"
          frameColor={theme.colors.altBg1}
        />
      </div>
    )
  }
}

/* -------------------------------------------------------------------------------- */

/**
 * WhatSection
 */
type WhatSectionProps = IStyleOverride & {
  title: string
  text1: string
  services?: IService[]
}

function WhatSection({ title, text1, services, ...props }: WhatSectionProps) {
  return (
    <section
      className={cx(
        "px-20 md:px-40 lg:px-60 xl:px-80",
        "py-40 md:py-60 lg:py-80",
        "bg-bg1",
        props._className
      )}
      css={[props._css]}>
      <div className={cx("wrapper")}>
        {textGroup()}
        {servicesGrid()}
        {callToAction()}
      </div>
    </section>
  )

  function textGroup() {
    return (
      <div className={cx("flex", "pb-40 md:pb-60")}>
        <div className={cx("md:w-8/12 max-w-600", "flex flex-col", "gap-20 md:gap-30")}>
          <h2 className={cx("font-medium text-lg2 md:text-xl text-text1", "resetLeading")}>
            {title}
          </h2>
          <p className={cx("text-sm3 md:md2 lg:text-md3 text-text2")}>{text1}</p>
        </div>
      </div>
    )
  }

  function servicesGrid() {
    if (!services || services.length === 0) {
      return null
    }

    return (
      <ul
        css={{
          display: "grid",
          gridTemplateColumns: "repeat(auto-fit, minmax(300px, 1fr))",
          gap: 16,
        }}>
        {services.map(service => {
          return (
            <WhatMiniCard
              key={service.title}
              id={service.id}
              title={service.title}
              subTitle={service.subTitle}
              iconUrl={service.iconUrl}
              iconDarkUrl={service.iconDarkUrl}
              skills={service.skills}
            />
          )
        })}
      </ul>
    )
  }

  function callToAction() {
    return (
      <div className={cx("flex justify-center", "pt-40")}>
        <Button
          to={homeData.whatSection.moreButton.route}
          title={homeData.whatSection.moreButton.title}
          size="lg"
          frameColor={theme.colors.altBg1}
        />
      </div>
    )
  }
}

/**
 * WhatMiniCard
 */
type WhatMiniCardProps = IService & IStyleOverride & {}

function WhatMiniCard({
  id,
  title,
  subTitle,
  iconUrl,
  iconDarkUrl,
  skills,
  ...props
}: WhatMiniCardProps) {
  return (
    <Link
      to={`/services/#${id}`}
      className={cx("lg:aspect-w-4 lg:aspect-h-5", props._className)}
      css={[
        {
          ":hover > li": {
            backgroundColor: theme.colors.accent1,
            boxShadow: `0 0 black`,
            transition: `all 0.2s ease-in-out`,
          },
          ":hover > li > div > h3": {
            color: theme.colors.altText1,
          },
          ":hover > li > div > .subTitle": {
            color: theme.colors.altText1_60,
          },
          ":hover > li > div > img.light": {
            display: "none",
          },
          ":hover > li > div > img.dark": {
            display: "block",
          },
          ":hover > li > ul > li": {
            backgroundColor: theme.colors.altText1,
            color: theme.colors.text1,
          },
        },
        props._css,
      ]}>
      <li
        className={cx("flex flex-col justify-between gap-10", "p-20", "rounded-md")}
        css={{ boxShadow: `inset 0px 0px 0px 1px rgba(32,48,64,0.1)` }}>
        <div className={cx("flex flex-col gap-8")}>
          {iconUrl && (
            <>
              <img className={cx("light", "w-80 md:w-60 h-80 md:h-60")} src={iconUrl} alt={title} />
              <img
                className={cx("dark", "hidden", "w-80 md:w-60 h-80 md:h-60")}
                src={iconDarkUrl ?? iconUrl}
                alt={title}
              />
            </>
          )}
          <h3
            className={cx(
              "text-md2 md:text-md3 lg:text-md3 text-accent2",
              "resetLeading",
              "pt-10"
            )}>
            {title}
          </h3>

          {subTitle && (
            <p className={cx("subTitle text-xs md:text-sm text-text3", "resetLeading")}>
              {subTitle}
            </p>
          )}
        </div>

        {tags(skills)}
      </li>
    </Link>
  )

  function tags(skills?: ISkill[]) {
    if (!skills || skills.length === 0) {
      return null
    }

    return (
      <ul className={cx("flex flex-wrap gap-4 md:gap-6", "pt-40 lg:pt-0")}>
        {skills.map(skill => {
          return tag(skill.title)
        })}
      </ul>
    )
  }

  function tag(title: string) {
    return (
      <li
        key={title}
        className={cx("text-xs md:text-sm", "resetLeading", "p-8", "rounded-xs")}
        css={{
          color: Color(theme.colors.accent1).darken(0.3).hex(),
          backgroundColor: Color(theme.colors.accent1).lighten(0.3).hex(),
        }}>
        {title}
      </li>
    )
  }
}

/* -------------------------------------------------------------------------------- */

/**
 * ProjectsSection
 */
type ProjectsSectionProps = IStyleOverride & {
  projects?: IProjectEdge[]
}

function ProjectsSection({ projects, ...props }: ProjectsSectionProps) {
  if (!projects || projects.length === 0) {
    return null
  }

  return (
    <section
      id="projects"
      className={cx(
        "px-20 md:px-40 lg:px-60 xl:px-80",
        "py-40 md:py-60 lg:py-80",
        "bg-bg1",
        props._className
      )}
      css={[props._css]}>
      <div className={cx("grid grid-cols-1 md:grid-cols-2 gap-10 md:gap-20 lg:gap-30")}>
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

      <div className={cx("flex justify-center items-center", "pt-20 md:pt-40")}>
        <div className={cx("lg:w-3/12")}>
          <Button
            to={homeData.projectsSection.moreButton.route}
            title={homeData.projectsSection.moreButton.title}
            size="xl"
            frameColor={theme.colors.altBg1}
            flexible={true}
          />
        </div>
      </div>
    </section>
  )
}
