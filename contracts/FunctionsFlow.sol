// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.13 <0.9.0; // !!! handler version just for local vscode

/**
 * Functions Flow
 *
 * -
 * -
 * -
 * -
 */
contract FunctionsFlow {
    /**
     * Deposit founds
     */
    mapping(address => uint256) public _balanceReceived;

    address payable _owner;

    /**
     * the constructor will be called only once on deploy
     * adter that the construct won't be called again
     * therefore, logic such as defining the owner will run only once in the life of the contract
     */
    constructor() public {
        _owner = msg.sender;
    }

    /**
     * View function
     *
     * a view function interact with a storage-variables (contract's properties)
     * but simply return the properties to view them without other operations like updates
     */
    function getContractOwner() public view returns (address) {
        return _owner;
    }

    /**
     * Pure function
     *
     * it is a function that does not interact with a storage-variables (contract's properties)
     * it is used only for simple logical ops etc
     */
    function convertWeiToEther(uint256 amountInWei)
        public
        pure
        returns (uint256)
    {
        // the ether keyword returns the value of eather with dec 1 000 000 000 000 000 000 // 18 0
        return amountInWei / 1 ether;
    }

    /**
     * Deposit founds
     */
    function destroySmartContract() public {
        require(msg.sender == owner, "action can be taken only be the owner");
        selfdestruct(msg.sender);
    }

    /**
     * Deposit founds
     */
    function depositFunds() public {
        _balanceReceived[msg.sender] += msg.value;
    }

    /**
     * Fallback function
     *
     * used as default function when someone send funds to the contract,
     * wihout calling specific function (via some other apps, etc)
     */
    function() external payable {
        depositFunds();
    }
}
