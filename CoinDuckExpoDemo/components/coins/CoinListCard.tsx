import React, { useState } from "react"
import { StyleProp, ViewStyle, View, Image, TouchableOpacity, Pressable } from "react-native"

import * as theme from "../../app/theme"
import { ICoin } from "../../types/coin"

import Spacer from "../shared/Spacer"
import Text from "../shared/Text"
import UpDownTag from "../coins/UpDownTag"
import ListItemSeparator from "../shared/ListItemSeparator"

type Props = {
  style?: StyleProp<ViewStyle>
  onTap: (id: number) => void
  item: ICoin
}

export default function CoinListCard({ style, onTap, item }: Props) {
  return (
    <TouchableOpacity style={style} onPress={() => onTap(item.coinId)}>
      <View
        style={{
          flexDirection: "row",
          justifyContent: "space-between",
          alignItems: "center",
          paddingVertical: 10,
          height: 76,
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
          <Text text={item.symbol} fontSize="md3" color="text1" />
          <Spacer vertical={4} />
          <Text text={item.name} fontSize="sm" color="text3" />
        </View>

        {/* Prices */}
        <View
          style={{
            alignItems: "flex-end",
            paddingRight: 10,
          }}>
          <UpDownTag isUp={item.upDownPct >= 0 ? true : false} value={item.upDownPctFormatted} />
          <Spacer vertical={4} />
          <Text text={item.priceFormatted} fontSize="md2" color="accent1" />
        </View>

        {/* Separator */}
        <ListItemSeparator inset={10} />
      </View>
    </TouchableOpacity>
  )
}
