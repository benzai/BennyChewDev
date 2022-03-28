import React from "react"
import {
  StyleProp,
  ViewStyle,
  ImageSourcePropType,
  TouchableOpacity,
  View,
  Text as RNText,
  Image,
} from "react-native"

type Size = "sm" | "md" | "lg"

type Props = {
  style?: StyleProp<ViewStyle>
  onTap: () => void
  icon: ImageSourcePropType
  size?: Size
  iconColor?: string
  frameColor?: string
}

export default function IconButton({
  style,
  onTap,
  icon,
  size = "md",
  iconColor = "white",
  frameColor = "red",
}: Props) {
  const sizes = {
    sm: { frameSize: 32, iconSize: 20 },
    md: { frameSize: 40, iconSize: 24 },
    lg: { frameSize: 48, iconSize: 28 },
  }
  const getSize = (key: Size) => sizes[key] ?? sizes.md

  const _size = getSize(size)

  return (
    <TouchableOpacity style={style} onPress={onTap}>
      <View
        style={{
          justifyContent: "center",
          alignItems: "center",
          width: _size.frameSize,
          height: _size.frameSize,
          backgroundColor: frameColor,
          borderRadius: 1000,
        }}>
        <Image
          style={{ width: _size.iconSize, height: _size.iconSize, tintColor: iconColor }}
          source={icon}
        />
      </View>
    </TouchableOpacity>
  )
}
