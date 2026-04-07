//258. Add Digits
//Easy
//
//Given an integer num, repeatedly add all its digits until the result has only one digit, and return it.
//
//
//
//Example 1:
//
//Input: num = 38
//Output: 2
//Explanation: The process is
//38 --> 3 + 8 --> 11
//11 --> 1 + 1 --> 2
//Since 2 has only one digit, return it.
//Example 2:
//
//Input: num = 0
//Output: 0
//
//
//Constraints:
//
//0 <= num <= 231 - 1
//
//
//Follow up: Could you do it without any loop/recursion in O(1) runtime?

package main

import "fmt"

func main() {
	// 3+8 = 11
	// 1+1 = 2
	num := 38
	result := addDigits(num)
	fmt.Println(result)

	// 0
	// 0
	num = 0
	result = addDigits(num)
	fmt.Println(result)

	// 5+6+4 = 15
	// 1+5 = 6
	num = 564
	result = addDigits(num)
	fmt.Println(result)

	// 5+6+4+9+1 = 25
	// 2+5 = 7
	num = 56491
	result = addDigits(num)
	fmt.Println(result)
}

func addDigits(num int) int {
	for num >= 10 {
		num = num/10 + num%10
	}

	return num
}
