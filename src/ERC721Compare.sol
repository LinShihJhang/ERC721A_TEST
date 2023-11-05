// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import './ERC721A.sol';
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyERC721E is ERC721Enumerable, Ownable {

    constructor()
        ERC721("My ERC721 Enumerable Token", "ENU")
        Ownable(msg.sender)
    {}

    function mint(address to, uint256 tokenId) public{
        _safeMint(to, tokenId);
    }
}


contract MyERC721A is ERC721A, Ownable {

    constructor()
        ERC721A("My ERC721A Token", "AAA")
        Ownable(msg.sender)
    {}

    function mint(address to, uint256 quantity) public{
        _safeMint(to, quantity);
    }
}