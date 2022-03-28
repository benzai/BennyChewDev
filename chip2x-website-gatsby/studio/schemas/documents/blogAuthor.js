import { FiBookOpen } from "react-icons/fi"

export default {
  name: "blogAuthor",
  type: "document",
  icon: FiBookOpen,
  fields: [
    {
      name: "name",
      type: "string",
      validation: rule => rule.required(),
    },
    {
      name: "profileImage",
      type: "image",
    },
  ],
}
