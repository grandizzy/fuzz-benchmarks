// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract MutateDArrayTarget {
    bytes e = "abcdef123";
    bool state;

    function fuzz_darray(bytes32 bs) public {
        if (bs[0] == e[0] && bs[1] == e[1] && bs[2] == e[2] && bs.length > 16)
            state = true;
    }

    function getState() public view returns (bool) {
        return state;
    }
}

contract DArrayMutationTest is Test {
    MutateDArrayTarget dTarget;

    function setUp() public {
        dTarget = new MutateDArrayTarget();
    }

    function invariant_mutate_darray() public view {
        assertFalse(dTarget.getState());
    }
}
