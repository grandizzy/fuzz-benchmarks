// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract BranBar {
    uint256 ret;

    function testFuzzBar(
        uint256 w,
        uint256 x,
        uint256 y,
        uint256 z,
        uint256 a
    ) public {
        ret = 0;
        if (x % 2 == 0) {
            //if(x % 1000 != 42) {
            ret = 256;
            if (y % 2 == 0) {
                ret = 257;
            }
            w = w % ret;
            while (w != 0) {
                w--;
            }
            assert(w == 0);
            z = z % ret;
            while (ret != z) {
                z++;
            }
            assert(ret == z); //assert(x != 42 - w*z);
        } else {
            ret = 3 * a * a + 7 * a + 101;
        }
    }

    function getRet() public view returns (uint256) {
        return ret;
    }
}

contract BranBarTest is Test {
    BranBar target;

    function setUp() public {
        target = new BranBar();
    }

    /// forge-config: default.invariant.fail-on-revert = false
    /// forge-config: default.invariant.runs = 10000
    function invariant_check() public view {
        assertTrue(target.getRet() != 5687);
    }
}
