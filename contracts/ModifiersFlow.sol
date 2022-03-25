// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.13 <0.9.0;

/**
 * Modifiers Flow
 *
 * @see InheritanceFlow for more abstraction with Inheritance
 */
contract ModifiersFlow {

    /**
     * owner storage
     */
    address _owner;

    /**
     * balance stoage
     */    
    uint _balance = 5; 


    /**
     * contractor set the owner
     */    
    constructor() public {
        _owenr = msg.sender;
    }

    /**
     * owner access modifier 
     */
    modifier onlyOwner() public {
        // require to be owner
        require(msg.sender == _owner, "only owner can take the action");
        _; // trigger the modified function
    }


    /**
     * owner access modifier 
     */
    modifier minBalance(uint256 amount) public {
        // require some balance to grather than x
        require(_balance >= amount, "balance must be above the amount");
        _; // trigger the modified function
    }


    /**
     * modify the "admin action" with onlyOwner
     * so that only the owner will be able to take the action
     */    
    function adminAction() public onlyOwner {
        // do somrhting that runs after the required check in modifier onlyOwner() ...
    }


    /**
     * modify the "function with onlyOwner
     * so that only the owner will be able to take the action
     */    
    function sendAmount(uint256 amount) public minBalance(amount){
        // do somrhting that runs after the required check in modifier onlyOwner() ...
    }

}
