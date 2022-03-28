import React from "react"
import { StyleProp, ViewStyle, View, Text as RNText, TouchableOpacity } from "react-native"

type Size = "sm" | "md" | "lg"
type Roundness = "none" | "sm" | "md" | "lg"

type Props = {
  onTap: () => void
  text: string
  size?: Size
  textColor: string
  frameColor: string
  width?: number
  roundness?: Roundness
  stretch?: boolean
  icon?: React.ReactNode
  iconColor?: string
  style?: StyleProp<ViewStyle>
}

export default function Button({
  onTap,
  text,
  size = "md",
  width,
  textColor,
  frameColor,
  roundness = "lg",
  stretch = false,
  icon,
  iconColor = "white",
  style,
}: Props) {
  const sizes = {
    sm: { padding: 12, height: 40, fontSize: 16 },
    md: { padding: 16, height: 48, fontSize: 18 },
    lg: { padding: 20, height: 56, fontSize: 20 },
  }
  const getSize = (key: Size) => sizes[key] ?? sizes.md

  const roundnesses = {
    none: 0,
    sm: 4,
    md: 8,
    lg: 12,
  }
  const getRoundness = (key: Roundness) => roundnesses[key] ?? roundnesses.lg

  const _size = getSize(size)
  const _roundness = getRoundness(roundness)
  const _stretchFlex = stretch ? 1 : 0
  const _stretchAlign = stretch ? "stretch" : "flex-start"

  return (
    <TouchableOpacity
      onPress={onTap}
      style={[
        {
          flex: _stretchFlex,
          alignSelf: _stretchAlign,
        },
        style,
      ]}>
      <View
        style={{
          justifyContent: "center",
          alignItems: "center",
          paddingHorizontal: _size.padding,
          height: _size.height,
          backgroundColor: frameColor,
          borderRadius: _roundness,
          width: width,
        }}>
        <RNText style={{ fontSize: _size.fontSize, color: textColor }}>{text}</RNText>
      </View>
    </TouchableOpacity>
  )
}
