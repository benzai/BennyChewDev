export default {
  name: "mainNav",
  type: "object",
  fields: [
    {
      name: "menuItems",
      type: "array",
      of: [
        {
          type: "navItem",
        },
      ],
    },
    // {
    //   name: "callToAction",
    //   type: "pageAction",
    //   options: {
    //     collapsible: true,
    //     collapsed: true,
    //   },
    // },
  ],
}
