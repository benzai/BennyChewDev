import { IPage, IMoreButton, ITeamMember, ISkill } from "./shared"

export type IAboutData = {
  page: IPage

  headerSection: {
    title: string
    subTitle?: string
  }

  introSection: {
    photos: IPhoto[]
  }

  howSection: {
    title: string
    steps: IWorkflowStep[]
  }

  teamSection: {
    title: string
    text1: string
    text2: string
    text3: string
    text4: string
    teamMembers: ITeamMember[]
  }
}

export type IPhoto = {
  title: string
  imageUrl: string
  resizeCss?: string
}

export type IWorkflowStep = {
  count: string
  title: string
  subTitle: string
  text1: string
  text2?: string
  positionCss?: string
}

export const aboutData: IAboutData = {
  page: {
    title: "About",
  },

  headerSection: {
    title:
      "ChipChip is a design duo based in the Netherlands. We are specialized in UI/UX design, app and website design. We use our design expertise and experience to find solutions that are creative and effective to achieve our clients' business goals.",
    subTitle: "About us",
  },

  introSection: {
    photos: [
      {
        title: "Pencils",
        imageUrl: "/static/images/photos/pencils.png",
        resizeCss: "md:pl-40 lg:pl-80 md:pt-40 lg:pt-80",
      },
      {
        title: "Desk",
        imageUrl: "/static/images/photos/desk.png",
        resizeCss: "mt-20 md:mt-0",
      },
      { title: "Jolie", imageUrl: "/static/images/photos/screen.png" },
      {
        title: "Books",
        imageUrl: "/static/images/photos/books.png",
        resizeCss: "mt-20 md:mt-0 md:pr-80 lg:pr-120 md:pb-80 lg:pb-120",
      },
    ],
  },

  howSection: {
    title: "How we work",
    steps: [
      {
        count: "01",
        title: "Discovery",
        subTitle: "Kickoff Meeting • User Research • Planning • Ideas • UI Sketching",
        text1:
          "The first step of every project is have a talk with the client team. We listen carefully to the problems they are trying to solve and seek to understand the user needs and pain points of the user. Besides this we also take the business and technical requirements into consideration. Often the client has specific knowlegde and experience of the target group, so we will ask the client to share this information if possible. Collaboration is key to success.",
        text2:
          "During this early stage we will gather ideas/inspiration and plan the project roughly. For project planning we like to use Airtable, Trello and/or Asana. A typical design project turnaround time can be anywhere between 2 to 3 weeks or 5 to 6 weeks (or more). To get a good overview of the project we will do UI sketching and write down some ideas in our favorite Moleskine notebook.",
        positionCss: "md:ml-40 lg:ml-1/12",
      },
      {
        count: "02",
        title: "Design",
        subTitle: "UI/UX Design • Wireframes • Design Direction • Design Concepts",
        text1:
          "Based on the project requirements and scope we start work on the UI/UX design and initial concept designs. In this early phase we strive to establish the design direction and have a basis of the design system early on. We consider this to be a critical foundational phase of the project, where we aim to come up with the so called heart and soul of the design. Think of things like direction direction, interaction model, design system, etc.",
        text2:
          "Besides working on the concept UI designs, we will also work on concept icon designs and illustrations. Often the client wishes to have a custom icon set and illustrations. Our design tool of choice is Sketch, but we can also work in Figma. For icons and illustrations we prefer to work in the Adobe Creative Suite, namely Illustrator. For animation we use Adobe Animate and After Effects.",
        positionCss: "md:ml-40 lg:ml-2/12",
      },
      {
        count: "03",
        title: "Design + Iterate",
        subTitle: "Learn • Iterate • Design System • More UI Design • More Icons/Illustrations",
        text1:
          "After reviewing the initial design concepts with the client we continue working on the designs. We upload the designs on InVision as this makes it easier to give feedback. Most of the time the client likes the design direction of the first design concept, but in rare cases if they don't, we will try to come up with an alternate solution. 9 out of 10 times the client will have feedback and we think this is great, because good feedback allows us to learn more and iterate accordingly. We love feedback!",
        text2:
          "During this phase we continue to work on the UI designs in Sketch (or Figma) and necessary visuals (icons and illustrations). This is a creative and iterative process. It is often not possible to know in advance what screens or design details we need to design. And that is a good thing in our opinion, because creative exploration oftens leads to better results. It's not much fun if we already know everything in advance, right?",
        positionCss: "md:ml-40 lg:ml-3/12",
      },
      {
        count: "04",
        title: "Deliver",
        subTitle: "Evaluation • Hand Off • Design Assets • Support • Happy Client",
        text1:
          "Depending on the preferences of the client we will deliver the design assets to the client/development team in Sketch or Figma format. We can assist the developent team wherever possible and required. For most projects we create a design library with all UI components, colors, font sizes, icons and illustrations, etc. All structured and organized in an easy to use design system. This design system enables better collaboration and makes it much easier for developer team to implement the designs in code. Since the Sketch or Figma files are well structured, the dev team will be able to find everything they need quickly.",
        text2:
          "Sometimes we can also implement the designs in code if the client requires this (front-end in particular). For website development our tech stack of choice is Gatsby/React, TypeScript, Tailwind CSS and Emotion. Depending on the client requirements we can additionally integrate a CMS into the website. Our favorite headless CMS is Sanity. We have also worked with Contentful and Strapi.",
        positionCss: "md:ml-40 lg:ml-4/12",
      },
    ],
  },

  teamSection: {
    title: "Meet the team",
    text1:
      "We are a creative design duo who enjoys making cool products and are passionate about helping startups and established brands create beautiful user experiences. With every new project we aim to create playful and beautiful solutions.",
    text2:
      "Combined we have more than 20 years of experience working as creative professionals. We are specialized in digital design, including UI/UX design, web app design, iOS/Android app design, website design and of course illustration, icon design and animation as well.",
    text3:
      "Our clients include new and upcoming startups like SchoolKassa, CyberBorg, Woovtie, WorkBookers and established brands such as ING, Al Jazeera Children's Channel, Philips, WNF and TicketSpy.",
    text4: "We are based in Rotterdam, The Netherlands.",
    teamMembers: [
      {
        name: "Benny Chew",
        occupation: "App Designer + Developer",
        avatarUrl: "/static/images/photos/benny.png",
        text1:
          "Highly experienced UI/UX designer originally from Singapore, passionate about all things design and tech. In his sparetime he likes to learn coding and build indie apps.",
        skills: [
          { title: "Digital Design" },
          { title: "UI/UX" },
          { title: "Product" },
          { title: "Sketch" },
          { title: "Mobile" },
          { title: "Apps" },
          { title: "Web Apps" },
          { title: "Websites" },
          { title: "Front-end" },
          { title: "React" },
          { title: "Gatsby" },
          { title: "TypeScript" },
          { title: "iOS Development" },
          { title: "Swift" },
        ],
        socials: [
          {
            title: "LinkedIn",
            websiteUrl: "https://www.linkedin.com/in/benzai/",
            iconUrl: "/static/images/graphics/social/social-linkedin-light.svg",
            iconDarkUrl: "/static/images/graphics/social/social-linkedin-dark.svg",
          },
          {
            title: "Twitter",
            websiteUrl: "https://twitter.com/bennychewNL/",
            iconUrl: "/static/images/graphics/social/social-twitter-light.svg",
            iconDarkUrl: "/static/images/graphics/social/social-twitter-dark.svg",
          },
          {
            title: "Dribbble",
            websiteUrl: "https://dribbble.com/BennyChew",
            iconUrl: "/static/images/graphics/social/social-dribbble-light.svg",
            iconDarkUrl: "/static/images/graphics/social/social-dribbble-dark.svg",
          },
          {
            title: "GitHub",
            websiteUrl: "https://github.com/benzai",
            iconUrl: "/static/images/graphics/social/social-github-light.svg",
            iconDarkUrl: "/static/images/graphics/social/social-github-dark.svg",
          },
        ],
        accentColor: "bg-accent3",
      },

      {
        name: "Jenneke Choe",
        occupation: "Designer",
        avatarUrl: "/static/images/photos/jenneke.png",
        text1:
          "Jenneke knows how to put a smile on people's faces by creating  fresh and playful visuals. When she's enjoying some downtime she can be found in the kitchen or learning a new language.",
        skills: [
          { title: "Icon Design" },
          { title: "Illustration" },
          { title: "Branding" },
          { title: "Character Design" },
          { title: "Art Direction" },
          { title: "Storytelling" },
          { title: "Animation" },
          { title: "Illustrator" },
          { title: "Photoshop" },
          { title: "Animate" },
          { title: "After Effects" },
        ],
        socials: [
          {
            title: "LinkedIn",
            websiteUrl: "https://www.linkedin.com/in/jennekechoe/",
            iconUrl: "/static/images/graphics/social/social-linkedin-light.svg",
            iconDarkUrl: "/static/images/graphics/social/social-linkedin-dark.svg",
          },
          {
            title: "Twitter",
            websiteUrl: "https://twitter.com/Puppetbrain",
            iconUrl: "/static/images/graphics/social/social-twitter-light.svg",
            iconDarkUrl: "/static/images/graphics/social/social-twitter-dark.svg",
          },
          {
            title: "Dribbble",
            websiteUrl: "https://dribbble.com/Puppetbrain",
            iconUrl: "/static/images/graphics/social/social-dribbble-light.svg",
            iconDarkUrl: "/static/images/graphics/social/social-dribbble-dark.svg",
          },
        ],
        accentColor: "bg-accent3",
      },
    ],
  },
}
