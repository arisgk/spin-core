pragma solidity ^0.4.0;

import "../../node_modules/zeppelin-solidity/contracts/token/StandardToken.sol";


contract Spincoin is StandardToken {
    string public name = "Spincoin";
    string public symbol = "SPN";
    uint256 public decimals = 18;

    function Spincoin(uint256 _initialSupply) {
        totalSupply = _initialSupply;
        balances[msg.sender] = _initialSupply;
    }
}
