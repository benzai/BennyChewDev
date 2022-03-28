export default {
  name: "callToActionSection",
  type: "object",
  fields: [
    {
      name: "title",
      type: "string",
      options: {
        collapsible: true,
        collapsed: false,
      },
    },
    {
      name: "description",
      type: "text",
      options: {
        collapsible: true,
        collapsed: false,
      },
    },
    // {
    //   name: "callToAction",
    //   type: "pageAction",
    //   options: {
    //     collapsible: true,
    //     collapsed: false,
    //   },
    // },
  ],
  preview: {
    select: {
      title: "title.en",
    },
  },
}
