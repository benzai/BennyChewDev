import React, { useState } from "react"
import { StyleProp, ViewStyle, View, TouchableOpacity } from "react-native"

import * as theme from "../../app/theme"
import { Color } from "../../app/theme"
import { ICoin } from "../../types/coin"

import Spacer from "./Spacer"
import Text from "./Text"

export type ITabItem = {
  type: string
  title: string
}

type Props = {
  style?: StyleProp<ViewStyle>
  items: ITabItem[]
  onTap: (tab: ITabItem) => void
}

export default function Tabs({ items = [], onTap, style }: Props) {
  const [activeTabIndex, setActiveTabIndex] = useState(0)

  function tapOnTap(tabIndex: number) {
    setActiveTabIndex(tabIndex)
    onTap(items[tabIndex])
  }

  return (
    <View
      style={[
        {
          justifyContent: "center",
          alignItems: "center",
        },
        style,
      ]}>
      <View style={{ flexDirection: "row" }}>
        {items.map((item, index) => {
          return tabButton(item, index)
        })}
      </View>
    </View>
  )

  function tabButton(tab: ITabItem, tabIndex: number) {
    const backgroundColor = tabIndex === activeTabIndex ? theme.colors.accent1_10 : "transparent"
    const textColor =
      tabIndex === activeTabIndex ? theme.colorKey("accent1") : theme.colorKey("text3")

    return (
      <TouchableOpacity key={tabIndex} onPress={() => tapOnTap(tabIndex)}>
        <View
          style={{
            justifyContent: "center",
            alignSelf: "flex-start",
            backgroundColor: backgroundColor,
            paddingHorizontal: 8,
            height: 32,
            borderRadius: 8,
          }}>
          <Text text={tab.title} fontSize="sm" color={textColor} />
        </View>
      </TouchableOpacity>
    )
  }
}
