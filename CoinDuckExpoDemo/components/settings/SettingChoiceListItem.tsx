import React from "react"
import { StyleProp, ViewStyle, View, Image, TouchableOpacity } from "react-native"

import * as theme from "../../app/theme"
import { UserSetting } from "../../types/settings"

import Spacer from "../shared/Spacer"
import Text from "../shared/Text"
import ListItemSeparator from "../shared/ListItemSeparator"

import { icon32_check } from "../../assets"

type Props = {
  style?: StyleProp<ViewStyle>
  onTap: (setting: UserSetting, key: string) => void
  setting: UserSetting
  settingKey: string
  title: string
  isSelected?: boolean
  showSeparator?: boolean
}

export default function SettingChoiceListItem({
  style,
  onTap,
  setting,
  settingKey,
  title,
  isSelected = false,
  showSeparator = true,
}: Props) {
  const _checkIcon = isSelected && (
    <Image
      style={{ width: 32, height: 32, tintColor: theme.colors.accent1 }}
      source={icon32_check}
    />
  )
  const _separator = showSeparator && <ListItemSeparator inset={10} />

  return (
    <TouchableOpacity onPress={() => onTap(setting, settingKey)}>
      <View
        style={[
          {
            flexDirection: "row",
            justifyContent: "space-between",
            alignItems: "center",
            paddingHorizontal: 10,
            height: 56,
            backgroundColor: theme.colors.bg1,
          },
          style,
        ]}>
        <Text style={{ flex: 2 }} text={title} fontSize="md3" color="text1" />
        {_checkIcon}
      </View>
      {_separator}
    </TouchableOpacity>
  )
}
