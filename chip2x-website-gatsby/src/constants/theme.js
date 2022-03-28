module.exports = {
  mq: breakpoint => {
    return `@media (min-width: ${breakpoint})`
  },
  screens: {
    md: `768px`,
    lg: `1024px`,
    xl: `1400px`,
  },
  colors: {
    none: `#transparent`,

    accent1: `#63c3eb`,
    accent2: `#387af2`,
    accent3: `#2bc7dd`,

    text1: `#203040`,
    text2: `#4d5966`,
    text3: `#8495a6`,
    altText1: `#ffffff`,
    altText1_60: `rgba(255, 255, 255, 0.6)`,
    altText2: `#ffffff`,
    altText3: `#ffffff`,

    bg1: `#ffffff`,
    bg2: `#f7fafc`,
    bg3: `#e9eff5`,
    altBg1: `#203040`,

    border1: `#e8eaeb`,
  },
  colorsTw: {
    bg_accent1: `bg-accent1`,
    bg_accent2: `bg-accent2`,
    bg_bg1: `bg-bg1`,
    bg_bg2: `bg-bg2`,
    bg_bg3: `bg-bg3`,
    bg_altBg1: `bg-altBg1`,
  },
  fontSizes: {
    xxl: [
      `160px`,
      {
        letterSpacing: "-0.05em",
        lineHeight: "0.9em",
      },
    ],
    xl3: [
      `120px`,
      {
        letterSpacing: "-0.05em",
        lineHeight: "0.9em",
      },
    ],
    xl2: [
      `100px`,
      {
        letterSpacing: "-0.05em",
        lineHeight: "0.9em",
      },
    ],
    xl: [
      `80px`,
      {
        letterSpacing: "-0.05em",
        lineHeight: "0.9em",
      },
    ],
    lg3: [
      `60px`,
      {
        letterSpacing: "-0.04em",
        lineHeight: "0.9em",
      },
    ],
    lg2: [
      `48px`,
      {
        letterSpacing: "-0.04em",
        lineHeight: "1.1em",
      },
    ],
    lg: [
      `40px`,
      {
        letterSpacing: "-0.04em",
        lineHeight: "1.2em",
      },
    ],
    md3: [
      `32px`,
      {
        letterSpacing: "-0.03em",
        lineHeight: "1.3em",
      },
    ],
    md2: [
      `28px`,
      {
        letterSpacing: "-0.04em",
        lineHeight: "1.3em",
      },
    ],
    md: [
      `24px`,
      {
        letterSpacing: "-0.03em",
        lineHeight: "1.5em",
      },
    ],
    sm3: [
      `21px`,
      {
        letterSpacing: "-0.02em",
        lineHeight: "1.5em",
      },
    ],
    sm2: [
      `18px`,
      {
        letterSpacing: "0em",
        lineHeight: "1.5em",
      },
    ],
    sm: [
      `16px`,
      {
        letterSpacing: "0em",
        lineHeight: "1.5em",
      },
    ],
    xs2: [
      `15px`,
      {
        letterSpacing: "0em",
        lineHeight: "1.5em",
      },
    ],
    xs: [
      `14px`,
      {
        letterSpacing: "0em",
        lineHeight: "1.5em",
      },
    ],
  },
  spacing: {
    sectionY: `py-40 md:py-60 lg:py-80`,
    sectionY_lg: `py-60 md:py-80 lg:py-100`,
    sectionY_md: `py-40 md:py-60`,
    sectionYTight: `py-20 md:py-40`,
    sectionYTop: `pt-40 md:pt-60 lg:pt-80`,
    sectionYTopExtra: `pt-120 md:pt-160`,
    sectionYBottom: `pb-40 md:pb-60 lg:pb-80`,
    blockY: `h-40 md:h-60`,
    blockYTight: `h-40`,
    blockYLoose: `h-40 md:h-60 lg:h-80`,
    cardPadding: `px-30 py-40 md:py-60`,
    spacerH_titleContent: `h-30 md:h-40 lg:h-60 bg-transparent`,
  },
}
