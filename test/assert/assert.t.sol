// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract ContractWithAssert {
    function direct_assert(int256 val) public {
        assert(val % 100 != 0);
    }

    function f(uint256 val) public {}
}

contract ContractWithDirectAssertTest is Test {
    ContractWithAssert target;

    function setUp() public {
        target = new ContractWithAssert();
    }

    /// forge-config: default.invariant.fail-on-revert = true
    function invariant_direct_assertion_failure() public view {}
}

contract ContractWithInternalAssert {
    function internal_func(uint256 val) internal {
        assert(val <= 128);
    }

    function f() public {}

    function internal_assert(uint256 val) public {
        internal_func(val);
    }
}

contract ContractWithInternalAssertTest is Test {
    ContractWithInternalAssert target;

    function setUp() public {
        target = new ContractWithInternalAssert();
    }

    /// forge-config: default.invariant.fail-on-revert = true
    function invariant_internal_assertion_failure() public view {}
}
