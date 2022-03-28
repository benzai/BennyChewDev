export default {
  name: "projectImage",
  type: "object",
  fields: [
    {
      name: "image",
      type: "image",
      validation: rule => rule.required(),
    },
    {
      name: "showBorder",
      type: "boolean",
    },
  ],
  preview: {
    select: {
      media: "image",
    },
  },
}
