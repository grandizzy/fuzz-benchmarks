// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract AlwaysTrue {
    function f(uint256) public returns (bool) {
        return (false);
    }
}

contract AlwaysTrueTest is Test {
    AlwaysTrue target;

    function setUp() public {
        target = new AlwaysTrue();
    }

    function invariant_always_true() public pure {
        assertTrue(true);
    }
}
