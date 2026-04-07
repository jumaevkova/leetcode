//168. Excel Sheet Column Title
//Easy
//
//Given an integer columnNumber, return its corresponding column title as it appears in an Excel sheet.
//
//For example:
//
//A -> 1
//B -> 2
//C -> 3
//...
//Z -> 26
//AA -> 27
//AB -> 28
//...
//
//
//Example 1:
//
//Input: columnNumber = 1
//Output: "A"
//Example 2:
//
//Input: columnNumber = 28
//Output: "AB"
//Example 3:
//
//Input: columnNumber = 701
//Output: "ZY"
//
//
//Constraints:
//
//1 <= columnNumber <= 231 - 1

package main

import "fmt"

func main() {
	n := 1
	fmt.Println(convertToTitle(n))

	n = 28
	fmt.Println(convertToTitle(n))

	n = 701
	fmt.Println(convertToTitle(n))

	n = 2147483647
	fmt.Println(convertToTitle(n))
}

func convertToTitle(columnNumber int) string {
	var columnTitle string

	for columnNumber > 0 {
		columnNumber--
		columnTitle = string(rune(columnNumber%26+'A')) + columnTitle
		columnNumber /= 26
	}

	return columnTitle
}
