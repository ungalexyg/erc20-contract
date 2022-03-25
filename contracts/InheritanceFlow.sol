// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.13 <0.9.0;



/**
 * Contract that gives ownership functionlaity to other contracts
 */
contract Owned {
    /**
     * owner storage
     */
    address _owner;

    /**
     * contractor set the owner
     */    
    constructor() public {
        _owenr = msg.sender;
    }

    modifier onlyOwner() public {
        // require to be owner
        require(msg.sender == _owner, "only owner can take the action");
        _; // trigger the modified function
    }    
}



/**
 * Contract that must be owned 
 * 
 * can inherit behavior of other contracts using the keyword "is" 
 * (like extends or traits in OOP) 
 */
contract InheritanceFlow is Owned {

    /**
     * balance stoage
     */    
    uint _balance = 5; 

    /* ------------------------------------------------------- *
    // # ownership handlers moved to the "Owned" contract 
    // # and now it can be reused in other contracts 
    /* ------------------------------------------------------- *
    // /**
    //  * owner storage
    //  */
    // address _owner;

    // /**
    //  * contractor set the owner
    //  */    
    // constructor() public {
    //     _owenr = msg.sender;
    // }    

    // /**
    //  * owner access modifier 
    //  */
    // modifier onlyOwner() public {
    //     // require to be owner
    //     require(msg.sender == _owner, "only owner can take the action");
    //     _; // trigger the modified function
    // }
    /* ------------------------------------------------------- *


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
