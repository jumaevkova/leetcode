//342. Power of Four
//Easy
//
//Given an integer n, return true if it is a power of four. Otherwise, return false.
//
//An integer n is a power of four, if there exists an integer x such that n == 4x.
//
//
//
//Example 1:
//
//Input: n = 16
//Output: true
//Example 2:
//
//Input: n = 5
//Output: false
//Example 3:
//
//Input: n = 1
//Output: true
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
	ok := isPowerOfFour(1)
	fmt.Println("1 ->", ok)

	ok = isPowerOfFour(16)
	fmt.Println("16 ->", ok)

	ok = isPowerOfFour(24)
	fmt.Println("24 ->", ok)

	ok = isPowerOfFour(2)
	fmt.Println("2 ->", ok)
}

func isPowerOfFour(n int) bool {
	return n > 0 && // число должно быть положительным
		(n&(n-1)) == 0 && // проверка, что это степень 2 (только один бит = 1)
		(n&0x55555555) != 0 // этот бит находится на "правильной" позиции (степень 4)
}
