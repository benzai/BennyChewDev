import config from "../../config"

export default {
  name: "imagesLayout",
  type: "object",
  fields: [
    {
      name: "layoutType",
      type: "string",
      options: {
        list: config.projects.layoutTypes,
        layout: "radio",
      },
      validation: rule => rule.required(),
    },
    {
      name: "images",
      type: "array",
      of: [{ type: "projectImage" }],
      options: {
        layout: "grid",
      },
    },
  ],
  preview: {
    select: {
      layoutType: "layoutType",
      images: "images",
    },
    prepare(selection) {
      const { layoutType, images } = selection
      const imagesCount = !images
        ? `No images`
        : images.length === 1
        ? `${images.length} image`
        : `${images.length} images`
      return {
        title: `${layoutType}`,
        subtitle: `${imagesCount}`,
      }
    },
  },
}
