//268. Missing Number
//Easy
//
//Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
//
//
//
//Example 1:
//
//Input: nums = [3,0,1]
//
//Output: 2
//
//Explanation:
//
//n = 3 since there are 3 numbers, so all numbers are in the range [0,3].
//2 is the missing number in the range since it does not appear in nums.
//
//Example 2:
//
//Input: nums = [0,1]
//
//Output: 2
//
//Explanation:
//
//n = 2 since there are 2 numbers, so all numbers are in the range [0,2].
//2 is the missing number in the range since it does not appear in nums.
//
//Example 3:
//
//Input: nums = [9,6,4,2,3,5,7,0,1]
//
//Output: 8
//
//Explanation:
//
//n = 9 since there are 9 numbers, so all numbers are in the range [0,9].
//8 is the missing number in the range since it does not appear in nums.

package main

import "fmt"

func main() {
	nums := []int{3, 0, 1}
	result := missingNumber(nums)
	fmt.Println(result)

	nums = []int{0, 1}
	result = missingNumber(nums)
	fmt.Println(result)

	nums = []int{9, 6, 4, 2, 3, 5, 7, 0, 1}
	result = missingNumber(nums)
	fmt.Println(result)
}

func missingNumber(nums []int) int {
	numsMap := make(map[int]bool)

	for _, num := range nums {
		numsMap[num] = true
	}

	for i := 0; i <= len(nums); i++ {
		if _, ok := numsMap[i]; !ok {
			return i
		}
	}

	return 0
}
