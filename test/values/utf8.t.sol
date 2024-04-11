// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

contract UTF8Test {
    bytes16 key = "\xf8";

    function testNonUTF8(string memory input) public {
        bytes memory x = bytes(input);
        if (x.length > 0) assert(key[0] != x[0]);
    }
}
