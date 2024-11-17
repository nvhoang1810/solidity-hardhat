// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract Floppy is ERC20, ERC20Burnable, Ownable {
    uint256 private immutable cap;

    constructor() ERC20("Floppy", "FLP") Ownable(msg.sender) {
        cap = 50_000_000_000 * 10**decimals();
        _mint(msg.sender, cap); // Mint toàn bộ token tới msg.sender
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= cap, "Floppy: cap exceeded");
        _mint(to, amount);
    }
}
