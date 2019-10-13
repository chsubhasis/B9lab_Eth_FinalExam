pragma solidity ^0.5.0;

import "./interfaces/RoutePriceHolderI.sol";
import "./TollBoothHolder.sol";

contract RoutePriceHolder is RoutePriceHolderI, TollBoothHolder{

    mapping(bytes32 => uint) internal routePrices;

    event LogRoutePriceSet(address indexed sender, address indexed entryBooth, address indexed exitBooth, uint priceWeis);

    constructor() public{

    }

    function setRoutePrice(address entryBooth, address exitBooth, uint priceWeis) fromOwner public returns(bool success) {
      require(isTollBooth(entryBooth));
      require(isTollBooth(exitBooth));
      require(entryBooth != exitBooth);
      //require(entryBooth != 0);
      //require(exitBooth != 0);
      bytes32 pathHash = keccak256(abi.encodePacked(entryBooth, exitBooth));
      require(routePrices[pathHash] != priceWeis);
      routePrices[pathHash] = priceWeis;
      emit LogRoutePriceSet(msg.sender, entryBooth, exitBooth, priceWeis);
      return true;
    }

    function getRoutePrice(address entryBooth, address exitBooth) view public returns(uint priceWeis){
      return routePrices[keccak256(abi.encodePacked(entryBooth, exitBooth))];
    }
}
