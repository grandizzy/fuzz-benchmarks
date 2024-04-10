### ABIv2

#### :white_check_mark: Ballot

- Echidna (`echidna tests/solidity/abiv2/Ballot.sol`)

```
echidna_test: failed!💥  
  Call sequence:
    Ballot.add_voter((87672771937923, true, 0x0, 4))
Traces: 
Unique instructions: 440
Unique codehashes: 1
Corpus size: 1
Seed: 7100943233176655135
```

- Foundry (`forge test --mc BallotTest`)

```
Failing tests:
Encountered 1 failing test in test/abiv2/Ballot.t.sol:BallotTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x000000000000000000000000000000000000009F addr=[test/abiv2/Ballot.t.sol:Ballot]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=add_voter((uint256,bool,address,uint256)) args=[Voter({ weight: 115792089237316195423570985008687907853269984665640564039457584007913129639935 [1.157e77], voted: true, delegate: 0xD8947c051D2e82C358Dd0BE71C6726807C8CfA04, vote: 3 })]
 invariant_add_voter() (runs: 256, calls: 3829, reverts: 0)
```

#### :no_entry_sign: Dynamic

- Echidna (`echidna tests/solidity/abiv2/Dynamic.sol`)

```
echidna_test: failed!💥  
  Call sequence:
    Dynamic.yolo((0, "yolo", 0x0))
Traces: 
Unique instructions: 733
Unique codehashes: 1
Corpus size: 1
Seed: 6819242683827791914
```

- Foundry (`forge test --mc DynamicTest`)

```
[PASS] invariant_dynamic() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 785.33ms (782.52ms CPU time)
```

#### :no_entry_sign: Dynamic2

- Echidna (`echidna tests/solidity/abiv2/Dynamic2.sol`)

```
echidna_test: failed!💥  
  Call sequence:
    Dynamic.yolo((0, "yolo", 0x0))
Traces: 
Unique instructions: 733
Unique codehashes: 1
Corpus size: 1
Seed: 6819242683827791914
```

- Foundry (`forge test --mc Dynamic2Test`)

```
[PASS] invariant_dynamic() (runs: 256, calls: 3840, reverts: 0)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 785.33ms (782.52ms CPU time)
```

#### :white_check_mark: MultiTuple

- Echidna (`echidna tests/solidity/abiv2/MultiTuple.sol`)

```
echidna_test: failed!💥  
  Call sequence:
    C.f((("")),(("")))

Traces: 
Unique instructions: 405
Unique codehashes: 1
Corpus size: 1
Seed: 3918361463246593139
```

- Foundry (`forge test --mc MultiTupleTest`)

```
Failing tests:
Encountered 1 failing test in test/abiv2/MultiTuple.t.sol:MultiTupleTest
[FAIL. Reason: assertion failed]
        [Sequence]
                sender=0x0000000000000000000000000000000000000004 addr=[test/abiv2/MultiTuple.t.sol:MultiTuple]0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f calldata=f(((bytes)),((bytes))) args=[S({ t: T({ bs: 0x56fc339d4ed97fd38fa17fbeac0071b31b44849dae49a378fb3c1c22e7dc5783bda41e30348a3edd327eb73fe5c0cabbc485ffeeaefcfb6bd50d1dea77f56ebbd53b50ff0912ffa5569c304ea28df351c085938064d68605725173e4cd }) }), S({ t: T({ bs: 0x79599af98fc8b82f69506f0afe262916b567ea2d13f292e802fd40f4d52b796e484f456623e31ee5c92b57c457849fbf580579c7a8c0398eb2cda60d052b14da664e445c93621622e1ac21a2098934992a0307bef7c6 }) })]
 invariant_multi_tuple() (runs: 256, calls: 3826, reverts: 0)
```
