import React, { useEffect, useState, useRef } from "react"
import { View, Text as RNText, Image, FlatList, Animated, ListRenderItemInfo } from "react-native"
import { StatusBar } from "expo-status-bar"

import * as theme from "../../app/theme"
import { useSettings } from "../../providers/SettingsProvider"
import { usePortfolio } from "../../providers/PortfolioProvider"
import { PortfolioPageNavProps } from "../../types/navigation"
import { IPortfolioCoin } from "../../types/portfolio"
import { IconButton, Text, PortfolioCard, PortfolioCoinListCard } from "../../components"

const AnimatedFlatList = Animated.createAnimatedComponent(FlatList)

type Props = PortfolioPageNavProps & {}

export default function PortfolioPage({ route, navigation }: Props) {
  const settingsProvider = useSettings()
  const portfolioProvider = usePortfolio()

  const scroll = useRef(new Animated.Value(0)).current
  const scrollReversed = Animated.multiply(scroll, -1)
  const minHeaderHeight = 210
  const maxHeaderHeight = minHeaderHeight + minHeaderHeight
  const scrollClamped = Animated.diffClamp(scroll, 0, minHeaderHeight)

  // Init
  useEffect(() => {
    console.log("PortfolioPage")
    portfolioProvider.fetchPortfolios()
  }, [])

  // Actions

  return (
    <View style={{ flex: 1 }}>
      {header()}
      <View style={{ flex: 1 }}>{portfolioList()}</View>
      <StatusBar style="light" />
    </View>
  )

  // Views
  function header() {
    return (
      <Animated.View
        style={{
          position: "absolute",
          left: 0,
          top: 0,
          right: 0,
          padding: 10,
          paddingTop: 0,
          justifyContent: "flex-end",
          height: scrollReversed.interpolate({
            inputRange: [0, minHeaderHeight],
            outputRange: [minHeaderHeight, maxHeaderHeight],
            extrapolateLeft: "clamp",
          }),
          transform: [
            {
              translateY: scroll.interpolate({
                inputRange: [0, minHeaderHeight / 2],
                outputRange: [0, -minHeaderHeight],
                extrapolate: "clamp",
              }),
            },
          ],
          backgroundColor: theme.colors.accent1,
        }}>
        {portfolioProvider.portfolios.map((portfolio, index) => {
          return (
            <PortfolioCard
              style={{
                shadowColor: "#000",
                shadowOffset: {
                  width: 0,
                  height: 1,
                },
                shadowOpacity: 0.1,
                shadowRadius: 3,
                elevation: 3,
              }}
              key={index}
              item={portfolio}
            />
          )
        })}
      </Animated.View>
    )
  }

  function portfolioList() {
    if (portfolioProvider.portfolio?.coins !== undefined) {
      return (
        <AnimatedFlatList
          style={{
            paddingTop: scroll.interpolate({
              inputRange: [0, minHeaderHeight],
              outputRange: [minHeaderHeight, 0],
              extrapolate: "clamp",
            }),
          }}
          onScroll={Animated.event(
            [
              {
                nativeEvent: {
                  contentOffset: {
                    y: scroll,
                  },
                },
              },
            ],
            {
              useNativeDriver: false,
            },
          )}
          scrollEventThrottle={16}
          data={portfolioProvider.portfolio.coins}
          numColumns={1}
          renderItem={(item: ListRenderItemInfo<IPortfolioCoin>) => (
            <PortfolioCoinListCard item={item.item} />
          )}
          keyExtractor={(item: IPortfolioCoin) => item.symbol}
        />
      )
    }
  }
}
