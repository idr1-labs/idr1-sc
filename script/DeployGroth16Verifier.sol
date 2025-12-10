// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Script, console} from "forge-std/Script.sol";
import {Groth16Verifier} from "../src/core/Groth16Verifier.sol";

contract DeployGroth16Verifier is Script {
    function run() external {
        vm.startBroadcast();
        Groth16Verifier verifier = new Groth16Verifier();
        vm.stopBroadcast();

        console.log("Groth16Verifier deployed at:", address(verifier));
    }
}
