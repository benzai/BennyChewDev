import React from "react"
import { StyleProp, ViewStyle, View, Image, TouchableOpacity } from "react-native"

import * as theme from "../../app/theme"
import { IPortfolioCoin } from "../../types/portfolio"

import Spacer from "../shared/Spacer"
import Text from "../shared/Text"
import ListItemSeparator from "../shared/ListItemSeparator"

/**
 * TODO
 * - Callbacks for user events
 */

type Props = {
  style?: StyleProp<ViewStyle>
  item: IPortfolioCoin
}

export default function PortfolioCoinListCard({ style, item }: Props) {
  return (
    <TouchableOpacity style={[{ flex: 1 }, style]} onPress={() => {}}>
      <View
        style={{
          flexDirection: "row",
          justifyContent: "space-between",
          alignItems: "center",
          paddingVertical: 10,
          height: 80,
          backgroundColor: "white",
        }}>
        {/* Image */}
        <View style={{ paddingHorizontal: 10 }}>
          <Image
            style={{ width: 24, height: 24, resizeMode: "contain" }}
            source={{ uri: item.iconUrl }}
          />
        </View>

        {/* Titles */}
        <View style={{ flex: 1, paddingRight: 10 }}>
          <Text text={item.symbol} fontSize={"md3"} color="text1" />
          <Spacer vertical={4} />
          <Text text={item.name} fontSize={"sm"} color="text3" />
        </View>

        {/* Prices */}
        <View style={{ flex: 1, paddingRight: 10 }}>
          <Text text={`${item.amount} ${item.symbol}`} fontSize={"md3"} color="text1" />
          <Spacer vertical={2} />
          <Text text={item.priceFormatted} fontSize={"md2"} color="accent1" />
        </View>

        {/* Separator */}
        <ListItemSeparator inset={10} />
      </View>
    </TouchableOpacity>
  )
}
