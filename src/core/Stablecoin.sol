// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.5.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {ERC20Pausable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

import {IGroth16Verifier} from "../interface/IGroth16Verifier.sol";

contract Stablecoin is ERC20, ERC20Burnable, ERC20Pausable, Ownable, ERC20Permit {
    IGroth16Verifier public verifier;
    mapping(bytes32 => bool) public usedNullifiers;

    constructor(address initialOwner) ERC20("Stablecoin", "STCN") Ownable(initialOwner) ERC20Permit("Stablecoin") {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(
        address to,
        uint256 amount,
        uint256[2] calldata _pA,
        uint256[2][2] calldata _pB,
        uint256[2] calldata _pC,
        uint256[3] calldata publicSignals,
        bytes32 nullifier
    ) public onlyOwner {
        // verify
        usedNullifiers[nullifier] = true;
        require(!usedNullifiers[nullifier], "Nullifier already used");
        require(verifier.verifyProof(_pA, _pB, _pC, publicSignals), "Invalid proof");

        // mint
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value) internal override(ERC20, ERC20Pausable) {
        super._update(from, to, value);
    }
}
