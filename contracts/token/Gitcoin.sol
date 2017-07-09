pragma solidity ^0.4.0;

import "node_modules/zeppelin-solidity/contracts/token/StandardToken.sol";


contract Gitcoin is StandardToken {
    string public name = "Gitcoin";
    string public symbol = "GTC";
    uint256 public decimals = 18;
    uint256 public INITIAL_SUPPLY = 10000;

    function Gitcoin() {
        totalSupply = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }
}
