ap// get funds from users
// set a minimum funding value
// withdraw funds

// SPDX-License-Identifier:MIT
// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.25;

import {priceConvertor} from "./priceConvertor.sol";
error notOwner();


contract fundMe{

    using priceConvertor for uint256;

    address public immutable i_owner;

    uint256 public constant MIN_USD = 5e18;

    address [] public funders;

    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    constructor(){
        i_owner = msg.sender;
    }

    function fund_me()public payable {

        require(msg.value.getConversionRate() >= MIN_USD , " didn't send enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;


    }
    function withdraw() public onlyOwner{


        for(uint256 funderIndex = 0 ;funderIndex<funders.length;funderIndex++){
            address funder  = funders[funderIndex];
            addressToAmountFunded[funder] =0;
        }
        funders  =new address[](0);

        //call
        (bool callSuccess,)  = payable (msg.sender).call{value: address(this).balance}("");
        require(callSuccess , "call failed");

    }


    modifier onlyOwner (){
        if(msg.sender!=i_owner){
            revert notOwner();
        }

        _;

    }



    
}
