import config from "../../config"

export default {
  name: "projectSection",
  type: "object",
  fields: [
    {
      name: "sectionType",
      type: "string",
      options: {
        list: config.projects.sectionTypes,
        layout: "radio",
      },
      validation: rule => rule.required(),
    },
    {
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
        { type: "imagesGrid" },
      ],
    },
  ],
}
