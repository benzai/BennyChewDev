import { useEffect } from "react"
import { StyleSheet, View } from "react-native"
import { StatusBar } from "expo-status-bar"
import { SafeAreaProvider } from "react-native-safe-area-context"

import { AppProvider } from "./providers"

import useCachedResources from "./hooks/useCachedResources"
import useColorScheme from "./hooks/useColorScheme"

import { TabPage } from "./navigation"

export default function App() {
  const isLoadingComplete = useCachedResources()
  const colorScheme = useColorScheme()

  useEffect(() => {
    console.log("App")
  }, [])

  if (!isLoadingComplete) {
    return null
  } else {
    return (
      <AppProvider>
        <TabPage />
        <StatusBar />
      </AppProvider>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
})
