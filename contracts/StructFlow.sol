// SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.7.0 <0.9.0; // <<< correct version
pragma solidity >=0.5.13 <0.9.0; // !!! handler version just for local vscode

/**
 * StructFlow
 */
contract StructFlow {
    /**
     * define structs
     * structs are like objects that can be used as an interface that represent an entity
     */
    struct Payment {
        uint256 amount;
        uint256 timestamp;
    }
    struct Balance {
        uint256 totalBalance;
        uint256 paymentsCounter;
        // strcut can hold mappings as well, which can point to other structs
        mapping(uint256 => Payment) payments;
    }

    mapping(address => Balance) public _balancesReceived;

    /**
     * Get contract's balance
     */
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    /**
     * Sender add funds to his balance
     */
    function addFunds() public payable {
        _balancesReceived[msg.sender].totalBalance += msg.value;

        // define Payment instance with current values
        // now = returns current timestamp
        // memory used since this strcut is tempo handler that won't be in use in other functions, its going to be stored in _balancesReceived
        Payment memory payment = Payment(msg.value, now);

        // prep the balance's paymentsCounter to use it as payment id
        uint256 paymentId = _balancesReceived[msg.sender].paymentsCounter;

        // store the payment info in _balancesReceived
        _balancesReceived[msg.sender].payments[paymentId] = payment;

        // increment the "payment id" for next deposit
        _balancesReceived[msg.sender].paymentsCounter++;
    }
}
