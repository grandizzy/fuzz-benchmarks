// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Constants {
    bool found = false;

    function seed() public returns (int256) {
        int256 mystery = 13337;
        return (1337 + mystery);
    }

    function find(int256 i) public {
        int256 mystery = 13337;
        if (i == 1337 + mystery) {
            found = true;
        }
    }

    function getFound() public returns (bool) {
        return found;
    }
}

contract RConstantsTest is Test {
    Constants target;

    function setUp() public {
        target = new Constants();
    }

    function invariant_found() public {
        assertTrue(!target.getFound());
    }
}
