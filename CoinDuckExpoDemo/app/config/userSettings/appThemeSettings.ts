import { IAppTheme, IAppThemeSetting } from "../../../types/settings"

const settings: IAppThemeSetting = {
  system: {
    key: "system",
    title: "System",
  },
  light: {
    key: "light",
    title: "Light",
  },
  dark: {
    key: "dark",
    title: "Dark",
  },
}

export const getSetting = (key: string): IAppTheme => {
  return settings[key] ?? settings.light
}

export const getSettingsArray = (): IAppTheme[] => {
  return Object.values(settings)
}
