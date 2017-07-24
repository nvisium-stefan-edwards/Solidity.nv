pragma solidity ^0.4.13;
contract CasinoRoyale {
    event CasinoLog(address);
    uint private seed = 0x00cafefe;
    uint private a = 2521490391;
    uint private c = 11;
    uint private mod = 0xDEADBEEF54;

    function random() returns (uint) {
        CasinoLog(msg.sender);
        uint t = ((a * seed) + c) % mod;
        seed = t;
        return t;
    }

    function randomrange(uint start, uint stop) returns (uint) {
        uint lstart = start;
        uint lstop = stop;
        uint diff = 0;
        uint guess = random();
        // always make sure our range is in order
        if(start > stop) {
            lstart = stop;
            lstop = start;
        }

        diff = lstop - lstart;
        return (lstart + (guess % diff));
    }

}
