pragma solidity ^0.5.0;

import "./interfaces/RegulatorI.sol";
import "./interfaces/RegulatedI.sol";

contract Regulated is RegulatedI{

    address internal regulator;

    event LogRegulatorSet(address indexed previousRegulator, address indexed newRegulator);

    modifier fromRegulator(){require(msg.sender == regulator); _;}

    constructor(address initialRegulator) public{
      //  require(initialRegulator > 0);
      regulator = initialRegulator;
    }

    function setRegulator(address newRegulator) fromRegulator public returns(bool success) {
      //require(newRegulator != 0);
      require(newRegulator != regulator);
      emit LogRegulatorSet(regulator, newRegulator);
      regulator = newRegulator;
      return true;
    }

    function getRegulator() view public returns(RegulatorI currentRegulator){
      return RegulatorI(regulator);
    }
}
