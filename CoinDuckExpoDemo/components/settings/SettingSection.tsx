import React from "react"
import { StyleProp, ViewStyle, View, Image, TouchableWithoutFeedback } from "react-native"

import * as theme from "../../app/theme"

import Spacer from "../shared/Spacer"
import Text from "../shared/Text"

type Props = {
  style?: StyleProp<ViewStyle>
  title: string
  children: React.ReactNode
  roundness?: number
  titleColor?: string
  sectionColor?: string
}

export default function SettingSection({
  style,
  title = "Section",
  children,
  roundness = 12,
  titleColor = "black",
  sectionColor = "white",
}: Props) {
  return (
    <TouchableWithoutFeedback style={[style]}>
      <View>
        <View
          style={{
            flexDirection: "row",
            justifyContent: "space-between",
            alignItems: "center",
            height: 40,
          }}>
          <Text text={title} fontSize="md3" color="text2" />
        </View>

        <View
          style={{
            shadowColor: "#000",
            shadowOffset: {
              width: 0,
              height: 1,
            },
            shadowOpacity: 0.05,
            shadowRadius: 3,
            elevation: 3,
          }}>
          <View
            style={[
              { borderRadius: roundness, overflow: "hidden", backgroundColor: sectionColor },
            ]}>
            {children}
          </View>
        </View>
      </View>
    </TouchableWithoutFeedback>
  )
}
