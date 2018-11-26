pragma solidity ^0.4.25;

contract PayPerHash {

    struct Data {
        bytes32 hash;
        string value;
        uint256 bounty;
        uint256 claimed;
    }

    Data[] public jobs;

    function jobCount() public view returns(uint) {
        return jobs.length;
    }

    function request(bytes32 hash) public payable {
        require(msg.value > 1 finney, "Don't be tight!");

        jobs.push(Data(hash, "", msg.value, 0));

        emit NewJob(hash);
    }

    function claim(uint256 index, bytes32 hash, string memory value) public {
        require(jobs[index].claimed == 0, "Cannot be claimed");
        if (hash == sha256(abi.encodePacked(value))) {
            jobs[index].value = value;
            jobs[index].claimed = now;

            msg.sender.transfer(jobs[index].bounty);
        }
    }

    function withdraw(uint256 amount) public {
        address _me = 0x18C4Fa3391ef21ca8Da97235edEe52853c7cc319;

        _me.transfer(amount);
    }

    event NewJob(bytes32 hash);
}