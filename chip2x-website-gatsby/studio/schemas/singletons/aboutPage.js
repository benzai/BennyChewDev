export default {
  name: "aboutPage",
  type: "document",
  __experimental_actions: ["update", "publish"],
  fields: [
    {
      name: "pageTitle",
      type: "localeString",
      validation: rule => rule.required(),
    },
  ],
  preview: {
    select: {
      title: "pageTitle.en",
    },
  },
}
