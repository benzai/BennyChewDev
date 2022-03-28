const theme = require("./src/constants/theme")

const generateFixedClasses = (start = 0, until = 1000, step = 10) => {
  let options = {}
  for (let i = start; i <= until; i += step) {
    options[i] = `${i}px`
  }
  return options
}

module.exports = {
  mode: "jit",
  purge: ["./public/**/*.html", "./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    fontFamily: {
      regular: [`var(--font_regular)`],
      medium: [`var(--font_medium)`],
      bold: [`var(--font_bold)`],
    },
    fontSize: {
      ...theme.fontSizes,
    },
    lineHeight: {
      none: 1,
      tight: 1.1,
      normal: 1.2,
      relaxed: 1.5,
      loose: 1.7,
    },
    letterSpacing: {
      tight_lg: `-0.04em`,
      tight_md: `-0.03em`,
      tight_sm: `-0.02em`,
      tight_xs: `-0.01em`,
      normal: `0`,
      wide_xs: `0.01em`,
      wide_sm: `0.02em`,
      wide_md: `0.03em`,
      wide_lg: `0.04em`,
    },
    borderRadius: {
      none: 0,
      default: `12px`,
      bubble: `20px`,
      round: `9999px`,
    },
    gap: {
      ...generateFixedClasses(0, 100, 2),
    },

    extend: {
      screens: {
        md: `768px`,
        lg: `1024px`,
        xl: `1500px`,
      },
      colors: {
        ...theme.colors,
      },
      borderRadius: {
        xs: `6px`,
        sm: `8px`,
        md: `12px`,
        lg: `16px`,
      },
      borderWidth: {
        one: `1px`,
        three: `3px`,
      },
      borderColor: {
        ...theme.colors,
      },
      boxShadow: {
        outline: `0 0 0 1px rgba(0, 0, 0, 0.1)`,
      },
      inset: {
        ...generateFixedClasses(0, 200, 10),
      },
      spacing: {
        none: 0,

        ...generateFixedClasses(0, 100, 2),
        ...generateFixedClasses(100, 200, 20),

        "1/10": "10%",
        "2/10": "20%",
        "3/10": "30%",
        "4/10": "40%",
        "5/10": "50%",
        "6/10": "60%",
        "7/10": "70%",
        "8/10": "80%",
        "9/10": "90%",
        "10/10": "100%",

        "1/2": "50%",
        "1/3": "33.333333%",
        "2/3": "66.666667%",
        "3/3": "100%",

        "1/4": "25%",
        "2/4": "50%",
        "3/4": "75%",
        "4/4": "100%",

        "1/5": "20%",
        "2/5": "40%",
        "3/5": "60%",
        "4/5": "80%",
        "5/5": "100%",

        "1/6": "16.666667%",
        "2/6": "33.333333%",
        "3/6": "50%",
        "4/6": "66.666667%",
        "5/6": "83.333333%",
        "6/6": "100%",

        "1/12": "8.333333%",
        "2/12": "16.666667%",
        "3/12": "25%",
        "4/12": "33.333333%",
        "5/12": "41.666667%",
        "6/12": "50%",
        "7/12": "58.333333%",
        "8/12": "66.666667%",
        "9/12": "75%",
        "10/12": "83.333333%",
        "11/12": "91.666667%",
        "12/12": "100%",

        full: "100%",
      },
      width: {
        ...generateFixedClasses(0, 100, 2),
        ...generateFixedClasses(100, 1000, 10),
        ...generateFixedClasses(1000, 2000, 100),
      },
      height: {
        ...generateFixedClasses(0, 100, 2),
        ...generateFixedClasses(100, 1000, 10),
        ...generateFixedClasses(1000, 2000, 100),
        "screen-50": `50vh`,
        "screen-60": `60vh`,
        "screen-70": `70vh`,
        "screen-80": `80vh`,
        "screen-90": `90vh`,
        "screen-exclNavBar-lg": `calc(100vh - 100px)`,
        "screen-exclNavBar-md": `calc(100vh - 80px)`,
        "screen-exclNavBar-sm": `calc(100vh - 60px)`,
      },
      minWidth: {
        ...generateFixedClasses(0, 100, 2),
        ...generateFixedClasses(100, 1000, 10),
        ...generateFixedClasses(1000, 2000, 100),
      },
      maxWidth: {
        ...generateFixedClasses(0, 100, 2),
        ...generateFixedClasses(100, 1000, 10),
        ...generateFixedClasses(1000, 2000, 100),
        page: `1600px`,
      },
      minHeight: {
        ...generateFixedClasses(0, 100, 2),
        ...generateFixedClasses(100, 1000, 10),
        ...generateFixedClasses(1000, 2000, 100),
      },
      maxHeight: {
        ...generateFixedClasses(0, 100, 2),
        ...generateFixedClasses(100, 1000, 10),
        ...generateFixedClasses(1000, 2000, 100),
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [require("@tailwindcss/aspect-ratio")],
  corePlugins: {},
}
