// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

interface IEliteWorldVault {
    function initialize(address token, address pointToken) external;

    function deposit(address from, uint256 amount) external;

    function withdraw(
        address addressToken,
        address to,
        uint256 amount
    ) external;

    function exchangePoint(address from, uint256 amount) external;
}

contract EliteWorldVault is Initializable, OwnableUpgradeable {
    using SafeERC20Upgradeable for IERC20Upgradeable;

    address public token;
    address public point;

    function initialize(address _token, address _point) public initializer {
        token = _token;
        point = _point;
        __Ownable_init();
    }

    function withdraw(
        address addressToken,
        address to,
        uint256 amount
    ) external onlyOwner {
        IERC20Upgradeable(addressToken).safeTransfer(to, amount);
    }

    function deposit(address from, uint256 amount) external onlyOwner {
        IERC20Upgradeable(token).safeTransferFrom(from, address(this), amount);
    }

    function exchangePoint(address from, uint256 amount) external onlyOwner {
        IERC20Upgradeable(point).safeTransferFrom(from, address(this), amount);
    }
}
