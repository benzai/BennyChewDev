import SwiftUI

// MARK: - ColorTheme

protocol ColorTheme {
  var theme: UserTheme { get }

  var accent1: Color { get }
  var accent2: Color { get }
  var accent3: Color { get }
  var accent4: Color { get }

  var text1: Color { get }
  var text2: Color { get }
  var text3: Color { get }
  var altText1: Color { get }
  var altText2: Color { get }
  var altText3: Color { get }

  var card1: Color { get }
  var card2: Color { get }
  var line1: Color { get }

  var navBarBg: Color { get }
  var navBarText: Color { get }
  var navBarTint: Color { get }
  var tabBarBg: Color { get }

  var bg1: Color { get }
  var bg2: Color { get }
  var altBg1: Color { get }
  var altBg2: Color { get }

  var statusPositive: Color { get }
  var statusWarning: Color { get }
  var statusNegative: Color { get }
}

/// LightTheme
struct LightTheme: ColorTheme {
  var theme: UserTheme { .light }

  var accent1: Color { Color("#ED8936") }
  var accent2: Color { Color("#26A672") }
  var accent3: Color { Color("#51BCC3") }
  var accent4: Color { Color("#DC3177") }

  var text1: Color { Color("#394566") }
  var text2: Color { Color("#6B8299") }
  var text3: Color { Color("#99ACBF") }
  var altText1: Color { Color("#FCFCFC") }
  var altText2: Color { Color("#EBEBEB") }
  var altText3: Color { Color("#C8D3DE") }

  var card1: Color { Color("#FFFFFF") }
  var card2: Color { Color("#FFFFFF") }
  var line1: Color { Color("#000000") }

  var navBarBg: Color { Color("#394466") }
  var navBarText: Color { Color("#FCFCFC") }
  var navBarTint: Color { Color("#99ACBF") }
  var tabBarBg: Color { Color("#F5F7F9") }

  var bg1: Color { Color("#FFFFFF") }
  var bg2: Color { Color("#F5F7F9") }
  var altBg1: Color { Color("#394466") }
  var altBg2: Color { Color("#293045") }

  var statusPositive: Color { Color("#51D191") }
  var statusWarning: Color { Color("#FF5901") }
  var statusNegative: Color { Color("#FF5959") }
}

/// DarkTheme
struct DarkTheme: ColorTheme {
  var theme: UserTheme { .dark }

  var accent1: Color { Color("#ED8936") }
  var accent2: Color { Color("#26A672") }
  var accent3: Color { Color("#51BCC3") }
  var accent4: Color { Color("#DC3177") }

  var text1: Color { Color("#FFFFFF") }
  var text2: Color { Color("#99ACBF") }
  var text3: Color { Color("#99ACBF") }
  var altText1: Color { Color("#394566") }
  var altText2: Color { Color("#6B8299") }
  var altText3: Color { Color("#99ACBF") }

  var card1: Color { Color("#323A54") }
  var card2: Color { Color("#3D4866") }
  var line1: Color { Color("#FFFFFF") }

  var navBarBg: Color { Color("#394466") }
  var navBarText: Color { Color("#FCFCFC") }
  var navBarTint: Color { Color("#99ACBF") }
  var tabBarBg: Color { Color("#293045") }

  var bg1: Color { Color("#394466") }
  var bg2: Color { Color("#272E42") }
  var altBg1: Color { Color("#FFFFFF") }
  var altBg2: Color { Color("#4F707F") }

  var statusPositive: Color { Color("#51D191") }
  var statusWarning: Color { Color("#FF5901") }
  var statusNegative: Color { Color("#FF5959") }
}
