// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Reputation {

  struct Rating {
      address from;
      uint8 value;  
  }

  mapping(address => Rating[]) public ratings;

  function rateUser(address user, uint8 score) external {
     ratings[user].push(Rating(msg.sender, score));
  }

}