// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Dynamic2 {
    bool cond = true;

    function yolo(
        uint256,
        string memory s,
        uint256
    ) public returns (bool) {
        if (
            keccak256(abi.encodePacked(s)) ==
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

contract Dynamic2Test is Test {
    Dynamic2 dynamic;

    function setUp() public {
        dynamic = new Dynamic2();
    }

    function invariant_dynamic2() public view {
        assertTrue(dynamic.isYolo());
    }
}
