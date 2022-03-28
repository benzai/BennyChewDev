export default {
  name: "siteConfig",
  type: "document",
  __experimental_actions: ["update", "publish"],
  fields: [
    {
      name: "mainNav",
      description: "Used for the (desktop) main nav.",
      type: "mainNav",
      options: {
        collapsible: true,
        collapsed: false,
      },
    },
    // {
    //   name: "alternateNav",
    //   description: "Used for the mobile nav and footer nav.",
    //   type: "alternateNav",
    //   options: {
    //     collapsible: true,
    //     collapsed: false,
    //   },
    // },
  ],
}
