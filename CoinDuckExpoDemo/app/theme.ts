export type Color =
  | "accent1"
  | "accent1_10"
  | "accent1_20"
  | "accent2"
  | "accent2_10"
  | "accent2_20"
  | "text1"
  | "text2"
  | "text3"
  | "altText1"
  | "altText1"
  | "altText2"
  | "altText3"
  | "bg1"
  | "bg2"
  | "altBg1"
  | "altBg2"
  | "statusPositive"
  | "statusWarning"
  | "statusNegative"
  | "spot1"
  | "spot2"
  | "spot3"

export type FontSize =
  | "xl"
  | "lg"
  | "lg2"
  | "lg3"
  | "md"
  | "md2"
  | "md3"
  | "sm"
  | "sm2"
  | "sm3"
  | "xs"

export const colors = {
  accent1: "rgba(55,61,250,1.0)",
  accent1_10: "rgba(55,61,250,0.1)",
  accent1_20: "rgba(55,61,250,0.2)",
  accent2: "rgba(2,191,236,1.0)",
  accent2_10: "rgba(2,191,236,0.1)",
  accent2_20: "rgba(2,191,236,0.2)",

  text1: "#263340",
  text2: "#6B8299",
  text3: "#99ACBF",
  altText1: "rgba(255,255,255,1.0)",
  altText1_60: "rgba(255,255,255,0.6)",
  altText2: "#FCFCFC",
  altText3: "#FCFCFC",

  bg1: "#FFFFFF",
  bg2: "#EEF0F3",
  altBg1: "#394566",
  altBg2: "#394566",

  statusPositive: "#54D192",
  statusWarning: "#FF5901",
  statusNegative: "#FF5959",

  spot1: "#61D3F2",
  spot2: "#52D191",
  spot3: "#FFB36B",
}

export const fontSizes = {
  xl: 48,
  lg: 40,
  lg2: 32,
  lg3: 24,
  md: 20,
  md2: 18,
  md3: 16,
  sm: 14,
  sm2: 13,
  sm3: 12,
  xs: 10,
}

export const color = (key: Color): string => colors[key] ?? colors.text1
export const colorKey = (key: Color): Color => key

export const fontSize = (key: FontSize): number => fontSizes[key] ?? fontSizes.md
export const fontSizeKey = (key: FontSize): FontSize => key
