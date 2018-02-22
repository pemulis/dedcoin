var Dedcoin = artifacts.require("./Dedcoin.sol");

module.exports = function(deployer) {
  deployer.deploy(Dedcoin);
};
