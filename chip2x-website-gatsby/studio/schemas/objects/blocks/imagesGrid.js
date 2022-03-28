import config from "../../config"

export default {
  name: "imagesGrid",
  type: "object",
  fields: [
    {
      name: "layouts",
      type: "array",
      of: [{ type: "imagesLayout" }],
    },
  ],
  preview: {
    select: {
      type: "_type",
      layouts: "layouts",
    },
    prepare(selection) {
      const { type, layouts } = selection
      const layoutsCount = !layouts
        ? `No layouts`
        : layouts.length === 1
        ? `${layouts.length} layout`
        : `${layouts.length} layouts`
      return {
        title: `${type}`,
        subtitle: `${layoutsCount}`,
      }
    },
  },
}
