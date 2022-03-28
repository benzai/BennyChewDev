import { FiBookOpen } from "react-icons/fi"

export default {
  name: "blog",
  type: "document",
  icon: FiBookOpen,
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
      title: "Content",
      name: "content",
      type: "array",
      of: [
        {
          type: "block",
          styles: [
            { title: "Normal", value: "normal" },
            { title: "Heading 2", value: "h2" },
            { title: "Heading 3", value: "h3" },
          ],
          marks: {
            decorators: [
              { title: "Strong", value: "strong" },
              { title: "Emphasis", value: "em" },
            ],
          },
        },
      ],
    },
    {
      name: "coverImage",
      type: "image",
    },
    {
      name: "publishDate",
      type: "date",
      validation: rule => rule.required(),
    },
    {
      name: "author",
      type: "reference",
      to: [{ type: "blogAuthor" }],
      validation: rule => rule.required(),
    },
    {
      name: "category",
      type: "reference",
      to: [{ type: "blogCategory" }],
      validation: rule => rule.required(),
    },
  ],
  initialValue: () => ({
    isPublish: false,
    author: {
      _ref: "c1b544f2-3d0e-4c59-94de-e85cdf755884",
      _type: "reference",
    },
    category: {
      _ref: "c90f99ca-8f63-4bc3-a35e-2a6ed6815cc1",
      _type: "reference",
    },
  }),
  preview: {
    select: {
      title: "title",
      subtitle: "slug.current",
    },
  },
}
