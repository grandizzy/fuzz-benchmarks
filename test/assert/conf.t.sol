// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract A {
    function c() public {}

    B private b;

    constructor() {
        b = new B();
    }
}

contract B {
    function c() public {
        assert(false);
    }
}

contract TargetSetTest is Test {
    A target;

    function setUp() public {
        target = new A();
        targetContract(address(target));
    }

    /// forge-config: default.invariant.fail-on-revert = true
    function invariant_should_not_fail() public view {}
}

contract TargetNotSetTest is Test {
    A target;

    function setUp() public {
        target = new A();
    }

    /// forge-config: default.invariant.fail-on-revert = true
    function invariant_should_fail() public view {}
}
