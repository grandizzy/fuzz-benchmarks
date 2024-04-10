// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Dynamic {
    struct Yolo {
        // Struct
        uint256 u;
        string s;
        address a;
    }

    bool cond = true;

    function yolo(Yolo memory y) public returns (bool) {
        if (
            keccak256(abi.encodePacked(y.s)) ==
            keccak256(abi.encodePacked("yolo"))
        ) {
            cond = false;
        }
        return (true);
    }

    function isYolo() public view returns (bool) {
        return cond;
    }
}

contract DynamicTest is Test {
    Dynamic dynamic;

    function setUp() public {
        dynamic = new Dynamic();
    }

    function invariant_dynamic() public view {
        assertTrue(dynamic.isYolo());
    }
}
