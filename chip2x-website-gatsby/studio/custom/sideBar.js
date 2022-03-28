import S from "@sanity/desk-tool/structure-builder"

import { FiFileText, FiSettings } from "react-icons/fi"

const singletonPages = [
  { id: "siteConfig", title: "Site Configuration (admin)", icon: FiSettings },
  { id: "sharedSections", title: "Shared Sections", icon: FiFileText },
  // { id: "homePage", title: "Home Page", icon: FiFileText },
  { id: "aboutPage", title: "About Page", icon: FiFileText },
]

const hiddenDocTypes = listItem =>
  !["siteConfig", "sharedSections", "aboutPage"].includes(listItem.getId())

const mapPages = arr => {
  return arr.map(item => {
    return S.listItem()
      .title(item.title)
      .icon(item.icon)
      .child(S.editor().title(item.title).id(item.id).schemaType(item.id).documentId(item.id))
  })
}

export default () => {
  return S.list()
    .title("Content")
    .items([
      ...S.documentTypeListItems().filter(hiddenDocTypes),
      S.divider(),
      ...mapPages(singletonPages),
    ])
}
