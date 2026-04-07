//14. Longest Common Prefix
//Easy
//
//Write a function to find the longest common prefix string amongst an array of strings.
//
//If there is no common prefix, return an empty string "".
//
//
//
//Example 1:
//
//Input: strs = ["flower","flow","flight"]
//Output: "fl"
//Example 2:
//
//Input: strs = ["dog","racecar","car"]
//Output: ""
//Explanation: There is no common prefix among the input strings.
//
//
//Constraints:
//
//1 <= strs.length <= 200
//0 <= strs[i].length <= 200
//strs[i] consists of only lowercase English letters if it is non-empty.

package main

import (
	"fmt"
)

func main() {
	strs := []string{"flower", "flow", "flight"}
	fmt.Println(longestCommonPrefix(strs))

	strs = []string{"dog", "racecar", "car"}
	fmt.Println(longestCommonPrefix(strs))

	strs = []string{"a", "a"}
	fmt.Println(longestCommonPrefix(strs))
}

func longestCommonPrefix(strs []string) string {
	var prefix string

Loop:
	for i := 0; i <= 200; i++ {
		firstStr := strs[0]

		if len(firstStr) > i {
			newPrefix := prefix + string(firstStr[i])

			for _, str := range strs {
				if len(str) >= len(newPrefix) {
					if newPrefix != str[0:i+1] {
						break Loop
					}
				} else {
					break Loop
				}
			}
			prefix = newPrefix
		} else {
			break
		}
	}

	return prefix
}
