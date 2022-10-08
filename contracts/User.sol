pragma solidity ^0.8.0;

contract User {

    mapping(address=>string) internal roles;
    mapping(address=>User) internal Users;


    struct   User{
        address userAddress;
        string userRole;
        uint flag;
        address[] approvedAddress;
    }


    constructor() {

    }


    function createUser(address _address) public returns(User memory) {
        address[] memory arr;
        User memory user = User({userAddress:_address,userRole:"",flag:0,approvedAddress:arr});
        Users[_address] = user;
        return Users[_address];
    }

    function assignRoleToPatient(address _address) external  returns(string memory){
        Users[_address].userRole = "PATIENT";
        return Users[_address].userRole;
    }

    function assignRoleAsDoctor(address _address) external returns(string memory) {
        Users[_address].userRole = "DOCTOR";
        return Users[_address].userRole;

    }

    function assignRoleAsChemist(address _address) external returns(string memory) {
        Users[_address].userRole = "CHEMIST";
        return Users[_address].userRole;

    }

    function getUserRole(address _address) view external returns(string memory){
        return Users[_address].userRole;
    }

    function testCall() view external returns(string memory){
        return "Test call successful";
    }

    function giveApproval(address userToBeApproved, address user) external returns(address[] memory){
        uint i = 0;
        ++i;
        Users[user].approvedAddress.push(userToBeApproved);
        Users[user].flag = i;
        return Users[user].approvedAddress;
    }

}
