// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is  ERC721URIStorage, Ownable{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenId;

    uint256 public currentId;

    constructor()  ERC721("Ecchi Girls","EGR"){}

    function mintNFT(string memory tokenURI) public onlyOwner returns (uint256) {
        _tokenId.increment();

        currentId = _tokenId.current();
        _mint(msg.sender,currentId);
        _setTokenURI(currentId,tokenURI);
        return currentId;
    }

    function transferNFT(address to, uint256 tokenId) public onlyOwner {
        transferFrom(msg.sender, to, tokenId);
    }
}