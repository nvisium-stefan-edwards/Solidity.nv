contract C {
    uint someVariable;
    uint[] data;

    function f() {
        data.push(2);
    }
    
    function g() returns (uint[]) {
        return data;
    }
    
    function h(uint t) {
        someVariable = t;
    }
    
    function j() returns (uint) {
        return someVariable;
    }
    
    function ff(int i, int j) returns (int) {
        return i + j;
    }
    
    function k(uint t) returns (uint[]) {
        uint[] res;
        res.push(t);
        return res;
    }
    
    function m(uint t) returns (uint[]) {
        uint[] memory res = new uint[](1);
        res[0] = t;
        return res;
    }
}
