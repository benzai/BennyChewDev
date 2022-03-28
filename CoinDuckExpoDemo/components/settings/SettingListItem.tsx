import React from "react"
import { StyleProp, ViewStyle, View, Image, TouchableOpacity, Switch } from "react-native"

import * as theme from "../../app/theme"
import { UserSetting, SettingType } from "../../types/settings"

import Spacer from "../shared/Spacer"
import Text from "../shared/Text"
import ListItemSeparator from "../shared/ListItemSeparator"

import { icon32_caret_right } from "../../assets"

type Props = {
  style?: StyleProp<ViewStyle>
  onTap: (type: SettingType, setting: UserSetting, payload?: string | boolean) => void
  type: SettingType
  setting: UserSetting
  title: string
  value: string | boolean
  accessoryIconColor?: string
  showSeparator?: boolean
}

export default function SettingListItem({
  style,
  onTap,
  type,
  setting,
  title,
  value,
  accessoryIconColor = theme.colors.text3,
  showSeparator = true,
}: Props) {
  const _listItemDisableTap = type === "boolean" ? true : false

  const _value = (type: SettingType) => {
    switch (type) {
      case "singleChoice":
        return (
          <Text
            style={{ width: 120 }}
            text={value as string}
            fontSize="sm"
            color="accent1"
            textAlign="right"
          />
        )

      case "boolean":
        return (
          <Switch
            style={{ marginRight: 4 }}
            onValueChange={value => onTap(type, setting, value as boolean)}
            value={value as boolean}
          />
        )

      default:
        return <View></View>
    }
  }

  const _accessory = (type: SettingType) => {
    switch (type) {
      case "boolean":
        return null

      default:
        return (
          <Image
            style={{ width: 32, height: 32, tintColor: accessoryIconColor }}
            source={icon32_caret_right}
          />
        )
    }
  }

  return (
    <TouchableOpacity disabled={_listItemDisableTap} onPress={() => onTap(type, setting)}>
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
        {_value(type)}
        {_accessory(type)}
      </View>

      {showSeparator && <ListItemSeparator inset={10} />}
    </TouchableOpacity>
  )
}
