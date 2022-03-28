// Setting types
export type SettingType = "singleChoice" | "multipleChoice" | "boolean"

// User settings
export type UserSetting =
  | "schemaVersion"
  | "app_theme"
  | "app_locale"
  | "app_isRequirePasscode"
  | "coin_currency"
  | "coin_isShowSubCurrency"
  | "portfolio_isPrivacyMode"

export type IUserSetting = {
  schemaVersion: {
    key: "schemaVersion"
    value: number
  }
  app_theme: {
    key: "app_theme"
    value: AppTheme
  }
  app_locale: {
    key: "app_locale"
    value: string
  }
  app_isRequirePasscode: {
    key: "app_isRequirePasscode"
    value: boolean
  }
  coin_currency: {
    key: "coin_currency"
    value: CoinCurrency
  }
  coin_isShowSubCurrency: {
    key: "coin_isShowSubCurrency"
    value: boolean
  }
  portfolio_isPrivacyMode: {
    key: "portfolio_isPrivacyMode"
    value: boolean
  }
}

// Base
export type SettingBase = { key: string; title: string }

// Theme
export type AppTheme = "system" | "light" | "dark"

export type IAppTheme = { key: AppTheme; title: string }

export type IAppThemeSetting = Record<AppTheme, IAppTheme>

// Currency
export type CoinCurrency = "usd" | "eur" | "jpy" | "krw"

export type ICoinCurrency = { key: CoinCurrency; title: string; sign: string }

export type ICoinCurrencySetting = Record<CoinCurrency, ICoinCurrency>
