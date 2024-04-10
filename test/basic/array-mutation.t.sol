// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract MutateArrayTarget {
    bytes32 example = "abcdef123";
    bool state;

    function fuzz_array(bytes32 bs) public {
        if (bs[0] == "a" && bs[1] == "b" && bs[2] == "c" && bs != example)
            state = true;
    }

    function getState() public view returns (bool) {
        return state;
    }
}

contract ArrayMutationTest is Test {
    MutateArrayTarget target;

    function setUp() public {
        target = new MutateArrayTarget();
    }

    function invariant_array_mutated() public view {
        assertFalse(target.getState());
    }
}
