// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract MultiTuple {
    struct T {
        bytes bs;
    }
    struct S {
        T t;
    }

    bool state = true;

    function f(S memory o1, S memory o2) public {
        state = false;
    }

    function cond() public view returns (bool) {
        return state;
    }
}

contract MultiTupleTest is Test {
    MultiTuple target;

    function setUp() public {
        target = new MultiTuple();
    }

    function invariant_multi_tuple() public view {
        assertTrue(target.cond());
    }
}
