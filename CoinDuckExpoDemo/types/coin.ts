export type ICoin = {
  coinId: number
  name: string
  symbol: string
  price: number
  upDownPct: number
  iconUrl: string

  priceFormatted?: string
  upDownPctFormatted?: string
}

export type ICoinDetail = ICoin & {}
