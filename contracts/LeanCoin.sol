// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * The contract allows only its creator to create new coins (different issuance schemas are possible)
 * Anyone can send coins to each other without a need for registering with a username or password
 * all you need is an Ethereum keypair
 */
contract LeanCoin {
    /**
     * define props
     */
    address public minter; //set the minter = the coin creator
    mapping(address => uint256) public balances; //

    /**
     * define events
     */
    event Sent(address from, address to, uint256 amount);

    /**
     * define erros (like exception classes)
     */
    error insufficientBalance(uint256 requested, uint256 available);

    /**
     * set the sender as the minter
     */
    constructor() {
        minter = msg.sender;
    }

    /**
     * make new coins and send them to an address
     * only the owner can send these coins
     */
    function mint(address receiver, uint256 amount) public {
        // check that the address that tryibng to take the actions comes from the owner - the minter
        require(msg.sender == minter);

        // then increae the balance record for the receiver
        balances[receiver] += amount;
    }

    /**
     * send any amount of coins to an existing address
     */
    function send(address receiver, uint256 amount) public {
        // use revert() to undo all state changes, will refund any remaining gas to the caller
        // let the revert use the pre-defioned insufficientBalance error with relevant info
        if (amount > balances[msg.sender]) {
            revert insufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        }

        // reduce from the sender
        balances[msg.sender] -= amount;
        // increment to the receiver
        balances[receiver] += amount;

        // trigger the Sent event
        emit Sent(msg.sender, receiver, amount);
    }
}
