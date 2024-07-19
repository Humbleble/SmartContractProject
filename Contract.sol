// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract LoyaltyToken {
    string public name = "LoyaltyToken";
    string public symbol = "LT";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => uint256) public loyaltyPoints;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);
    event RedeemLoyaltyPoints(address indexed from, uint256 points, string benefit);

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function mint(address _to, uint256 _amount) external onlyOwner {
        require(_to != address(0), "Invalid address");
        require(_amount > 0, "Mint amount must be greater than zero");
        
        totalSupply += _amount;
        balanceOf[_to] += _amount;

        // Ensure the total supply never overflows
        assert(totalSupply >= _amount);

        emit Mint(_to, _amount);
    }

    function burn(uint256 _amount) external {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance to burn");
        require(_amount > 0, "Burn amount must be greater than zero");
        
        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;

        // Ensure the total supply never underflows
        assert(totalSupply <= totalSupply + _amount);

        emit Burn(msg.sender, _amount);
    }

    function earnLoyaltyPoints(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");
        loyaltyPoints[msg.sender] += _amount;

        // Ensure the loyalty points do not overflow
        assert(loyaltyPoints[msg.sender] >= _amount);
    }

    function redeemLoyaltyPoints(uint256 _points, string memory _benefit) external {
        require(loyaltyPoints[msg.sender] >= _points, "Insufficient loyalty points");
        require(bytes(_benefit).length > 0, "Benefit description required");

        loyaltyPoints[msg.sender] -= _points;

        // Example of using revert with a condition
        if (loyaltyPoints[msg.sender] < 0) {
            revert("Loyalty points cannot be negative");
        }

        emit RedeemLoyaltyPoints(msg.sender, _points, _benefit);
    }

    function Balance(address _account) external view returns (uint256) {
        return balanceOf[_account];
    }
}
