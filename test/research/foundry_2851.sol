// SPDX-License-Identifier: MIT OR Apache-2.0
import "forge-std/Test.sol";
pragma solidity ^0.8.1;

contract Backdoor {
    uint256 public number = 1;

    function backdoor(uint256 newNumber) public payable {
        uint256 x = newNumber - 1;
        if (x == 6912213124124531) {
            number = 0;
        }
    }
}

contract BackdoorTest is Test {
    Backdoor back;

    function setUp() public {
        back = new Backdoor();
    }

    function invariantNotZero() public {
        assertEq(back.number(), 1);
    }
}
