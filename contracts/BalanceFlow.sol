// SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.7.0 <0.9.0; // <<< correct version
pragma solidity >=0.5.13 <0.9.0; // !!! handler version just for local vscode

/**
 * contract defines as object prefixed with the "contract' keyword as classes
 * each contract get an address, the address functions in a similiar way to "routes",
 * and the actual contract class is like a "controller" with embeded functionality to the blockchain
 */
contract BalanceFlow {
    /*
     * prep balance storage
     * when props updated, it will be stored on the contract
     * and it will be available for interactions during the next contract calls
     */
    // better not define it as p[ublic, instead just return it from the getBalance()
    // however, here it defined as public to allow direct access
    // for the demo, to compare it with the getBalance()
    uint256 public balanceReceived;

    /**
     * Send money to the contract's balance
     * any function in Solidity with the modifier Payable ensures that the function can send and receive Ether.
     * it is required when values that reprresent money sent in, and going to be stored on contract's varaibles
     */
    function sendMoney() public payable {
        //msg global object avauilble everywhere in the contract up on request
        balanceReceived += msg.value; // now the balanceReceived will store the value in the contract and will be avaible in next request
    }

    /**
     * Get the current contrac's balance
     * display it in public up on request
     */
    function getBalance() public view returns (uint256) {
        // the contract's address available when using the casting address(this)
        // which returns the address object that has the balance property
        // balanceReceived
        return address(this).balance;
    }

    /**
     * Withdrwal from the contract's balance to the sender address
     * unlike in sendMoney(), this function shouldn't be defined as payable since there is no incoming payment oprations
     * it is only transferring contract's balance to the current contract's caller
     */
    function withdrwalMoney() public {
        // define the aender as payable before taking payment operation
        // address objects cab casted as payable payable(msg.sender);
        address payable to = payable(msg.sender);
        to.transfer(this.getBalance());
    }
}
