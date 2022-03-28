import React, { useEffect } from "react"
import { ScrollView, View, Text as RNText, Image } from "react-native"
import { StatusBar } from "expo-status-bar"

import * as theme from "../../app/theme"
import { useSettings } from "../../providers/SettingsProvider"
import * as appThemeSettings from "../../app/config/userSettings/appThemeSettings"
import * as coinCurrencySettings from "../../app/config/userSettings/coinCurrencySettings"
import { AccountPageNavProps } from "../../types/navigation"
import { UserSetting, SettingType } from "../../types/settings"

import { Spacer, Text, SettingSection, SettingListItem } from "../../components"

/// TODO: Refactor coinCurrencySettings.getSetting to be in the settings provider.

type Props = AccountPageNavProps & {}

export default function AccountPage({ route, navigation }: Props) {
  const settingsProvider = useSettings()

  // Init
  useEffect(() => {
    console.log("AccountPage")
  }, [])

  // Actions
  function settingOnTap(type: SettingType, setting: UserSetting, payload?: string | boolean) {
    switch (setting) {
      case "app_theme":
        navigation.navigate("SettingPicker", {
          pageTitle: "Theme",
          setting: setting,
          currentValue: settingsProvider.theme,
          items: appThemeSettings.getSettingsArray(),
        })
        break

      case "app_isRequirePasscode":
        console.log("Pas", payload)
        break

      case "coin_currency":
        navigation.navigate("SettingPicker", {
          pageTitle: "Currency",
          setting: setting,
          currentValue: settingsProvider.currency,
          items: coinCurrencySettings.getSettingsArray(),
        })
        break

      case "coin_isShowSubCurrency":
        console.log("Toggle", payload)
        break
    }
  }

  return (
    <ScrollView>
      <View style={{ paddingHorizontal: 20, paddingVertical: 20 }}>
        <SettingSection title="Coins">
          <SettingListItem
            onTap={settingOnTap}
            type="singleChoice"
            setting="coin_currency"
            title="Currency"
            value={coinCurrencySettings.getSetting(settingsProvider.currency).title}
          />
          <SettingListItem
            onTap={settingOnTap}
            type="boolean"
            setting="coin_isShowSubCurrency"
            title="Show sub currency"
            value={settingsProvider.showSubCurrency}
            showSeparator={false}
          />
        </SettingSection>

        <Spacer vertical={20} />

        <SettingSection title="Display">
          <SettingListItem
            onTap={settingOnTap}
            type="singleChoice"
            setting="app_theme"
            title="Theme"
            value={appThemeSettings.getSetting(settingsProvider.theme).title}
          />
          <SettingListItem
            onTap={settingOnTap}
            type="singleChoice"
            setting="app_locale"
            title="Locale"
            value="NL"
          />
          <SettingListItem
            onTap={settingOnTap}
            type="boolean"
            setting="app_isRequirePasscode"
            title="Require passcode"
            value={true}
            showSeparator={false}
          />
        </SettingSection>
      </View>
      <StatusBar style="light" />
    </ScrollView>
  )
}
