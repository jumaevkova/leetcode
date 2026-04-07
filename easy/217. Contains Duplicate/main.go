//217. Contains Duplicate
//Easy
//
//Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
//
//
//
//Example 1:
//
//Input: nums = [1,2,3,1]
//
//Output: true
//
//Explanation:
//
//The element 1 occurs at the indices 0 and 3.
//
//Example 2:
//
//Input: nums = [1,2,3,4]
//
//Output: false
//
//Explanation:
//
//All elements are distinct.
//
//Example 3:
//
//Input: nums = [1,1,1,3,3,4,3,2,4,2]
//
//Output: true
//
//
//
//Constraints:
//
//1 <= nums.length <= 105
//-109 <= nums[i] <= 109

package main

import "fmt"

func main() {
	ok := containsDuplicate([]int{1, 2, 3, 4, 5})
	fmt.Println(ok)

	ok = containsDuplicate([]int{1, 2, 3, 4, 5, 1})
	fmt.Println(ok)
}

func containsDuplicate(nums []int) bool {
	m := make(map[int]struct{})

	for _, num := range nums {
		if _, ok := m[num]; ok {
			return true
		}
		m[num] = struct{}{}
	}

	return false
}
