// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Identities {

  struct Profile {
    string fullName; 
    string email;
    string[] socialAccounts;  
    bytes encryptedPersonalData;
  }

  mapping(address => Profile) public profiles;

  function register(string calldata name, string calldata email, string[] calldata socialAccounts, bytes calldata encryptedData) external {
    profiles[msg.sender] = Profile(name, email, socialAccounts, encryptedData);
  }

}