// SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.7.0 <0.9.0; // <<< correct version
pragma solidity >=0.5.13 <0.9.0; // !!! handler version just for local vscode

/**
 * contract defines as object prefixed with the "contract' keyword as classes
 * each contract get an address, the address functions in a similiar way to "routes",
 * and the actual contract class is like a "controller" with embeded functionality to the blockchain
 */
contract BasicDataStorage {
    /*
     * Contract properties
     *
     * each contract can hold properties
     * props should be defined with <propType> <propVar>
     * props are private by defualt, they should be defined as public for extrnal usage
     */
    uint256 storeData = 23; // "uint" is unsigned int
    string names = "tom";
    bool switchON = true;
    uint256 public balanceReceived;

    /*
     * Private functions
     *
     * functions defined with the keyword "function" and the name of the function as in other langs
     * the access level defined after the arguments
     * functions can be private or public
     */
    function setStoreData(uint256 x) private {
        // assigned values to pre-defined properties will be stored
        // and can be accessed in other functions
        storeData = x;
    }

    /* 
        Public+View functions
    
        * Functions that returns values should be declared with the return and the type    
        * View functions ensure that they will not modify the state. 
          A function can be declared as view (after the access level: public view)
          The following statements if present in the function are considered modifying the state and compiler will throw warning in such cases.
        *- Modifying state variables.
        *- Emitting events.
        *- Creating other contracts.
        *- Using selfdestruct.
        *- Sending Ether via calls.
        *- Calling any function which is not marked view or pure.
        *- Using low-level calls.
        *- Using inline assembly containing certain opcodes    
    */
    function getStoredData() public view returns (uint256) {
        return storeData;
    }
}
