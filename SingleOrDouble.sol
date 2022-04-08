// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0 < 0.9.0;

contract SingleOrDouble {
    address public manager;
    uint public betValue;

    struct Player {
        uint choose;
        bool winner;
    }

    address player1Addr; // PLayer one address
    address player2Addr; // Player two address

    mapping(address => Player) player;

    // For clarifying betValue and manager of the contract
    constructor(uint _betValue) {
        manager = msg.sender;
        betValue = _betValue*1000000000000000000; // Transfering wei to ether
    }

    // Bet money which is clarified at the initializing should be satisfied
    modifier enoughBetMoney() {
        require(msg.value == betValue);
        _;
    }

    // Only owner of the contract can manage functions
    modifier managerOnly() {
        require(msg.sender == manager);
        _;
    } 

    function player1Choose(uint _choose) public payable enoughBetMoney {
        require(_choose == 0 || _choose == 1); // 0 means double, 1 means single 
        player1Addr = msg.sender;   // For clarify the player one address
        player[msg.sender].choose = _choose;
    }

    function player2Guess(uint _guess) public payable enoughBetMoney {
        require(_guess == 0 || _guess == 1); // 0 means double, 1 means single
        player2Addr = msg.sender; // For clarify the player two address
        player[msg.sender].choose = _guess;
    }

    function pickWinner() public payable managerOnly {
        // If player one and player two are the same person money will refund
        if(player1Addr == player2Addr) {
            payable(address(player1Addr)).transfer(payable(address(this)).balance);
        }

        // If player two guess correct player two wins
        if(player[player1Addr].choose == player[player2Addr].choose) {
            player[player2Addr].winner = true;
            payable(address(player2Addr)).transfer(payable(address(this)).balance); 
        }

        // If player two guess wrong player one wins
        if(player[player1Addr].choose != player[player2Addr].choose) {
            player[player1Addr].winner = true;
            payable(address(player1Addr)).transfer(payable(address(this)).balance); 
        }
    }
    

}
