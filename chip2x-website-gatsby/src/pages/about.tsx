import { useEffect } from "react"
import { PageProps as GatsbyPageProps, graphql, Link } from "gatsby"
import { cx } from "@emotion/css"
import * as Color from "color"

import theme from "../constants/theme"
import { IStyleOverride } from "../data/_componentTypes"
import { mainMenu, contactDetails } from "../data/siteConfig"
import { ISocial, ITeamMember, ISkill, sharedData } from "../data/shared"
import { IService } from "../data/services"
import { IPhoto, IWorkflowStep, aboutData } from "../data/about"

import { patternWhatApps, patternWhatUX } from "../assets/graphics"
import { Layout, SEO, Button, SubHeaderSection, CallToActionSection } from "../components"

type Props = GatsbyPageProps & {}

/**
 * About
 */
export default function AboutPage({}: Props) {
  useEffect(() => {}, [])

  return (
    <Layout mainMenu={mainMenu} contactDetails={contactDetails}>
      <SEO title={aboutData.page.title} />
      <SubHeaderSection
        title={aboutData.headerSection.title}
        subTitle={aboutData.headerSection.subTitle}
        titleType="callout"
      />
      <IntroSection photos={aboutData.introSection.photos} />
      <HowSection title={aboutData.howSection.title} steps={aboutData.howSection.steps} />
      <TeamSection
        title={aboutData.teamSection.title}
        text1={aboutData.teamSection.text1}
        text2={aboutData.teamSection.text2}
        text3={aboutData.teamSection.text3}
        text4={aboutData.teamSection.text4}
        teamMembers={aboutData.teamSection.teamMembers}
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

/* -------------------------------------------------------------------------------- */

/**
 * IntroSection
 */
type IntroSectionProps = IStyleOverride & {
  photos: IPhoto[]
}

function IntroSection({ photos }: IntroSectionProps) {
  return (
    <section
      className={cx(
        "px-20 md:px-40 lg:px-60 xl:px-80",
        "pb-40 md:pb-60 lg:pb-80 xl:pb-120",
        "bg-bg1"
      )}>
      <div className={cx("wrapper")}>
        <div className={cx("grid grid-cols-2 gap-10 md:gap-20", "px-1/12 md:px-2/12")}>
          {photos.map(photo => {
            return image(photo.title, photo.imageUrl, photo.resizeCss)
          })}
        </div>
      </div>
    </section>
  )

  function image(title: string, imageUrl: string, resizeCss?: string) {
    return (
      <div key={imageUrl} className={cx("aspect-w-1 aspect-h-1")}>
        <div className={cx(resizeCss)}>
          <img
            key={title}
            className={cx("w-full h-full", "rounded-md object-cover")}
            src={imageUrl}
            alt={title}
          />
        </div>
      </div>
    )
  }
}

/* -------------------------------------------------------------------------------- */

/**
 * HowSection
 */
type HowSectionProps = IStyleOverride & {
  title: string
  steps: IWorkflowStep[]
}

function HowSection({ title, steps }: HowSectionProps) {
  return (
    <section
      className={cx(
        "px-20 md:px-40 lg:px-60 xl:px-80",
        "pt-40 md:pt-60 lg:pt-80 xl:pt-120",
        "pb-40 md:pb-60 lg:pb-[240px]",
        "bg-altBg1"
      )}
      css={[
        {
          backgroundImage: `url(${patternWhatApps}), url(${patternWhatUX})`,
          backgroundPosition: `top right, bottom left`,
          backgroundRepeat: "no-repeat",
          backgroundSize: `100px, 100px`,
          [theme.mq(theme.screens.md)]: {
            backgroundSize: `200px, 200px`,
          },
          [theme.mq(theme.screens.lg)]: {
            backgroundSize: `300px, 300px`,
          },
          [theme.mq(theme.screens.xl)]: {
            backgroundSize: `400px, 400px`,
          },
        },
      ]}>
      <div className={cx("wrapper", "flex flex-col items-center")}>
        <div className={cx("lg:w-6/12", "mb-40 md:mb-60")}>
          <h2
            className={cx(
              "font-medium text-lg2 md:text-lg3 lg:text-xl text-altText1 text-center",
              "resetLeading"
            )}>
            {title}
          </h2>
        </div>

        <div className={cx("grid grid-cols-1 gap-40 md:gap-60 xl:gap-80")}>
          {steps.map(step => {
            return textBlock(
              step.count,
              step.title,
              step.subTitle,
              step.text1,
              step.text2,
              step.positionCss
            )
          })}
        </div>
      </div>
    </section>
  )

  function textBlock(
    count: string,
    title: string,
    subTitle: string,
    text1: string,
    text2?: string,
    positionCss?: string
  ) {
    return (
      <div
        key={title}
        className={cx("md:w-10/12 lg:w-8/12 xl:w-7/12", positionCss)}
        css={{
          display: "grid",
          gridTemplateColumns: `40px 1fr`,
          gridTemplateRows: `auto 1fr`,
          gridTemplateAreas: `"count ." ". content"`,
          gap: `10px`,
        }}>
        <p
          css={{ gridArea: `count` }}
          className={cx(
            "text-md2 md:text-md3 lg:text-lg xl:text-lg2 text-text3 text-right",
            "resetLeading",
            "opacity-40"
          )}>
          {count}
        </p>
        <article
          className="pb-40"
          css={{ gridArea: `content`, borderBottom: `2px solid ${theme.colors.accent2}` }}>
          <h3
            className={cx(
              "text-md2 md:text-md3 lg:text-md3 xl:text-lg text-text3",
              "resetLeading",
              "mb-10"
            )}>
            {title}
          </h3>
          <p className={cx("text-sm md:text-sm2 lg:text-sm3 text-altText1", "resetLeading")}>
            {subTitle}
          </p>

          <div className="h-20 md:h-30" />

          <div className={cx("flex flex-col gap-30 md:gap-40")}>
            <p className={cx("text-sm3 md:text-md2 lg:text-md3 text-altText1")}>{text1}</p>
            {text2 && (
              <p className={cx("text-sm3 md:text-md2 lg:text-md3 text-altText1")}>{text2}</p>
            )}
          </div>
        </article>
      </div>
    )
  }
}

/* -------------------------------------------------------------------------------- */

/**
 * TeamSection
 */
type TeamSectionProps = IStyleOverride & {
  title: string
  text1: string
  text2: string
  text3: string
  text4: string
  teamMembers: ITeamMember[]
}

function TeamSection({ title, text1, text2, text3, text4, teamMembers }: TeamSectionProps) {
  return (
    <section
      className={cx("px-20 md:px-40 lg:px-60 xl:px-80", "py-40 md:py-60 lg:py-80 xl:py-120")}>
      <div className={cx("wrapper", "flex flex-col items-center")}>
        <div className={cx("lg:w-6/12", "mb-40 md:mb-60")} css={{ alignSelf: "flex-start" }}>
          <h2
            className={cx(
              "font-medium text-lg2 md:text-lg3 lg:text-xl text-text1",
              "resetLeading",
              "mb-40"
            )}>
            {title}
          </h2>

          <p className={cx("text-sm3 md:text-md2 lg:text-md3 text-text1")}>{text1}</p>
        </div>

        <div
          className={cx(
            "grid grid-cols-1 lg:grid-cols-2 gap-10 md:gap-20 lg:gap-30",
            "w-full",
            "mb-60"
          )}>
          {teamMembers.map(teamMember => {
            return (
              <TeamMemberCard
                key={teamMember.name}
                name={teamMember.name}
                occupation={teamMember.occupation}
                avatarUrl={teamMember.avatarUrl}
                text1={teamMember.text1}
                skills={teamMember.skills}
                socials={teamMember.socials}
                accentColor={teamMember.accentColor}
              />
            )
          })}
        </div>

        <div className={cx("lg:w-6/12", "flex flex-col gap-40")} css={{ alignSelf: "flex-end" }}>
          <p className={cx("text-sm3 md:text-md2 lg:text-md3 text-text1")}>{text2}</p>
          <p className={cx("text-sm3 md:text-md2 lg:text-md3 text-text1")}>{text3}</p>
          <p className={cx("text-sm3 md:text-md2 lg:text-md3 text-accent2")}>{text4}</p>
        </div>
      </div>
    </section>
  )
}

/**
 * TeamMemberCard
 */
type TeamMemberCardProps = ITeamMember & IStyleOverride & {}

function TeamMemberCard({
  name,
  occupation,
  avatarUrl,
  text1,
  skills,
  socials,
  accentColor,
}: TeamMemberCardProps) {
  return (
    <div className={cx("xl:aspect-w-6 xl:aspect-h-4")}>
      <div
        className={cx("flex flex-col lg:flex-row", "rounded-md")}
        css={{ boxShadow: `inset 0px 0px 0px 1px rgba(32,48,64,0.1)` }}>
        {sideBar()}
        {contentPane()}
      </div>
    </div>
  )

  function sideBar() {
    return (
      <div
        className={cx(
          "flex flex-col justify-center items-center",
          "rounded-md",
          "lg:w-240 xl:w-280",
          "p-20 md:p-40",
          accentColor ?? "bg-altBg1"
        )}>
        <img
          className={cx(
            "w-60 md:w-80 lg:w-120 h-60 md:h-80 lg:h-120 object-cover rounded-round",
            "mb-10 md:mb-16"
          )}
          css={{ border: `2px solid white` }}
          src={avatarUrl}
        />
        <h3 className={cx("text-sm3 md:text-md text-altText1 text-center", "resetLeading", "mb-8")}>
          {name}
        </h3>
        <p className={cx("text-sm2 text-text1 text-center", "resetLeading", "mb-20 lg:mb-40")}>
          {occupation}
        </p>

        {socialButtons(socials)}
      </div>
    )
  }

  function contentPane() {
    return (
      <div
        className={cx(
          "flex flex-1 flex-col justify-between items-center",
          "px-20 md:px-30 py-20 md:py-40"
        )}>
        <p className={cx("text-sm2 xl:text-sm3 text-text1")}>{text1}</p>

        {tags(skills)}
      </div>
    )
  }

  function socialButtons(socials?: ISocial[]) {
    if (!socials || socials.length === 0) {
      return null
    }

    return (
      <div className={cx("flex gap-6")}>
        {socials.map(social => {
          return (
            <a key={social.title} href={social.websiteUrl} target="_blank">
              <img className={cx("w-32 h-32")} src={social.iconDarkUrl} alt={social.title} />
            </a>
          )
        })}
      </div>
    )
  }

  function tags(skills?: ISkill[]) {
    if (!skills || skills.length === 0) {
      return null
    }

    return (
      <ul className={cx("flex flex-wrap gap-4 md:gap-6", "pt-40")}>
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
