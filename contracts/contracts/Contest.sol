// SPDX-License-Identifier: GPL-3.0

import "./Ticket.sol";
pragma solidity >=0.7.0 <0.9.0;

contract Contest {
    address contestOwner;
    uint256[] ticketIds;
    Ticket ticketContract;

    constructor(address ticketContractAddress) {
        ticketContract = Ticket(ticketContractAddress);
    }

    function enterContest() public payable {
        require(msg.value >= 10000000000000000);
        uint256 ticketId = ticketContract.createTicket(msg.sender);
        ticketIds.push(ticketId);
    }

    function viewTicketIds() public view returns (uint256[] memory) {
        return ticketIds;
    }
}
