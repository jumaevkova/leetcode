//119. Pascal's Triangle II
//Easy
//
//Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.
//
//In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
//
//
//
//
//Example 1:
//
//Input: rowIndex = 3
//Output: [1,3,3,1]
//Example 2:
//
//Input: rowIndex = 0
//Output: [1]
//Example 3:
//
//Input: rowIndex = 1
//Output: [1,1]
//
//
//Constraints:
//
//0 <= rowIndex <= 33
//
//
//Follow up: Could you optimize your algorithm to use only O(rowIndex) extra space?

package main

import "fmt"

func main() {
	nums := getRow(5)
	fmt.Println(nums)
}

func getRow(rowIndex int) []int {
	nums := generate(rowIndex + 1)
	return nums[rowIndex]
}

func generate(numRows int) [][]int {
	result := make([][]int, 0, numRows)

	for i := 0; i < numRows; i++ {
		nums := make([]int, i+1)

		for j := range nums {
			if j == 0 || j == i {
				nums[j] = 1
				continue
			}

			nums[j] = result[i-1][j-1] + result[i-1][j]
		}

		result = append(result, nums)
	}

	return result
}
