### Assert

#### :white_check_mark: Direct Assert

- Echidna (`echidna --test-mode assertion tests/solidity/assert/assert-0.8.sol`)

```
direct_assert(int256): failed!💥  
  Call sequence:
    Test.direct_assert(0)

Traces: 

f(uint256): passing
g(): passing
AssertionFailed(..): passing

Unique instructions: 277
Unique codehashes: 1
Corpus size: 3
Seed: 4961374932231313837
```

- Foundry (`forge test --mc ContractWithDirectAssertTest`)

```
[FAIL. Reason: panic: assertion failed (0x01)]
        [Sequence]
                sender=0x0000000000000000000000000000000000000b52 addr=[test/assert/assert-0.8.t.sol:ContractWithAssert]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=direct_assert(int256) args=[0]
 invariant_direct_assertion_failure() (runs: 1, calls: 1, reverts: 1)
```

#### :white_check_mark: Internal Assert

- Echidna (`echidna --test-mode assertion tests/solidity/assert/assert.sol`)

```
internal_assert(uint256): failed!💥  
  Call sequence:
    Test.internal_assert(129)

Traces: 

Unique instructions: 193
Unique codehashes: 1
Corpus size: 3
Seed: 8387724807326208845
```

- Foundry (`forge test --mc ContractWithInternalAssertTest`)

```
[FAIL. Reason: panic: assertion failed (0x01)]
        [Sequence]
                sender=0x000000000000000000000000000000000000076b addr=[test/assert/assert-0.8.t.sol:ContractWithInternalAssert]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=internal_assert(uint256) args=[16385633107485026702326161393 [1.638e28]]
 invariant_internal_assertion_failure() (runs: 1, calls: 1, reverts: 1)
```

#### :white_check_mark: Target config

- Echidna (`echidna --test-mode assertion tests/solidity/assert/conf.sol`)

```
c(): passing
AssertionFailed(..): passing

Unique instructions: 35
Unique codehashes: 1
Corpus size: 2
Seed: 31729858633749037

```

- Foundry (`forge test --mc TargeSetTest`)

```
[PASS] invariant_should_not_fail() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 306.95ms (304.54ms CPU time)
```

Note: `forge test --mc TargetNotSetTest` fails as `B.c()` function is called
