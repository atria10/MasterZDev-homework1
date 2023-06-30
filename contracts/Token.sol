// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "contracts/BlackList.sol";

contract Token is ERC20, Ownable, BlackList {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}

    // for minting a new token, but only if the minter is the contract owner
    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }

    // for burning an existing and owned token
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    // this function allows me to run the content before other openZeppelin function in which is included _transfer
    function _beforeTokenTransfer(address from) internal view {
        require(!isBlackListed[from]);
    }
}
