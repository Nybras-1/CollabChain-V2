// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Collaboration {

    uint public projectCount;
    uint public taskCount;
    uint public docCount;

    struct Project {
        string name;
        address owner;
        mapping(address => bool) members;
        uint[] taskIds;
        uint[] docIds;
        mapping(address => uint[]) ratings;
    }

    struct Task {
        string name; 
        string description;
        address assignedTo;
        bool completed;
    }

    struct Document {
        string name;
        string ipfsHash; 
    }

    mapping(uint => Project) public projects;
    mapping(uint => Task) public tasks;
    mapping(uint => Document) public docs;

    function createProject(string calldata name) external {
        uint projectId = projectCount++;

        projects[projectId].name = name;
        projects[projectId].owner = msg.sender;
        projects[projectId].members[msg.sender] = true;
    }

    function assignMember(uint projectId, address member) external {
        require(projects[projectId].owner == msg.sender, "Only owner can add members");
        projects[projectId].members[member] = true;
    }

    function createTask(uint projectId, string calldata name, string calldata desc) external {
        uint taskId = taskCount++;
        tasks[taskId] = Task(name, desc, address(0), false); 
        projects[projectId].taskIds.push(taskId);
    }

    function completeTask(uint taskId) external {
        tasks[taskId].completed = true;
    }
    
    function addDoc(uint projectId, string calldata name, string calldata ipfsHash) external {
        uint docId = docCount++;
        docs[docId] = Document(name, ipfsHash);
        projects[projectId].docIds.push(docId);
    }

    function assignTask(uint projectId, uint taskId, address member) external {
        require(projects[projectId].members[msg.sender], "Only project members can assign");
        tasks[taskId].assignedTo = member;
    }


    function addRating(uint projectId, address member, uint score) external {
        projects[projectId].ratings[member].push(score);
    }   

}