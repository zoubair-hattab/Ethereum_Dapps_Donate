// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
import "./interfacePayments.sol";

contract VolunteerContract {

    address public owner;
    
    constructor(){
        owner= msg.sender;
    }
    
    modifier onlyOwner{
        require(msg.sender == owner,"The Contract Owner Only Can Use Withdraw  Function");
        _;
    }
    uint public numberofFunders;
    
    mapping (uint=>address) private funders;
    mapping(address=>bool) private sucessFunders;
    receive() external payable{}
    
    
    function donate() external payable {
        address funder = msg.sender;
        
        if(!sucessFunders[funder]){
            uint index = numberofFunders++;
            funders[index]= funder;
            sucessFunders[funder]= true;
        }
    }
    
    function getContractBalance()public view returns(uint){
        return address(this).balance;
    }
    
        function withdraw(uint amount) external onlyOwner {
            
            require(amount <=  20000000000000000,"The withdraw amount Should Be less Than 0.2 Ether ");
            payable(msg.sender).transfer(amount);
        }

}