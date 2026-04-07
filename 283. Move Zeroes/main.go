//283. Move Zeroes
//Easy
//
//Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//Note that you must do this in-place without making a copy of the array.
//
//
//
//Example 1:
//
//Input: nums = [0,1,0,3,12]
//Output: [1,3,12,0,0]
//Example 2:
//
//Input: nums = [0]
//Output: [0]
//
//
//Constraints:
//
//1 <= nums.length <= 104
//-231 <= nums[i] <= 231 - 1
//
//
//Follow up: Could you minimize the total number of operations done?

package main

import "fmt"

func main() {
	nums := []int{0, 1, 0, 3, 12}
	moveZeroes(nums)
	fmt.Println(nums)

	nums = []int{0, 0}
	moveZeroes(nums)
	fmt.Println(nums)

	nums = []int{0, 1, 0, 2, 0, 3, 0, 0}
	moveZeroes(nums)
	fmt.Println(nums)

	nums = []int{0, 0, 0, 0, 0, 0, 0, 0}
	moveZeroes(nums)
	fmt.Println(nums)

	nums = []int{0, 0, 0, 0, 0, 0, 0, 1}
	moveZeroes(nums)
	fmt.Println(nums)

	nums = []int{0, 0, 1}
	moveZeroes(nums)
	fmt.Println(nums)
}

func moveZeroes(nums []int) {
	pos := 0

	// Переносим все ненулевые элементы вперёд
	for _, num := range nums {
		if num != 0 {
			nums[pos] = num
			pos++
		}
	}

	// Заполняем оставшуюся часть нулями
	for i := pos; i < len(nums); i++ {
		nums[i] = 0
	}
}

//func moveZeroes(nums []int) {
//	var zeroes []int
//
//	for i, num := range nums {
//		if i >= len(nums) {
//			continue
//		}
//
//		if num == 0 {
//			nums = append(nums[:i], nums[i+1:]...)
//			zeroes = append(zeroes, num)
//		}
//	}
//
//	nums = append(nums, zeroes...)
//}
