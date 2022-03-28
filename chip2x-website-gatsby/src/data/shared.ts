export type ISharedData = {
  callToActionSection: {
    title: string
    subTitle?: string
    text1: string
    moreButton: IMoreButton
  }
}

export type IPage = {
  title: string
}

export type ITheme = "light" | "dark"

export type IFormField = {
  element: "input" | "textarea"
  name: string
  label: string
  placeholder: string
}

export type IMoreButton = {
  title: string
  route: string
}

export type ISkill = {
  title: string
}

export type ITeamMember = {
  name: string
  occupation: string
  avatarUrl: string
  text1: string
  skills?: ISkill[]
  socials?: ISocial[]
  accentColor?: "bg-accent1" | "bg-accent2" | "bg-accent3"
}

export type ISocial = {
  title: string
  websiteUrl: string
  iconUrl: string
  iconDarkUrl?: string
}

export const sharedData: ISharedData = {
  callToActionSection: {
    title: "Have a new project?",
    subTitle: "We are available for new projects.",
    text1: "Let's make something amazing together.",
    moreButton: {
      title: "Get in touch",
      route: "/contact",
    },
  },
}
