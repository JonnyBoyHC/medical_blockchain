// SPDX-License-Identifier: MIT

pragma solidity >= 0.6.0 < 0.9.0;
pragma experimental ABIEncoderV2;

contract PatientAcctsDB {

    address doctor = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address reqDoctor = msg.sender;

    modifier onlyDoctor{
        require(doctor == msg.sender);
        _;
    }
    
    struct PatientAccts {
        string name;
        uint256 ID_no;
        address reqDoctor;
    }
    
    PatientAccts[] public patientAccts;
    mapping(string => uint) public patientAcctsKV;
    
    function addPerson(string memory _name, uint256 _ID_no) public onlyDoctor {
        patientAccts.push(PatientAccts(_name, _ID_no, msg.sender));
        patientAcctsKV[_name] = _ID_no;
    }    
    
    // function getAllAccts() external view returns(string[] memory, uint256[] memory, address[] memory) {
    //     string[] memory names = new string[](patientAccts.length);
    //     uint256[] memory ID_nos = new uint256[](patientAccts.length);
    //     address[] memory reqDocs = new address[](patientAccts.length);

    //     for (uint i = 0; i < patientAccts.length; i++) {
    //         names[i] = patientAccts[i].name;
    //         ID_nos[i] = patientAccts[i].ID_no;
    //         reqDocs[i] = patientAccts[i].reqDoctor;
    //     } 
    //     return (names, ID_nos, reqDocs);
    // }

    function getAllAccts() external view returns(PatientAccts[] memory) {
        return patientAccts;
    }
}
