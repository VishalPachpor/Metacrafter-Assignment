// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//This is the contract's metadata, which includes the SPDX license identifier and the Solidity version required to compile the contract.


contract SimpleStorage {

    //This is the contract's name, SimpleStorage, and it's declared as a Solidity contract. 
    // A contract is a collection of functions and data that reside at a specific address on the Ethereum network. 
    // In this case, the contract has a single variable and two functions.

    uint256 private _storedData;
    // This is the contract's only variable, _storedData, which is a uint256 data type. 
    // It's declared as private, which means it can only be accessed by functions within the contract. 
    

    function set(uint256 value) public {
        _storedData = value;
    }
    //This is the contract's set function, which takes a uint256 parameter named value and sets _storedData to that value. 
    // The function is declared as public, which means it can be called by anyone on the Ethereum network.


    function get() public view returns (uint256) {
        return _storedData;
    }

    // This is the contract's get function, which returns the current value of _storedData. The function is also declared as public, but with the additional keyword view. 
    // This means that the function does not modify any state variables in the contract, and can be called without incurring any gas costs.
    // The function returns a uint256 value.

    

}
