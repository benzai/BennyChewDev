import React from "react"
import { StyleProp, ViewStyle, View, Image } from "react-native"

import * as theme from "../../app/theme"

import Spacer from "../shared/Spacer"
import Text from "../shared/Text"
import { icon16_filled_caret_down, icon16_filled_caret_up } from "../../assets"

type Sizes = {
  sm: SizeConfig
  md: SizeConfig
}
type SizeConfig = {
  padding: number
  fontSize: theme.FontSize
  iconSize: number
  borderRadius: number
}

type Size = "sm" | "md"

type Props = {
  style?: StyleProp<ViewStyle>
  isUp: boolean
  value: string
  size?: Size
}

export default function UpDownTag({ style, isUp, value, size = "sm" }: Props) {
  const sizes: Sizes = {
    sm: { padding: 2, fontSize: "sm2", iconSize: 16, borderRadius: 4 },
    md: { padding: 4, fontSize: "sm", iconSize: 18, borderRadius: 6 },
  }
  const getSize = (key: Size) => sizes[key] ?? sizes.sm

  const _size = getSize(size)
  const icon = isUp ? icon16_filled_caret_up : icon16_filled_caret_down
  const frameColor = isUp ? theme.colors.statusPositive : theme.colors.statusNegative

  return (
    <View
      style={[
        {
          flexDirection: "row",
          alignItems: "center",
          backgroundColor: frameColor,
          paddingHorizontal: _size.padding,
          paddingVertical: _size.padding,
          borderRadius: _size.borderRadius,
        },
        style,
      ]}>
      <Image
        style={{ width: _size.iconSize, height: _size.iconSize, tintColor: "white" }}
        source={icon}
      />
      <Spacer horizontal={2} />
      <Text text={value} fontSize={_size.fontSize} color="altText1" />
    </View>
  )
}
