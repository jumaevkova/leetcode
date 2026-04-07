//67. Add Binary
//Easy
//
//Given two binary strings a and b, return their sum as a binary string.
//
//
//
//Example 1:
//
//Input: a = "11", b = "1"
//Output: "100"
//Example 2:
//
//Input: a = "1010", b = "1011"
//Output: "10101"
//
//
//Constraints:
//
//1 <= a.length, b.length <= 104
//a and b consist only of '0' or '1' characters.
//Each string does not contain leading zeros except for the zero itself.

package main

import (
	"fmt"
	"strconv"
)

func main() {
	a := "11"
	b := "1"
	fmt.Println(addBinary(a, b))

	a = "1010"
	b = "1011"
	fmt.Println(addBinary(a, b))

	a = "0"
	b = "0"
	fmt.Println(addBinary(a, b))

	a = "1111"
	b = "1111"
	fmt.Println(addBinary(a, b))
}

func addBinary(a string, b string) string {

	var (
		lenA   = len(a)
		lenB   = len(b)
		maxLen = lenA
		rest   = 0
		result string
	)

	if lenB > lenA {
		maxLen = lenB
	}

	for i := 1; i <= maxLen; i++ {
		intA := 0
		if lenA >= i {
			intA, _ = strconv.Atoi(string(a[lenA-i]))
		}

		intB := 0
		if lenB >= i {
			intB, _ = strconv.Atoi(string(b[lenB-i]))
		}

		sum := intA + intB + rest

		if sum > 1 {
			result = strconv.Itoa(sum%2) + result
			rest = 1
		} else {
			result = strconv.Itoa(sum) + result
			rest = 0
		}
	}

	if rest == 1 {
		result = strconv.Itoa(rest) + result
	}

	return result
}
