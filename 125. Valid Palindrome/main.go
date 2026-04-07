//125. Valid Palindrome
//Easy
//
//A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
//
//Given a string s, return true if it is a palindrome, or false otherwise.
//
//
//
//Example 1:
//
//Input: s = "A man, a plan, a canal: Panama"
//Output: true
//Explanation: "amanaplanacanalpanama" is a palindrome.
//Example 2:
//
//Input: s = "race a car"
//Output: false
//Explanation: "raceacar" is not a palindrome.
//Example 3:
//
//Input: s = " "
//Output: true
//Explanation: s is an empty string "" after removing non-alphanumeric characters.
//Since an empty string reads the same forward and backward, it is a palindrome.
//
//
//Constraints:
//
//1 <= s.length <= 2 * 105
//s consists only of printable ASCII characters.

package main

import (
	"fmt"
	"regexp"
	"strings"
	"unicode"
)

func main() {
	s := "A man, a plan, a canal: Panama"
	fmt.Println(isPalindrome(s))

	s = "race a car"
	fmt.Println(isPalindrome(s))

	s = " "
	fmt.Println(isPalindrome(s))
}

func isPalindrome(s string) bool {
	var forward string
	var backward string

	for _, char := range s {
		char = unicode.ToLower(char)
		if (char >= 'a' && char <= 'z') || (char >= '0' && char <= '9') {
			forward += string(char)
			backward = string(char) + backward
		}
	}

	return forward == backward
}

func isPalindrome_2(s string) bool {
	s = regexp.MustCompile(`[^a-zA-Z0-9]+`).ReplaceAllString(s, "")
	s = strings.ToLower(s)
	index := len(s)

	backward := ""

	for range s {
		index--
		backward += s[index : index+1]
	}

	return s == backward
}
