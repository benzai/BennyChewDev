import React, { useEffect, useLayoutEffect, useState } from "react"
import { FlatList, View } from "react-native"

import * as theme from "../../app/theme"
import { useSettings } from "../../providers/SettingsProvider"

import { SettingPickerPageNavProps } from "../../types/navigation"
import { UserSetting, AppTheme, CoinCurrency } from "../../types/settings"
import { Spacer, SettingChoiceListItem } from "../../components"

type Props = SettingPickerPageNavProps & {}

export default function SettingPickerPage({ route, navigation }: Props) {
  const settingsProvider = useSettings()

  // State
  const [currentValue, setCurrentValue] = useState<string | undefined>(undefined)

  // Init
  useEffect(() => {
    console.log("SettingPickerPage")
    setCurrentValue(route.params.currentValue)
  }, [])

  useLayoutEffect(() => {
    navigation.setOptions({
      title: route.params?.pageTitle,
    })
  })

  // Actions
  function listItemOnTap(setting: UserSetting, key: string) {
    switch (setting) {
      case "app_theme":
        setCurrentValue(key)
        settingsProvider.changeTheme(key as AppTheme)
        navigation.goBack()
        break

      case "coin_currency":
        setCurrentValue(key)
        settingsProvider.changeCurrency(key as CoinCurrency)
        navigation.goBack()
        break
    }
  }

  return (
    <FlatList
      style={{ flex: 1, backgroundColor: theme.colors.bg1 }}
      data={route.params.items}
      renderItem={renderItem => {
        const _isSelected = renderItem.item.key === currentValue ? true : false
        return (
          <SettingChoiceListItem
            onTap={listItemOnTap}
            setting={route.params.setting}
            settingKey={renderItem.item.key}
            title={renderItem.item.title}
            isSelected={_isSelected}
          />
        )
      }}
      keyExtractor={item => item.key}
    />
  )
}
