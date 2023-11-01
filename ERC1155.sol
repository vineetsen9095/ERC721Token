// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyERC1155Tken is ERC1155, Ownable, ERC1155Burnable {
    using Counters for Counters.Counter;
    Counters.Counter private _mintId;

    constructor(address initialOwner)
        ERC1155("https://ipfs.io/ipfs/QmYNVXy3q1wKE4kKewNRVz6Lg73GBWZnNifrjAsHko7iXb")
        Ownable(initialOwner)
    {}

    function setURI(string memory newURI) public onlyOwner {
        _setURI(newURI);
    }

    function mint(address account, uint256 amount, bytes memory data) public onlyOwner {
        _mintId.increment();
        uint256 id = _mintId.current();
        _mint(account, id, amount, data);
    }
    
}
