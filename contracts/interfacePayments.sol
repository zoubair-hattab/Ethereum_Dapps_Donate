// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

interface interfacePayments{
    function donate()external payable;
    function withdraw(uint amount) external  ;

    
}