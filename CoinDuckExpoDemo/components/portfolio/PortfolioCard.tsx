import React, { useState } from "react"
import { StyleProp, ViewStyle, View, Image, Button, TouchableOpacity } from "react-native"

import * as theme from "../../app/theme"
import { IPortfolio } from "../../types/portfolio"

import Spacer from "../shared/Spacer"
import Text from "../shared/Text"
import IconButton from "../shared/IconButton"
import UpDownTag from "../coins/UpDownTag"
import { icon32_edit } from "../../assets"

/**
 * TODO
 * - Callbacks for user events
 */

type Props = {
  style?: StyleProp<ViewStyle>
  item: IPortfolio
}

export default function PortfolioCard({ style, item }: Props) {
  function mainActionOnTap() {}

  return (
    <View
      style={[
        {
          justifyContent: "space-between",
          height: 200,
          borderRadius: 12,
          backgroundColor: theme.colors.bg1,
        },
        style,
      ]}>
      {titleBar()}
      {priceGroup()}
      {actions()}
    </View>
  )

  function titleBar() {
    return (
      <View
        style={{
          flexDirection: "row",
          justifyContent: "space-between",
          alignItems: "center",
          paddingHorizontal: 10,
          paddingVertical: 12,
        }}>
        <Text text={item.title} fontSize="md2" color="text1" />
        <UpDownTag isUp={item.profitIsUp} value={item.profitPercentageFormatted} size="md" />
      </View>
    )
  }

  function priceGroup() {
    return (
      <View style={{ flexDirection: "row" }}>
        <View style={{ flex: 1, alignItems: "flex-end" }}>{chart()}</View>
        <Spacer horizontal={10} />
        <View style={{ flex: 2, justifyContent: "center" }}>
          <Text text={item.totalPortfolioPriceFormatted} fontSize="lg3" color="text1" />
          <Spacer vertical={4} />
          <Text text={`Cost: ${item.investmentCostFormatted}`} fontSize="sm" color="text3" />
          <Text text={`Profit: ${item.profitFormatted}`} fontSize="sm" color="text3" />
        </View>
      </View>
    )
  }

  function chart() {
    return (
      <View
        style={{
          justifyContent: "center",
          alignItems: "center",
          width: 80,
          height: 80,
          borderRadius: 1000,
          borderWidth: 8,
          borderColor: theme.colors.spot2,
        }}>
        <Text text={`${item.coinsCount}`} fontSize="md2" color="text1" />
        <Text text={`Coins`.toUpperCase()} fontSize="sm3" color="text3" />
      </View>
    )
  }

  function actions() {
    return (
      <View style={{ alignItems: "flex-end", padding: 10 }}>
        <IconButton
          onTap={mainActionOnTap}
          icon={icon32_edit}
          iconColor={theme.colors.accent1}
          frameColor={theme.colors.accent1_20}
        />
      </View>
    )
  }
}
