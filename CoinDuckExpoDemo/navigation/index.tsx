import React from "react"
import { ImageSourcePropType, Image } from "react-native"
import { NavigationContainer } from "@react-navigation/native"
import { createNativeStackNavigator } from "@react-navigation/native-stack"
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs"

import { ITab, ICoinsStack, IPortfolioStack, IAccountStack } from "../types/navigation"
import {
  CoinsPage,
  CoinDetailPage,
  PortfolioPage,
  AccountPage,
  SettingPickerPage,
} from "../screens"
import {
  icon32_coin,
  icon32_watchlist,
  icon32_portfolio,
  icon32_news,
  icon32_settings,
} from "../assets"

import * as theme from "../app/theme"

const navBarStyle_color = {
  headerTintColor: "white",
  headerStyle: { backgroundColor: theme.colors.accent1 },
  headerShadowVisible: false,
  headerLargeTitleShadowVisible: false,
}

// Coins
const CoinsStack = createNativeStackNavigator<ICoinsStack>()

export function CoinsStackPage() {
  return (
    <CoinsStack.Navigator screenOptions={navBarStyle_color}>
      <CoinsStack.Screen name="Coins" component={CoinsPage} />
      <CoinsStack.Screen name="CoinDetail" component={CoinDetailPage} />
    </CoinsStack.Navigator>
  )
}

// Portfolio
const PortfolioStack = createNativeStackNavigator<IPortfolioStack>()

export function PortfolioStackPage() {
  return (
    <PortfolioStack.Navigator screenOptions={navBarStyle_color}>
      <PortfolioStack.Screen name="Portfolio" component={PortfolioPage} />
    </PortfolioStack.Navigator>
  )
}

// Account
const AccountStack = createNativeStackNavigator<IAccountStack>()

export function AccountStackPage() {
  return (
    <AccountStack.Navigator screenOptions={navBarStyle_color}>
      <AccountStack.Screen name="Account" component={AccountPage} />
      <AccountStack.Screen name="SettingPicker" component={SettingPickerPage} />
    </AccountStack.Navigator>
  )
}

// Tab
const Tab = createBottomTabNavigator<ITab>()

export function TabPage() {
  return (
    <NavigationContainer>
      <Tab.Navigator
        screenOptions={() => ({
          tabBarShowLabel: false,
          tabBarActiveTintColor: theme.colors.accent1,
          tabBarInactiveTintColor: theme.colors.text3,
        })}>
        <Tab.Screen
          name="CoinsStack"
          component={CoinsStackPage}
          options={{
            headerShown: false,
            title: "Coins",
            tabBarIcon: ({ color }) => icon(icon32_coin, color),
          }}
        />
        <Tab.Screen
          name="PortfolioStack"
          component={PortfolioStackPage}
          options={{
            headerShown: false,
            title: "Portfolio",
            tabBarIcon: ({ color }) => icon(icon32_portfolio, color),
          }}
        />
        <Tab.Screen
          name="AccountStack"
          component={AccountStackPage}
          options={{
            headerShown: false,
            title: "Account",
            tabBarIcon: ({ color }) => icon(icon32_settings, color),
          }}
        />
      </Tab.Navigator>
    </NavigationContainer>
  )

  function icon(icon: ImageSourcePropType, color: string) {
    return (
      <Image
        style={{
          tintColor: color,
          width: 32,
          height: 32,
          resizeMode: "contain",
        }}
        source={icon}
      />
    )
  }
}
