pragma solidity ^0.5.0;

import "./Owned.sol";
import "./interfaces/TollBoothHolderI.sol";

contract TollBoothHolder is TollBoothHolderI,Owned {

    mapping(address => bool) internal tollBoothExists;

    event LogTollBoothAdded(address indexed sender, address indexed tollBooth);
    event LogTollBoothRemoved(address indexed sender, address indexed tollBooth);

    constructor() public{

    }

    function addTollBooth(address tollBooth) fromOwner public returns(bool success){
      require(!tollBoothExists[tollBooth]);
      //require(tollBooth != 0);
      tollBoothExists[tollBooth] = true;
      emit LogTollBoothAdded(msg.sender, tollBooth);
      return true;
    }

    function isTollBooth(address tollBooth) view public returns(bool isIndeed){
      return tollBoothExists[tollBooth];
    }

    function removeTollBooth(address tollBooth) fromOwner public returns(bool success){
      require(tollBoothExists[tollBooth]);
      //require(tollBooth != 0);
      tollBoothExists[tollBooth] = false;
      emit LogTollBoothRemoved(msg.sender, tollBooth);
      return true;
    }
}
