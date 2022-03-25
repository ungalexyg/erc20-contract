// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.13 <0.9.0; // !!! handler version just for local vscode

/**
 * Events Flow
 *
 * - events used to inform that something happend on the blockchain
 * - when sending return value from functions it isn't returned to the user (returned only in dev networs)
 * - events help to output the value in any network
 * - events send the triggered values to the chain scan (visible in eathersacn etc)
 * - event's args can be indexed for searchability in chain scan
 * - up to 3 indexes per event
 * - can be used for retuen values
 * - can be used as triggers for external functions
 * - events can be used to trigger external storage to store contract's related data (strings, etc)
 * - since stroing data directly on chain via smart contract props is pricey. events are cheap
 */
contract EventsFlow {
    /**
     * balance mapping
     */
    mapping(address => uint256) public _tokenBalance;

    /**
     * define events
     */
    event ToeknSent(address indexed to, uint256 amount);

    /**
     * Send token
     */
    function sendToken(address to, uint256 amount) public returns (bool) {
        // gate
        require(_tokenBalance[msg.sender] >= amount, "amount < balance");

        // assertions
        assert(_tokenBalance[to] + amount >= _tokenBalance[to]);
        assert(_tokenBalance[msg.sender] - amount <= _tokenBalance[msg.sender]);

        // update balances
        _tokenBalance[msg.sender] -= amount;
        _tokenBalance[to] += amount;

        // trigger the predefined event
        emit ToeknSent(to, amount);

        return true;
    }
}
