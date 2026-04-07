//326. Power of Three
//Easy
//
//Given an integer n, return true if it is a power of three. Otherwise, return false.
//
//An integer n is a power of three, if there exists an integer x such that n == 3x.
//
//
//
//Example 1:
//
//Input: n = 27
//Output: true
//Explanation: 27 = 33
//Example 2:
//
//Input: n = 0
//Output: false
//Explanation: There is no x where 3x = 0.
//Example 3:
//
//Input: n = -1
//Output: false
//Explanation: There is no x where 3x = (-1).
//
//
//Constraints:
//
//-231 <= n <= 231 - 1
//
//
//Follow up: Could you solve it without loops/recursion?

package main

import "fmt"

func main() {
	ok := isPowerOfThree(27)
	fmt.Println(ok)

	ok = isPowerOfThree(9)
	fmt.Println(ok)

	ok = isPowerOfThree(1)
	fmt.Println(ok)

	ok = isPowerOfThree(18)
	fmt.Println(ok)

	ok = isPowerOfThree(0)
	fmt.Println(ok)

	ok = isPowerOfThree(-1)
	fmt.Println(ok)
}

func isPowerOfThree(n int) bool {
	return n > 0 && 1162261467%n == 0
}
