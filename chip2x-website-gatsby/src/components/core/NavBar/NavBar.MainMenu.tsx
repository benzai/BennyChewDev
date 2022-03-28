import * as React from "react"
import { Link } from "gatsby"
import cx from "classnames"

import theme from "../../../constants/theme"
import { IMenuItem } from "../../../data/siteConfig"
import { CaretDownGlyph } from "../../index"
import { NavBarStyleProps } from "./NavBar"

/**
 * MainMenu
 */
type MainMenuProps = {
  items: IMenuItem[]
  navBarStyleProps: NavBarStyleProps
}

export default function MainMenu({ items, navBarStyleProps }: MainMenuProps) {
  return (
    <nav>
      <ol className="flex items-center">
        {items.map(item => {
          return (
            <MainMenuButton
              key={item.title}
              title={item.title}
              route={item.route}
              subItems={item.subItems}
              navBarStyleProps={navBarStyleProps}
            />
          )
        })}
      </ol>
    </nav>
  )
}

/**
 * MainMenuButton
 */
type MainMenuButtonProps = {
  title: string
  route: string
  subItems?: IMenuItem[]
  navBarStyleProps: NavBarStyleProps
}

function MainMenuButton({ title, route, subItems, navBarStyleProps }: MainMenuButtonProps) {
  let hasSubItems = subItems && subItems.length > 0

  return (
    <Link
      className={cx("flex items-center", "h-full px-16", "text-sm3")}
      activeStyle={{
        backgroundColor: navBarStyleProps.menuActiveColor,
        color: navBarStyleProps.textActiveColor,
        borderRadius: 1000,
        height: 48,
      }}
      css={{
        color: navBarStyleProps.textColor,
        "&:hover": {
          color: navBarStyleProps.textHoverColor,
        },
      }}
      to={route}
      partiallyActive={true}>
      {title}
      {hasSubItems && <div className="w-4 bg-transparent" />}
      {hasSubItems && <CaretDownGlyph className="icon" color={navBarStyleProps.tintColor} />}
      {/* {subMenuItems.length > 0 ? subMenu(subMenuItems) : null} */}
    </Link>
  )
}
