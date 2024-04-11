// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Time {
    uint256 start;
    uint256 marked;

    constructor() public {
        start = block.timestamp;
        marked = block.timestamp;
    }

    function mark() public {
        marked = block.timestamp;
    }

    function getStart() public returns (uint256) {
        return start;
    }

    function getMarked() public returns (uint256) {
        return marked;
    }
}

contract TimeTest is Test {
    Time target;

    function setUp() public {
        target = new Time();
    }

    function invariant_timepassed() public returns (bool) {
        assertTrue(target.getStart() == target.getMarked());
    }

    function invariant_moretimepassed() public returns (bool) {
        return (block.timestamp < target.getStart() + 10 weeks);
    }
}
