// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract HarveyBaz {
    bool private state1;
    bool private state2;
    bool private state3;
    bool private state4;
    bool private state5;

    function baz(
        int256 a,
        int256 b,
        int256 c
    ) public returns (int256) {
        int256 d = b + c;
        //minimize(d < 1 ? 1 - d : 0);
        //minimize(d < 1 ? 0 : d);
        if (d < 1) {
            //minimize(b < 3 ? 3 - b : 0);
            //minimize(b < 3 ? 0 : b - 2);
            if (b < 3) {
                state1 = true;
                return 1;
            }
            //minimize(a == 42 ? 1 : 0);
            //minimize(a == 42 ? 0 : |a - 42|);
            if (a == 42) {
                state2 = true;
                return 2;
            }

            state3 = true;
            return 3;
        } else {
            //minimize(c < 42 ? 42 - c : 0);
            //minimize(c < 42 ? 0 : c - 41);
            if (c < 42) {
                state4 = true;
                return 4;
            }
            state5 = true;
            return 5;
        }
    }

    function allStates() public view returns (bool) {
        return !state1 || !state2 || !state3 || !state4 || !state5;
    }
}

contract HarveyBazTest is Test {
    HarveyBaz target;

    function setUp() public {
        target = new HarveyBaz();
    }

    /// forge-config: default.invariant.depth = 5000
    function invariant_check() public view {
        assertTrue(target.allStates());
    }
}
