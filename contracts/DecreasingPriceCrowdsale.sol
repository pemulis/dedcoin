pragma solidity ^0.4.18;

import "zeppelin-solidity/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "zeppelin-solidity/contracts/math/SafeMath.sol";

/**
 * @title DecreasingPriceCrowdsale
 * @dev Extension of Crowdsale contract that decreases the price of tokens linearly in time.
 * Note that what should be provided to the constructor is the initial and final _rates_, that is,
 * the amount of tokens per wei contributed. Thus, the initial rate must be lower than the final rate.
 */
contract DecreasingPriceCrowdsale is TimedCrowdsale {
  using SafeMath for uint256;

  uint256 public initialRate;
  uint256 public finalRate;

  /**
   * @dev Constructor, takes intial and final rates of tokens received per wei contributed.
   * @param _initialRate Number of tokens a buyer gets per wei at the start of the crowdsale
   * @param _finalRate Number of tokens a buyer gets per wei at the end of the crowdsale
   */
  function DecreasingPriceCrowdsale(uint256 _initialRate, uint256 _finalRate) public {
    require(_initialRate <= _finalRate);
    initialRate = _initialRate;
    finalRate = _finalRate;
  }

  /**
   * @dev Returns the rate of tokens per wei at the present time.
   * Note that, as price _decreases_ with time, the rate _increases_.
   * @return The number of tokens a buyer gets per wei at a given time
   */
  function getCurrentRate() public view returns (uint256) {
    uint256 elapsedTime = now.sub(openingTime);
    uint256 timeRange = closingTime.sub(openingTime);
    uint256 rateRange = finalRate.sub(initialRate);
    return finalRate.sub(elapsedTime.mul(rateRange).div(timeRange));
  }

  /**
   * @dev Overrides parent method taking into account variable rate.
   * @param _weiAmount The value in wei to be converted into tokens
   * @return The number of tokens _weiAmount wei will buy at present time
   */
  function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256) {
    uint256 currentRate = getCurrentRate();
    return currentRate.mul(_weiAmount);
  }

}
