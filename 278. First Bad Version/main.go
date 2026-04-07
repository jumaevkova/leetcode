//278. First Bad Version
//Easy
//
//You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
//
//Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
//
//You are given an API bool isBadVersion(version) which returns whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
//
//
//
//Example 1:
//
//Input: n = 5, bad = 4
//Output: 4
//Explanation:
//call isBadVersion(3) -> false
//call isBadVersion(5) -> true
//call isBadVersion(4) -> true
//Then 4 is the first bad version.
//Example 2:
//
//Input: n = 1, bad = 1
//Output: 1
//
//
//Constraints:
//
//1 <= bad <= n <= 231 - 1

package main

import "fmt"

/**
 * Forward declaration of isBadVersion API.
 * @param   version   your guess about first bad version
 * @return 	 	      true if current version is bad
 *			          false if current version is good
 * func isBadVersion(version int) bool;
 */

func main() {
	result := isBadVersion(3)
	fmt.Println(result)

	result = isBadVersion(5)
	fmt.Println(result)

	result = isBadVersion(4)
	fmt.Println(result)

}

func isBadVersion(version int) bool {
	return version >= 4
}

func firstBadVersion(n int) int {
	left, right := 1, n

	for left < right {
		mid := left + (right-left)/2

		if isBadVersion(mid) {
			right = mid // first bad is here or earlier
		} else {
			left = mid + 1 // first bad is after mid
		}
	}

	return left
}
