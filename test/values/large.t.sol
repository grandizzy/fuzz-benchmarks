// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract C {
    uint256 internal x;

    function set(uint256 _x) public {
        x = _x;
    }

    function getX() public returns (uint256) {
        return x;
    }
}

contract LargeTest is Test {
    C target;

    function setUp() public {
        target = new C();
    }

    function invariant_large() public {
        assertTrue((target.getX() + 1 != 0));
    }
}
