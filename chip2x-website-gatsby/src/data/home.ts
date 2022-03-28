import { IPage, IMoreButton, ISkill } from "./shared"

export type IHomeData = {
  page: IPage

  headerSection: {
    title: string
    text1: string
    coverImageUrl: string
    moreButton: IMoreButton
  }

  whatSection: {
    title: string
    text1: string
    moreButton: IMoreButton
  }

  projectsSection: {
    title: string
    text1?: string
    moreButton: IMoreButton
  }
}

export type IServicePreview = {
  id: string
  title: string
  iconUrl?: string
  skills?: ISkill[]
}

export const homeData: IHomeData = {
  page: {
    title: "Freelance UI/UX design services. Apps, websites, icons and illustrations.",
  },

  headerSection: {
    title:
      "<span class='font-medium text-lg3 md:text-xl lg:text-xl2 xl:text-xxl text-text1'>Hello</span><br /><span class='font-medium text-lg3 md:text-xl lg:text-xl2 xl:text-xxl text-accent1'>we are</span><br /><span class='font-medium text-lg3 md:text-xl lg:text-xl2 xl:text-xxl text-accent2'>ChipChip</span>",
    text1:
      "Creative design duo specialized in creating awesome digital products. ChipChip can help you visualize your product idea.",
    coverImageUrl: "/static/images/graphics/illustrations/illustration-home-header.svg",
    moreButton: { title: "View our work", route: "/#projects" },
  },

  whatSection: {
    title: "What we do",
    text1:
      "We create custom app and web designs with immersive digital experiences for brands across different markets.",
    moreButton: { title: "More about us", route: "/about" },
  },

  projectsSection: {
    title: "Latest projects",
    text1:
      "A selection of our latest design projects. Including mobile, web apps, websites, icons, illustrations and more.",
    moreButton: { title: "More projects", route: "/projects" },
  },
}
