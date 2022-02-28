// SPDX-License-Identifier: GPL-3.0

// Amended by HashLips
/**
    !Disclaimer!
    These contracts have been used to create tutorials,
    and was created for the purpose to teach people
    how to create smart contracts on the blockchain.
    please review this code on your own before using any of
    the following code for production.
    HashLips will not be liable in any way if for the use 
    of the code. That being said, the code has been tested 
    to the best of the developers' knowledge to work as intended.
*/

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract NFT is ERC721Enumerable, Ownable {
  using Strings for uint256;

  string public baseURI;
  string public baseExtension = ".json";
  string public notRevealedUri;
  uint256 public cost = 0.1 ether;
  uint256 public whitelistCost = 0.1 ether;
  uint256 public maxSupply = 7777;
  uint256 public maxMintAmount = 50;
  uint256 public nftPerAddressLimit = 20;
  uint256 public devReserve = 64;
  bool public saleIsActive = true;
  // bool public paused = false;
  bool public revealed = true;
  bool public onlyWhitelisted = false;
  //address payable commissions = payable(0xde3B22caAaD25e65C839c2A3d852d665669EdD5c);
  address[] public whitelistedAddresses;
  

  mapping(address => uint256) public addressMintedBalance;


  constructor(
    string memory _name,
    string memory _symbol,
    string memory _initBaseURI,
    string memory _initNotRevealedUri
  ) ERC721(_name, _symbol) {
    setBaseURI(_initBaseURI);
    setNotRevealedURI(_initNotRevealedUri);
  }

  // internal
  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }
  // public
  function mint(uint256 _mintAmount) public payable {
    require(saleIsActive == true , "the contract is paused");
    uint256 supply = totalSupply();
    require(_mintAmount > 0, "need to mint at least 1 NFT");
    require(_mintAmount <= maxMintAmount, "max mint amount per session exceeded");
    require(supply + _mintAmount <= maxSupply, "max NFT limit exceeded");

    if (msg.sender != owner()) {
        if(onlyWhitelisted == true) {
            require(isWhitelisted(msg.sender), "user is not whitelisted");
            uint256 ownerMintedCount = addressMintedBalance[msg.sender];
            require(ownerMintedCount + _mintAmount <= nftPerAddressLimit, "max NFT per address exceeded");
            require(msg.value >= whitelistCost * _mintAmount, "insufficient funds");

        }
        require(msg.value >= cost * _mintAmount, "insufficient funds");
    }

    for (uint256 i = 1; i <= _mintAmount; i++) {
      addressMintedBalance[msg.sender]++;
      _safeMint(msg.sender, supply + i);
    }

  }

  

     function isWhitelisted(address _user) public view returns (bool) {
    for (uint i = 0; i < whitelistedAddresses.length; i++) {
      if (whitelistedAddresses[i] == _user) {
          return true;
      }
    }
    return false;
  }



  function walletOfOwner(address _owner)
    public
    view
    returns (uint256[] memory)
  {
    uint256 ownerTokenCount = balanceOf(_owner);
    uint256[] memory tokenIds = new uint256[](ownerTokenCount);
    for (uint256 i; i < ownerTokenCount; i++) {
      tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
    }
    return tokenIds;
  }
 

  function tokenURI(uint256 tokenId)
    public
    view
    virtual
    override
    returns (string memory)
  {
    require(
      _exists(tokenId),
      "ERC721Metadata: URI query for nonexistent token"
    );
    
    if(revealed == false) {
        return notRevealedUri;
    }

    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), baseExtension))
        : "";
  }

  //only owner
  function reveal() public onlyOwner {
      revealed = true;
  }
  
  function setNftPerAddressLimit(uint256 _limit) public onlyOwner {
    nftPerAddressLimit = _limit;
  }
  
  function setCost(uint256 _newCost) public onlyOwner {
    cost = _newCost;
  }

  function setmaxMintAmount(uint256 _newmaxMintAmount) public onlyOwner {
    maxMintAmount = _newmaxMintAmount;
  }

  function setBaseURI(string memory _newBaseURI) public onlyOwner {
    baseURI = _newBaseURI;
  }

  function setBaseExtension(string memory _newBaseExtension) public onlyOwner {
    baseExtension = _newBaseExtension;
  }
  
  function setNotRevealedURI(string memory _notRevealedURI) public onlyOwner {
    notRevealedUri = _notRevealedURI;
  }

 function toggleSaleState() public onlyOwner {
        saleIsActive = !saleIsActive;
      }
  
  function setOnlyWhitelisted(bool _state) public onlyOwner {
    onlyWhitelisted = _state;
  }
  
  function whitelistUsers(address[] calldata _users) public onlyOwner {
    delete whitelistedAddresses;
    whitelistedAddresses = _users;
  }
 

    //aca vamos a poner la billetera de cada uno

  address private hiddensociety_18 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
  address private maxi_12 = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db; 
  address private nico_12 = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB; 
  address private vale_12 = 0x617F2E2fD72FD9D5503197092aC168c91465E7f2; 
  address private martin_12 = 0x17F6AD8Ef982297579C203069C1DbfFE4348c372; 
  address private red_4 = 0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678; 
  address private juan_3 = 0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7; 
  address private chamo_1 = 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C; 
  address private f1_1 = 0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC; 
  address private f2_1 = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c; 
  address private f3_1 = 0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C; 
  address private f4_1 = 0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB; 


  function withdraw() public payable onlyOwner {
  //   // This will pay HashLips 5% of the initial sale.
  //   // You can remove this if you want, or keep it in to support HashLips and his channel.
  //   // =============================================================================
   (bool primero, ) = payable(hiddensociety_18).call{value: address(this).balance  * 18000 / 100000}("");
    require(primero);

    (bool segunda, ) = payable(maxi_12).call{value: address(this).balance  * 14630 / 100000}("");
    require(segunda);

    (bool tercera, ) = payable(nico_12).call{value: address(this).balance  * 17150 / 100000}("");
    require(tercera);

    (bool cuarta, ) = payable(vale_12).call{value: address(this).balance  * 20700 / 100000}("");
    require(cuarta);

    (bool quinta, ) = payable(martin_12).call{value: address(this).balance * 26100 / 100000}("");
    require(quinta);

    (bool sexta, ) = payable(red_4).call{value: address(this).balance  * 11770 / 100000}("");
    require(sexta);

    (bool septima, ) = payable(juan_3).call{value: address(this).balance  * 10000 / 100000}("");
    require(septima);

    (bool octava, ) = payable(chamo_1).call{value: address(this).balance  * 3700 / 100000}("");
    require(octava);

     (bool novena, ) = payable(f1_1).call{value: address(this).balance  * 3840 / 100000}("");
    require(novena);

    (bool decima, ) = payable(f2_1).call{value: address(this).balance  * 4000 / 100000}("");
    require(decima);

    (bool once, ) = payable(f3_1).call{value: address(this).balance  * 4170 / 100000}("");
    require(once);

    (bool doce, ) = payable(f4_1).call{value: address(this).balance  * 4350 / 100000}("");
    require(doce);



    
  //   // This will payout the owner 95% of the contract balance.
  //   // Do not remove this otherwise you will not be able to withdraw the funds.
  //   // =============================================================================
  //   // (bool os, ) = payable(owner()).call{value: msg.value}("");
  //   // require(os);
  //   // =============================================================================
  }
}