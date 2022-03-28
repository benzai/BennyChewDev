import React, { useEffect, useLayoutEffect, useState } from "react"
import { ImageSourcePropType, ScrollView, View, Text as RNText, Image } from "react-native"
import { StatusBar } from "expo-status-bar"

import * as theme from "../../app/theme"
import { useSettings } from "../../providers/SettingsProvider"
import { useCoins } from "../../providers/CoinsProvider"

import { CoinDetailPageNavProps } from "../../types/navigation"
import { ICoin } from "../../types/coin"
import { ITabItem } from "../../components/shared/Tabs"
import { Spacer, IconButton, Text, Button, Tabs, ScrollableTabs } from "../../components"
import { dummy_chart, icon32_marketcap, icon32_supply, icon32_volume } from ".././../assets"

const periodTabs: ITabItem[] = [
  { type: "day", title: "24h" },
  { type: "week", title: "7d" },
  { type: "month", title: "30d" },
  { type: "year", title: "1y" },
  { type: "year5", title: "5y" },
]

const sectionTabs: ITabItem[] = [
  { type: "overview", title: "Overview" },
  { type: "exchanges", title: "Exchanges" },
  { type: "news", title: "News" },
  { type: "calculator", title: "Calculator" },
  { type: "resources", title: "Resources" },
]

type Props = CoinDetailPageNavProps & {}

export default function CoinDetailPage({ route, navigation }: Props) {
  const settingsProvider = useSettings()
  const coinsProvider = useCoins()

  // Init
  useEffect(() => {
    console.log("CoinDetailPage")
    coinsProvider.fetchCoin("1")
  }, [])

  // Actions
  function sectionTabOnTap(tab: ITabItem) {
    console.log("sectionTabOnTap", tab)
  }

  function periodTabOnTap(tab: ITabItem) {
    console.log("periodTabOnTap", tab)
  }

  return (
    <ScrollView style={{ backgroundColor: theme.colors.bg1 }}>
      {titleBar()}
      {priceSection()}
      {graphSection()}
      {contentSection()}
      <StatusBar style="light" />
    </ScrollView>
  )

  // Views

  // Title Bar
  function titleBar() {
    return (
      <View
        style={{
          flexDirection: "row",
          justifyContent: "space-between",
          alignItems: "center",
          padding: 10,
        }}>
        <View style={{ paddingRight: 10 }}>
          <Image
            style={{ width: 24, height: 24, resizeMode: "contain" }}
            source={{ uri: coinsProvider.coin?.iconUrl }}
          />
        </View>

        <View style={{ flex: 1, paddingRight: 10 }}>
          <Text text={coinsProvider.coin?.symbol} fontSize="md3" color="text1" />
          <Spacer vertical={4} />
          <Text text={coinsProvider.coin?.name} fontSize="sm" color="text3" />
        </View>
      </View>
    )
  }

  // Price
  function priceSection() {
    return (
      <View
        style={{
          flexDirection: "row",
          justifyContent: "space-between",
          alignItems: "center",
          padding: 10,
        }}>
        <View
          style={{
            flex: 1,
            justifyContent: "center",
            alignItems: "flex-end",
            paddingHorizontal: 10,
          }}>
          <Text text={coinsProvider.coin?.priceFormatted} fontSize="md" color="accent1" />
        </View>

        <View
          style={{
            flex: 1,
            justifyContent: "center",
            alignItems: "flex-start",
            paddingHorizontal: 10,
          }}>
          <View>
            <Text text={"HIGH"} fontSize="sm3" color="text3" />
            <Text text={coinsProvider.coin?.priceFormatted} fontSize="sm" color="text1" />
          </View>

          <Spacer vertical={10} />

          <View>
            <Text text={"LOW"} fontSize="sm3" color="text3" />
            <Text text={coinsProvider.coin?.priceFormatted} fontSize="sm" color="text1" />
          </View>
        </View>
      </View>
    )
  }

  // Graph
  function graphSection() {
    return (
      <View>
        <View
          style={{
            paddingTop: 10,
            justifyContent: "flex-end",
            height: 200,
          }}>
          <Image
            style={{
              width: "100%",
              height: 200,
              resizeMode: "cover",
            }}
            source={dummy_chart}
          />
        </View>

        <Tabs onTap={periodTabOnTap} items={periodTabs} style={{ paddingTop: 4 }} />
      </View>
    )
  }

  // Content
  function contentSection() {
    return (
      <View>
        <ScrollableTabs
          onTap={sectionTabOnTap}
          items={sectionTabs}
          contentInset={10}
          style={{ paddingVertical: 10 }}
        />
        {overviewBlock()}
      </View>
    )
  }

  // Overview
  function overviewBlock() {
    return (
      <View style={{ paddingHorizontal: 20 }}>
        {coinMarketInfoCard(
          "Market Cap",
          coinsProvider.coin?.priceFormatted,
          icon32_marketcap,
          theme.colors.spot1,
        )}
        <Spacer vertical={6} />
        {coinMarketInfoCard(
          "Circulating Supply",
          coinsProvider.coin?.priceFormatted,
          icon32_supply,
          theme.colors.spot2,
        )}
        <Spacer vertical={6} />
        {coinMarketInfoCard(
          "Daily Volume",
          coinsProvider.coin?.priceFormatted,
          icon32_volume,
          theme.colors.spot3,
        )}
      </View>
    )
  }

  function coinMarketInfoCard(
    label: string,
    text: string,
    icon: ImageSourcePropType,
    frameColor: string,
  ) {
    return (
      <View
        style={{
          paddingHorizontal: 16,
          paddingVertical: 10,
          borderRadius: 8,
          backgroundColor: theme.colors.bg2,
        }}>
        <View style={{ flexDirection: "row", alignItems: "center" }}>
          <View
            style={{
              justifyContent: "center",
              alignItems: "center",
              width: 32,
              height: 32,
              borderRadius: 1000,
              backgroundColor: frameColor,
            }}>
            <Image style={{ width: 24, height: 24, tintColor: "white" }} source={icon} />
          </View>

          <Spacer horizontal={10} />

          <View>
            <Text text={label.toUpperCase()} fontSize="sm3" color="text3" />
            <Spacer vertical={2} />
            <Text text={text} fontSize="sm" color="text1" />
          </View>
        </View>
      </View>
    )
  }
}
