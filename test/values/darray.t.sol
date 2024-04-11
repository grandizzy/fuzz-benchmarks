// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract C {
    address x = address(0x123456);
    bool state;

    function add_darray(address[] memory xs) public {
        for (uint256 i; i < xs.length; i++) if (xs[i] == x) state = true;
    }

    function getState() public returns (bool) {
        return state;
    }
}

contract DArrayTest is Test {
    C target;

    function setUp() public {
        target = new C();
    }

    function invariant_state() public {
        assertFalse(target.getState());
    }
}
