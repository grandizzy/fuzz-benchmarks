// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract PushLongTarget {
    address[] a;
    bool lengthChecking = false;

    function push_1() public {
        a.push(address(1));
    }

    function turn_on_length_checking() public {
        lengthChecking = true;
    }

    function turn_off_length_checking() public {
        lengthChecking = false;
    }

    function getLength() public view returns (uint256) {
        return a.length;
    }

    function shouldCheckLength() public view returns (bool) {
        return lengthChecking;
    }
}

contract PushLongTest is Test {
    PushLongTarget target;

    function setUp() public {
        target = new PushLongTarget();
    }

    function invariant_test_long_5() public view {
        if (target.getLength() >= 5 && target.shouldCheckLength()) {
            assertTrue(false);
        }
    }
}
