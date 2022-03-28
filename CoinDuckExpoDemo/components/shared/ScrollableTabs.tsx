import React, { useState } from "react"
import { StyleProp, ViewStyle, ScrollView, View, TouchableOpacity } from "react-native"

import * as theme from "../../app/theme"

import Spacer from "./Spacer"
import Text from "./Text"

export type ITabItem = {
  type: string
  title: string
}

type Props = {
  style?: StyleProp<ViewStyle>
  onTap: (tab: ITabItem) => void
  items: ITabItem[]
  contentInset?: number
}

export default function ScrollableTabs({ style, onTap, items = [], contentInset = 20 }: Props) {
  const [activeTabIndex, setActiveTabIndex] = useState(0)

  function tapOnTap(tabIndex: number) {
    setActiveTabIndex(tabIndex)
    onTap(items[tabIndex])
  }

  return (
    <ScrollView style={style} horizontal={true} showsHorizontalScrollIndicator={false}>
      <View style={{ flexDirection: "row", paddingHorizontal: contentInset }}>
        {items.map((item, index) => {
          return tabButton(item, index)
        })}
      </View>
    </ScrollView>
  )

  function tabButton(tab: ITabItem, tabIndex: number) {
    const backgroundColor = tabIndex === activeTabIndex ? theme.colors.accent1 : "transparent"
    const textColor =
      tabIndex === activeTabIndex ? theme.colorKey("altText1") : theme.colorKey("text3")

    return (
      <TouchableOpacity key={tabIndex} onPress={() => tapOnTap(tabIndex)}>
        <View
          style={{
            justifyContent: "center",
            alignSelf: "flex-start",
            backgroundColor: backgroundColor,
            paddingHorizontal: 10,
            height: 32,
            borderRadius: 1000,
          }}>
          <Text text={tab.title} fontSize="md3" color={textColor} />
        </View>
      </TouchableOpacity>
    )
  }
}
