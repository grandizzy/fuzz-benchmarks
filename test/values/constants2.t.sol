// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract ConstantsBytes32 {
    bool found = false;

    function find(bytes32 s) public {
        if (s == "test") {
            found = true;
        }
    }

    function getFound() public view returns (bool) {
        return found;
    }
}

contract ConstantsBytes32Test is Test {
    ConstantsBytes32 constants;

    function setUp() public {
        constants = new ConstantsBytes32();
    }

    function invariant_found32() public view {
        assertFalse(constants.getFound());
    }
}
