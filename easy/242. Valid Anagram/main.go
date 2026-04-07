//242. Valid Anagram
//Easy
//
//Given two strings s and t, return true if t is an anagram of s, and false otherwise.
//
//
//
//Example 1:
//
//Input: s = "anagram", t = "nagaram"
//
//Output: true
//
//Example 2:
//
//Input: s = "rat", t = "car"
//
//Output: false
//
//
//
//Constraints:
//
//1 <= s.length, t.length <= 5 * 104
//s and t consist of lowercase English letters.
//
//
//Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

package main

import "fmt"

func main() {
	s := "anagram"
	t := "nagaram"
	ok := isAnagram(s, t)
	fmt.Println(ok)

	s = "rat"
	t = "car"
	ok = isAnagram(s, t)
	fmt.Println(ok)
}

func isAnagram(s string, t string) bool {
	if len(s) != len(t) {
		return false
	}

	sMap := make(map[rune]int)
	tMap := make(map[rune]int)

	for i := 0; i < len(s); i++ {
		sMap[rune(s[i])]++
		tMap[rune(t[i])]++
	}

	for k, v := range sMap {
		if v != tMap[k] {
			return false
		}
	}

	return true
}
