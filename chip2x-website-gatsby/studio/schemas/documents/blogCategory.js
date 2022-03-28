import { FiBookOpen } from "react-icons/fi"

export default {
  name: "blogCategory",
  type: "document",
  icon: FiBookOpen,
  fields: [
    {
      name: "title",
      type: "string",
      validation: rule => rule.required(),
    },
  ],
}
