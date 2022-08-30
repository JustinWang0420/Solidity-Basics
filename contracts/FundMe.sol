//Get Funds From Users
//Withdraw Funds
//Set a minimum funding value in USD



// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimumUsd = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable{
        //Want to be able to set minimum fund amount in USD
        // 1. How do we send ETH to this contract

        require( msg.value.getConversionRate() >= minimumUsd, "Didn't send enough!"); // 1e18 = 1*10 ** 18 == 1000000000000000000 
        // this has 18 decimals

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function Withdraw() public{
        /* starting Index, ending index, step amount */
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        //reset the array
        funders = new address[] (0);

/*        // withdrawing the funds (#WAYS)
        // 1. Transfer (capped at 2300 gas, throws error)

        //msg.sender = address     // payable(msg.sender) = payable address
        payable(msg.sender).transfer(address(this).balance);

        // 2. Send (capped at 2300 gas, returns bool)
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send Failed!");
*/

        // 3. Call (forward all gas or set gas, returns bool)
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed!");
    }
}