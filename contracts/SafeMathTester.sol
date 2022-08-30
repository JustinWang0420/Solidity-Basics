// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract SafeMathTester{
    uint8 public bigNumber = 255;

    function add() public {
        bigNumber = bigNumber + 1;
    }
}