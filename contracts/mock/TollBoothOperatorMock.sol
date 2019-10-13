pragma solidity ^0.5.0;

import { TollBoothOperator } from "../TollBoothOperator.sol";

contract TollBoothOperatorMock is TollBoothOperator {

    constructor(bool paused, uint depositWeis, address regulator)
    	TollBoothOperator(paused, depositWeis, regulator)
    	public {
    }
}