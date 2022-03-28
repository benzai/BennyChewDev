import { FiBookOpen } from "react-icons/fi"

export default {
  name: "projectTool",
  type: "document",
  icon: FiBookOpen,
  fields: [
    {
      name: "title",
      type: "string",
      validation: rule => rule.required(),
    },
    {
      name: "iconImage",
      type: "image",
      validation: rule => rule.required(),
    },
  ],
}
