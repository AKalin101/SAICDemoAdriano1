// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsoleVoting {

    // Struct for a console
    struct Console {
        uint8 votes;
        string name;
    }

    // Mapping from console names to their vote counts
    mapping(string => Console) public consoles;

    // Mapping to check if an address has already voted
    mapping(address => bool) public hasVoted;

    // Event to emit when a vote is cast
    event Voted(address indexed voter, string consoleName);

    // Contract constructor to initialize the consoles
    constructor() {
        consoles["PC"] = Console(0, "PC");
        consoles["Playstation"] = Console(0, "Playstation");
        consoles["Xbox"] = Console(0, "Xbox");
        consoles["Nintendo"] = Console(0, "Nintendo");
    }

    // Function to cast a vote
    function vote(string memory consoleName) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        // require(
        //     keccak256(abi.encodePacked(consoleName)) == keccak256(abi.encodePacked("PC")) || 
        //     keccak256(abi.encodePacked(consoleName)) == keccak256(abi.encodePacked("Playstation")) ||
        //     keccak256(abi.encodePacked(consoleName)) == keccak256(abi.encodePacked("Xbox")) ||
        //     keccak256(abi.encodePacked(consoleName)) == keccak256(abi.encodePacked("Nintendo")),
        //     "Invalid console name."
        // );

        consoles[consoleName].votes++;
        hasVoted[msg.sender] = true;

        emit Voted(msg.sender, consoleName);
    }

    // Function to get the vote count for a specific console
    function getVotes(string memory consoleName) public view returns (uint256) {
        require(
            keccak256(abi.encodePacked(consoleName)) == keccak256(abi.encodePacked("PC")) || 
            keccak256(abi.encodePacked(consoleName)) == keccak256(abi.encodePacked("Playstation")) ||
            keccak256(abi.encodePacked(consoleName)) == keccak256(abi.encodePacked("Xbox")) ||
            keccak256(abi.encodePacked(consoleName)) == keccak256(abi.encodePacked("Nintendo")),
            "Invalid console name."
        );

        return consoles[consoleName].votes;
    }
}
