/*
https://leetcode.com/problems/reverse-integer/description/

Given a 32-bit signed integer, reverse digits of an integer.

Example 1:

Input: 123
Output: 321
Example 2:

Input: -123
Output: -321
Example 3:

Input: 120
Output: 21
Note:
Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

*/

class Solution {
    func reverse(_ x: Int) -> Int {
        
        var copyX = x
        var result = 0
        while copyX != 0 {
            let latest = copyX % 10 
            copyX = copyX / 10
            result = result * 10 + latest
        }
        
        if result > Int32.max || result < Int32.min {
            return 0
        }
        return result 
    }
}
