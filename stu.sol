// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";
contract MarksManagmtSys {
 // Structure
 struct Student {
 int256 ID;
 string fName;
 string lName;
 int256 marks;
 string email;
 }
 address owner;
 int256 public stdCount = 0;
 //array
 mapping(int256 => Student) public stdRecords;
modifier onlyOwner() {
 require(owner == msg.sender);
 _;
 }
 constructor() {
 owner = msg.sender;
 }
 // Create a function to add
// the new records
 function addNewRecords(
 int256 _ID,
 string memory _fName,
 string memory _lName,
 int256 _marks,
 string memory _email
 ) public onlyOwner {
 // Increase the count by 1
 stdCount = stdCount + 1;
 // Fetch the student details
 // with the help of stdCount
 stdRecords[stdCount] = Student(_ID, _fName, _lName, _marks, _email);
 }
 function Update(int256 _id, string memory _email) public {
 for (int256 i = 1; i <= stdCount; i++) {
 if (stdRecords[i].ID == _id) {
 stdRecords[i].email = _email;
 }
 }
 }
 // fallback function
 fallback() external {
 console.log("Fallback function called");
 }
}
