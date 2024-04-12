### Basic

#### :white_check_mark: Array mutation

- Echidna (`echidna tests/solidity/basic/array-mutation.sol`)

```
echidna_mutated: failed!💥  
  Call sequence:
    C.f("abcdef123\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\188")
Traces: 
Unique instructions: 208
Unique codehashes: 1
Corpus size: 1
Seed: 7154976317742601675
```

- Foundry (`forge test --mc ArrayMutation`)

```
Failing tests:
Encountered 1 failing test in test/basic/array-mutation.t.sol:ArrayMutationTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x00000000000000000000000000000000000007a4 addr=[test/basic/array-mutation.t.sol:MutateArrayTarget]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=fuzz_array(bytes32) args=[0x616263646566313232ffffffffffffffffffffffffffffffffffffffffffffff]
 invariant_array_mutated() (runs: 256, calls: 3827, reverts: 0)
```

#### :white_check_mark: Dynamic Array mutation

- Echidna (`echidna tests/solidity/basic/array-mutation.sol`)

```
echidna_mutated: failed!💥  
  Call sequence:
    C.f("abcdef123\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\188")
Traces: 
Unique instructions: 208
Unique codehashes: 1
Corpus size: 1
Seed: 7154976317742601675
```

- Foundry (`forge test --mc DArrayMutation`)

```
Failing tests:
Encountered 1 failing test in test/basic/darray-mutation.t.sol:DArrayMutationTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x0000000000000000000000000000000000000C2e addr=[test/basic/darray-mutation.t.sol:MutateDArrayTarget]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=fuzz_darray(bytes32) args=[0x6162636465663132330000000000000000000000000000000000000000000013]
 invariant_mutate_darray() (runs: 256, calls: 3839, reverts: 0)
```

#### :white_check_mark: Construct

- Echidna (`echidna tests/solidity/basic/construct.sol`)

```
echidna_construct: failed!💥  
  Call sequence:
    C.f()

Traces: 

Unique instructions: 116
Unique codehashes: 1
Corpus size: 1
Seed: 5837106131762211404
```

- Foundry (`forge test --mc ConstructTest`)

```
Failing tests:
Encountered 1 failing test in test/basic/construct.t.sol:ConstructTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x00000000000000000000000000000000000006A0 addr=[test/basic/construct.t.sol:C]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=f() args=[]
 invariant_construct() (runs: 256, calls: 3826, reverts: 0)
 ```

#### :white_check_mark: Immutable

- Echidna (`echidna tests/solidity/basic/immutable.sol`)

```
echidna_test: failed!💥  
  Call sequence:
    C.f()

Traces: 

Unique instructions: 63
Unique codehashes: 1
Corpus size: 1
Seed: 5072587281934352320
```

- Foundry (`forge test --mc ImmutableTest`)

```
Failing tests:
Encountered 1 failing test in test/basic/immutable.t.sol:ImmutableTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x0000000000000000000000000000000000000118 addr=[test/basic/immutable.t.sol:Immutable]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=f() args=[]
 invariant_immutable() (runs: 256, calls: 3826, reverts: 0)
 ```

#### :white_check_mark: Immutable2

- Echidna (`echidna tests/solidity/basic/immutable-2.sol`)

```
echidna_test: failed!💥  
  Call sequence:
    C.set(1)

Traces: 
call 0x62d69f6867A0A084C6d313943dC22023Bc263691::state() (/home/george/work/echidna_repo/tests/solidity/basic/immutable-2.sol:13)
 └╴← (false)

Unique instructions: 451
Unique codehashes: 2
Corpus size: 1
Seed: 4124105840271785401
```

- Foundry (`forge test --mc Immutable2Test`)

```
Failing tests:
Encountered 1 failing test in test/basic/immutable.t.sol:Immutable2Test
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x80e75891197fAC493A0d8D1Ef61677427784aA55 addr=[test/basic/immutable.t.sol:Immutable2]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=set(uint256) args=[1]
 invariant_immutable2() (runs: 256, calls: 3833, reverts: 3551)
 ```

#### :white_check_mark: Library

- Foundry (`forge test --mc ContractWithLibTest`)

```
Failing tests:
Encountered 1 failing test in test/basic/library.t.sol:ContractWithLibTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x000000000000000000000000000000000000052a addr=[test/basic/library.t.sol:ContractWithLib]0xFEfC6BAF87cF3684058D62Da40Ff3A795946Ab06 calldata=set() args=[]
 invariant_library_call() (runs: 256, calls: 3826, reverts: 0)
 ```

#### :white_check_mark: Multisender

- Foundry (`forge test --mc MultisenderTest`)

```
Failing tests:
Encountered 1 failing test in test/basic/multisender.t.sol:MultisenderTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x0000000000000000000000000000000000000001 addr=[test/basic/multisender.t.sol:Multisender]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=s1() args=[]
                sender=0x0000000000000000000000000000000000000003 addr=[test/basic/multisender.t.sol:Multisender]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=s3() args=[]
                sender=0x0000000000000000000000000000000000000002 addr=[test/basic/multisender.t.sol:Multisender]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=s2() args=[]
 invariant_multisenders() (runs: 256, calls: 3839, reverts: 2540)
 ```

#### :white_check_mark: Push long

- Echidna (`echidna --test-mode assertion tests/solidity/basic/push_long.sol`)

```
test_long_5(): failed!💥  
  Call sequence:
    TEST.push_1()
    TEST.push_1()
    TEST.push_1()
    TEST.push_1()
    TEST.turn_on_length_checking()
    TEST.push_1()
    TEST.test_long_5()

Traces:

push_1(): passing
turn_off_length_checking(): passing
turn_on_length_checking(): passing
AssertionFailed(..): passing

Unique instructions: 207
Unique codehashes: 1
Corpus size: 1
Seed: 5007364529916031582
```

- Foundry (`forge test --mc PushLong`)

```
Failing tests:
Encountered 1 failing test in test/basic/push-long.t.sol:PushLongTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x48A63C8D3D8f2c43C8B56F2F12a9b7FB4941C530 addr=[test/basic/push-long.t.sol:PushLongTarget]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=turn_on_length_checking() args=[]
                sender=0x000000000000000000000000000000000000079C addr=[test/basic/push-long.t.sol:PushLongTarget]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=push_1() args=[]
                sender=0x0000000000000000000000000000000000000B0b addr=[test/basic/push-long.t.sol:PushLongTarget]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=push_1() args=[]
                sender=0x0000000000000000000000000000000000000B65 addr=[test/basic/push-long.t.sol:PushLongTarget]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=push_1() args=[]
                sender=0x00000000000000000000000000000000000000C4 addr=[test/basic/push-long.t.sol:PushLongTarget]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=push_1() args=[]
                sender=0x0000000000000000000000000000000000000004 addr=[test/basic/push-long.t.sol:PushLongTarget]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=push_1() args=[]
 invariant_test_long_5() (runs: 256, calls: 3836, reverts: 0)
```

#### :white_check_mark: Fail on revert

- Echidna (`echidna -tests/solidity/basic/revert.sol`)

```
echidna_fails_on_revert: failed!💥  
  Call sequence:
    C.f(-1,0x0,0xdeadbeef)

Traces: 

Unique instructions: 213
Unique codehashes: 1
Corpus size: 1
Seed: 4360257448405569666
```

- Foundry (`forge test --mc FailOnRevertTest`)

```
Failing tests:
Encountered 1 failing test in test/basic/revert.t.sol:FailOnRevertTest
[FAIL. Reason: EvmError: Revert]
        [Sequence]
                sender=0x000000000000000000000000000000000000000d addr=[test/basic/revert.t.sol:FailOnRevert]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=f(int256,address,address) args=[-1, 0xf4E9DA973D03454635139B2DF48AFE1a836Ba9BE, 0xBbbf3169215b8CDa6f730C56959783E9f1626984]
                sender=0x0000000000000000000000000000000000000b73 addr=[test/basic/revert.t.sol:FailOnRevert]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=failOnrevert() args=[]
 invariant_fail_on_revert() (runs: 1, calls: 2, reverts: 1)
```

#### :white_check_mark: Always true

- Echidna (`echidna tests/solidity/basic/true.sol`)

```
echidna_true: passing

Unique instructions: 93
Unique codehashes: 1
Corpus size: 2
Seed: 892903217539378304
```

- Foundry (`forge test --mc AlwaysTrueTest`)

```
[PASS] invariant_always_true() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 328.33ms (325.83ms CPU time)
```
