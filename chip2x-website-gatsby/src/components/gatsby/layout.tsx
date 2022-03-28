import * as React from "react"

import { IMainMenu, IContactDetails } from "../../data/siteConfig"
import { NavBarStyle } from "../core/NavBar/NavBar"

import { NavBar, Footer } from "../"

type Props = {
  children?: React.ReactNode
  mainMenu: IMainMenu
  contactDetails: IContactDetails
  navBarStyle?: NavBarStyle
}

export default function Layout({ children, mainMenu, contactDetails, navBarStyle }: Props) {
  return (
    <div className="relative bg-bg1">
      <NavBar
        menuItems={mainMenu.menuItems}
        mobileMenuItems={mainMenu.mobileMenuItems}
        nextActions={mainMenu.nextActions}
        contactDetails={contactDetails}
        navBarStyle={navBarStyle}
      />
      <main>{children}</main>
      <Footer footerMenuSections={mainMenu.footerMenuSections} contactDetails={contactDetails} />
    </div>
  )
}
