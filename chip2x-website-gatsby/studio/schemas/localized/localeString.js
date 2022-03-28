import config from "./config"
const defaultLocale = config.defaultLocale
const languages = config.languages

export default {
  name: "localeString",
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
    type: "string",
    fieldset: language.locale === defaultLocale ? null : "translations",
  })),
}
