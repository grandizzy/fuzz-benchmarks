// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Now {
    bool state;
    uint256 time;

    function set() public {
        time = block.timestamp;
    }

    function guess(uint256 x) public {
        if (x <= time + 4 weeks && x >= time - 4 weeks) state = true;
    }

    function getState() public returns (bool) {
        return state;
    }
}

contract NowTest is Test {
    Now target;

    function setUp() public {
        target = new Now();
    }

    function invariant_now() public {
        assertTrue(!target.getState());
    }
}
