// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.13 <0.9.0; // !!! handler version just for local vscode

/**
 * ExceptionsFlow
 */
contract ExceptionsFlow {
    /**
     * Gate with required condition
     */
    function requiredGate() public view returns (uint256) {
        require(1 > 2, "1 must be grather 2, otherwise the action will stop");
        // do somrhting...
        return 1;
    }

    /**
     * Gate with assertion condition
     */
    function asssertionGate(uint256 handler) public view returns (uint256) {
        // value must be grather than 1
        require(handler > 1, "value must be grather 1");

        // howevenr, the value can't be exacly 5
        assert(handler != 5);

        // do somrhting...
        return handler;
    }
}
