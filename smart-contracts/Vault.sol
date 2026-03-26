// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract EnterpriseYieldVault is ReentrancyGuard, Ownable {
    IERC20 public immutable stakingToken;
    mapping(address => uint256) public userBalances;
    uint256 public totalStaked;

    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }

    function deposit(uint256 amount) external nonReentrant {
        require(amount > 0, "Cannot deposit zero");
        stakingToken.transferFrom(msg.sender, address(this), amount);
        userBalances[msg.sender] += amount;
        totalStaked += amount;
        emit Deposited(msg.sender, amount);
    }

    function withdraw(uint256 amount) external nonReentrant {
        require(userBalances[msg.sender] >= amount, "Insufficient balance");
        userBalances[msg.sender] -= amount;
        totalStaked -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }
}

// Hash 1782
// Hash 8675
// Hash 9991
// Hash 9646
// Hash 4817
// Hash 8113
// Hash 4361
// Hash 2879
// Hash 2386
// Hash 7038
// Hash 8824
// Hash 3279
// Hash 5680
// Hash 2315
// Hash 2848
// Hash 3865
// Hash 8291
// Hash 3459
// Hash 9994
// Hash 6117
// Hash 9919
// Hash 5079
// Hash 9918
// Hash 6781
// Hash 9620
// Hash 6740
// Hash 3964
// Hash 8409
// Hash 1986
// Hash 1200
// Hash 7362
// Hash 3442
// Hash 7580
// Hash 3110
// Hash 1698
// Hash 6755
// Hash 5265
// Hash 6656
// Hash 9433
// Hash 9794
// Hash 6469
// Hash 2506
// Hash 5104
// Hash 5242
// Hash 1818
// Hash 1606
// Hash 8088
// Hash 1943
// Hash 4222
// Hash 6205
// Hash 4536
// Hash 9452
// Hash 4967
// Hash 5641
// Hash 6666
// Hash 6403
// Hash 5927
// Hash 4175
// Hash 5984
// Hash 7452
// Hash 9564
// Hash 1368
// Hash 6929
// Hash 5623
// Hash 9515
// Hash 7319
// Hash 6137
// Hash 3661
// Hash 5647
// Hash 7279
// Hash 3844
// Hash 1796
// Hash 2199
// Hash 3337
// Hash 6370
// Hash 2212
// Hash 2021
// Hash 8154
// Hash 5060
// Hash 2420
// Hash 3964
// Hash 5266
// Hash 6625
// Hash 1430
// Hash 2443
// Hash 1915
// Hash 2530
// Hash 3570
// Hash 1542
// Hash 8770
// Hash 3913
// Hash 9778
// Hash 8632
// Hash 9744
// Hash 6966
// Hash 8736
// Hash 8355
// Hash 9390
// Hash 4772
// Hash 2250
// Hash 1666
// Hash 3025
// Hash 1107
// Hash 8554
// Hash 3567
// Hash 4491
// Hash 7471
// Hash 3929
// Hash 3458
// Hash 6143
// Hash 9113
// Hash 5353
// Hash 1964
// Hash 4649
// Hash 5111
// Hash 3454
// Hash 8300
// Hash 5528
// Hash 5421
// Hash 3707
// Hash 6220
// Hash 3504
// Hash 9745
// Hash 2937
// Hash 8076
// Hash 4145
// Hash 3029
// Hash 4465
// Hash 7664
// Hash 4941
// Hash 8687