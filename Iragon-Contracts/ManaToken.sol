//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ManaToken is ERC20, Ownable {
    uint256 public maxAmount;
    uint256 public currentAmount;
    constructor()  ERC20("Mana Token","MNTK"){
        maxAmount = 1000000;
        currentAmount = 0;
    }

    function setMaxAmount(uint256 amount_) public onlyOwner {
        maxAmount = amount_;
    }

    function mintToken(uint256 amount) public onlyOwner {
        require(currentAmount + amount <= maxAmount, "Exceeded amount of Mana Token!");
        _mint(msg.sender, amount * 10 ** 18);
        currentAmount += amount;
    }

    function transferToken(address to, uint256 amount) public onlyOwner {
        _transfer(msg.sender, to, amount * 10 ** 18);
    }
}