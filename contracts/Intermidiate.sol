pragma solidity ^0.8.0;

contract Voting {
    
    // Structure to store information about each candidate
    struct Candidate {
        string name;
        uint voteCount;
    }

    // Array to store all the candidates
    Candidate[] public candidates;
    
    // Mapping to keep track of which address has voted
    mapping(address => bool) public hasVoted;

    // Function to add a candidate to the candidates array
    function addCandidate(string memory _name) public {
        candidates.push(Candidate({name: _name, voteCount: 0}));
    }

    // Function to get the total number of candidates
    function getCandidateCount() public view returns (uint) {
        return candidates.length;
    }

    // Function to cast a vote for a candidate
    function vote(uint _candidateIndex) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(_candidateIndex < candidates.length, "Invalid candidate index.");

        candidates[_candidateIndex].voteCount++;
        hasVoted[msg.sender] = true;
    }

    // Function to get the number of votes for a candidate
    function getVoteCount(uint _candidateIndex) public view returns (uint) {
        require(_candidateIndex < candidates.length, "Invalid candidate index.");

        return candidates[_candidateIndex].voteCount;
    }

}
