import React from "react"
import { StyleProp, ViewStyle, View } from "react-native"

import * as theme from "../../app/theme"

type Props = {
  style?: StyleProp<ViewStyle>
  height?: number
  inset?: number
  color?: string
}

export default function ListItemSeparator({
  style,
  height = 1,
  inset = 20,
  color = "#e6e6e6",
}: Props) {
  return (
    <View
      style={[
        {
          position: "absolute",
          left: 0,
          bottom: 0,
          width: "100%",
          height: height,
          marginLeft: inset,
          backgroundColor: color,
        },
        style,
      ]}
    />
  )
}
