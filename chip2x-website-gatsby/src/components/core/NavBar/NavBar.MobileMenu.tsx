import * as React from "react"
import { Link } from "gatsby"
import cx from "classnames"

import theme from "../../../constants/theme"
import { IMenuItem } from "../../../data/siteConfig"
import { Button, IconButton, CaretDownGlyph, CaretUpGlyph, MenuIcon, CrossIcon } from "../../index"

const buttonStyle = cx("flex justify-between items-center", "h-60", "px-16", "text-sm3 text-text1")

/**
 * MobileMenu
 */
type MobileMenuProps = {
  items: IMenuItem[]
}

export default function MobileMenu({ items }: MobileMenuProps) {
  return (
    <nav className={cx("w-full")}>
      <ol className="flex flex-col">
        {items.map(item => {
          let hasSubItems = item.subItems && item.subItems.length > 0
          return hasSubItems ? (
            <SubMenu key={item.title} title={item.title} subItems={item.subItems} />
          ) : (
            <MenuButton key={item.title} title={item.title} route={item.route} />
          )
        })}
      </ol>
    </nav>
  )
}

/**
 * SubMenu
 */
type SubMenuProps = {
  title: string
  subItems: IMenuItem[]
}

function SubMenu({ title, subItems }: SubMenuProps) {
  return (
    <div className={cx("")}>
      <input
        type="checkbox"
        id={title}
        className="hidden"
        css={{
          "label div .icon": { display: "block" },
          ":checked ~ label div .icon": { display: "none" },
          ":checked ~ label div .icon-active": { display: "block" },
          ":checked ~ .submenu": { display: "block", opacity: 1 },
        }}
      />
      <label htmlFor={title} className={cx("cursor-pointer", "block")}>
        <div className={buttonStyle} css={{ borderBottom: `1px solid ${theme.colors.border1}` }}>
          {title}
          <CaretDownGlyph className="icon" color={theme.colors.text3} />
          <CaretUpGlyph className="icon-active hidden" color={theme.colors.accent1} />
        </div>
      </label>

      <div className={cx("submenu", "hidden opacity-0", "bg-bg2")}>
        <ol className={cx("flex flex-col", "")}>
          {subItems.map(subItem => {
            return <MenuButton key={subItem.title} title={subItem.title} route={subItem.route} />
          })}
        </ol>
      </div>
    </div>
  )
}

/**
 * MenuButton
 */
type MenuButtonProps = {
  title: string
  route: string
}

function MenuButton({ title, route }: MenuButtonProps) {
  return (
    <Link to={route} className={cx()}>
      <div className={buttonStyle} css={{ borderBottom: `1px solid ${theme.colors.border1}` }}>
        {title}
      </div>
    </Link>
  )
}
