// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenGamingToken is ERC20, Ownable {
    // Events
    event TokensMinted(address indexed to, uint256 amount);
   event TokensRedeemed(address indexed from, uint256 amount, string prizeSelection, string message);
    event TokensBurned(address indexed from, uint256 amount);
    event TransferFeeUpdated(uint256 oldFee, uint256 newFee);
    event FeeRecipientChanged(address oldRecipient, address newRecipient);

    uint256 private transferFee;
    address private feeRecipient;

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 1000000 * (10**uint256(decimals()))); 
        transferFee = 100; 
        feeRecipient = msg.sender; 
    }

    // Minting new tokens (only the owner can mint)
    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit TokensMinted(to, amount);
    }

    // Transferring tokens
    function transferTokens(address to, uint256 amount) public returns (bool) {
        require(amount <= balanceOf(msg.sender), "Insufficient balance");

        uint256 totalAmount = amount;
        if (transferFee > 0) {
            uint256 feeAmount = amount * transferFee / 10000; 
            totalAmount = amount - feeAmount;
            _transfer(msg.sender, feeRecipient, feeAmount);
        }

        _transfer(msg.sender, to, totalAmount);
        return true;
    }

    // Redeeming tokens for in-game items
    function redeemTokens(uint256 amount, string memory prizeSelection) public returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _burn(msg.sender, amount);
        emit TokensRedeemed(msg.sender, amount, prizeSelection, "Redemption successful");
        return true;
    }

    // Checking token balance
    function getTokenBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    // Burning tokens
    function burnTokens(uint256 amount) public {
        _burn(msg.sender, amount);
        emit TokensBurned(msg.sender, amount);
    }

    // Set transfer fee (only the owner can set)
    function setTransferFee(uint256 newFee) public onlyOwner {
        require(newFee <= 10000, "Fee should be in basis points (0.01% or less)");
        emit TransferFeeUpdated(transferFee, newFee);
        transferFee = newFee;
    }

    // Change fee recipient (only the owner can change)
    function changeFeeRecipient(address newRecipient) public onlyOwner {
        require(newRecipient != address(0), "Invalid address");
        emit FeeRecipientChanged(feeRecipient, newRecipient);
        feeRecipient = newRecipient;
    }

    // Mint tokens with restrictions (only the owner can mint)
    function mintWithRestrictions(address to, uint256 amount, uint256 releaseTime) public onlyOwner {
        require(totalSupply() + amount <= totalSupplyCap(), "Exceeds total supply cap");
        require(releaseTime >= block.timestamp, "Release time must be in the future");
        _mint(to, amount);
        
    }

    // Check if the transfer fee is enabled
    function isTransferFeeEnabled() public view returns (bool) {
        return transferFee > 0;
    }

    // Get the current fee recipient address
    function getFeeRecipient() public view returns (address) {
        return feeRecipient;
    }

    // Get the total supply cap
    function totalSupplyCap() public view returns (uint256) {
        return 2000000 * (10**uint256(decimals())); 
    }
}
