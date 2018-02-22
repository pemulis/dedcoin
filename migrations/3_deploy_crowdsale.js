const DedcoinCrowdsale = artifacts.require("./DedcoinCrowdsale.sol")

module.exports = function(deployer, network, accounts) {
  const startTime = web3.eth.getBlock(web3.eth.blockNumber).timestamp + 1 // one second in the future
  const endTime = startTime + (86400 * 365) // 365 days
  const rate = new web3.BigNumber(1000)
  const wallet = accounts[0]

  deployer.deploy(DedcoinCrowdsale, startTime, endTime, rate, wallet)
};
