pragma solidity ^0.5.0;

/**
 * Eventer contract
 */
contract Eventer {
    
    // decler trade events
    // indexed allows the consumer to filter the info in more affiecent way
    // max indexed per event
    // the indexed keyword relevant only to events
    event NewTrade(
        uint256 indexed date, 
        address from, 
        address to, 
        uint256 amount
    );

    function trade(address payable to, uint256 amount) external {
        // emit the event
        emit NewTrade(
            uint indexed block.timestamp, // use global var block
            to, 
            amount
        );
    }
}
