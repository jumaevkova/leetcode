//4. Median of Two Sorted Arrays
//Hard
//
//Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
//
//The overall run time complexity should be O(log (m+n)).
//
//
//
//Example 1:
//
//Input: nums1 = [1,3], nums2 = [2]
//Output: 2.00000
//Explanation: merged array = [1,2,3] and median is 2.
//Example 2:
//
//Input: nums1 = [1,2], nums2 = [3,4]
//Output: 2.50000
//Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
//
//
//Constraints:
//
//nums1.length == m
//nums2.length == n
//0 <= m <= 1000
//0 <= n <= 1000
//1 <= m + n <= 2000
//-106 <= nums1[i], nums2[i] <= 106

package main

import (
	"fmt"
	"sort"
)

func main() {
	result := findMedianSortedArrays([]int{1, 3}, []int{2})
	fmt.Println(result)

	result = findMedianSortedArrays([]int{1, 2}, []int{3, 4})
	fmt.Println(result)
}

func findMedianSortedArrays(nums1 []int, nums2 []int) float64 {
	nums := append(nums1, nums2...)
	sort.Ints(nums)

	medium := len(nums) / 2
	if len(nums)%2 != 0 {
		return float64(nums[medium])
	}

	medianNums := nums
	if len(nums) > 2 {
		medianNums = nums[medium-1 : medium+1]
	}

	sumNums := 0
	for _, v := range medianNums {
		sumNums += v
	}

	result := float64(sumNums) / float64(len(medianNums))
	return result
}
