// SPDX-License-Identifier: MIT




pragma solidity ^0.8.26;




contract Vote {


    struct Voter {
        string name;
        uint age;
        uint voterId;
        Gender gender;
        uint voteCandidateId;
        address voterAddress;
    }


    struct Candidate {
        string name;
        string party;
        uint age;
        Gender gender;
        uint candidateId;
        address candidateAddress;
        uint votes;
    }


    address electionCommission;
    address public winner;
    uint nextVoterId = 1;
    uint nextCandidateId = 1;
    uint startTime;
    uint endTime;
    bool stopVoting;


    mapping(uint => Voter) voterDetails;
    mapping(uint => Candidate) candidateDetails;


    enum VotingStatus {NotStarted, InProgress, Ended}
    enum Gender {NotSpecified, Male, Female, Other}


    constructor() {
        electionCommission = msg.sender;
    }


    modifier isVotingOver() {
        require(block.timestamp <= endTime && stopVoting == false, "Voting is OVER!");
      _;
    }


    modifier onlyCommissioner() {
        require(msg.sender == electionCommission, "Not Authourised");
        _;
    }


    function registerCandidate(
        string calldata _name,
        string calldata _party,
        uint _age,
        Gender _gender
    ) external {
        require(isCandidateNotRegistered(msg.sender) == true, "Candidate already registered");
        require(nextCandidateId < 3, "Seats already fuldilled");
        candidateDetails[nextCandidateId] = Candidate({
            name: _name,
            party: _party,
            age: _age,
            gender: _gender,
            candidateId: nextCandidateId,
            candidateAddress: msg.sender,
            votes: 0
        });
        nextCandidateId++;
    }


    function isCandidateNotRegistered(address _person) internal view returns (bool) {
           for(uint i=1; i<nextCandidateId; i++){
                if(candidateDetails[i].candidateAddress == _person){
                    return false;
                }
           }
           return true;
    }


    function getCandidateList() public view returns (Candidate[] memory) {
        Candidate[] memory candidateList = new Candidate[](nextCandidateId - 1);
        for(uint i=1; i<nextCandidateId; i++){
            candidateList[i-1] = candidateDetails[i];
        }
        return candidateList;
    }


    function isVoterNotRegistered(address _person) internal view returns (bool) {
        for(uint i=1; i<nextVoterId; i++){
            if(voterDetails[i].voterAddress == _person){
                return false;
            }
        }
        return true;
    }


    function registerVoter(
        string calldata _name,
        uint _age,
        Gender _gender
    ) external {
        require(isVoterNotRegistered(msg.sender) == true, "Voter already registered");
        voterDetails[nextVoterId] = Voter({
            name: _name,
            age: _age,
            voterId: nextVoterId,
            gender: _gender,
            voteCandidateId: 0,
            voterAddress: msg.sender
        });
        nextVoterId++;
    }


    function getVoterList() public view returns (Voter[] memory) {
        Voter[] memory voterList = new Voter[](nextVoterId - 1);
        for(uint i=1; i<nextVoterId; i++){
            voterList[i-1] = voterDetails[i];
        }
        return voterList;
    }


    function castVote(uint _voterId, uint _voteCandidateId) external {
        require(voterDetails[_voterId].voterAddress == msg.sender, "Not Authourised");
        voterDetails[_voterId].voteCandidateId = _voteCandidateId;
        candidateDetails[_voteCandidateId].votes++;
    }


    function setVotingPeriod(uint _startTime, uint _endTime) external onlyCommissioner() {
        startTime = block.timestamp + _startTime;
        endTime = block.timestamp + _endTime;
    }


    function getVotingStatus() public view returns (VotingStatus) {
        if(block.timestamp < startTime){
            return VotingStatus.NotStarted;
        } else if(block.timestamp >= startTime && block.timestamp <= endTime && stopVoting == false){
            return VotingStatus.InProgress;
        } else {
            return VotingStatus.Ended;
        }
    }


    function announceVotingResult() external onlyCommissioner() {
        uint max = 0;
        for(uint i=1; i<nextCandidateId; i++){
            if(candidateDetails[i].votes > max){
                max = candidateDetails[i].votes;
                winner = candidateDetails[i].candidateAddress;
            }
        }
    }


    function emergencyStopVoting() public onlyCommissioner() {
       stopVoting = true;
    }
}
