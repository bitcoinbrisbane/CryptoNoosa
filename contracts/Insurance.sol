pragma solidity ^0.5.0;

contract Insurance {

    struct Member {
        uint256 joined;
        uint256 balance;
    }

    mapping(address => Member) private members;


    
}