pragma solidity ^0.5.0;

import "./Owned.sol";
import "./interfaces/PausableI.sol";

contract Pausable is PausableI, Owned {
    /**
     * Event emitted when a new paused state has been set.
     * @param sender The account that ran the action.
     * @param newPausedState The new, and current, paused state of the contract.
     */
    bool internal paused;

    event LogPausedSet(address indexed sender, bool indexed newPausedState);

    modifier whenPaused(){require(paused); _;}
    modifier whenNotPaused(){require(!paused); _;}

    constructor(bool isPaused) public{
      paused = isPaused;
    }

    function setPaused(bool newState) fromOwner public returns(bool success){
      require(newState != paused);
      paused = newState;
      emit LogPausedSet(msg.sender, newState);
      return true;
    }

    function isPaused() view public returns(bool isIndeed){
      return paused;
    }
}
