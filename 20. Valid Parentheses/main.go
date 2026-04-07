//20. Valid Parentheses
//Easy
//
//Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
//
//An input string is valid if:
//
//Open brackets must be closed by the same type of brackets.
//Open brackets must be closed in the correct order.
//Every close bracket has a corresponding open bracket of the same type.
//
//
//Example 1:
//
//Input: s = "()"
//
//Output: true
//
//Example 2:
//
//Input: s = "()[]{}"
//
//Output: true
//
//Example 3:
//
//Input: s = "(]"
//
//Output: false
//
//Example 4:
//
//Input: s = "([])"
//
//Output: true
//
//Example 5:
//
//Input: s = "([)]"
//
//Output: false
//
//
//
//Constraints:
//
//1 <= s.length <= 104
//s consists of parentheses only '()[]{}'.

package main

import (
	"fmt"
)

func main() {
	fmt.Println(isValid("(){}[]()"))
	fmt.Println(isValid("({})"))
	fmt.Println(isValid("({}){()}"))
	fmt.Println(isValid("()"))
	fmt.Println(isValid("(}"))
	fmt.Println(isValid(")("))
	fmt.Println(isValid("(){}}{"))
	fmt.Println(isValid("[[[]"))
}

var closeOpenParentheses = map[uint8]uint8{
	'(': ')',
	'[': ']',
	'{': '}',
}

func isValid1(s string) bool {
	if len(s)%2 != 0 {
		return false
	}

	for i := 0; i < len(s); i++ {
		if len(s) > i+1 {
			if closeOpenParentheses[s[i]] == s[i+1] {
				s = s[0:i] + s[i+2:]
				i = -1
			}
		}
	}

	return len(s) <= 0
}

func isValid(s string) bool {
	if len(s)%2 != 0 {
		return false
	}

	ok := false

	for i := 0; i < len(s); i++ {
		if len(s) > i+1 {
			if closeOpenParentheses[s[i]] == s[i+1] {
				ok = true
				i++
				continue
			}

			ok = false

			for j := i + 2; j < len(s); j += 2 {
				if len(s) > j+1 {
					if closeOpenParentheses[s[i]] == s[j+1] {
						ok = true
						//j++
						break
					}
				}
			}
		}
	}

	return ok
}
