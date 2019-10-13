pragma solidity ^0.5.0;

import "./Owned.sol";
import "./interfaces/RegulatorI.sol";
import ".//TollBoothOperator.sol";

contract Regulator is Owned, RegulatorI {

  mapping(address => uint) internal vehicleTypes;
  mapping(address => bool) internal operatorExists;

  event LogVehicleTypeSet(address indexed sender, address indexed vehicle, uint indexed vehicleType);
  event LogTollBoothOperatorCreated(address indexed sender, TollBoothOperator newOperator, address indexed owner, uint depositWeis);
  event LogTollBoothOperatorRemoved(address indexed sender, TollBoothOperator operator);

  constructor() public{
    
  }

  function setVehicleType(address vehicle, uint vehicleType) fromOwner public returns(bool success) {
    require(vehicleTypes[vehicle] != vehicleType);
    //require(vehicle != 0);
    vehicleTypes[vehicle] = vehicleType;
    emit LogVehicleTypeSet(msg.sender, vehicle, vehicleType);
    return true;
  }

  function getVehicleType(address vehicle) view public returns(uint vehicleType){
    return vehicleTypes[vehicle];
  }

  function createNewOperator(address owner, uint deposit) fromOwner public returns(TollBoothOperatorI newOperator) {
    require(owner != contractOwner);
    TollBoothOperator operator = new TollBoothOperator(true, deposit, msg.sender);
    operator.setOwner(owner);
    operatorExists[msg.sender] = true;
    emit LogTollBoothOperatorCreated(msg.sender, operator, owner, deposit);
    
    return operator;
  }

  function removeOperator(address operator) fromOwner public returns(bool success) {
    require(isOperator(operator));
    operatorExists[msg.sender] = false;
    emit LogTollBoothOperatorRemoved(msg.sender, operator);
    return true;
  }

  function isOperator(address operator) view public returns(bool indeed){
    return operatorExists[operator];
  }
}
