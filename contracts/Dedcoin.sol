pragma solidity ^0.4.18;
import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";

contract Dedcoin is MintableToken {
  string public name = "Dedcoin";
  string public symbol = "DED";
  uint8 public decimals = 18;
}
