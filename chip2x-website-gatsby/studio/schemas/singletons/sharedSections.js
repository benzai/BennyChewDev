import { FiSquare } from "react-icons/fi"

export default {
  name: "sharedSections",
  type: "document",
  icon: FiSquare,
  __experimental_actions: ["update", "publish"],
  fields: [
    {
      name: "callToActionSection",
      type: "callToActionSection",
      options: {
        collapsible: true,
        collapsed: true,
      },
    },
  ],
}
