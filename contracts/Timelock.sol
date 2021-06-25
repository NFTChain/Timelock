pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TimeLock {
    uint256 public constant duration = 365 days;
    uint256 public immutable end;
    address payable public immutable owner;

    constructor(address payable _owner) {
        end = block.timestamp + duration;
        owner = _owner;
    }

    function deposit(address token, uint256 amount) external {
        IERC20(token).transferFrom(msg.sender, address(this), amount);
    }

    receive() external payable {}

    function withdraw(address token, uint256 amount) external {
        require(msg.sender == owner, "only owner");
        require(block.timestamp >= end, "too early");
        if (token == address(0)) {
            owner.transfer(amount);
        } else {
            IERC20(token).transfer(owner, amount);
        }
    }
}
