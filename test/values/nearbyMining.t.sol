// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract NearbyMining {
    uint256 n = 0;

    function f(uint256 newn) public {
        n = newn;
    }

    function getN() public returns (uint256) {
        return n;
    }
}

contract NearbyMiningTest is Test {
    NearbyMining target;

    function setUp() public {
        target = new NearbyMining();
    }

    function invariant_nearby_mining() public {
        assertTrue(
            target.getN() <= 181888880989308019 ||
                target.getN() >= 181888880989308021
        );
    }
}
