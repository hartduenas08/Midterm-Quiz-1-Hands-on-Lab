// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SalaryCalculationContract {

// variables
uint public age;
uint public hoursWorked;
uint public hourlyRate;
uint public totalSalary;

// age of employee
function setAge(uint _age) public {
age = _age;
}

// workhour's employee
function setHrsWrk(uint _hoursWorked) public {
hoursWorked = _hoursWorked;
}

// hourly rate
function setRate(uint _hourlyRate) public onlyOwner {
require(_hourlyRate > 0, "Hourly rate must be greater than zero.");
hourlyRate = _hourlyRate;
}

// total sallary
function calculateTotSal() public onlyOwner {
require(hourlyRate > 0 && hoursWorked > 0, "Cannot calculate salary with zero values.");
totalSalary = hourlyRate * hoursWorked;
}

// modifier functions
modifier onlyOwner() {
require(msg.sender == tx.origin, "Only the contract owner can call this function.");
_;
}
}