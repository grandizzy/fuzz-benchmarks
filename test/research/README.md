### Research

#### :white_check_mark: Bran bar

- Echidna (`echidna --test-mode assertion tests/solidity/research/bran_bar.sol`)

```
bar(uint256,uint256,uint256,uint256,uint256): failed!💥  
  Call sequence:
    C.bar(262837622344789843531474253329143548022115584571,682031646494013430162138818013452384240074697210545227607339,3886198371976676412271574596253694810162012,61225941813804946332230119114622905591,42)

Traces: 

AssertionFailed(..): passing

Unique instructions: 560
Unique codehashes: 1
Corpus size: 2
Seed: 1641768400428506761
```

- Foundry (`forge test --mc SimpleDSChiefTest`)

Note:  
configs to prevent test failing due to arithmetic underflow or overflow and to set runs to 1000 to catch failing sequence needed

```
    /// forge-config: default.invariant.fail-on-revert = false
    /// forge-config: default.invariant.runs = 10000
```

```
Failing tests:
Encountered 1 failing test in test/research/bran_bar.t.sol:BranBarTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x0000000000000000000000000000000000000838 addr=[test/research/bran_bar.t.sol:BranBar]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=testFuzzBar(uint256,uint256,uint256,uint256,uint256) args=[115792089237316195423570985008687907853269984665640564039457584007913129639934 [1.157e77], 578230240149368329169 [5.782e20], 48, 2, 42]
 invariant_check() (runs: 10000, calls: 149989, reverts: 23318)

```

#### :white_check_mark: Harvey baz

- Echidna (`echidna tests/solidity/research/harvey_baz.sol`)

```
echidna_all_states: failed!💥  
  Call sequence:
    Baz.baz(42,3,-3)
    Baz.baz(0,1,0)
    Baz.baz(0,0,0)
    Baz.baz(0,0,42)
    Baz.baz(11396323331869472339396296016851060375,3,-3)

Traces: 

Unique instructions: 424
Unique codehashes: 1
Corpus size: 3
Seed: 4939788057208767017
```

- Foundry (`forge test --mc HarveyBazTest`)

Note:  
configs to set depth to 5000 to catch failing sequence needed

```
    /// forge-config: default.invariant.depth = 5000
```

```
Failing tests:
Encountered 1 failing test in test/research/harvey_baz.t.sol:HarveyBazTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x0000000000000000000000000000000000000040 addr=[test/research/harvey_baz.t.sol:HarveyBaz]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=baz(int256,int256,int256) args=[420, 16, 3210]
                sender=0x00000000000000000000000000000000000000db addr=[test/research/harvey_baz.t.sol:HarveyBaz]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=baz(int256,int256,int256) args=[-466460595087503155870099225024165749863 [-4.664e38], -7, 2]
                sender=0x0000000000000000000000000000000000000145 addr=[test/research/harvey_baz.t.sol:HarveyBaz]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=baz(int256,int256,int256) args=[3, 57896044618658097711785492504343953926634992332820282019728792003956564819967 [5.789e76], -57896044618658097711785492504343953926634992332820282019728792003956564819968 [-5.789e76]]
                sender=0x0000000000000000000000000000000000000997 addr=[test/research/harvey_baz.t.sol:HarveyBaz]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=baz(int256,int256,int256) args=[71036242043089691939034831705338383692758256764183533723684721172464 [7.103e67], 7847968503579 [7.847e12], 0]
                sender=0x00000000000000000000000000000000fefFFfff addr=[test/research/harvey_baz.t.sol:HarveyBaz]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=baz(int256,int256,int256) args=[42, 74274746694490829609903699605539430845152191300780760184 [7.427e55], -57896044618658097711785492504343953926634992332820282019728792003956564819967 [-5.789e76]]
 invariant_check() (runs: 256, calls: 1279512, reverts: 142621)
```

#### :white_check_mark: Harvey foo

- Echidna (`echidna tests/solidity/research/harvey_baz.sol`)

```
echidna_assert: failed!💥  
  Call sequence:
    Foo.SetY(41)
    Foo.CopyY()
    Foo.IncX()
    Foo.Bar()

Traces: 

Unique instructions: 311
Unique codehashes: 1
Corpus size: 3
Seed: 5445128997940809361
```

- Foundry (`forge test --mc HarveyFooTest`)

Note:  
configs to set depth to 5000 to catch failing sequence needed

```
    /// forge-config: default.invariant.depth = 5000
```

```
Failing tests:
Encountered 1 failing test in test/research/harvey_foo.t.sol:HarveyFooTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x0000000000000000000000000000006970667357 addr=[test/research/harvey_foo.t.sol:HarveyFoo]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=SetY(int256) args=[42]
                sender=0x0000000000000000000000000000006970667357 addr=[test/research/harvey_foo.t.sol:HarveyFoo]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=CopyY() args=[]
                sender=0xAE82eF90772D777FFc4de76cE0003b9768626F1b addr=[test/research/harvey_foo.t.sol:HarveyFoo]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=Bar() args=[]
 invariant_check() (runs: 256, calls: 1275116, reverts: 11200)
```

#### :no_entry_sign: DSChief

- Echidna (`echidna --test-mode assertion tests/solidity/research/vera_dschief.sol`)

```

voteYays(address): passing
checkAnInvariant(): failed!💥  
  Call sequence, shrinking 4383/5000:
    SimpleDSChief.lock(4370000) from: 0x0000000000000000000000000000000000020000
    SimpleDSChief.voteSlate("\ESC\189\164\144\214\RSH\250A\143y\193\242\222\161\216x\177\143\255\&8\211|\230\193y(y\SO*\194\209") from: 0x0000000000000000000000000000000000020000 Time delay: 414579 seconds Block delay: 23722
    SimpleDSChief.voteYays(0x2fffffffd) from: 0x0000000000000000000000000000000000010000 Time delay: 156190 seconds Block delay: 60054
    SimpleDSChief.checkAnInvariant() from: 0x0000000000000000000000000000000000020000

Traces:

approvals(address): passing
etch(address): passing
slates(bytes32): passing
votes(address): passing
free(uint256): passing
lock(uint256): passing
voteSlate(bytes32): passing
deposits(address): passing
AssertionFailed(..): passing

Unique instructions: 1307
Unique codehashes: 1
Corpus size: 4
Seed: 3555496966892085736

```

- Foundry (`forge test --mc SimpleDSChiefTest`)

```
Ran 1 test for test/research/vera_dschief.t.sol:SimpleDSChiefTest
[PASS] invariant_check() (runs: 1, calls: 30000, reverts: 8339)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 19.10s (19.09s CPU time)
```
