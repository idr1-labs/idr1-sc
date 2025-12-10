// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {Stablecoin} from "../src/core/Stablecoin.sol";

contract DeployStablecoin is Script {
    function run() external {
        address initialOwner = vm.envAddress("INITIAL_OWNER");

        vm.startBroadcast();
        Stablecoin stablecoin = new Stablecoin(initialOwner);
        vm.stopBroadcast();

        console.log("Stablecoin deployed at:", address(stablecoin));
    }
}
