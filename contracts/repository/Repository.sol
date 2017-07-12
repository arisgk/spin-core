pragma solidity ^0.4.0;

import "../../node_modules/zeppelin-solidity/contracts/ownership/Ownable.sol";
import "../../node_modules/zeppelin-solidity/contracts/token/StandardToken.sol";


contract Repository is Ownable {
    uint256 public price;
    mapping (address => bool) purchased;
    StandardToken token;

    function Repository(address _tokenAddress, uint256 _price) {
        token = StandardToken(_tokenAddress);
        price = _price;
    }

    function setPrice(uint _price) onlyOwner {
        price = _price;
    }

    function purchase() payable {
        token.transferFrom(msg.sender, this, price);
        purchased[msg.sender] = true;
    }

    // Approve contracts so that they can use transferFrom to withdraw
    function approvePaymentToContract(address _address, uint256 _value) payable onlyOwner {
        token.approve(_address, _value);
    }

    // Must only be used with externally owned accounts
    function payEOA(address _address, uint256 _value) payable onlyOwner {
        token.transfer(_address, _value);
    }

    function deposit(uint256 _value) payable onlyOwner {
        token.transferFrom(msg.sender, this, _value);
    }

    function() {
        throw;
    }
}
