// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract SmallValues {
    int256 n = 0;

    function f(uint256 newn) public {
        n = int256(newn);
    }

    function getN() public view returns (int256) {
        return n;
    }
}

contract SmallValuesTest is Test {
    SmallValues target;

    function setUp() public {
        target = new SmallValues();
    }

    /// forge-config: default.invariant.depth = 1000
    function invariant_find_small() public view {
        assertTrue((target.getN() - 256) != 31);
    }
}
