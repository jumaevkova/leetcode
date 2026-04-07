//349. Intersection of Two Arrays
//Easy
//
//Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.
//
//
//
//Example 1:
//
//Input: nums1 = [1,2,2,1], nums2 = [2,2]
//Output: [2]
//Example 2:
//
//Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
//Output: [9,4]
//Explanation: [4,9] is also accepted.
//
//
//Constraints:
//
//1 <= nums1.length, nums2.length <= 1000
//0 <= nums1[i], nums2[i] <= 1000

package main

import "fmt"

func main() {
	nums1 := []int{1, 2, 2, 1}
	nums2 := []int{2, 2}
	result := intersection(nums1, nums2)
	fmt.Println(result)

	nums1 = []int{4, 9, 5}
	nums2 = []int{9, 4, 9, 8, 4}
	result = intersection(nums1, nums2)
	fmt.Println(result)
}

func intersection(nums1 []int, nums2 []int) []int {
	var (
		numsMap = make(map[int]struct{})
		nums    []int
	)

	for _, num := range nums1 {
		numsMap[num] = struct{}{}
	}

	for _, num := range nums2 {
		if _, ok := numsMap[num]; ok {
			nums = append(nums, num)
			delete(numsMap, num)
		}
	}

	return nums
}
