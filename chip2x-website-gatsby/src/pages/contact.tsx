import { useEffect } from "react"
import { PageProps as GatsbyPageProps } from "gatsby"
import { cx } from "@emotion/css"

import theme from "../constants/theme"
import { IStyleOverride } from "../data/_componentTypes"
import { mainMenu, contactDetails } from "../data/siteConfig"
import { sharedData } from "../data/shared"
import { contactData } from "../data/contact"

import { Layout, SEO, Button, SubHeaderSection, ContactForm } from "../components"

type Props = GatsbyPageProps & {}

/**
 * Contact
 */
export default function ContactPage({}: Props) {
  useEffect(() => {}, [])

  return (
    <Layout mainMenu={mainMenu} contactDetails={contactDetails}>
      <SEO title={contactData.page.title} />
      <SubHeaderSection
        title={contactData.headerSection.title}
        subTitle={contactData.headerSection.subTitle}
      />
      <ContactFormSection />
    </Layout>
  )
}

/* -------------------------------------------------------------------------------- */

/**
 * ContactFormSection
 */
type ContactFormSectionProps = IStyleOverride & {}

function ContactFormSection({}: ContactFormSectionProps) {
  return (
    <section
      className={cx(
        "px-20 md:px-40 lg:px-60 xl:px-80",
        "pb-40 md:pb-60 lg:pb-80 xl:pb-120",
        "bg-bg1"
      )}>
      <div className={cx("lg:wrapper", "flex flex-col items-center", "lg:px-40 xl:px-80")}>
        <ContactForm confirmation={contactData.contactFormSection.confirmation} />
      </div>
    </section>
  )
}
