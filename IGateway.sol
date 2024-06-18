// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GmpSender} from "./Primitives.sol";

/**
 * @dev Required interface of an Gateway compliant contract
 */

interface IGateway {
    event GmpCreated(
        bytes32 indexed id,
        bytes32 indexed source,
        address indexed destinationAddress,
        uint16 destinationNetwork,
        uint256 executionGasLimit,
        uint256 salt,
        bytes data
    );

    function networkId() external view returns (uint16);

    function deposit(GmpSender sender, uint16 sourceNetwork) external payable;

    function depositOf(GmpSender sender, uint16 sourceNetwork) external view returns (uint256);

    function submitMessage(
        address destinationAddress,
        uint16 destinationNetwork,
        uint256 executionGasLimit,
        bytes calldata data
    ) external payable returns (bytes32);
}
