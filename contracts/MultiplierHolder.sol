pragma solidity ^0.5.0;

import "./Owned.sol";
import "./interfaces/MultiplierHolderI.sol";

contract MultiplierHolder is MultiplierHolderI,Owned {

    mapping(uint => uint) internal multipliers;

    event LogMultiplierSet(address indexed sender, uint indexed vehicleType, uint multiplier);

    constructor() public{

    }

    function setMultiplier(uint vehicleType, uint multiplier) fromOwner public returns(bool success) {
      require(vehicleType != 0);
      require(multipliers[vehicleType] != multiplier);
      multipliers[vehicleType] = multiplier;
      emit LogMultiplierSet(msg.sender, vehicleType, multiplier);
      return true;
    }

    function getMultiplier(uint vehicleType) view public returns(uint multiplier){
      return multipliers[vehicleType];
    }
}
