import { ICoinCurrency, ICoinCurrencySetting } from "../../../types/settings"

export const settings: ICoinCurrencySetting = {
  usd: {
    key: "usd",
    title: "US Dollar",
    sign: "US$",
  },
  eur: {
    key: "eur",
    title: "Euro",
    sign: "€",
  },
  jpy: {
    key: "jpy",
    title: "Japanese Yen",
    sign: "JP¥",
  },
  krw: {
    key: "krw",
    title: "WON",
    sign: "Won",
  },
}

export const getSetting = (key: string): ICoinCurrency => {
  return settings[key] ?? settings.usd
}

export const getSettingsArray = (): ICoinCurrency[] => {
  return Object.values(settings)
}
