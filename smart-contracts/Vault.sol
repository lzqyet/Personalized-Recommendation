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