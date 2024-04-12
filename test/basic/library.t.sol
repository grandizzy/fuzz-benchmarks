// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.18;

import {Test} from "forge-std/Test.sol";

library TestLib {
    struct Storage {
        bool flag;
    }

    function set(Storage storage st) public {
        st.flag = true;
    }
}

contract ContractWithLib {
    using TestLib for TestLib.Storage;
    TestLib.Storage st;

    function set() public {
        st.set();
    }

    function getFlag() external view returns (bool) {
        return st.flag;
    }
}

contract ContractWithLibTest is Test {
    ContractWithLib target;

    function setUp() public {
        target = new ContractWithLib();
    }

    function invariant_library_call() public view {
        assertFalse(target.getFlag());
    }
}
