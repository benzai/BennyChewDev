import * as React from "react"
import { Link } from "gatsby"
import cx from "classnames"

import theme from "../../constants/theme"
import { IFooterMenuSection, IMenuItem, IContactDetails } from "../../data/siteConfig"
import { Button, IconButton, CaretDownGlyph, MenuIcon, CrossIcon } from "../index"

/**
 * Footer
 */
type Props = {
  footerMenuSections: IFooterMenuSection[]
  contactDetails: IContactDetails
}

export default function Footer({ footerMenuSections, contactDetails }: Props) {
  return (
    <footer className={cx("px-30 md:px-40", "py-30 md:py-40", "bg-bg3")}>
      <div className={cx("flex flex-col lg:flex-row justify-between")}>
        {authorPane()}
        {menuPane()}
        {socialPane()}
      </div>
      {copyright()}
    </footer>
  )

  function authorPane() {
    return (
      <div className={cx("lg:w-3/12 pb-40 lg:pb-0 lg:mr-40")}>
        <div className="flex flex-col justify-start items-start gap-20">
          <Link to={"/"}>
            {contactDetails.company.logoUrl && (
              <img
                className="h-48 md:h-60"
                src={contactDetails.company.logoUrl}
                alt={contactDetails.company.name}
              />
            )}
          </Link>

          {contactDetails.company.description && (
            <p className={cx("text-sm3 text-text1 leading-normal max-w-320")}>
              {contactDetails.company.description}
            </p>
          )}
        </div>
      </div>
    )
  }

  function menuPane() {
    return (
      <div className={cx("flex flex-col lg:flex-row flex-1")}>
        {footerMenuSections.map(section => {
          return (
            <div key={section.title} className={cx("w-full", "pb-40 lg:pb-0")}>
              <MenuSection title={section.title} items={section.items} />
            </div>
          )
        })}
      </div>
    )
  }

  function socialPane() {
    if (!contactDetails.links.socials || contactDetails.links.socials.length === 0) {
      return null
    }

    return (
      <nav className={cx("flex")}>
        {contactDetails.links.socials.map(social => {
          return (
            <Link key={social.title} to={social.websiteUrl} className="mr-4 last:mr-0">
              <img className={cx("w-40 h-40")} src={social.iconUrl} alt={social.title} />
            </Link>
          )
        })}
      </nav>
    )
  }

  function copyright() {
    let yearNow = new Date().getFullYear()
    let yearGiven = contactDetails.company.startYear ?? yearNow
    let yearText = yearNow === yearGiven ? `${yearGiven}` : `${yearGiven} - ${yearNow}`
    return (
      <div className="flex flex-col gap-8 pt-40">
        <p className="text-sm text-text2 resetLeading">
          &copy; {contactDetails.company.name} {yearText}. All rights reserved.
        </p>

        {contactDetails.company.legal && (
          <p className="text-sm text-text2 resetLeading">{contactDetails.company.legal}</p>
        )}
      </div>
    )
  }
}

/**
 * MenuSection
 */
type MenuSectionProps = {
  title: string
  items: IMenuItem[]
}

function MenuSection({ title, items = [] }: MenuSectionProps) {
  return (
    <div className={cx("flex flex-col", "")}>
      <h3
        className={cx(
          "text-sm lg:text-sm2 text-accent3 uppercase leading-none tracking-wide_sm",
          "pb-20"
        )}>
        {title}
      </h3>

      <nav className="flex flex-col">
        {items.map(item => {
          let linkStyle = cx("text-sm2 lg:text-sm3 text-text1", "hover:text-accent1", "py-8")

          let actionType = item.actionType ? item.actionType : "route"

          return actionType === "route" ? (
            <Link key={item.title} to={item.route} className={linkStyle}>
              {item.title}
            </Link>
          ) : actionType === "external" ? (
            <div key={item.title} className={cx("flex items-center")}>
              {item.iconUrl && (
                <img className="w-24 h-24 mr-10" src={item.iconUrl} alt={item.title} />
              )}
              <a key={item.title} href={item.route} target="_blank" className={linkStyle}>
                {item.title}
              </a>
            </div>
          ) : null
        })}
      </nav>
    </div>
  )
}
