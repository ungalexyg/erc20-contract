// SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.7.0 <0.9.0; // <<< correct version
pragma solidity >=0.5.13 <0.9.0; // !!! handler version just for local vscode

/**
 * MappingFlow
 */
contract MappingFlow {
    /**
     * define mapping
     * mapping helps to store contract's data in a array-like stracture
     * mapping are endless and they don't have a "length"̀, arrays do have "length"̀
     * if you need to define mapping length, you can do so with a separete value
     * arrays have .length() & .push()
     */
    mapping(uint256 => bool) _myIndexMapping; //mark confirmed index for some logic (bool is false by default)
    mapping(address => bool) _myAddressWhitelist; //mark confirmed addresses for some logic (bool is false by default)
    mapping(address => mapping(address => uint256)) _companySalaryAllocations; // mappings cab be nested (company => (employee => salary))

    /**
     * Mark indexes
     */
    function markIndex(uint256 _index) public {
        // _myMappingIndex updated and the true will be stored in the contract's data for future reference
        _myIndexMapping[_index] = true;
    }

    /**
     * "Add address to whitelist"
     */
    function whitelistAddress(address someAddress) public {
        _myAddressWhitelist[someAddress] = true;
    }

    /**
     * Company pays employess salaray allocations
     */
    function allocatedCompanySalaries(
        address employeeAddress,
        uint256 allocatedSalary
    ) public {
        // e.g msg.sender is the company's account
        _companySalaryAllocations[msg.sender][
            employeeAddress
        ] = allocatedSalary;
    }
}
