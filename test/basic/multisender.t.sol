// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Multisender {
    bool state1 = false;
    bool state2 = false;
    bool state3 = false;

    function s1() public {
        require(msg.sender == address(0x1));
        state1 = true;
    }

    function s2() public {
        require(msg.sender == address(0x2));
        state2 = true;
    }

    function s3() public {
        require(msg.sender == address(0x3));
        state3 = true;
    }

    function getState1() public view returns (bool) {
        return state1;
    }

    function getState2() public view returns (bool) {
        return state2;
    }

    function getState3() public view returns (bool) {
        return state3;
    }
}

contract MultisenderTest is Test {
    Multisender target;

    function setUp() public {
        target = new Multisender();

        targetSender(address(0x1));
        targetSender(address(0x2));
        targetSender(address(0x3));
    }

    function invariant_multisenders() public view {
        assertTrue(
            !target.getState1() || !target.getState2() || !target.getState3()
        );
    }
}
