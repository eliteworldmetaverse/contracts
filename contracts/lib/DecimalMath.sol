// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 * @title DecimalMath
 * @notice Functions for fixed point number with 18 decimals
 */

import "./SafeMath.sol";

library DecimalMath {
    using SafeMath for uint256;

    uint256 internal constant ONE = 10**18;
    uint256 internal constant ONE2 = 10**36;

    function mulFloor(uint256 target, uint256 d)
        internal
        pure
        returns (uint256)
    {
        return target.mul(d) / (10**18);
    }

    function mulCeil(uint256 target, uint256 d)
        internal
        pure
        returns (uint256)
    {
        return target.mul(d).divCeil(10**18);
    }

    function divFloor(uint256 target, uint256 d)
        internal
        pure
        returns (uint256)
    {
        return target.mul(10**18).div(d);
    }

    function divCeil(uint256 target, uint256 d)
        internal
        pure
        returns (uint256)
    {
        return target.mul(10**18).divCeil(d);
    }

    function reciprocalFloor(uint256 target) internal pure returns (uint256) {
        return uint256(10**36).div(target);
    }

    function reciprocalCeil(uint256 target) internal pure returns (uint256) {
        return uint256(10**36).divCeil(target);
    }
}
