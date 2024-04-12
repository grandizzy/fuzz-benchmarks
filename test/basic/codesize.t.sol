// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract C {
    uint256 sz;

    constructor() public {
        uint256 x;
        address t = address(this);
        assembly {
            x := extcodesize(t)
        }
        sz = x;
    }

    function getSize() public returns (uint256) {
        return sz;
    }
}

contract CodeSizeTest is Test {
    function testCodeSize() public {
        C target = new C();
        assertTrue(target.getSize() == 0);
    }
}
