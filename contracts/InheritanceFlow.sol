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
 * - can inherit behavior of other contracts using the keyword "is" (like extends or traits in OOP) 
 * - contract can inherit few contracts : InheritanceFlow is A,B,C 
 * - if is A,B,C  has the same methods names, the last one, C overrides the others
 * - inherit contracts deployed as single contract, not separate one
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


/* ------------------------------------------------------

// The super keyword in Solidity gives access to the immediate parent contract from which 
// the current contract is derived. When having 
// a contract A with a function f() that derives from B which also has a function f(), 
// A overrides the f of B. That means that myInstanceOfA.f() will call the version of f that 
// is implemented inside A itself, the original version implemented inside B is not visible anymore. 
// The original function f from B (being A's parent) is thus available inside A via super.f(). 
// Alternatively, one can explicitly specifying the parent of which one wants to call the overridden function 
// because multiple overriding steps are possible as exemplified in the example below:

contract C {
  uint u;
  function f() {
    u = 1;
  }
}

contract B is C {
  function f() {
    u = 2;
  }
}

contract A is B {
  function f() {  // will set u to 3
    u = 3;
  }
  function f1() { // will set u to 2
    super.f();
  }
  function f2() { // will set u to 2
    B.f();
  }
  function f3() { // will set u to 1
    C.f();
  }
}
/* --------------------------------------------------- */