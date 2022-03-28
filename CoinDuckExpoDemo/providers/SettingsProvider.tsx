import React, { createContext, useEffect, useState, useContext } from "react"
import AsyncStorage from "@react-native-async-storage/async-storage"
import { IUserSetting, AppTheme, CoinCurrency } from "../types/settings"

/// TODO: Move this to /app/config/userSettings
const defaultSettings: IUserSetting = {
  schemaVersion: {
    key: "schemaVersion",
    value: 1,
  },
  app_theme: {
    key: "app_theme",
    value: "light",
  },
  app_locale: {
    key: "app_locale",
    value: "en",
  },
  app_isRequirePasscode: {
    key: "app_isRequirePasscode",
    value: false,
  },
  coin_currency: {
    key: "coin_currency",
    value: "eur",
  },
  coin_isShowSubCurrency: {
    key: "coin_isShowSubCurrency",
    value: true,
  },
  portfolio_isPrivacyMode: {
    key: "portfolio_isPrivacyMode",
    value: true,
  },
}

type ISettingsProvider = {
  theme: string
  currency: string
  showSubCurrency: boolean
  changeTheme: (value: AppTheme) => void
  changeCurrency: (value: CoinCurrency) => void
}

const SettingsContext = createContext<ISettingsProvider | undefined>(undefined)

type Props = {
  children: React.ReactNode
}

export const SettingsProvider = ({ children }: Props) => {
  // State
  const [theme, setTheme] = useState<string>(defaultSettings.app_theme.value)
  const [currency, setCurrency] = useState<string>(defaultSettings.coin_currency.value)
  const [showSubCurrency, setShowSubCurrency] = useState<boolean>(
    defaultSettings.coin_isShowSubCurrency.value,
  )

  // Init
  useEffect(() => {
    console.log("SettingsProvider")
    initSettings()
  }, [])

  async function initSettings() {
    console.log("initSettings")
    const schemaVersion = await getSchemaVersion()
    if (schemaVersion < defaultSettings.schemaVersion.value) {
      console.log("SET SETTINGS.")
      await _saveSchemaVersion()
      await _saveInitialSettings()
      await _setInitialState()
    } else {
      console.log("SETTINGS ALREADY SET.")
      await _setInitialState()
    }
  }

  async function _saveInitialSettings() {
    await _saveTheme()
    await _saveCurrency()
  }

  async function _setInitialState() {
    const theme = await getTheme()
    const currency = await getCurrency()
    setTheme(theme)
    setCurrency(currency)
  }

  // Actions
  function changeTheme(value: AppTheme) {
    _saveTheme(value)
  }

  function changeCurrency(value: CoinCurrency) {
    _saveCurrency(value)
  }

  // Getters
  async function getSchemaVersion(): Promise<number> {
    const stringValue = await AsyncStorage.getItem(defaultSettings.schemaVersion.key)
    return stringValue !== null ? (JSON.parse(stringValue) as number) : 0
  }

  async function getTheme(): Promise<string> {
    const value = await AsyncStorage.getItem(defaultSettings.app_theme.key)
    return value !== null ? value : defaultSettings.app_theme.value
  }

  async function getCurrency(): Promise<string> {
    const value = await AsyncStorage.getItem(defaultSettings.coin_currency.key)
    return value !== null ? value : defaultSettings.coin_currency.value
  }

  // Setters
  async function _saveSchemaVersion() {
    await AsyncStorage.setItem(
      defaultSettings.schemaVersion.key,
      JSON.stringify(defaultSettings.schemaVersion.value),
    )
  }

  async function _saveTheme(value?: AppTheme, updateState: boolean = true) {
    const valueToSave = value !== undefined ? value : defaultSettings.app_theme.value
    await AsyncStorage.setItem(defaultSettings.app_theme.key, valueToSave)
    if (updateState) {
      setTheme(valueToSave)
    }
  }

  async function _saveCurrency(value?: CoinCurrency, updateState: boolean = true) {
    const valueToSave = value !== undefined ? value : defaultSettings.coin_currency.value
    await AsyncStorage.setItem(defaultSettings.coin_currency.key, valueToSave)
    if (updateState) {
      setCurrency(valueToSave)
    }
  }

  return (
    <SettingsContext.Provider
      value={{ theme, currency, showSubCurrency, changeTheme, changeCurrency }}>
      {children}
    </SettingsContext.Provider>
  )
}

export const useSettings = () => useContext(SettingsContext)
