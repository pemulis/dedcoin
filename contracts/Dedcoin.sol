pragma solidity ^0.4.18;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract Dedcoin is StandardToken {
  string public name = "Dedcoin";
  string public symbol = "DED";
  uint public decimals = 2;
  uint public INITIAL_SUPPLY = 10000000000 * (10 ** decimals);

  function Dedcoin() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}
