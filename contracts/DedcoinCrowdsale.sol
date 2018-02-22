pragma solidity ^0.4.18;

import './Dedcoin.sol';
import './DecreasingPriceCrowdsale.sol';


contract DedcoinCrowdsale is DecreasingPriceCrowdsale {

  function DedcoinCrowdsale(uint256 _initialRate, uint256 _finalRate, uint256 _openingTime, uint256 _closingTime, uint256 _rate, address _wallet, MintableToken _token)
    DecreasingPriceCrowdsale(_initialRate, _finalRate)
    TimedCrowdsale(_openingTime, _closingTime)
    Crowdsale(_rate, _wallet, _token) {
  }

  // creates the token to be sold.
  // override this method to have crowdsale of a specific MintableToken token.
  function createTokenContract() internal returns (MintableToken) {
    return new Dedcoin();
  }

}
