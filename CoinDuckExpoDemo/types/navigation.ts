import { RouteProp } from "@react-navigation/native"
import { NativeStackNavigationProp } from "@react-navigation/native-stack"
import { SettingBase, UserSetting } from "./settings"

// Stacks
export type ITab = {
  CoinsStack: undefined
  WatchlistStack: undefined
  PortfolioStack: undefined
  NewsStack: undefined
  AccountStack: undefined
}

export type ICoinsStack = {
  Coins: undefined
  CoinDetail: { coinId?: string }
}

export type IWatchlistStack = {
  Watchlist: undefined
}

export type IPortfolioStack = {
  Portfolio: undefined
}

export type INewsStack = {
  News: undefined
}

export type IAccountStack = {
  Dump: undefined
  Account: undefined
  SettingPicker: {
    pageTitle: string
    setting: UserSetting
    currentValue: string
    items: SettingBase[]
  }
}

// Props

// Coins
export type CoinsPageNavProps = {
  route: RouteProp<ICoinsStack, "Coins">
  navigation: NativeStackNavigationProp<ICoinsStack, "Coins">
}
export type CoinDetailPageNavProps = {
  route: RouteProp<ICoinsStack, "CoinDetail">
  navigation: NativeStackNavigationProp<ICoinsStack, "CoinDetail">
}

// Watchlist
export type WatchlistPageNavProps = {
  route: RouteProp<IWatchlistStack, "Watchlist">
  navigation: NativeStackNavigationProp<IWatchlistStack, "Watchlist">
}

// Portfolio
export type PortfolioPageNavProps = {
  route: RouteProp<IPortfolioStack, "Portfolio">
  navigation: NativeStackNavigationProp<IPortfolioStack, "Portfolio">
}

// News
export type NewsPageNavProps = {
  route: RouteProp<INewsStack, "News">
  navigation: NativeStackNavigationProp<INewsStack, "News">
}

// Account
export type AccountPageNavProps = {
  route: RouteProp<IAccountStack, "Account">
  navigation: NativeStackNavigationProp<IAccountStack, "Account">
}
export type SettingPickerPageNavProps = {
  route: RouteProp<IAccountStack, "SettingPicker">
  navigation: NativeStackNavigationProp<IAccountStack, "SettingPicker">
}
