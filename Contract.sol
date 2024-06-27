
// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;

contract SmartContract {
    uint256 public balance;

    // Function to deposit an amount
    function deposit(uint256 amount) public {
        // If true, store value. Otherwise, revert
        require(amount > 50, "Deposit value must be greater than 50.");

        // Always true
        assert(balance + amount > balance);

        // Adds the deposited value to balance
        balance += amount;
    }

    // Function to withdraw an amount
    function withdraw(uint256 amount) public {
        require(amount > 0, "Withdrawal amount must be greater than zero.");

        
        if (amount > balance) {
            revert("Attempted withdrawal amount is higher than current balance.");
        }

        // Deduct withdrawn value from balance
        balance -= amount;
    }
}
