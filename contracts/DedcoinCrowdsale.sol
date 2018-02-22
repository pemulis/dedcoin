pragma solidity ^0.4.18;

import './Dedcoin.sol';
import './DecreasingPriceCrowdsale.sol';


contract DedcoinCrowdsale is DecreasingPriceCrowdsale {

  function DedcoinCrowdsale(uint256 _initialRate, uint256 _finalRate)
    DecreasingPriceCrowdsale(_initialRate, _finalRate) {
    // _initialRate = 1/30000000000000000
    // _finalRate = 1
  }

  // creates the token to be sold.
  // override this method to have crowdsale of a specific MintableToken token.
  function createTokenContract() internal returns (MintableToken) {
    return new Dedcoin();
  }

}
