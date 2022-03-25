// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.13 <0.9.0; // !!! handler version just for local vscode

/**
 * ExceptionsFlow
 *
 * - errors are "state reverting"
 * - require, assert, revert
 * - caching is not possoble within solidity
 * - revert() and require() can return an error string
 * - revert() and require() revert the transaction
 * - revert() and require() are pretty much the same
 * - require() reverting the operation & return the remaining gas to the caller
 * - require() used to validate user input
 * - assert() used to validated invariants - contract's values
 * - best pratice is tm avoid assert(), use it only in specific cases which should betrated as exceptions
 */
contract ExceptionsFlow {
    /**
     * Gate with REQUIRED condition
     */
    function requiredGate(uint256 handler) public returns (uint256) {
        // require condition
        require(handler > 2, "handler must be grather than 2");
        // do somrhting...
        return handler;
    }

    /**
     * Gate with REVERT condition
     */
    function revertGate(uint256 handler) public returns (uint256) {
        // require condition
        if (handler < 2) {
            revert("handler must be grather than 2");
        }
        // do somrhting...
        return handler;
    }

    /**
     * Gate with ASSEERT condition
     */
    function asssertionGate(uint256 handler) public returns (uint256) {
        // value must be grather than 1
        require(handler > 1, "value must be grather than 1");

        // howevenr, the value can't be exacly 5
        assert(handler != 5);

        // do somrhting...
        return handler;
    }
}
