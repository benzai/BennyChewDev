import React from "react"
import { StyleProp, ViewStyle, Text as RNText, TextStyle } from "react-native"

import * as theme from "../../app/theme"

type Props = {
  style?: StyleProp<ViewStyle>
  text: string
  fontSize: theme.FontSize
  color: theme.Color
  textAlign?: TextStyle["textAlign"]
}

export default function Text({ style, text, fontSize, color, textAlign = "left" }: Props) {
  return (
    <RNText
      style={[
        {
          fontSize: theme.fontSize(fontSize),
          color: theme.color(color),
          textAlign: textAlign,
        },
        style,
      ]}>
      {text}
    </RNText>
  )
}
