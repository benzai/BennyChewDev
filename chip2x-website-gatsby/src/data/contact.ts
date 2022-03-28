import { IPage } from "./shared"

export type IContactData = {
  page: IPage

  headerSection: {
    title: string
    subTitle?: string
  }

  contactFormSection: {
    confirmation: {
      title: string
      text1: string
      button: {
        title: string
      }
    }
  }
}

export const contactData: IContactData = {
  page: {
    title: "Contact",
  },

  headerSection: {
    title: "Get in touch",
    subTitle: "Contact",
  },

  contactFormSection: {
    confirmation: {
      title: "Thank you for your message.",
      text1: "We will get in touch as soon as possible.",
      button: {
        title: "Send another one",
      },
    },
  },
}
