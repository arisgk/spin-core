pragma solidity ^0.4.0;

import "node_modules/zeppelin-solidity/contracts/ownsership/Ownable.sol";
import "node_modules/zeppelin-solidity/contracts/token/StandardToken.sol";


contract Repository is Ownable(msg.sender) {
    uint256 public price;
    mapping (address => bool) purchased;
    StandardToken token;

    function Repository(address _tokenAddress, uint256 _balance, uint256 _price) {
        token = StandardToken(_tokenAddress);
        price = _price;
    }

    function setPrice(uint _price) onlyOwner {
        price = _price;
    }

    function purchase() {
        token.transferFrom(msg.sender, this, price);
        purchased[msg.sender] = true;
    }

    function pay(address _address, uint256 _value) onlyOwner {
        token.approve(_address, _value);
        token.transferFrom(this, _address, _value);
    }

    function deposit(uint256 _value) onlyOwner {
        token.transferFrom(msg.sender, this, _value);
    }

    function() {
        throw;
    }
}
