import { FiBookOpen } from "react-icons/fi"

export default {
  name: "projectSkill",
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
