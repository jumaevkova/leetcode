//171. Excel Sheet Column Number
//Easy
//
//Given a string columnTitle that represents the column title as appears in an Excel sheet, return its corresponding column number.
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
//Input: columnTitle = "A"
//Output: 1
//Example 2:
//
//Input: columnTitle = "AB"
//Output: 28
//Example 3:
//
//Input: columnTitle = "ZY"
//Output: 701
//
//
//Constraints:
//
//1 <= columnTitle.length <= 7
//columnTitle consists only of uppercase English letters.
//columnTitle is in the range ["A", "FXSHRXW"].

package main

import "fmt"

func main() {
	n := "A"
	fmt.Println(titleToNumber(n))

	n = "AB"
	fmt.Println(titleToNumber(n))

	n = "ZY"
	fmt.Println(titleToNumber(n))

	n = "FXSHRXW"
	fmt.Println(titleToNumber(n))
}

func titleToNumber(columnTitle string) int {
	var columnNumber int

	for _, title := range columnTitle {
		columnNumber *= 26
		columnNumber = int(title) - 'A' + columnNumber
		columnNumber++
	}

	return columnNumber
}
