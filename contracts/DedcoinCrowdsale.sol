pragma solidity ^0.4.18;

import './Dedcoin.sol';
import './DecreasingPriceCrowdsale.sol';


contract DedcoinCrowdsale is DecreasingPriceCrowdsale {

  function DedcoinCrowdsale(uint256 _initialRate, uint256 _finalRate, uint256 _openingTime, uint256 _closingTime)
    DecreasingPriceCrowdsale(_initialRate, _finalRate)
    TimedCrowdsale(_openingTime, _closingTime) {
  }

  // creates the token to be sold.
  // override this method to have crowdsale of a specific MintableToken token.
  function createTokenContract() internal returns (MintableToken) {
    return new Dedcoin();
  }

}
