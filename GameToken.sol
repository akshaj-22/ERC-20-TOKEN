// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract GameT is ERC20{

    address public admin;

    constructor()ERC20("Game","GTE") {
        admin=msg.sender;
        _mint(msg.sender, 100000000000000000000);
    }

    modifier onlyAdmin{
        require(msg.sender == admin, "Unauthorised Access");
        _;
    }

    function safeMint(address to,uint value)public onlyAdmin {
        _mint(to, value);
    }
}