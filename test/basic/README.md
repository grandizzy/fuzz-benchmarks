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
