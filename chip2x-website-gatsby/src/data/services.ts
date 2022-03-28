import { IPage, ISkill } from "./shared"

export type IServicesData = {
  page: IPage

  headerSection: {
    title: string
    subTitle?: string
  }

  servicesSection: {
    services: IService[]
  }
}

export type IService = {
  id: string
  title: string
  subTitle?: string
  shortTitle?: string
  text1?: string
  text2?: string
  iconUrl?: string
  iconDarkUrl?: string
  coverImageUrl?: string
  skills?: ISkill[]
}

export const servicesData: IServicesData = {
  page: {
    title: "Services",
  },

  headerSection: {
    title: "We design products that people love",
    subTitle: "Services",
  },

  servicesSection: {
    services: [
      {
        id: "uiux",
        title: "UI/UX design",
        shortTitle: "UI/UX",
        text1:
          "We base our design solutions on research of user needs. Combining graphic elements we ensure visually amazing and userfriendly websites and apps.",
        text2:
          "We'll wireframe your digital product to map out a clear user journey and how they navigate the screens. This helps us to design a product that works without frustrating users.",
        iconUrl: "/static/images/graphics/services/service-uiux.svg",
        iconDarkUrl: "/static/images/graphics/services/service-uiux-dark.svg",
        coverImageUrl: "/static/images/graphics/illustrations/illustration-services-uiux.svg",
        skills: [
          {
            title: "User Centered",
          },
          {
            title: "Design System",
          },
          {
            title: "UI Design",
          },
          {
            title: "UX Design",
          },
          {
            title: "Interaction Design",
          },
          {
            title: "Product Design",
          },
          {
            title: "Wireframes",
          },
        ],
      },

      {
        id: "mobile",
        title: "Mobile app and web app design",
        shortTitle: "Mobile",
        text1: "Creating interfaces for mobile and web apps is what we like and excel in.",
        text2:
          "We design and make intuitive digital products that deliver exceptional experiences on all devices. We are experts at making apps that are easy to use, beautiful and engaging.",
        iconUrl: "/static/images/graphics/services/service-mobile.svg",
        iconDarkUrl: "/static/images/graphics/services/service-mobile-dark.svg",
        coverImageUrl: "/static/images/graphics/illustrations/illustration-services-mobile.svg",
        skills: [
          {
            title: "Mobile Design",
          },
          {
            title: "Design System",
          },
          {
            title: "Dashboard",
          },
          {
            title: "iOS",
          },
          {
            title: "Android",
          },
          {
            title: "Web App",
          },
        ],
      },

      {
        id: "illustration",
        title: "Icon design and illustration",
        shortTitle: "Illustration",
        text1:
          "Using custom graphics is an effective way to to add depth, character and feeling to a digital product.",
        text2:
          "We create original illustrations and icons enriching your brand's visual language and adding uniqueness.",
        iconUrl: "/static/images/graphics/services/service-illustration.svg",
        iconDarkUrl: "/static/images/graphics/services/service-illustration-dark.svg",
        coverImageUrl:
          "/static/images/graphics/illustrations/illustration-services-illustration.svg",
        skills: [
          {
            title: "Icon Design",
          },
          {
            title: "Illustration",
          },
          {
            title: "Animation",
          },
          {
            title: "Character Design",
          },
          {
            title: "Art Direction",
          },
          {
            title: "Branding",
          },
        ],
      },

      {
        id: "website",
        title: "Website design",
        shortTitle: "Website",
        text1:
          "We can design a website from scratch or redesign an existing one. Using research we design experiences that are intuitive and easy to use.",
        text2:
          "From landing pages to product websites, we do it all. Our websites are designed not only to look great but also work across devices and platforms.",
        iconUrl: "/static/images/graphics/services/service-website.svg",
        iconDarkUrl: "/static/images/graphics/services/service-website-dark.svg",
        coverImageUrl: "/static/images/graphics/illustrations/illustration-services-website.svg",
        skills: [
          {
            title: "Product Website",
          },
          {
            title: "Landing Pages",
          },
          {
            title: "Responsive Design",
          },
          {
            title: "Email Templates",
          },
        ],
      },

      {
        id: "development",
        title: "Development*",
        subTitle: "*In limited capacity",
        shortTitle: "Dev",
        text1:
          "Following the process of UX and UI exploration, we can implement designs into live products with clean code that is on par with todays requirements.",
        text2:
          "We use a set of trusted tools that are essential for keeping deadlines and quality promises on track. ",
        iconUrl: "/static/images/graphics/services/service-development.svg",
        iconDarkUrl: "/static/images/graphics/services/service-development-dark.svg",
        coverImageUrl:
          "/static/images/graphics/illustrations/illustration-services-development.svg",
        skills: [
          {
            title: "React",
          },
          {
            title: "Gatsby",
          },
          {
            title: "Sanity",
          },
          {
            title: "TypeScript",
          },
          {
            title: "HTML/CSS",
          },
          {
            title: "iOS",
          },
          {
            title: "Swift",
          },
          {
            title: "SwiftUI",
          },
        ],
      },
    ],
  },
}
