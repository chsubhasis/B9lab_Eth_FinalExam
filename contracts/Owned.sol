pragma solidity ^0.5.0;

import "./interfaces/OwnedI.sol";

contract Owned is OwnedI {

    address internal contractOwner;

    event LogOwnerSet(address indexed previousOwner, address indexed newOwner);

    modifier fromOwner{require(msg.sender == contractOwner); _;}

    constructor() public{
      contractOwner = msg.sender;
    }

    function setOwner(address newOwner) fromOwner public returns(bool success) {
      require(newOwner != contractOwner);
      //require(newOwner != 0);
      emit LogOwnerSet(contractOwner, newOwner);
      contractOwner = newOwner;
      return true;
    }

    function getOwner() view public returns(address owner) {
      return contractOwner;
    }
}
