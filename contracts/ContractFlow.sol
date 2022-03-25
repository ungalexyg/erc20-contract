// SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.7.0 <0.9.0; // <<< correct version
pragma solidity >=0.5.13 <0.9.0; // !!! handler version just for local vscode

/**
 * contract defines as object prefixed with the "contract' keyword as classes
 * each contract get an address, the address functions in a similiar way to "routes",
 * and the actual contract class is like a "controller" with embeded functionality to the blockchain
 */
contract ContractFlow {
    /**
     * prep balance storage
     * when props updated, it will be stored on the contract
     * and it will be available for interactions during the next contract calls
     *
     * better not define the balance as public, instead just return it from the getBalance()
     * however, here it defined as public to allow direct access
     * for the demo, to compare it with the getBalance()
     */
    uint256 public _balanceReceived; // marked with _ as hint for contract's storage

    /**
     * the contract's owner address typically stored in a variable called "owner"
     * it can be stored when assigning the address to the variable
     */
    address _owner;

    /**
     * to keep the busines logic safe, the contract should hold a single owner
     * the owner assignment can be performed in the onctract's constructor
     * which run only once on deploy
     */
    constructor() public {
        _owner = msg.sender;
    }

    /**
     * Display contract's owner
     * add the view modielfir when the function simply returns values simply from read operations
     */
    function getOwnerAddress() public view returns (address owner) {
        return _owner;
    }

    /**
     * Send money to the contract's balance
     * any function in Solidity with the modifier Payable ensures that the function can send and receive Ether.
     * it is required when values that reprresent money sent in, and going to be stored on contract's varaibles
     */
    function sendMoneyToContract() public payable {
        //msg global object avauilble everywhere in the contract up on request
        _balanceReceived += msg.value; // now the balanceReceived will store the value in the contract and will be avaible in next request
    }

    /**
     * Get the current contrac's balance
     * display it in public up on request
     */
    function getContractBalance() public view returns (uint256) {
        // the contract's address available when using the casting address(this)
        // which returns the address object that has the balance property
        // _balanceReceived
        return address(this).balance;
    }

    /**
     * Withdrwal from the contract's balance to the sender address
     * unlike in sendMoney(), this function shouldn't be defined as payable since there is no incoming payment oprations
     * it is only transferring contract's balance to the current contract's caller
     */
    function withdrwalAmountToSender(uint256 amount) public {
        // gate - make sure that the balance has the requested amount
        require(amount > this.getContractBalance());

        // cascade the sender as payable before taking payment operation
        address payable to = payable(msg.sender);

        // use the build in payable.transfer() method to send the amount to the address
        to.transfer(amount);

        // decrease the amount from the balance
        _balanceReceived -= amount;
    }

    /**
     * Withdrwal from the contract's balance to a given address
     * in this canse since the address came from input, it should be defined as payable
     */
    function withdrwalAmountToAddress(address payable to, uint256 amount)
        public
    {
        // gate - make sure that the balance has the requested amount
        require(amount > this.getContractBalance());

        // use the build in payable.transfer() method to send the amount to the address
        to.transfer(amount);

        // decrease the amount from the balance
        _balanceReceived -= amount;
    }

    /**
     * Withdrwal from the contract's balance to the owner's address
     */
    function withdrwalFullBalanceToOwner() public {
        // gate - check if the caller is the owner
        require(msg.sender == _owner, "only the owner can take this action");

        // send all the balance to the sender
        payable(msg.sender).transfer(this.getContractBalance());

        // reset the balance to 0
        _balanceReceived = 0;
    }

    /**
     * Destroy the contract
     */
    function destorySmartContract() public {
        // gate - check if the caller is the owner
        require(msg.sender == _owner, "only the owner can take this action");

        // selfdestruct() is a built in method
        // which destruct the contruct and send the left balance funds to the given address
        selfdestruct(msg.sender);
    }
}
