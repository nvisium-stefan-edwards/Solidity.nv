pragma solidity ^0.4.13;
contract IntTypes {
    event Log12(uint);
    event Log13(int, uint);
    event Log20(int, int);
    event Log21(int, int);
  function info() returns (uint ret) { 
      var j = 100;
      return 42 + j; 
  }
  
  function test(int x, int y) returns (int) {
      x + y;
  }
  
  function test1(int x, int y) returns (int) {
      return x + y;
  }
  
  function test2() returns (uint) {
      uint256 i = 1;
      uint8 j = 2;
      var res = i - j;
      // enourmous 256bit underflow
      return res;
  }
  
  function test3() returns (uint) {
      var i = 1;
      var j = 2;
      var res = i - j;
      // 255, uh... normal underflow
      return res;
  }
  
  function test4() returns (string) {
      // returns empty string
      "this is my test string";
  }
  
  function test5() returns (string) {
      // returns empty string
      // makes sense because who cares
      // what type 1+1 is?
      1 + 1;
  }
  
  function test6() returns (bool) {
      return true;
  }
  
  function test7() returns (uint) {
      return 10 * 1/2;
  }

  function test8(uint y) returns (uint){
    var x = 10 / y;
    return x;
  }
  
  function test9() {
    var x = 1 ether;
    var y = 1 wei;
    var z = 1 finney;
  }
  
  function test10() returns (uint) {
      var j = 0xcafe ^ 0xdead;
      return j;
  }
  
  function test11() {
    var i = 1000;
    var j = -1000;
    var ii = 100000;
    var jj = 0xcafebeef;
  }
  
  function test12() {
    int8 i = 10;
    uint8 j = 10;
    Log12(uint(i));
    Log12(j);
    Log12(j & 0xFF);
  }
  
  function test13() returns (uint) {
    int8 i = 10;
    uint8 j = 12;
    Log13(i - int(j), j - uint(i));
  }
  
  function test14() returns (uint16) {
      var i = 1;
      var j = 10000;
      var res = i - j;
      return res;
  }
  
  function test15() returns (int) {
      var res = 1 - 2;
      return res;
  }
  
  function test16() returns (int) {
      var idx = 0; var acc = 1;
      while(idx < 10) {
          acc += acc * acc;
          idx += 1;
      }
      return acc;
  }
  
  function test17() returns (int) {
      var acc = 1;
      for(var idx = 0; idx < 10; idx++) {
          acc += acc * acc;
      }
      return acc;
  }

  function test18() returns (int) {
      var acc = 1;
      var idx = 0;
      for(; idx < 10; idx++) {
          Log20(idx, acc);
          acc += acc * acc;
      }
      return acc;
  }
  
  function sum() returns (int) {
      var t = [1,2,3,4];
      var sum = 0;
      for(var idx = 0; idx < 4; idx++) {
         sum += t[idx]; 
      }
      return sum;
  }
  
  function test20(int idx, int acc) returns (int) {
      Log20(idx, acc);
      if(idx < 10) {
          return test20(idx + 1, acc + (acc * acc));
      } else {
          return acc;
      }
  }
  
  function test21(int n) returns (int) {
      if(n <= 1) {
          return 1;
      } else {
          return test21(n - 1) + test21(n - 2);
      }
  }
  
  function test22(int i, int j, int m) returns (int){
      int t = 0;
      while(m >= 0){
          t = i;
          i = j;
          j = t + j;
          m -= 1;
      }
      return i;
  }
  function test23(int n) returns (int) {
      if(n <= 1) {
          return 1;
      } else {
          return n * test23(n - 1);
      }
  }
  function test24(int n) returns (int){
      int acc = 1;
      if(acc <= 1) {
          return 1;
      }
      while(n >= 1) {
          acc *= n;
          n -= 1;
      }
      return 1;
  }
}
