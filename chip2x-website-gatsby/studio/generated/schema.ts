import type {
  SanityReference,
  SanityKeyedReference,
  SanityAsset,
  SanityImage,
  SanityFile,
  SanityGeoPoint,
  SanityBlock,
  SanityDocument,
  SanityImageCrop,
  SanityImageHotspot,
  SanityKeyed,
  SanityImageAsset,
  SanityImageMetadata,
  SanityImageDimensions,
  SanityImagePalette,
  SanityImagePaletteSwatch,
} from "sanity-codegen";

export type {
  SanityReference,
  SanityKeyedReference,
  SanityAsset,
  SanityImage,
  SanityFile,
  SanityGeoPoint,
  SanityBlock,
  SanityDocument,
  SanityImageCrop,
  SanityImageHotspot,
  SanityKeyed,
  SanityImageAsset,
  SanityImageMetadata,
  SanityImageDimensions,
  SanityImagePalette,
  SanityImagePaletteSwatch,
};

/**
 * aboutPage
 *
 *
 */
export interface AboutPage extends SanityDocument {
  _type: "aboutPage";

  /**
   * pageTitle — `localeString`
   *
   *
   */
  pageTitle?: LocaleString;
}

/**
 * sharedSections
 *
 *
 */
export interface SharedSections extends SanityDocument {
  _type: "sharedSections";

  /**
   * ctaSection — `ctaSection`
   *
   *
   */
  ctaSection?: CtaSection;
}

/**
 * siteConfig
 *
 *
 */
export interface SiteConfig extends SanityDocument {
  _type: "siteConfig";

  /**
   * mainNav — `mainNav`
   *
   * Used for the (desktop) main nav.
   */
  mainNav?: MainNav;
}

/**
 * Menu items (admin)
 *
 *
 */
export interface MenuItem extends SanityDocument {
  _type: "menuItem";

  /**
   * title — `localeString`
   *
   *
   */
  title?: LocaleString;

  /**
   * slug — `slug`
   *
   * Absolute path to the page (start with /). If this is a sub menu section header, you can define the slug but it will not have an own page.
   */
  slug?: { _type: "slug"; current: string };

  /**
   * Is Section Header (desktop) — `boolean`
   *
   * Turn on if this menu item is a sub menu section header (on desktop). The section header will open the sub menu and does not have an own page.
   */
  isSectionHeader?: boolean;

  /**
   * Is Sub Menu Item (desktop) — `boolean`
   *
   * Turn on if this menu item is part of a sub menu section (on desktop).
   */
  isSubMenuItem?: boolean;

  /**
   * description — `localeString`
   *
   *
   */
  description?: LocaleString;

  /**
   * thumbnailImage — `image`
   *
   *
   */
  thumbnailImage?: {
    _type: "image";
    asset: SanityReference<SanityImageAsset>;
    crop?: SanityImageCrop;
    hotspot?: SanityImageHotspot;
  };
}

/**
 * project
 *
 *
 */
export interface Project extends SanityDocument {
  _type: "project";

  /**
   * showOnWebsite — `boolean`
   *
   *
   */
  showOnWebsite?: boolean;

  /**
   * title — `string`
   *
   *
   */
  title?: string;

  /**
   * slug — `slug`
   *
   *
   */
  slug?: { _type: "slug"; current: string };

  /**
   * publishDate — `date`
   *
   *
   */
  publishDate?: string;

  /**
   * subTitle — `string`
   *
   * For example: Web app | Mobile app | Website.
   */
  subTitle?: string;

  /**
   * coverImage — `image`
   *
   *
   */
  coverImage?: {
    _type: "image";
    asset: SanityReference<SanityImageAsset>;
    crop?: SanityImageCrop;
    hotspot?: SanityImageHotspot;
  };

  /**
   * client — `string`
   *
   *
   */
  client?: string;

  /**
   * category — `reference`
   *
   *
   */
  category?: SanityReference<ProjectCategory>;

  /**
   * skills — `array`
   *
   *
   */
  skills?: Array<SanityKeyedReference<ProjectSkill>>;
}

/**
 * projectCategory
 *
 *
 */
export interface ProjectCategory extends SanityDocument {
  _type: "projectCategory";

  /**
   * title — `string`
   *
   *
   */
  title?: string;
}

/**
 * projectSkill
 *
 *
 */
export interface ProjectSkill extends SanityDocument {
  _type: "projectSkill";

  /**
   * title — `string`
   *
   *
   */
  title?: string;
}

export type LocaleBlock = {
  _type: "localeBlock";
  /**
   * English — `array`
   *
   *
   */
  en?: Array<SanityKeyed<SanityBlock>>;

  /**
   * Nederlands — `array`
   *
   *
   */
  nl?: Array<SanityKeyed<SanityBlock>>;
};

export type LocaleString = {
  _type: "localeString";
  /**
   * English — `string`
   *
   *
   */
  en?: string;

  /**
   * Nederlands — `string`
   *
   *
   */
  nl?: string;
};

export type LocaleText = {
  _type: "localeText";
  /**
   * English — `text`
   *
   *
   */
  en?: string;

  /**
   * Nederlands — `text`
   *
   *
   */
  nl?: string;
};

export type BlockSimpleText = {
  _type: "blockSimpleText";
  /**
   * title — `string`
   *
   *
   */
  title?: string;

  /**
   * description — `text`
   *
   *
   */
  description?: string;
};

export type CtaSection = {
  _type: "ctaSection";
  /**
   * title — `localeString`
   *
   *
   */
  title?: LocaleString;

  /**
   * description — `localeText`
   *
   *
   */
  description?: LocaleText;
};

export type MainNav = {
  _type: "mainNav";
  /**
   * menuItems — `array`
   *
   *
   */
  menuItems?: Array<SanityKeyed<NavItem>>;
};

export type NavItem = {
  _type: "navItem";
  /**
   * menuItem — `reference`
   *
   *
   */
  menuItem?: SanityReference<MenuItem>;

  /**
   * subMenuItems — `array`
   *
   *
   */
  subMenuItems?: Array<SanityKeyedReference<MenuItem>>;
};

export type Documents =
  | AboutPage
  | SharedSections
  | SiteConfig
  | MenuItem
  | Project
  | ProjectCategory
  | ProjectSkill;
