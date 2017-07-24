pragma solidity ^0.4.13;

contract C {
    address owner;
    uint private foo = 0xcafebeef;

    function C() {
        owner = msg.sender;
    }

    function getfoo() returns (uint) {
        return foo;
    }

    function setfoo(uint tmp) returns (bool) {
        if(msg.sender == owner) {
            foo = tmp;
            return true;
        } else {
            return false;
        }
    }
}

contract D {
    C c = new C();

    // ExposeLog is here literally to make
    // the exploit easier
    event ExposeLog(address);

    function test0() {
        ExposeLog(c);
        c.setfoo(10);
    }
    function test1() returns (uint) {
        ExposeLog(c);
        return c.getfoo();
    }
}

contract Attacker {
    event AttackLog(uint);

    function attack() {
        C c = C(0x4678b4d1aa70ad04ba5decd0e4e2df0d27850bf1);
        var t = c.getfoo();
        AttackLog(t);
        c.setfoo(10);
        t = c.getfoo();
        AttackLog(t);
    }
}
