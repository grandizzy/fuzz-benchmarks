// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract HarveyFoo {
    int256 private x;
    int256 private y;
    bool private state;

    constructor() {
        x = 0;
        y = 0;
    }

    function Bar() public returns (int256) {
        if (x == 42) {
            state = true;
            return 1;
        }
        return 0;
    }

    function SetY(int256 ny) public {
        y = ny;
    }

    function IncX() public {
        x++;
    }

    function CopyY() public {
        x = y;
    }

    function getState() public view returns (bool) {
        return !state;
    }
}

contract HarveyFooTest is Test {
    HarveyFoo target;

    function setUp() public {
        target = new HarveyFoo();
    }

    /// forge-config: default.invariant.depth = 5000
    function invariant_check() public view {
        assertTrue(target.getState());
    }
}
