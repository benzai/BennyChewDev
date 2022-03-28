import { IPage, ITheme, ISkill } from "./shared"

export type IProject = {
  id: string
  title: string
  slug: {
    current: string
  }
  description: string
  publishDate: string
  contentSections?: IContentSection[]
  subTitle?: string
  coverImage?: {
    asset?: {
      url: string
    }
  }
  headerImage?: {
    asset?: {
      url: string
    }
  }
  client?: string
  category?: {
    title: string
  }
  skills?: ISkill[]
  tools?: ITool[]
  backgroundColor?: string
  theme?: ITheme
}

export type IContentSection = {
  sectionType: "header" | "content"
  _rawContent: any[]
}

export type ITool = {
  title: string
  iconImage: {
    asset: {
      url: string
    }
  }
}

export type IProjectsData = {
  page: IPage

  projectsSection: {
    title: string
    subTitle?: string
    text1?: string
  }
}

export type IProjectDetailData = {
  titles: {
    client: string
    what: string
    tools: string
  }
}

export const projectsData: IProjectsData = {
  page: {
    title: "Projects",
  },

  projectsSection: {
    title: "Our recent projects",
    subTitle: "Projects",
    text1: "",
  },
}

export const projectDetailData: IProjectDetailData = {
  titles: {
    client: "Client",
    what: "What we did",
    tools: "Tools used",
  },
}
