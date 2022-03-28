import { FiBookOpen } from "react-icons/fi"

import config from "../config"

export default {
  name: "project",
  type: "document",
  icon: FiBookOpen,
  initialValue: () => ({
    showOnWebsite: true,
    backgroundColor: "#ffffff",
    theme: "dark",
  }),
  fieldsets: [
    {
      title: "Content",
      name: "contentFieldSet",
      options: {
        collapsible: true,
        collapsed: false,
      },
    },
    {
      title: "Supporting info",
      name: "supportingInfoFieldSet",
      options: {
        collapsible: true,
        collapsed: false,
      },
    },
    {
      title: "Style",
      name: "styleFieldSet",
      options: {
        collapsible: true,
        collapsed: false,
      },
    },
  ],
  fields: [
    {
      name: "showOnWebsite",
      type: "boolean",
      validation: rule => rule.required(),
    },
    {
      name: "title",
      type: "string",
      validation: rule => rule.required(),
    },
    {
      name: "slug",
      type: "slug",
      options: {
        source: "title",
        maxLength: 96,
      },
      validation: rule => rule.required(),
    },
    {
      name: "description",
      type: "text",
      validation: rule => rule.required(),
    },
    {
      name: "publishDate",
      type: "date",
      validation: rule => rule.required(),
    },
    // Style
    {
      name: "backgroundColor",
      type: "string",
      fieldset: "styleFieldSet",
      validation: rule => rule.required(),
    },
    {
      name: "theme",
      type: "string",
      options: {
        list: config.global.themes,
        layout: "radio",
      },
      fieldset: "styleFieldSet",
      validation: rule => rule.required(),
    },
    // Content
    {
      name: "contentSections",
      type: "array",
      options: {
        editModal: "fullscreen",
      },
      of: [{ type: "projectSection" }],
      fieldset: "contentFieldSet",
    },
    // Supporting info
    {
      name: "subTitle",
      type: "string",
      fieldset: "supportingInfoFieldSet",
    },
    {
      name: "coverImage",
      type: "image",
      fieldset: "supportingInfoFieldSet",
    },
    {
      name: "headerImage",
      type: "image",
      fieldset: "supportingInfoFieldSet",
    },
    {
      name: "client",
      type: "string",
      fieldset: "supportingInfoFieldSet",
    },
    {
      name: "category",
      type: "reference",
      to: [{ type: "projectCategory" }],
      fieldset: "supportingInfoFieldSet",
    },
    {
      name: "skills",
      type: "array",
      of: [
        {
          type: "reference",
          to: [{ type: "projectSkill" }],
        },
      ],
      fieldset: "supportingInfoFieldSet",
    },
    {
      name: "tools",
      type: "array",
      of: [
        {
          type: "reference",
          to: [{ type: "projectTool" }],
        },
      ],
      fieldset: "supportingInfoFieldSet",
    },
  ],
  orderings: [
    {
      title: "Publish Date, New",
      name: "publishDateDesc",
      by: [{ field: "publishDate", direction: "desc" }],
    },
    {
      title: "Publish Date, Old",
      name: "publishDateAsc",
      by: [{ field: "publishDate", direction: "asc" }],
    },
  ],
  preview: {
    select: {
      title: "title",
      subtitle: "client",
      media: "coverImage",
    },
  },
}
