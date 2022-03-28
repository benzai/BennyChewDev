import * as React from "react"
import { useEffect } from "react"
import { PageProps as GatsbyPageProps, graphql, Link } from "gatsby"
import { cx } from "@emotion/css"
import * as Color from "color"

import theme from "../constants/theme"
import { IStyleOverride } from "../data/_componentTypes"
import { mainMenu, contactDetails } from "../data/siteConfig"
import { ISkill, sharedData } from "../data/shared"
import { IService, servicesData } from "../data/services"

import { Layout, SEO, Button, SubHeaderSection, CallToActionSection, Section } from "../components"

type Props = GatsbyPageProps & {}

/**
 * Services
 */
export default function ServicesPage({}: Props) {
  useEffect(() => {}, [])

  return (
    <Layout mainMenu={mainMenu} contactDetails={contactDetails}>
      <SEO title={servicesData.page.title} />
      <SubHeaderSection
        title={servicesData.headerSection.title}
        subTitle={servicesData.headerSection.subTitle}>
        <SectionTabs services={servicesData.servicesSection.services} />
      </SubHeaderSection>
      <ServicesSection services={servicesData.servicesSection.services} />
      <CallToActionSection
        title={sharedData.callToActionSection.title}
        subTitle={sharedData.callToActionSection.subTitle}
        text1={sharedData.callToActionSection.text1}
        moreButton={sharedData.callToActionSection.moreButton}
      />
    </Layout>
  )
}

/* -------------------------------------------------------------------------------- */

/**
 * SectionTabs
 */
type SectionTabsProps = {
  services?: IService[]
}

function SectionTabs({ services }: SectionTabsProps) {
  if (!services || services.length === 0) {
    return null
  }

  return (
    <nav className={cx("hidden md:flex justify-center items-center")}>
      <ul className={cx("flex justify-center flex-wrap", "p-8", "bg-bg3 rounded-md")}>
        {services.map(service => {
          return (
            <Link
              key={service.id}
              to={`/services/#${service.id}`}
              css={{
                ":hover > li": {
                  backgroundColor: theme.colors.accent1,
                  transition: `all 0.2s ease-in-out`,
                },
                ":hover > li > h2": {
                  color: theme.colors.altText1,
                },
                ":hover > li > img.light": {
                  display: "none",
                },
                ":hover > li > img.dark": {
                  display: "block",
                },
              }}>
              <li
                className={cx(
                  "flex flex-col items-center gap-10",
                  service.iconUrl ? "justify-end" : "justify-center",
                  "py-20",
                  "w-160 h-160",
                  "rounded-md"
                )}>
                {service.iconUrl && (
                  <React.Fragment>
                    <img
                      className={cx("light", "w-60 h-60")}
                      src={service.iconUrl}
                      alt={service.title}
                    />
                    <img
                      className={cx("dark", "hidden", "w-60 h-60")}
                      src={service.iconDarkUrl ?? service.iconUrl}
                      alt={service.title}
                    />
                  </React.Fragment>
                )}
                <h2 className={cx("text-md text-text1", "resetLeading", "pt-8")}>
                  {service.shortTitle ?? service.title}
                </h2>
              </li>
            </Link>
          )
        })}
      </ul>
    </nav>
  )
}

/* -------------------------------------------------------------------------------- */

/**
 * ServicesSection
 */
type ServicesSectionProps = {
  services?: IService[]
}

function ServicesSection({ services }: ServicesSectionProps) {
  if (!services || services.length === 0) {
    return null
  }

  return (
    <section
      className={cx(
        "px-20 md:px-40 lg:px-60 xl:px-80",
        "py-40 md:py-60 lg:py-80 xl:py-120",
        "bg-bg1"
      )}>
      <div className={cx("flex flex-col")}>
        {services.map((service, index) => {
          return (
            <ServiceBlock
              key={service.id}
              id={service.id}
              title={service.title}
              subTitle={service.subTitle}
              text1={service.text1}
              text2={service.text2}
              coverImageUrl={service.coverImageUrl}
              skills={service.skills}
              flippedLayout={index % 2 === 0 ? false : true}
            />
          )
        })}
      </div>
    </section>
  )
}

/**
 * ServiceBlock
 */
type ServiceBlockProps = IService & {
  flippedLayout?: boolean
}

function ServiceBlock({
  id,
  title,
  subTitle,
  text1,
  text2,
  coverImageUrl,
  skills,
  flippedLayout = false,
}: ServiceBlockProps) {
  return (
    <section
      id={id}
      className={cx(
        "px-20 md:px-40 lg:px-60 xl:px-80",
        "pb-40 md:pb-60 lg:pb-80 xl:pb-120",
        "last:pb-0",
        "bg-bg1"
      )}>
      <div className={cx("wrapper")}>
        <div className={cx("flex flex-col lg:flex-row")}>
          {coverImageUrl && (
            <div
              className={cx(
                flippedLayout && "lg:order-last",
                "lg:w-6/12",
                "px-60", 
                "py-20 md:py-0",
                "flex flex-col lg:flex-row justify-center items-center"
              )}>
              <img className={cx("lg:p-40")} src={coverImageUrl} alt={title} />
            </div>
          )}

          <div className={cx(flippedLayout && "lg:w-1/12")} />

          <div
            className={cx(
              "lg:w-5/12 max-w-700",
              "lg:pt-40 pb-40 lg:pb-0 lg:pr-40",
              "flex flex-col"
            )}>
            <div className={cx("flex flex-col gap-8", "mb-30 lg:mb-40")}>
              <h3
                className={cx(
                  "text-lg md:text-lg2 lg:text-lg3 xl:text-xl text-accent2",
                  "resetLeading"
                )}>
                {title}
              </h3>

              {subTitle && (
                <p className={cx("subTitle text-sm md:text-sm2 text-text3", "resetLeading")}>
                  {subTitle}
                </p>
              )}
            </div>

            <div className={cx("flex flex-col gap-20 md:gap-30", "pb-40")}>
              <p className={cx("text-sm3 md:text-md2 text-text1")}>{text1}</p>
              {text2 && <p className={cx("text-sm3 md:text-md2 text-text1")}>{text2}</p>}
            </div>

            {tags(skills)}
          </div>
        </div>
      </div>
    </section>
  )

  function tags(skills?: ISkill[]) {
    if (!skills || skills.length === 0) {
      return null
    }

    return (
      <ul className={cx("flex flex-wrap gap-6")}>
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
        className={cx("text-sm2", "p-8", "rounded-sm")}
        css={{
          color: Color(theme.colors.accent1).darken(0.3).hex(),
          backgroundColor: Color(theme.colors.accent1).lighten(0.3).hex(),
        }}>
        {title}
      </li>
    )
  }
}
