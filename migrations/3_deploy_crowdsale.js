const DedcoinCrowdsale = artifacts.require("./DedcoinCrowdsale.sol")
const Dedcoin = artifacts.require("./Dedcoin.sol")

module.exports = function(deployer, network, accounts) {
  const initialRate = 1
  const finalRate = 3
  const openingTime = web3.eth.getBlock(web3.eth.blockNumber).timestamp + 1 // one second in the future
  const closingTime = openingTime + (86400 * 20) // 20 days
  const rate = 1
  const wallet = accounts[0]
  const token = Dedcoin

  deployer.deploy(DedcoinCrowdsale, initialRate, finalRate, openingTime, closingTime, rate, wallet, token)
};
