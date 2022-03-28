export type IPortfolio = {
  currencyFormatter: Intl.NumberFormat | undefined
  percentageFormatter: Intl.NumberFormat | undefined

  // User
  portfolioId: string
  title: string
  dateUpdated: Date
  investmentCost: number
  coins: IPortfolioCoin[]

  // Computed
  readonly coinsCount: number
  readonly totalPortfolioPrice: number
  readonly profit: number
  readonly profitPercentage: number
  readonly profitIsUp: boolean

  // Formatted
  readonly investmentCostFormatted: string
  readonly totalPortfolioPriceFormatted: string
  readonly profitFormatted: string
  readonly profitPercentageFormatted: string
}

export type IPortfolioCoin = {
  currencyFormatter: Intl.NumberFormat | undefined
  percentageFormatter: Intl.NumberFormat | undefined

  // User
  coinId: number
  amount: number

  // Remote
  name: string
  symbol: string
  price: number
  iconUrl: string

  // Computed
  readonly totalPrice: number

  // Formatted
  readonly priceFormatted: string
}

export class Portfolio implements IPortfolio {
  currencyFormatter: Intl.NumberFormat | undefined
  percentageFormatter: Intl.NumberFormat | undefined

  // User
  portfolioId: string
  title: string
  dateUpdated: Date
  investmentCost: number
  coins: PortfolioCoin[]

  // Computed
  get coinsCount(): number {
    return this.coins.length
  }

  get totalPortfolioPrice(): number {
    return this.coins.reduce((value, item) => value + item.totalPrice, 0)
  }

  get profit(): number {
    return this.totalPortfolioPrice - this.investmentCost
  }

  get profitPercentage(): number {
    return this.totalPortfolioPrice / this.investmentCost
  }

  get profitIsUp(): boolean {
    return this.profitPercentage >= 0 ? true : false
  }

  // Formatted
  get investmentCostFormatted(): string {
    return this.currencyFormatter.format(this.investmentCost) ?? "$0"
  }

  get totalPortfolioPriceFormatted(): string {
    return this.currencyFormatter.format(this.totalPortfolioPrice) ?? "$0"
  }

  get profitFormatted(): string {
    return this.currencyFormatter.format(this.profit) ?? "$0"
  }

  get profitPercentageFormatted(): string {
    return this.percentageFormatter.format(this.profitPercentage) ?? "0%"
  }

  constructor(
    portfolioId: string,
    title: string,
    dateUpdated: Date,
    investmentCost: number,
    coins: PortfolioCoin[],
  ) {
    this.portfolioId = portfolioId
    this.title = title
    this.dateUpdated = dateUpdated
    this.investmentCost = investmentCost
    this.coins = coins
  }
}

export class PortfolioCoin implements IPortfolioCoin {
  currencyFormatter: Intl.NumberFormat | undefined
  percentageFormatter: Intl.NumberFormat | undefined

  // User
  coinId: number
  amount: number

  // Remote
  name: string
  symbol: string
  price: number
  iconUrl: string

  // Computed
  get totalPrice(): number {
    return this.amount * this.price
  }

  // Formatted
  get priceFormatted(): string {
    return this.currencyFormatter.format(this.price)
  }

  constructor(
    coinId: number,
    amount: number,
    name: string,
    symbol: string,
    price: number,
    iconUrl: string,
  ) {
    this.coinId = coinId
    this.amount = amount
    this.name = name
    this.symbol = symbol
    this.price = price
    this.iconUrl = iconUrl
  }
}
