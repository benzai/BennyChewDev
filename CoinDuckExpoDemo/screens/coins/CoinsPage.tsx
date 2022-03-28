import React, { useEffect } from "react"
import { View, Text as RNText, Image, Button, FlatList } from "react-native"
import { StatusBar } from "expo-status-bar"

import * as theme from "../../app/theme"
import { CoinsPageNavProps } from "../../types/navigation"
import { useCoins } from "../../providers/CoinsProvider"
import { CoinListCard } from "../../components"

type Props = CoinsPageNavProps & {}

export default function CoinsPage({ route, navigation }: Props) {
  const coinsProvider = useCoins()

  useEffect(() => {
    console.log("CoinsPage")
    coinsProvider.fetchCoins()
  }, [])

  function listItemOnTap(id: number) {
    navigation.navigate("CoinDetail")
  }

  return (
    <View style={{ flex: 1, backgroundColor: "white" }}>
      <FlatList
        data={coinsProvider.coins}
        renderItem={item => (
          <CoinListCard key={item.index} onTap={listItemOnTap} item={item.item} />
        )}
        keyExtractor={item => item.symbol}
      />
      <StatusBar style="light" />
    </View>
  )
}
