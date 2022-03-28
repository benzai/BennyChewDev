import config from "./config"
const defaultLocale = config.defaultLocale
const languages = config.languages

export default {
  name: "localeText",
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
    type: "text",
    fieldset: language.locale === defaultLocale ? null : "translations",
  })),
}
