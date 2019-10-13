pragma solidity ^0.5.0;

import "../Owned.sol";
import "../TollBoothHolder.sol";
import "../RoutePriceHolder.sol";

contract RoutePriceHolderMock is TollBoothHolder, RoutePriceHolder {

    constructor() public{
    }
}