// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract Crowdsale {
    uint256 goal = 10000 * 10**18;
    uint256 raised = 0;
    uint256 closeTime;
    address public owner;
    mapping(address => uint256) deposits;
    uint256 phase; // 0: active, 1: success, 2: refund
    bool public hacked;

    constructor() {
        closeTime = block.timestamp + 30 days;
        owner = msg.sender;
    }

    function invest(uint256 amount) public {
        require(phase == 0 && raised < goal);
        deposits[msg.sender] += amount;
        raised += amount;
    }

    function setPhase(uint256 newPhase) public {
        require(
            (newPhase == 1 && raised >= goal) ||
                (newPhase == 2 && raised < goal && block.timestamp >= closeTime)
        );
        phase = newPhase;
    }

    function withdraw() public {
        require(phase == 1);
        if (msg.sender != owner) hacked = true;
    }

    function refund() public {
        require(phase == 2);
        deposits[msg.sender] = 0;
    }
}

contract Handler is Test {
    Crowdsale target;

    constructor(Crowdsale target_) {
        target = target_;
    }

    function invest(address investor, uint256 amount) public {
        amount = bound(amount, 100 * 10**18, 1000 * 10**18);
        vm.prank(investor);
        target.invest(amount);
    }

    function setPhase(uint256 phase) public {
        phase = bound(phase, 0, 2);
        target.setPhase(phase);
    }

    function withdraw(address owner) public {
        vm.prank(owner);
        target.withdraw();
    }
}

contract CrowdsaleTest is Test {
    Crowdsale target;
    Handler handler;

    function setUp() public {
        target = new Crowdsale();
        handler = new Handler(target);
        targetContract(address(handler));
    }

    /// forge-config: default.invariant.depth = 1000
    function invariant_hacked() public view {
        assertFalse(target.hacked());
    }
}
