// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract A {}

contract C {
    bool state = true;
    bool state2 = true;
    A a;
    A b;

    constructor() public {
        a = new A();
    }

    function c() public {
        if (b == A(address(0x0))) b = new A();
    }

    function f(address x) public {
        if (A(x) == a) state = false;
        if ((A(x) == b) && (b != A(address(0x0)))) state2 = false;
    }

    function getState() public returns (bool) {
        return state || state2;
    }
}

contract CreateTest is Test {
    C create;

    function setUp() public {
        create = new C();
    }

    function invariant_state() public {
        assertTrue(create.getState());
    }
}
