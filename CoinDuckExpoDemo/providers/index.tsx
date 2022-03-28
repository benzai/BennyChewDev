import React, { useEffect } from "react"
import { SettingsProvider } from "./SettingsProvider"
import { PortfolioProvider } from "./PortfolioProvider"
import { CoinsProvider } from "./CoinsProvider"

type Props = {
  children: React.ReactNode
}

export const AppProvider = ({ children }: Props) => {
  useEffect(() => {
    console.log("AppProvider")
  }, [])

  return (
    <SettingsProvider>
      <PortfolioProvider>
        <CoinsProvider>{children}</CoinsProvider>
      </PortfolioProvider>
    </SettingsProvider>
  )
}
