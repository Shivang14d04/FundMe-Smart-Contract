ap// get funds from users
// set a minimum funding value
// withdraw funds

// SPDX-License-Identifier:MIT
pragma solidity^0.8.20;

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

        // allow users to send $
        //have a minimum $ spend
        // how do we send ethereum to this contract?
        require(msg.value.getConversionRate() >= MIN_USD , " didn't send enough eth");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;


    }
    function withdraw() public onlyOwner{

        // require(msg.sender== owner , "must be owner");


        for(uint256 funderIndex = 0 ;funderIndex<funders.length;funderIndex++){
            address funder  = funders[funderIndex];
            addressToAmountFunded[funder] =0;
        }
        funders  =new address[](0);

        // actually withdraw the funds
        // transfer
        // payable(msg.sender).transfer(address(this).balance);

        //send
        // bool sendSuccess = payable (msg.sender).send(address(this).balance);
        // require(sendSuccess , "send failed");

        //call
        (bool callSuccess,)  = payable (msg.sender).call{value: address(this).balance}("");
        require(callSuccess , "call failed");

    }


    modifier onlyOwner (){
        // require(msg.sender==i_owner,"must be owner");
        if(msg.sender!=i_owner){
            revert notOwner();
        }

        _;

    }



    
}
