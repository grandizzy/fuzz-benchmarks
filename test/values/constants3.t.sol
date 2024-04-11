// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract ConstantsAddress {
    bool found = false;

    function find(address s) public {
        if (s == msg.sender) {
            found = true;
        }
    }

    function getFound() public view returns (bool) {
        return found;
    }
}

contract ConstantsAddressTest is Test {
    ConstantsAddress constants;

    function setUp() public {
        constants = new ConstantsAddress();
    }

    function invariant_found_sender() public view {
        assertFalse(constants.getFound());
    }
}
