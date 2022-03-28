import { FiBookOpen } from "react-icons/fi";

export default {
  title: "Menu items (admin)",
  name: "menuItem",
  type: "document",
  icon: FiBookOpen,
  fieldsets: [
    {
      title: "Sub menu",
      name: "subMenu",
      description: "Only used for sub menu items.",
      options: {
        collapsible: true,
        collapsed: false,
      },
    },
  ],
  fields: [
    {
      name: "title",
      type: "localeString",
      validation: rule => rule.required(),
    },
    {
      name: "slug",
      description:
        "Absolute path to the page (start with /). If this is a sub menu section header, you can define the slug but it will not have an own page.",
      type: "slug",
    },
    {
      title: "Is Section Header (desktop)",
      name: "isSectionHeader",
      description:
        "Turn on if this menu item is a sub menu section header (on desktop). The section header will open the sub menu and does not have an own page.",
      type: "boolean",
      fieldset: "subMenu",
    },
    {
      title: "Is Sub Menu Item (desktop)",
      name: "isSubMenuItem",
      description: "Turn on if this menu item is part of a sub menu section (on desktop).",
      type: "boolean",
      fieldset: "subMenu",
    },
    {
      name: "description",
      type: "localeString",
      fieldset: "subMenu",
    },
    {
      name: "thumbnailImage",
      type: "image",
      fieldset: "subMenu",
    },
  ],
  orderings: [
    {
      title: "Slug",
      name: "slugAsc",
      by: [{ field: "slug.current", direction: "asc" }],
    },
    {
      title: "Title",
      name: "titleAsc",
      by: [{ field: "title.en", direction: "asc" }],
    },
  ],
  initialValue: {
    isSubMenuItem: false,
  },
  preview: {
    select: {
      title: "slug.current",
      subtitle: "title.en",
    },
  },
};
