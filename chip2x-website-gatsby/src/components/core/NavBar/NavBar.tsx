import * as React from "react"
import { Link } from "gatsby"
import cx from "classnames"
import * as Color from "color"

import theme from "../../../constants/theme"
import { IMenuItem, INextAction, IContactDetails } from "../../../data/siteConfig"
import { Button, IconButton, CaretDownGlyph, MenuIcon, CrossIcon } from "../../index"
import MainMenu from "./NavBar.MainMenu"
import MobileMenu from "./NavBar.MobileMenu"

/**
 * NavBar
 */
type Props = {
  menuItems: IMenuItem[]
  mobileMenuItems?: IMenuItem[]
  nextActions?: INextAction[]
  contactDetails: IContactDetails
  navBarStyle: NavBarStyle
}

export type NavBarStyle = {
  theme: "light" | "dark"
  navBarColor: string
}

export type NavBarStyleProps = {
  logoUrl: string
  navBarColor: string
  textColor: string
  textActiveColor: string
  textHoverColor: string
  tintColor: string
  menuActiveColor: string
  actionButton: {
    textColor: string
    frameColor: string
  }
}

export default function NavBar({
  menuItems,
  mobileMenuItems,
  nextActions,
  contactDetails,
  navBarStyle = { theme: "light", navBarColor: theme.colors.bg1 },
}: Props) {
  const [isMobileMenuOpen, setMobileMenuOpen] = React.useState(false)

  const navBarStyles: Record<NavBarStyle["theme"], NavBarStyleProps> = {
    light: {
      logoUrl: contactDetails.company.logoUrl,
      navBarColor: navBarStyle.navBarColor,
      textColor: theme.colors.text1,
      textActiveColor: theme.colors.altText1,
      textHoverColor: theme.colors.accent1,
      tintColor: theme.colors.text3,
      menuActiveColor: theme.colors.accent1,
      actionButton: {
        textColor: theme.colors.altText1,
        frameColor: theme.colors.altBg1,
      },
    },
    dark: {
      logoUrl: contactDetails.company.logoDarkUrl ?? contactDetails.company.logoUrl,
      navBarColor: navBarStyle.navBarColor,
      textColor: theme.colors.altText1,
      textActiveColor: theme.colors.text1,
      textHoverColor: theme.colors.text1,
      tintColor: theme.colors.altText1_60,
      menuActiveColor: theme.colors.altText1,
      actionButton: {
        textColor: theme.colors.text1,
        frameColor: theme.colors.bg1,
      },
    },
  }

  return (
    <section className={cx()}>
      {debug(true)}
      {topBar()}
      {mobileMenuPane()}
    </section>
  )

  function debug(hide: boolean = false) {
    if (hide) {
      return null
    }

    return (
      <div className="flex justify-center p-4 bg-blue-100">
        <p className="md:hidden text-md">SM</p>
        <p className="hidden md:block lg:hidden text-md">MD</p>
        <p className="hidden lg:block xl:hidden text-md">LG</p>
        <p className="hidden xl:block text-md">XL</p>
      </div>
    )
  }

  function topBar() {
    return (
      <div
        className={cx("h-64 md:h-80 lg:h-100")}
        css={{
          backgroundColor: Color(navBarStyles[navBarStyle.theme].navBarColor).lighten(0.1).hex(),
        }}>
        <div className="flex justify-between h-full px-10 md:px-20 lg:px-30">
          {logoPane()}
          {mainMenuPane()}
          {actionsPane()}
        </div>
      </div>
    )
  }

  function mobileMenuPane() {
    let items = mobileMenuItems && mobileMenuItems.length > 0 ? mobileMenuItems : menuItems
    return (
      isMobileMenuOpen && (
        <div className={cx("block md:hidden")}>
          <MobileMenu items={items} />
        </div>
      )
    )
  }

  function logoPane() {
    if (!contactDetails.company.logoUrl) {
      return null
    }

    return (
      <div className={cx("flex justify-start items-center", "h-full flex-1")}>
        <Link to={"/"}>
          <img
            className="h-48 md:h-60"
            src={navBarStyles[navBarStyle.theme].logoUrl}
            alt={contactDetails.company.name}
          />
        </Link>
      </div>
    )
  }

  function mainMenuPane() {
    return (
      <div className={cx("hidden md:flex items-center", "h-full")}>
        <MainMenu items={menuItems} navBarStyleProps={navBarStyles[navBarStyle.theme]} />
      </div>
    )
  }

  function actionsPane() {
    return (
      <div className={cx("flex justify-end items-center", "flex-1")}>
        {actionButtons()}
        {toggleIconButton()}
      </div>
    )

    function actionButtons() {
      return (
        <div className={cx("hidden md:flex items-center", "h-full")}>
          <div className="flex gap-4">
            {nextActions.map(item => {
              return (
                <Button
                  key={item.title}
                  title={item.title}
                  to={item.route}
                  size="lg"
                  textColor={navBarStyles[navBarStyle.theme].actionButton.textColor}
                  frameColor={navBarStyles[navBarStyle.theme].actionButton.frameColor}
                />
              )
            })}
          </div>
        </div>
      )
    }

    function toggleIconButton() {
      return (
        <div className={cx("flex md:hidden items-center", "h-full")}>
          <IconButton
            type="button"
            onClick={() => {
              setMobileMenuOpen(!isMobileMenuOpen)
            }}
            icon={!isMobileMenuOpen ? <MenuIcon /> : <CrossIcon />}
            frameColor={theme.colors.altBg1}
            size="md"
          />
        </div>
      )
    }
  }
}
