import React from "react"
import { StyleProp, ViewStyle, View } from "react-native"

type DebugColor = "red" | "blue" | "green" | "hotpink" | "gray" | "brown" | "purple"

type Props = {
  style?: StyleProp<ViewStyle>
  horizontal?: number
  vertical?: number
  debugColor?: DebugColor
}

export default function Spacer({ style, horizontal = 0, vertical = 0, debugColor = "red" }: Props) {
  return (
    <View
      style={[
        {
          width: horizontal,
          height: vertical,
          backgroundColor: debugColor,
        },
        style,
      ]}
    />
  )
}
