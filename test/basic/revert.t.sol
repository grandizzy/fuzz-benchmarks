// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract FailOnRevert {
    int256 private state = 0;

    function f(
        int256 x,
        address y,
        address z
    ) public {
        require(z != address(0x0));
        state = x;
    }

    function failOnrevert() public returns (bool) {
        if (state < 0) revert();
        return true;
    }
}

contract FailOnRevertTest is Test {
    FailOnRevert target;

    function setUp() public {
        target = new FailOnRevert();
    }

    /// forge-config: default.invariant.fail-on-revert = true
    function invariant_fail_on_revert() public view {}
}
