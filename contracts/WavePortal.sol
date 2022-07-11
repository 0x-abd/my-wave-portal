// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import "hardhat/console.sol";

contract WavePortal {
    event NewWave(address indexed from, uint256 timestamp, string message);
    uint256 waveCount = 0;
    mapping(address => uint) mostWaved;
    constructor(){
        console.log("hello world");
    }
    struct Wave{
        string message;
        address waver;
        uint256 timestamp;
    }
    Wave[] waves;
    function wave(string memory _message) public {
        waveCount += 1;
        mostWaved[msg.sender] += 1;
        console.log("%s has waved! Message: %s", msg.sender, _message);
        waves.push(Wave(_message, msg.sender, block.timestamp));
        emit NewWave(msg.sender, block.timestamp, _message);
    }
    function getTotalWaves() public view returns(uint) {
        console.log("We have %d total waves!", waveCount);
        console.log("%s address waved total %d times.", msg.sender, mostWaved[msg.sender]);
        return waveCount;
    }
}