// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract TwitterLab{
    struct Tweet {
        uint id;
        address author;
        string content;
        uint timestamp;
    }
    struct Message {
        uint id;
        string content;
        address sender;
        address receiver;
        uint timestamp;
    }

    uint internal tweetId;
    uint internal messageId;

    mapping(uint => Tweet) tweets; // tweetId => Tweet
    mapping(address => uint) tweetsOf; // user => tweetId
    mapping(uint => Message) conversations; // messageId => Message
    mapping(address => address[]) operators; // user => operators
    mapping(address => address[]) following; // user => following


    function _tweet(address _from, string memory _content) internal {
        tweets[tweetId] = Tweet({
            id: tweetId,
            author: _from,
            content: _content,
            timestamp: block.timestamp
        });
        tweetsOf[_from] = tweetId;
        tweetId++;
    }

    function _sendMessage(address _from, address _to, string memory _content) internal {
        conversations[messageId] = Message({
            id: messageId,
            content: _content,
            sender: _from,
            receiver: _to,
            timestamp: block.timestamp
        });
        messageId++;
    }

    function tweet(string memory _content) external {
        _tweet(msg.sender, _content);
    }

    function tweet(address _from, string memory _content) external {
        require(isOperator(_from, msg.sender), "Unauthourise");
        _tweet(_from, _content);
    }

    function sendMessage(string memory _content, address _to) external {
        _sendMessage(msg.sender, _to, _content);
    }

    function follow(address _followed) external {
        following[msg.sender].push(_followed);
    }

    function allow(address _operator) external {
        operators[msg.sender].push(_operator);
    }

    function disallow(address _operator) external {
        uint length = operators[msg.sender].length;
        for (uint i = 0; i < length; i++) {
            if (operators[msg.sender][i] == _operator) {
                operators[msg.sender][i] = operators[msg.sender][length - 1];
                operators[msg.sender].pop();
                break;
            }
        }
    }

    function getLatestTweets(uint count) external view returns(Tweet[] memory){
        Tweet[] memory latestTweets = new Tweet[](count);
        uint index = 0;
        for(uint i=tweetId-1; i>=0; i--){
            if(index<count-1){
                latestTweets[index] = tweets[i];
                index++;
            }
        }
        return latestTweets;
    }

    function getLatestTweetsOf(address user, uint count) external view returns(Tweet[] memory){
        Tweet[] memory latestTweetsUser = new Tweet[](count);
        uint index = 0;
        for(uint i=tweetId-1; i>=0; i--){
            if(tweets[i].author == user && index<count-1){
                latestTweetsUser[index] = tweets[i];
                index++;
            }
        }
        return latestTweetsUser;
    }










    // Helper function -> to check if an address is in the array
    function isOperator(address _from, address _operator) internal view returns (bool) {
        address[] memory operatorArray = operators[_from];
        for (uint i = 0; i < operatorArray.length; i++) {
            if (operatorArray[i] == _operator) {
                return true;
            }
        }
        return false;
    }
}
