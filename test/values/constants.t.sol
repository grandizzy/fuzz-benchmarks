// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Constants {
    bool found = false;
    bool found_large = false;

    function find(int256 i) public {
        if (i == 1447) {
            found = true;
        }
        if (i == 133700000000) {
            found = false;
        }
        if (i == 11234567890123456789012345678901234560) {
            found_large = true;
        }
    }

    function getFound() public view returns (bool) {
        return found;
    }

    function getFoundLarge() public view returns (bool) {
        return found_large;
    }
}

contract ConstantsTest is Test {
    Constants constants;

    function setUp() public {
        constants = new Constants();
    }

    function invariant_found() public view {
        assertFalse(constants.getFound());
    }

    function invariant_found_large() public view {
        assertFalse(constants.getFoundLarge());
    }
}
