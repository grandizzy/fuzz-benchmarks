// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test, console} from "forge-std/Test.sol";

contract FunWithNumbers {
    uint256 public constant tokensPerEth = 10;
    uint256 public constant weiPerEth = 1e18;
    mapping(address => uint256) public balances;
    bool public found;

    function buyTokens(uint256 amount) public payable {
        uint256 tokens = (amount / weiPerEth) * tokensPerEth; // convert wei to eth, then multiply by token rate
        balances[msg.sender] += tokens;
    }

    function sellTokens(uint256 tokens) public {
        require(balances[msg.sender] >= tokens && tokens != 0);
        uint256 eth = tokens / tokensPerEth;
        balances[msg.sender] -= tokens;
        uint256 tokensReceived = eth * weiPerEth;
        // sequence found if no tokens received
        found = tokensReceived == 0;
    }
}

contract FunWithNumbersTest is Test {
    FunWithNumbers target;

    function setUp() public {
        target = new FunWithNumbers();
    }

    function invariant_fun_with_numbers_not_found() public view {
        assertFalse(target.found());
    }

    function testReproduceFunWithNumbersSequence() public {
        target.buyTokens(1000000000000000000);
        target.sellTokens(6);
        assertTrue(target.found());
    }
}
