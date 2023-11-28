// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Documents {

    struct File {
        string name;
        string ipfsHash; 
        address[] editors;  
    }

    mapping(uint => File) public files;
    
    uint public fileCount;

    function addFile(string calldata name, string calldata ipfsHash) external {
        files[fileCount] = File(name, ipfsHash, new address[](0));
        fileCount++;
    }
}