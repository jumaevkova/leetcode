//69. Sqrt(x)
//Easy
//
//Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
//
//You must not use any built-in exponent function or operator.
//
//For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.
//
//
//Example 1:
//
//Input: x = 4
//Output: 2
//Explanation: The square root of 4 is 2, so we return 2.
//Example 2:
//
//Input: x = 8
//Output: 2
//Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
//
//
//Constraints:
//
//0 <= x <= 231 - 1

package main

import (
	"fmt"
)

func main() {
	//fmt.Println("0:", mySqrt(0))
	fmt.Println("2:", mySqrt(2))
	fmt.Println("4:", mySqrt(4))
	fmt.Println("8:", mySqrt(8))
	fmt.Println("9:", mySqrt(9))
	fmt.Println("15:", mySqrt(15))
	fmt.Println("16:", mySqrt(16))
	fmt.Println("144:", mySqrt(144))
}

func mySqrt(x int) int {
	/*
	   Define the search space:
	       Min answer we can get is 0.
	       Max answer is x + 1 in case x = 0 or x = 1.
	*/
	left, right := 0, x+1

	for left < right {
		mid := left + (right-left)/2

		/*
		   If we overshoot, move the right pointer to the left.
		   Otherwise, move the left pointer to the right.
		*/
		if mid*mid > x {
			right = mid
		} else {
			left = mid + 1
		}
	}

	/*
	   At the end of the loop, the left pointer will be placed at ceil(n) such that n^2 = x.

	   For example, x = 8 (sqrt is 2.82842...) and the left pointer will be at 3.
	   Return left - 1 = 3 - 1 = 2

	   So we need to return (left - 1) as we are asked to round the answer down to the neares integer.
	*/
	return left - 1
}
