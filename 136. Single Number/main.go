//136. Single Number
//Easy
//
//Given a non-empty array of integers nums, every element appears twice except for one. Find that single one.
//
//You must implement a solution with a linear runtime complexity and use only constant extra space.
//
//
//
//Example 1:
//
//Input: nums = [2,2,1]
//
//Output: 1
//
//Example 2:
//
//Input: nums = [4,1,2,1,2]
//
//Output: 4
//
//Example 3:
//
//Input: nums = [1]
//
//Output: 1
//
//
//
//Constraints:
//
//1 <= nums.length <= 3 * 104
//-3 * 104 <= nums[i] <= 3 * 104
//Each element in the array appears twice except for one element which appears only once.

package main

import "fmt"

func main() {
	nums := []int{2, 2, 1}
	fmt.Println(singleNumber(nums))

	nums = []int{4, 1, 2, 1, 2}
	fmt.Println(singleNumber(nums))

}

func singleNumber(nums []int) int {
	numbers := make(map[int]int)

	for _, num := range nums {
		numbers[num]++
	}

	for number, count := range numbers {
		if count == 1 {
			return number
		}
	}

	return 0
}
