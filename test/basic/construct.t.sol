// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract C {
    bool state = true;

    function f() public {
        D a = new D();
        D b = new D();
        state = false;
    }

    function getState() public view returns (bool) {
        return state;
    }
}

contract D {}

contract ConstructTest is Test {
    C target;

    function setUp() public {
        target = new C();
    }

    function invariant_construct() public view {
        assertTrue(target.getState());
    }
}
