pragma solidity ^0.4.25;

contract PayPerHash {

    struct Data {
        bytes32 hash;
        string value;
        uint256 bounty;
    }

    mapping(bytes32 => Data) public jobs;

    function request(bytes32 hash) public payable {
        require(msg.value > 10 finney, "Don't be tight!");

        jobs[hash] = Data(hash, "", msg.value);

        emit NewJob(hash);
    }

    function claim(bytes32 hash, string memory value) public {
        if (hash == sha256(abi.encodePacked(value))) {

        }
    }

    function withdraw() public {
        address me = 0x18C4Fa3391ef21ca8Da97235edEe52853c7cc319;

        me.transfer(this.balance);
    }

    event NewJob(bytes32 hash);
}