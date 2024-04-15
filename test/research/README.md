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

#### :white_check_mark: Crowdsale

- Foundry (`forge test --mc CrowdsaleTest`)

Note:  
configs to set depth to 1000 to catch failing sequence needed

```
    /// forge-config: default.invariant.depth = 1000
```

```
Failing tests:
Encountered 1 failing test in test/research/ilf_crowdsale.sol:CrowdsaleTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x00000000000000000000000000000000000008d5 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0x7F80C95dBd54FA21ced7A315b6BA37888AdCcbff, 1275169900567995278035420052745665669373227819380035883 [1.275e54]]
                sender=0xfffFFFfFFfFFfFffFffFffFffffFFfFFFfffFFE1 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0xE44E8e580a58429Cb453be0db0A2677898150B63, 115792089237316195423570985008687907853269984665640564039457584007913129639935 [1.157e77]]
                sender=0x0000000000000000000000000000000000000041 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0xa50d687bCBf80cE96974d29cD7babDd86963aC56, 115792089237316195423570985008687907853269984665640564039457584007913129639933 [1.157e77]]
                sender=0x2031323834373535353130323030313936353438 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0x00000000000000000000000000000000000001c2, 243]
                sender=0x0000000000000000000000000000000000000A6F addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0x5E640cfcA71B2fDd53DC630bD4EfEcc3b92e1F24, 2173362503081052799 [2.173e18]]
                sender=0xe315e768AEdE70d44993E12Ef4CFc37485c04B27 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0x1C4EF3AEC2fF69f5A07A57AD6185569242eD304f, 115792089237316195423570985008687907853269984665640564039457584007913129639932 [1.157e77]]
                sender=0x0000000000000000000000000000000000000ECF addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0x0000000000000000000000000000000000000fE7, 3147]
                sender=0x0000000000000000000000000000000000000Fe6 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0x0000000000000000000000000000000000000401, 4142]
                sender=0x0000000000000000000000000000000000000237 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0xe7Cc241576d9898cf35716572F7Ca21236c38b65, 2510724521397796163 [2.51e18]]
                sender=0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0x01d1B08E1F8D320ea5B5CD45bB848a1E946A85C0, 392026 [3.92e5]]
                sender=0x00000000000000000000000000000000000000C8 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=invest(address,uint256) args=[0x1E59C55BEF539A43726Ff9198b5F47b08fC04090, 115792089237316195423570985008687907853269984665640564039457584007913129639933 [1.157e77]]
                sender=0x00000000000000000000000000000000000003A0 addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=setPhase(uint256) args=[19251713690932 [1.925e13]]
                sender=0x0000000000000000000000000000000000000cEE addr=[test/research/ilf_crowdsale.sol:Handler]0x2e234DAe75C793f67A35089C9d99245E1C58470b calldata=withdraw(address) args=[0xA36cd83E82b18fF06B6e06D412CD9EbF696ff439]
 invariant_hacked() (runs: 256, calls: 255056, reverts: 145797)
```

#### :white_check_mark: Solcfuzz fun with number

- Foundry (`forge test --mc FunWithNumbersTest`)

```
Failing tests:
Encountered 1 failing test in test/research/solcfuzz_funwithnumbers.t.sol:FunWithNumbersTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x0000000000000000000000000000000000000755 addr=[test/research/solcfuzz_funwithnumbers.t.sol:FunWithNumbers]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=buyTokens(uint256) args=[115792089237316195423570985008687907853269984665640564039457584007913129639935 [1.157e77]]
                sender=0x0000000000000000000000000000000000000755 addr=[test/research/solcfuzz_funwithnumbers.t.sol:FunWithNumbers]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=sellTokens(uint256) args=[3]
 invariant_fun_with_numbers_not_found() (runs: 256, calls: 3836, reverts: 1907)
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

Note:

- sequence can be caught by using fixtures

```
Failing tests:
Encountered 1 failing test in test/research/vera_dschief.t.sol:SimpleDSChiefTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x5AF940eE0911386bf0ABD122Dc6c03D87B076B08 addr=[test/research/vera_dschief.t.sol:SimpleDSChief]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=lock(uint256) args=[475317125384186903101321268780756146974315014978586952145309064 [4.753e62]]
                sender=0x5AF940eE0911386bf0ABD122Dc6c03D87B076B08 addr=[test/research/vera_dschief.t.sol:SimpleDSChief]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=voteSlate(bytes32) args=[0x84d0f09009a1ea5ee68aee38236d9fdc4e8a0690209c5a196c7397121b1d0394]
                sender=0xAB151c8D305D1ba43c25329c71fBc6c82f3b7c87 addr=[test/research/vera_dschief.t.sol:SimpleDSChief]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=voteYays(address) args=[0x3F48d6B16b97c50512CAcdf03696039F115793cd]
                sender=0x5AF940eE0911386bf0ABD122Dc6c03D87B076B08 addr=[test/research/vera_dschief.t.sol:SimpleDSChief]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=checkInvariant() args=[]
 invariant_check_dschief() (runs: 256, calls: 127531, reverts: 8685)
 ```
