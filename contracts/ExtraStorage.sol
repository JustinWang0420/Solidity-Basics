// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.8;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    // Add 5 to every favouriteNumber 
    // virtual // override
    function store(uint256 _favoriteNumber) public override {
        favouriteNumber = _favoriteNumber + 5;
    }
}