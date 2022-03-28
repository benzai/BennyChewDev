import config from "./config"
const defaultLocale = config.defaultLocale
const languages = config.languages

export default {
  name: "localeBlock",
  type: "object",
  fieldsets: [
    {
      title: "Translations",
      name: "translations",
      options: {
        collapsible: true,
        collapsed: true,
      },
    },
  ],
  fields: languages.map(language => ({
    title: language.title,
    name: language.locale,
    type: "array",
    of: [
      {
        type: "block",
        styles: [{ title: "Normal", value: "normal" }],
        marks: {
          decorators: [
            { title: "Strong", value: "strong" },
            { title: "Emphasis", value: "em" },
          ],
        },
      },
    ],
    fieldset: language.locale === defaultLocale ? null : "translations",
  })),
}
