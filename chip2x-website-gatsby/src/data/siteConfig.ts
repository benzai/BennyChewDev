import { ISocial } from "./shared"

export type IMainMenu = {
  menuItems: IMenuItem[]
  nextActions: INextAction[]
  mobileMenuItems?: IMenuItem[]
  footerMenuSections: IFooterMenuSection[]
}

export type IMenuItem = {
  title: string
  route: string
  iconUrl?: string
  actionType?: "route" | "external"
  subItems?: IMenuItem[]
}

export type INextAction = {
  type: "main" | "alternate"
  title: string
  route: string
}

export type IFooterMenuSection = {
  title: string
  items: IMenuItem[]
}

export type IContactDetails = {
  company: {
    name: string
    description?: string
    legal?: string
    logoUrl?: string
    logoDarkUrl?: string
    startYear?: number
  }
  contact: {
    email: string
    phone: string
    location: string
  }
  links: {
    website: string
    socials?: ISocial[]
  }
}

export const mainMenu: IMainMenu = {
  menuItems: [
    {
      title: "Projects",
      route: "/projects",
    },
    {
      title: "Services",
      route: "/services",
    },
    {
      title: "About",
      route: "/about",
    },
    { title: "Contact", route: "/contact" },
  ],

  nextActions: [{ type: "main", title: "Hire us", route: "/contact" }],

  footerMenuSections: [
    {
      title: "Contact us",
      items: [
        {
          title: "hello@chipchip.nl",
          route: "mailto:hello@chipchip.nl",
          iconUrl: "/static/images/graphics/icons/icon24-email.svg",
          actionType: "external",
        },
        {
          title: "The Netherlands",
          route:
            "https://www.google.com/maps/place/Rotterdam/@51.9280573,4.420367,12z/data=!3m1!4b1!4m5!3m4!1s0x47c5b7605f54c47d:0x5229bbac955e4b85!8m2!3d51.9244201!4d4.4777325",
          iconUrl: "/static/images/graphics/icons/icon24-location.svg",
          actionType: "external",
        },
      ],
    },

    {
      title: "Company",
      items: [
        {
          title: "Home",
          route: "/",
        },
        {
          title: "Projects",
          route: "/projects",
        },
        {
          title: "Services",
          route: "/services",
        },
        {
          title: "About",
          route: "/about",
        },
        {
          title: "Contact",
          route: "/contact",
        },
      ],
    },

    {
      title: "Projects",
      items: [
        {
          title: "CleanOnn Clean",
          route: "/projects/cleanonn-clean",
        },
        {
          title: "Reisknaller",
          route: "/projects/reisknaller",
        },
        {
          title: "Rubbiz",
          route: "/projects/rubbiz",
        },
        {
          title: "Blackfire",
          route: "/projects/blackfire",
        },
        {
          title: "CoinHippo",
          route: "/projects/coinhippo",
        },
      ],
    },
  ],
}

export const contactDetails: IContactDetails = {
  company: {
    name: "ChipChip",
    description: "Creative design duo specialized in creating awesome digital products.",
    legal: "Registered at The Netherlands Chamber of Commerce - Rotterdam 67000592.",
    logoUrl: "/static/images/graphics/brand/logo-mark-light.svg",
    logoDarkUrl: "/static/images/graphics/brand/logo-mark-dark.svg",
    startYear: 2016,
  },

  contact: {
    email: "hello@chipchip.nl",
    phone: "",
    location: "Rotterdam, The Netherlands",
  },

  links: {
    website: "/static",
  },
}
