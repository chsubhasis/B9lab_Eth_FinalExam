pragma solidity ^0.5.0;

import "./Owned.sol";
import "./interfaces/DepositHolderI.sol";

contract DepositHolder is DepositHolderI,Owned {

    uint internal depositValue;

    event LogDepositSet(address indexed sender, uint depositWeis);

    constructor(uint depositWeis) public{
      require(depositWeis > 0);
      depositValue = depositWeis;
    }

    function setDeposit(uint depositWeis) fromOwner public returns(bool success) {
      require(depositWeis > 0);
      require(depositWeis != depositValue);
      emit LogDepositSet(msg.sender, depositWeis);
      depositValue = depositWeis;
      return true;
    }

    function getDeposit() view public returns(uint weis){
      return depositValue;
    }

}
