const DedcoinCrowdsale = artifacts.require("./DedcoinCrowdsale.sol")

module.exports = function(deployer, network, accounts) {
  const initialRate = (1/30000000000000000)
  const finalRate = 1
  const openingTime = web3.eth.getBlock(web3.eth.blockNumber).timestamp + 1 // one second in the future
  const closingTime = openingTime + (86400 * 20) // 20 days

  deployer.deploy(DedcoinCrowdsale, initialRate, finalRate, openingTime, closingTime)
};
