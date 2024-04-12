// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Immutable {
    bytes32 public immutable x = keccak256("");
    bool private state = true;

    function f() public {
        state = false;
    }

    function getState() public view returns (bool) {
        return state;
    }
}

contract ImmutableTest is Test {
    Immutable target;

    function setUp() public {
        target = new Immutable();
    }

    function invariant_immutable() public view {
        assertTrue(target.getState());
    }
}

contract Immutable3 {
    uint256 public immutable n;
    bool public state = true;

    constructor(uint256 _n) {
        n = _n;
    }

    function set() external {
        if (n != 1) revert();
        state = false;
    }
}

contract Immutable2 {
    Immutable3 d;

    constructor() {
        d = new Immutable3(0);
    }

    function set(uint256 n) external {
        d = new Immutable3(n);
        d.set();
    }

    function getState() external view returns (bool) {
        return d.state();
    }
}

contract Immutable2Test is Test {
    Immutable2 target;

    function setUp() public {
        target = new Immutable2();
    }

    function invariant_immutable2() public view {
        assertTrue(target.getState());
    }
}
