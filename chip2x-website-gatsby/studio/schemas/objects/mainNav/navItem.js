export default {
  name: "navItem",
  type: "object",
  fields: [
    {
      name: "menuItem",
      type: "reference",
      to: [{ type: "menuItem" }],
    },
    {
      name: "subMenuItems",
      type: "array",
      of: [
        {
          type: "reference",
          to: [{ type: "menuItem" }],
        },
      ],
    },
  ],
  preview: {
    select: {
      title: "menuItem.title.en",
      subtitle: "menuItem.slug.current",
    },
  },
}
