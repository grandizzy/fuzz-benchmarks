// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract SimpleDSChief {
    mapping(bytes32 => address) public slates;
    mapping(address => bytes32) public votes;
    mapping(address => uint256) public approvals;
    mapping(address => uint256) public deposits;

    bool public hacked = false;

    function lock(uint256 wad) public {
        deposits[msg.sender] = add(deposits[msg.sender], wad);
        addWeight(wad, votes[msg.sender]);
    }

    function free(uint256 wad) public {
        deposits[msg.sender] = sub(deposits[msg.sender], wad);
        subWeight(wad, votes[msg.sender]);
    }

    function voteYays(address yay) public returns (bytes32) {
        bytes32 slate = etch(yay);
        voteSlate(slate);

        return slate;
    }

    function etch(address yay) public returns (bytes32 slate) {
        bytes32 hash = keccak256(abi.encodePacked(yay));

        slates[hash] = yay;

        return hash;
    }

    function voteSlate(bytes32 slate) public {
        uint256 weight = deposits[msg.sender];
        subWeight(weight, votes[msg.sender]);
        votes[msg.sender] = slate;
        addWeight(weight, votes[msg.sender]);
    }

    function addWeight(uint256 weight, bytes32 slate) internal {
        address yay = slates[slate];
        approvals[yay] = add(approvals[yay], weight);
    }

    function subWeight(uint256 weight, bytes32 slate) internal {
        address yay = slates[slate];
        approvals[yay] = sub(approvals[yay], weight);
    }

    function add(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require((z = x + y) >= x);
    }

    function sub(uint256 x, uint256 y) internal pure returns (uint256 z) {
        require((z = x - y) <= x);
    }

    function checkInvariant() public {
        bytes32 senderSlate = votes[msg.sender];
        address option = slates[senderSlate];
        uint256 senderDeposit = deposits[msg.sender];

        if (approvals[option] < senderDeposit) {
            hacked = true;
        }
    }
}

contract SimpleDSChiefTest is Test {
    SimpleDSChief dsChief;

    address[] public fixtureYay = [
        makeAddr("yay1"),
        makeAddr("yay2"),
        makeAddr("yay3")
    ];
    bytes32[] public fixtureSlate = [
        keccak256(abi.encodePacked(makeAddr("yay1"))),
        keccak256(abi.encodePacked(makeAddr("yay2"))),
        keccak256(abi.encodePacked(makeAddr("yay3")))
    ];

    function setUp() public {
        dsChief = new SimpleDSChief();
        targetContract(address(dsChief));
        targetSender(makeAddr("voter1"));
        targetSender(makeAddr("voter2"));
    }

    /// forge-config: default.invariant.depth = 500
    function invariant_check_dschief() public view {
        assertFalse(dsChief.hacked());
    }

    function testReproduceDSChiefBugSequence() public {
        address victim = makeAddr("victim");
        address attacker = makeAddr("attacker");
        address yay = makeAddr("yay");
        bytes32 slate = keccak256(abi.encodePacked(yay));

        vm.startPrank(victim);
        dsChief.lock(4370000);
        dsChief.voteSlate(slate);

        vm.startPrank(attacker);
        dsChief.voteYays(yay);

        vm.startPrank(victim);
        dsChief.checkInvariant();

        require(!dsChief.hacked(), "DSChief hacked");
    }
}

contract SimplifiedDSChief {
    mapping(bytes32 => address) public slates;
    bool everMatched = false;

    function etch(address yay) public returns (bytes32 slate) {
        bytes32 hash = keccak256(abi.encodePacked(yay));
        slates[hash] = yay;
        return hash;
    }

    function lookup(bytes32 slate, address nay) public {
        if (nay != address(0x0)) {
            everMatched = slates[slate] == nay;
        }
    }

    function wasEverMatched() public view returns (bool) {
        return everMatched;
    }
}

contract SimplifiedDSChiefCheckTest is Test {
    SimplifiedDSChief dsChief;

    function setUp() public {
        dsChief = new SimplifiedDSChief();
    }

    /// forge-config: default.invariant.depth = 1000
    function invariant_check_ever_matched() public view {
        assertFalse(dsChief.wasEverMatched());
    }
}

contract SimpleFindFromReturn {
    bool found = false;

    function seed() public returns (int256) {
        int256 mystery = 13337;
        return (1337 + mystery);
    }

    function find(int256 i) public {
        int256 mystery = 13337;
        if (i == 1337 + mystery) {
            found = true;
        }
    }

    function getFound() public view returns (bool) {
        return found;
    }
}

contract SimpleFindFromReturnTest is Test {
    SimpleFindFromReturn target;

    function setUp() public {
        target = new SimpleFindFromReturn();
    }

    function invariant_not_found() public view {
        assertFalse(target.getFound());
    }
}
