// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LUCRPulseMonitor {
    address public governance;

    uint256 public lastMintPulse;
    uint256 public lastBurnPulse;
    uint256 public lastSalePulse;
    uint256 public lastTreasuryPulse;
    uint256 public lastGovernancePulse;

    event Pulse(
        uint256 indexed blockNum,
        uint256 mintPulse,
        uint256 burnPulse,
        uint256 salePulse,
        uint256 treasuryPulse,
        uint256 governancePulse,
        uint256 timestamp
    );

    modifier onlyGovernance() {
        require(msg.sender == governance, "Not governance");
        _;
    }

    constructor() {
        governance = msg.sender;
    }

    function recordMintPulse() external onlyGovernance {
        lastMintPulse = block.number;
    }

    function recordBurnPulse() external onlyGovernance {
        lastBurnPulse = block.number;
    }

    function recordSalePulse() external onlyGovernance {
        lastSalePulse = block.number;
    }

    function recordTreasuryPulse() external onlyGovernance {
        lastTreasuryPulse = block.number;
    }

    function recordGovernancePulse() external onlyGovernance {
        lastGovernancePulse = block.number;
    }

    function emitPulse() external onlyGovernance {
        emit Pulse(
            block.number,
            lastMintPulse,
            lastBurnPulse,
            lastSalePulse,
            lastTreasuryPulse,
            lastGovernancePulse,
            block.timestamp
        );
    }
}
