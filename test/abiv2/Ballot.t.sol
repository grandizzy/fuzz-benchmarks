// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Ballot {
    struct Voter {
        // Struct
        uint256 weight;
        bool voted;
        address delegate;
        uint256 vote;
    }

    bool voted = true;

    function add_voter(Voter memory voter) public returns (bool) {
        if (voter.voted == true) {
            voted = false;
        }
        return (true);
    }

    function cond() public view returns (bool) {
        return voted;
    }
}

contract BallotTest is Test {
    Ballot ballot;

    function setUp() public {
        ballot = new Ballot();
    }

    function invariant_add_voter() public view {
        assertTrue(ballot.cond());
    }
}
