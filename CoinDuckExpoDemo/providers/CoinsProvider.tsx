import React, { createContext, useEffect, useState, useContext } from "react"
import * as Localization from "expo-localization"

import { ICoin } from "../types/coin"
import * as coinsService from "../services/coinsService"
import { mockCoins, mockCoin_bitcoin } from "./mockData/coin"

type ICoinsProvider = {
  coins: ICoin[]
  coin?: ICoin
  fetchCoins: () => void
  fetchCoin: (coinId: string) => void
}

const CoinsContext = createContext<ICoinsProvider | undefined>(undefined)

type Props = {
  children: React.ReactNode
}

export const CoinsProvider = ({ children }: Props) => {
  const [coins, setCoins] = useState<ICoin[]>([])
  const [coin, setCoin] = useState<ICoin | undefined>(undefined)

  const currencyFormatter = new Intl.NumberFormat(Localization.locale, {
    style: "currency",
    currency: "USD",
    minimumFractionDigits: 2,
    maximumFractionDigits: 4,
  })

  // Init
  useEffect(() => {
    console.log("CoinsProvider")
  }, [])

  // Actions
  function fetchCoins() {
    // coinsService.fetchCoins();
    const parsedCoins = _parseCoins(mockCoins)
    setCoins(parsedCoins)
  }

  function fetchCoin(coinId: string) {
    // coinsService.fetchCoin("btc");
    const parsedCoin = _parseCoin(mockCoin_bitcoin)
    setCoin(parsedCoin)
  }

  return (
    <CoinsContext.Provider value={{ coins, coin, fetchCoins, fetchCoin }}>
      {children}
    </CoinsContext.Provider>
  )

  // Helpers
  function _parseCoins(items: ICoin[]): ICoin[] {
    return items.map(item => {
      return {
        ...item,
        priceFormatted: currencyFormatter.format(item.price),
        upDownPctFormatted: `${item.upDownPct}%`,
      }
    })
  }

  function _parseCoin(item: ICoin): ICoin {
    return {
      ...item,
      priceFormatted: currencyFormatter.format(item.price),
      upDownPctFormatted: `${item.upDownPct}%`,
    }
  }
}

export const useCoins = () => useContext(CoinsContext)
