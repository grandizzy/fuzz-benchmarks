// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract C {
    uint256 state = 0;
    uint256 another_state = 0;

    function payable_function() public payable {
        if (msg.value == 129) state = msg.value;
    }

    function another_function(uint256) public {
        another_state = 1;
    }

    function getState() public returns (uint256) {
        return state;
    }
}

contract PayableTest is Test {
    C target;

    function setUp() public {
        target = new C();
    }

    function invariant_payable() public {
        assertTrue(target.getState() == 0);
    }
}
