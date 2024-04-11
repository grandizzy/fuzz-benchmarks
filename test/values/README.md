### Values

#### :white_check_mark: Constants

- Echidna (`echidna tests/solidity/values/constants.sol`)

```
echidna_found_large: failed!💥  
  Call sequence:
    Constants.find(11234567890123456789012345678901234560)

Traces: 

echidna_found: failed!💥  
  Call sequence:
    Constants.find(1447)

Traces: 

Unique instructions: 206
Unique codehashes: 1
Corpus size: 2
Seed: 5358816162973203010
```

- Foundry (`forge test --mc ConstantsTest`)

```
Failing tests:
Encountered 2 failing tests in test/values/constants.sol:ConstantsTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x5aa74B8EF0bc1A8485c90BF9eaEee5CD70e1210a addr=[test/values/constants.sol:Constants]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=find(int256) args=[1447]
 invariant_found() (runs: 256, calls: 3840, reverts: 0)
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x00000000000000000000000000000000000004e1 addr=[test/values/constants.sol:Constants]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=find(int256) args=[11234567890123456789012345678901234560 [1.123e37]]
 invariant_found_large() (runs: 256, calls: 3839, reverts: 0)
```

#### :no_entry_sign: Constants2

- Echidna (`echidna tests/solidity/values/constants2.sol`)

```
echidna_found32: failed!💥  
  Call sequence:
    ConstantsBytes32.find("test\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL\NUL")

Traces: 

Unique instructions: 144
Unique codehashes: 1
Corpus size: 1
Seed: 377289957988878278
```

- Foundry (`forge test --mc ConstantsBytes32`)

```
Ran 1 test for test/values/constants2.sol:ConstantsBytes32Test
[PASS] invariant_found32() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 377.63ms (375.07ms CPU time)
```

#### :white_check_mark: Constants3

- Echidna (`echidna tests/solidity/values/constants3.sol`)

```
echidna_found_sender: failed!💥  
  Call sequence:
    ConstantsAddress.find(0x10000)

Traces: 

Unique instructions: 158
Unique codehashes: 1
Corpus size: 1
Seed: 2542439492116109195
```

- Foundry (`forge test --mc ConstantsAddressTest`)

```
Failing tests:
Encountered 1 failing test in test/values/constants3.t.sol:ConstantsAddressTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x000000000000000000000000000000000000079D addr=[test/values/constants3.t.sol:ConstantsAddress]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=find(address) args=[0x000000000000000000000000000000000000079D]
 invariant_found_sender() (runs: 256, calls: 3836, reverts: 0)
```

#### :no_entry_sign: Create

- Echidna (`echidna --contract C tests/solidity/values/create.sol`)

```
echidna_state: failed!💥  
  Call sequence:
    C.f(0xb4c79dab8f259c7aee6e5b2aa729821864227e84)
    C.c()
    C.f(0x62d69f6867a0a084c6d313943dc22023bc263691)

Traces: 

Unique instructions: 324
Unique codehashes: 1
Corpus size: 2
Seed: 4314082609132092580
```

- Foundry (`forge test --mc CreateTest`)

```
[PASS] invariant_state() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 396.87ms (394.89ms CPU time)
```

Note: sequence is found when limiting number of fuzzedd addresses by using `max_calldata_fuzz_dictionary_addresses = 1`

```
Failing tests:
Encountered 1 failing test in test/values/create.t.sol:CreateTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0xdc9ad73DcFcd269635eF104e5EeF6a59420d6a98 addr=[test/values/create.t.sol:C]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=c() args=[]
                sender=0x00000000000000000000000000000000000002b9 addr=[test/values/create.t.sol:C]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=f(address) args=[0x037eDa3aDB1198021A9b2e88C22B464fD38db3f3]
                sender=0x00000000000000000000000000000000000000e7 addr=[test/values/create.t.sol:C]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=f(address) args=[0x104fBc016F4bb334D775a19E8A6510109AC63E00]
 invariant_state() (runs: 256, calls: 3839, reverts: 0)
```

#### :white_check_mark: Dynamic array

- Echidna (`echidna --contract C tests/solidity/values/darray.sol`)

```
echidna_darray: failed!💥  
  Call sequence:
    C.add_darray([0x123456])

Traces: 

Unique instructions: 442
Unique codehashes: 1
Corpus size: 1
Seed: 4123056987548917734
```

- Foundry (`forge test --mc CreateTest`)

```
Failing tests:
Encountered 1 failing test in test/values/darray.t.sol:DArrayTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x83aAd5883cAD6071AE4BD064068A0Fb4f00A8A1B addr=[test/values/darray.t.sol:C]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=add_darray(address[]) args=[[0x0000000000000000000000000000000000000184, 0x000000000000000000000000000000000000003b, 0x000000000000000000000000000000001865C57C, 0x0000000000000000000000000000000000000075, 0x0000000000000000000000000000006970667359, 0x00000064736F6C63430008120033a26469706674, 0x000000000000000000000000000000004e487b72, 0x0000000000000000000000000000000000000280, 0x0000000000000000000000000000006970667358, 0x00000000000000000000000000000000000001aa, 0x0000000000000000000000000000000000000350, 0x0000000000000000000000000000000000000c31, 0x0000000000000000000000000000000000000AC7, 0x0000000000000000000000000000000000000938, 0x0000000000000000000000000000000000000384, 0x0000000000000000000000000000000000000147, 0x0000000000000000000000000000000000000162, 0x0000000000000000000000000000000000000012, 0x0000000000000000000000000000000000123456, 0x000000000000000000000000000000000000019B, 0x0000000000000000000000000000000000000788, 0x0000000000000000000000000000000000000164, 0x0000000000000000000000000000000000000003, 0x000000000000000000000000000000000000070F, 0x00000000000000000000000000000000BA414fA5, 0x000000000000000000000000000000000000017b, 0x0000000000000000000000000000000000000821, 0x0000000000000000000000010000000000000000, 0x0000000000000000000000000000000000000c45, 0x00000000000000000000000000000000000008D7, 0x00000000000000000000000000000000000004EB, 0x000000000000000000000000000000000000099E, 0x0000000000000000000000000000000000000A84, 0x00000000000000000000000000000000000000DE, 0x0000000000000000000000000000000000123457, 0x000000000000000000000000005884a98fCe6207, 0x0000000000000000000000000000000066d9A9A0, 0x000000000000000000000000000000000000081f, 0x0000000000000000000000000000000000000c6c, 0x0000000000000000000000000000000085226C82, 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D, 0x00000000000000000000000000000000000008D7, 0x000000000000000000000000000000000000001c, 0x0000000000000000000000000000000000000787, 0x0000000000000000000000000000000000000c8d, 0x0000000000000000000000000000000000000BFb, 0x000000000000000000000000000000000000016a, 0x000000000000000000000000000000000000021b, 0x00000000000000000000000000000000000000f7, 0x0000000000000000000000000000000085226C81, 0x00000000000000000000000000000000000001bd, 0x000000000000000000000000000000001ed7831b, 0x000000000000000000000000000000000000017b, 0x0000000000000000000000000000000000000983, 0x000000000000000000000000000000000000024a, 0x00000000000000000000000000000000000006a1, 0x0000000000000000000000000000000000000191, 0x00000000000000000000000000000000667F9d6f, 0x00000000000000000000000000000000000001bB, 0x00000000000000000000000000000000000000fd, 0x00000000000000000000000000000000000002b9, 0x000000000000000000000000000000000000037c, 0x7109709ECFA91a80626ff3989d68f67F5B1dd12c, 0x000000000000000000000000000000000000027f, 0x000000000000000000000000005884a98fCe6207, 0x00000000000000000000000000000000000002BA, 0x00000000000000000000000000000000667F9d6f, 0x00000000000000000000000000000000000001e0, 0x0000000000000000000000000000000000000787, 0x0000000000000000000000000000000000000C64, 0x0000000000000000000000000000000000000764, 0x0000000000000000000000000000000000000084, 0x000000000000000000000000000000000000064e, 0x0000000000000000000000000000000000000049, 0x0000000000000000000000000000000000000100, 0x00000000000000000000000000000000000004c1, 0x0000000000000000000000000000000000000128, 0x000000000000000000000000000000000000021c, 0x0000000000000000000000000000000000000bFd, 0x00000000000000000000000000000000000005f2, 0x0000000000000000000000000000000000000caE, 0x000000000000000000000000000000000000019B, 0x0000000000000000000000000000000000000366, 0x15DEB798bB3E4dFa0139DFA1B3D433cC23B72f01, 0x00000000000000000000000000000000000008D8, 0x0000000000000000000000000000000000000ac9, 0x00000000000000000000000000000000000001ac, 0x0000000000000000000000000000000000000004, 0x00000000000000000000000000000000000009ec, 0x00000000000000000000000000000000000004c0, 0x00000000000000000000000000000000000009f9, 0x0000000000000000000000000000000000000B91, 0x000000000000000000000000000000000000061c, 0x00000000000000000000000000000000E20C9f72, 0x000000000000000000000000000000001ed7831C, 0x0000000000000000000000000000000000000c30, 0x000000000000000000000000000000008d33Fc63, 0x000000000000000000000000000000003E5e3c23, 0x0000000000000000000000000000000000000787, 0x00000000000000000000000000000000000001A7, 0x0000000000000000000000000000000000000150, 0x00000000000000000000000000000000000000f3, 0x00000000000000000000000000000000000000E6, 0x0000000000000000000000000000000000000C6a, 0x000000000000000000000000000000000000066B, 0x0000000000000000000000000000000000000c32, 0x0000000000000000000000000000000000000305, 0x00000000000000000000000000000000000009f8, 0x0000000000000000000000000000000000000BfC, 0x00000000000000000000000000000000000001bd, 0x00000000000000000000000000000000000000fc, 0x00000000000000000000000000000000000000fb, 0x000000000000000000000000000000000000064e, 0x0000000000000000000000000000000000000c6c, 0x000000000000000000000000000000000000008b, 0x00000000000000000000000000000000000002d8, 0x00000000000000000000000000000000000000D3, 0x0000000000000000000000000000000000000009, 0x000000000000000000000000000000000000021c, 0x00000000000000000000000000000000000009f8, 0x000000000000000000000000000000000000010D, 0x0000000000000000000000000000000000000151, 0x0000000000000000000000000000000000000BA0, 0x0000000000000000000000000000000000000a21, 0x7109709ECfa91a80626fF3989D68f67F5b1DD12D, 0x0000000000000000000000000000000000000557, 0x00000000000000000000000000000000A5982885, 0x000000000000000000000000000000002aDE3881, 0x0000000000000000000000000000000000000804, 0x00000000000000000000000000000000000007A7, 0x0000000000000000000000000000000000000016, 0x000000000000000000000000000000000000099F, 0x0000000000000000000000000000000000000833, 0x00000000000000000000000000000000000001bB, 0x00000000000000000000000000000000000004eC, 0x0000000000000000000000000000000000000080]]
 invariant_state() (runs: 256, calls: 3834, reverts: 0)
```

#### :white_check_mark: Extreme

- Echidna (`echidna --test-mode assertion tests/solidity/values/extreme.sol`)

```
testMinInt16(int16): failed!💥  
  Call sequence:
    Test.testMinInt16(-32768)

Traces: 

testMinInt128(int128): failed!💥  
  Call sequence:
    Test.testMinInt128(-170141183460469231731687303715884105728)

Traces: 

testMinInt64(int64): failed!💥  
  Call sequence:
    Test.testMinInt64(-9223372036854775808)

Traces: 

testMinInt32(int32): failed!💥  
  Call sequence:
    Test.testMinInt32(-2147483648)

Traces: 

testMinInt8(int8): failed!💥  
  Call sequence:
    Test.testMinInt8(-128)

Traces: 

AssertionFailed(..): passing

Unique instructions: 602
Unique codehashes: 1
Corpus size: 3
Seed: 714645461690686622

```

- Foundry (`forge test --mc ExtremeTest`)

```
Failing tests:
Encountered 5 failing tests in test/values/extreme.t.sol:ExtremeTest
[FAIL. Reason: panic: assertion failed (0x01); counterexample: calldata=0xa777ae54ffffffffffffffffffffffffffffffff80000000000000000000000000000000 args=[-170141183460469231731687303715884105728 [-1.701e38]]] testMinInt128(int128) (runs: 282, μ: 322, ~: 322)
[FAIL. Reason: panic: assertion failed (0x01); counterexample: calldata=0x4f483627ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8000 args=[-32768 [-3.276e4]]] testMinInt16(int16) (runs: 11, μ: 316, ~: 316)
[FAIL. Reason: panic: assertion failed (0x01); counterexample: calldata=0xc20754c4ffffffffffffffffffffffffffffffffffffffffffffffffffffffff80000000 args=[-2147483648 [-2.147e9]]] testMinInt32(int32) (runs: 75, μ: 315, ~: 315)
[FAIL. Reason: panic: assertion failed (0x01); counterexample: calldata=0xa8aef52dffffffffffffffffffffffffffffffffffffffffffffffff8000000000000000 args=[-9223372036854775808 [-9.223e18]]] testMinInt64(int64) (runs: 137, μ: 338, ~: 338)
[FAIL. Reason: panic: assertion failed (0x01); counterexample: calldata=0xebff4abcffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff80 args=[-128]] testMinInt8(int8) (runs: 28, μ: 359, ~: 359)
```

#### :white_check_mark: Large

- Echidna (`echidna tests/solidity/values/large.sol`)

```
echidna_large: failed!💥  
  Call sequence:
    C.set(115792089237316195423570985008687907853269984665640564039457584007913129639935)

Traces: 

Unique instructions: 118
Unique codehashes: 1
Corpus size: 1
Seed: 2772937090697865384
```

- Foundry (`forge test --mc LargeTest`)

```
Failing tests:
Encountered 1 failing test in test/values/large.t.sol:LargeTest
[FAIL. Reason: panic: arithmetic underflow or overflow (0x11)]
        [Sequence]
                sender=0x9b824132D7A24696F2b13Fd62E11feEd9596672D addr=[test/values/large.t.sol:C]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=set(uint256) args=[115792089237316195423570985008687907853269984665640564039457584007913129639935 [1.157e77]]
 invariant_large() (runs: 256, calls: 3833, reverts: 0)
```

#### :white_check_mark: Nearby mining

- Echidna (`echidna tests/solidity/values/nearbyMining.sol`)

```
echidna_findNearby: failed!💥  
  Call sequence:
    nearbyMining.f(181888880989308020)

Traces: 

Unique instructions: 123
Unique codehashes: 1
Corpus size: 1
Seed: 459367750246698198
```

- Foundry (`forge test --mc NearbyMiningTest`)

```
Failing tests:
Encountered 1 failing test in test/values/nearbyMining.t.sol:NearbyMiningTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x000000000000000000000000000000002ADe3880 addr=[test/values/nearbyMining.t.sol:NearbyMining]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=f(uint256) args=[181888880989308020 [1.818e17]]
 invariant_nearby_mining() (runs: 256, calls: 3830, reverts: 0)
```

#### :no_entry_sign: Now

- Echidna (`echidna tests/solidity/values/now.sol`)

```
echidna_now: failed!💥  
  Call sequence:
    C.set()
    C.guess(1524397568)

Traces: 

Unique instructions: 273
Unique codehashes: 1
Corpus size: 4
Seed: 2258373530910920556
```

- Foundry (`forge test --mc NowTest`)

```
[PASS] invariant_now() (runs: 256, calls: 3840, reverts: 618)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 332.47ms (329.98ms CPU time)
```

#### :no_entry_sign: Payable

- Echidna (`echidna tests/solidity/values/payable.sol`)

```
echidna_payable: failed!💥  
  Call sequence:
    C.payable_function() Value: 0x81

Traces: 

Unique instructions: 148
Unique codehashes: 1
Corpus size: 2
Seed: 7652821178361636030
```

- Foundry (`forge test --mc PayableTest`)

```
[PASS] invariant_payable() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 352.82ms (350.42ms CPU time)
```

#### :no_entry_sign: RConstants

- Echidna (`echidna tests/solidity/values/rconstants.sol`)

```
echidna_found: failed!💥  
  Call sequence:
    Constants.find(14674)

Traces: 

Unique instructions: 278
Unique codehashes: 1
Corpus size: 3
Seed: 8040259168632912209
```

- Foundry (`forge test --mc RConstantsTest`)

Note: suitable for fixtures feature

```
[PASS] invariant_found() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 366.48ms (364.12ms CPU time)
```

#### :no_entry_sign: Small values

- Echidna (`echidna tests/solidity/values/smallValues.sol`)

```
echidna_findSmall: failed!💥  
  Call sequence:
    smallValues.f(287)

Traces: 

Unique instructions: 126
Unique codehashes: 1
Corpus size: 2
Seed: 4338233787221587175
```

- Foundry (`forge test --mc SmallValuesTest`)

```
[PASS] invariant_find_small() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 366.48ms (364.12ms CPU time)
```

Note: passing with `depth = 1000` setting

```
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x0000000000000000000000000000000000000161 addr=[test/values/smallValues.t.sol:SmallValues]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=f(uint256) args=[287]
 invariant_find_small() (runs: 256, calls: 255551, reverts: 0)
```

#### :no_entry_sign: Time

- Echidna (`echidna tests/solidity/values/time.sol`)

```
echidna_timepassed: failed!💥  
  Call sequence:
    Time.mark() Time delay: 1 seconds Block delay: 1

Traces: 

echidna_moretimepassed: failed!💥  
  Call sequence:
    Time.mark() Time delay: 303345 seconds Block delay: 53910
    *wait* Time delay: 415353 seconds Block delay: 27404
    Time.mark() Time delay: 116188 seconds Block delay: 9920
    Time.mark() Time delay: 271149 seconds Block delay: 12053
    Time.mark() Time delay: 511822 seconds Block delay: 24987
    Time.mark() Time delay: 490446 seconds Block delay: 5952
    Time.mark() Time delay: 209930 seconds Block delay: 23885
    Time.mark() Time delay: 271957 seconds Block delay: 5023
    Time.mark() Time delay: 127251 seconds Block delay: 23885
    Time.mark() Time delay: 66543 seconds Block delay: 57086
    Time.mark() Time delay: 42305 seconds Block delay: 3448
    Time.mark() Time delay: 297507 seconds Block delay: 49415
    Time.mark() Time delay: 448552 seconds Block delay: 12053
    Time.mark() Time delay: 379552 seconds Block delay: 5237
    Time.mark() Time delay: 297507 seconds Block delay: 42229
    Time.mark() Time delay: 135921 seconds Block delay: 32147
    Time.mark() Time delay: 322386 seconds Block delay: 53166
    Time.mark() Time delay: 292304 seconds Block delay: 47212
    Time.mark() Time delay: 444463 seconds Block delay: 2512
    Time.mark() Time delay: 604791 seconds Block delay: 7323

Traces: 

Unique instructions: 48
Unique codehashes: 1
Corpus size: 1
Seed: 3672019953993257768
```

- Foundry (`forge test --mc TimeTest`)

```
[PASS] invariant_moretimepassed() (runs: 256, calls: 3840, reverts: 0)
[PASS] invariant_timepassed() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 2 passed; 0 failed; 0 skipped; finished in 404.92ms (767.51ms CPU time)
```

#### :no_entry_sign: UTF8

- Echidna (`echidna --test-mode assertion tests/solidity/values/utf8.sol`)

```
testNonUTF8(string): failed!💥  
  Call sequence:
    Test.testNonUTF8("\248")

Traces: 

AssertionFailed(..): passing

Unique instructions: 336
Unique codehashes: 1
Corpus size: 2
Seed: 5232973115180236935
```

- Foundry (`forge test --mc UTF8Test`)

```
[PASS] testNonUTF8(string) (runs: 100005, μ: 2729, ~: 2793)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 4.64s (4.64s CPU time)
```
