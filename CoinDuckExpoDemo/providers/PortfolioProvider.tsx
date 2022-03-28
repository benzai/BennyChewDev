import React, { createContext, useEffect, useState, useContext } from "react"
import * as Localization from "expo-localization"

import { IPortfolio } from "../types/portfolio"
import { mockPortfolios, mockPortfolios_1coin } from "./mockData/portfolio"

type IPortfolioProvider = {
  portfolios: IPortfolio[]
  portfolio: IPortfolio
  fetchPortfolios: () => void
}

const PortfolioContext = createContext<IPortfolioProvider | undefined>(undefined)

type Props = {
  children: React.ReactNode
}

export const PortfolioProvider = ({ children }: Props) => {
  const [portfolios, setPortfolios] = useState<IPortfolio[]>([])
  const [portfolio, setPortfolio] = useState<IPortfolio | undefined>(undefined)

  const currencyFormatter = new Intl.NumberFormat(Localization.locale, {
    style: "currency",
    currency: "USD",
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  })

  const percentageFormatter = new Intl.NumberFormat(Localization.locale, {
    style: "percent",
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  })

  // Init
  useEffect(() => {
    console.log("PortfolioProvider")
  }, [])

  // Actions
  function fetchPortfolios() {
    const parsedPortfolios = _parsePortfolios(mockPortfolios)
    setPortfolios(parsedPortfolios)
    setPortfolio(parsedPortfolios[0])
  }

  return (
    <PortfolioContext.Provider value={{ portfolios, portfolio, fetchPortfolios }}>
      {children}
    </PortfolioContext.Provider>
  )

  // Helpers
  function _parsePortfolios(items: IPortfolio[]): IPortfolio[] {
    return items.map(portfolio => {
      const portfolioCopy = portfolio
      portfolioCopy.currencyFormatter = currencyFormatter
      portfolioCopy.percentageFormatter = percentageFormatter
      const coinsCopy = portfolioCopy.coins.map(coin => {
        const coinCopy = coin
        coinCopy.currencyFormatter = currencyFormatter
        coinCopy.percentageFormatter = percentageFormatter
        return coinCopy
      })
      portfolioCopy.coins = coinsCopy
      return portfolioCopy
    })
  }
}

export const usePortfolio = () => useContext(PortfolioContext)
