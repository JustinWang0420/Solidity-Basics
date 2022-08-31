// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.8;

contract FallbackExample {
    uint256 public result;

    receive() external payable {
        result = 1;
    }

    fallback() external payable {
        result = 2;
    }
}