// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract demo {
    struct USER {
        uint id;
        string name;
    }

    USER[] public usersArr;

    function insert(uint _id, string calldata _name) external {
        usersArr[_id] = USER({
            id: _id,
            name: _name
        });
    }

    function read(uint _id) external view returns (uint, string memory) {
        return (usersArr[_id].id, usersArr[_id].name);
    }

    function find(uint _id) external view {
        require(usersArr[_id].id != 0, "User does not exist!");
    }
}


