import { Portfolio, PortfolioCoin } from "../../types/portfolio"

export const mockPortfolios: Portfolio[] = [
  new Portfolio("portfolio1", "Portfolio 1", new Date(), 10000, [
    new PortfolioCoin(
      1,
      1.2,
      "Bitcoin",
      "BTC",
      48189.7469410668,
      "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.png",
    ),
    new PortfolioCoin(
      9,
      1200,
      "Cardano",
      "ADA",
      2.6702516708,
      "https://cdn.coinranking.com/ryY28nXhW/ada.png",
    ),
    new PortfolioCoin(
      14,
      50,
      "Binance",
      "BNB",
      471.6173787268,
      "https://cdn.coinranking.com/B1N19L_dZ/bnb.png",
    ),
    new PortfolioCoin(
      8,
      2500,
      "Tether USD",
      "USDT",
      1.0009889874,
      "https://cdn.coinranking.com/mgHqwlCLj/usdt.png",
    ),
    new PortfolioCoin(
      2,
      10.5,
      "Ethereum",
      "ETH",
      3184.1621353894,
      "https://cdn.coinranking.com/rk4RKHOuW/eth.png",
    ),
  ]),
]

export const mockPortfolios_1coin: Portfolio[] = [
  new Portfolio("portfolio1", "Portfolio 1", new Date(), 10000, [
    new PortfolioCoin(
      1,
      1,
      "Bitcoin",
      "BTC",
      10000,
      "https://cdn.coinranking.com/bOabBYkcX/bitcoin_btc.png",
    ),
  ]),
]
