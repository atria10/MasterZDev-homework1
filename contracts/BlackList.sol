// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract BlackList is Ownable {
    // map Object for blackListed Accounts
    mapping(address => bool) public isBlackListed;

    // function that allows the Contract Owner to add a user address to the blackList
    function addBlackList(address _deniedUser) external onlyOwner {
        isBlackListed[_deniedUser] = true;
    }

    // function that allows the Contract Owner to remove a user address to the blackList
    function removeBlackList(address _clearUser) external onlyOwner {
        isBlackListed[_clearUser] = false;
    }

    function getBlackListStatus(
        address _addressToCheck
    ) external view returns (bool) {
        return isBlackListed[_addressToCheck];
    }
}
