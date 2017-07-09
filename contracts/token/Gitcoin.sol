pragma solidity ^0.4.0;

import "node_modules/zeppelin-solidity/contracts/token/StandardToken.sol";


contract Gitcoin is StandardToken {
    string public name = "Gitcoin";
    string public symbol = "GTC";
    uint256 public decimals = 18;

    function Gitcoin(uint256 _initialSupply) {
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }
}
