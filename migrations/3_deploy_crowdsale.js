const DedcoinCrowdsale = artifacts.require("./DedcoinCrowdsale.sol")

module.exports = function(deployer, network, accounts) {
  const initialRate = (1/30000000000000000)
  const finalRate = 1

  deployer.deploy(DedcoinCrowdsale, initialRate, finalRate)
};
