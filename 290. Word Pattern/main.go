//290. Word Pattern
//Easy
//
//Given a pattern and a string s, find if s follows the same pattern.
//
//Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s. Specifically:
//
//Each letter in pattern maps to exactly one unique word in s.
//Each unique word in s maps to exactly one letter in pattern.
//No two letters map to the same word, and no two words map to the same letter.
//
//
//Example 1:
//
//Input: pattern = "abba", s = "dog cat cat dog"
//
//Output: true
//
//Explanation:
//
//The bijection can be established as:
//
//'a' maps to "dog".
//'b' maps to "cat".
//Example 2:
//
//Input: pattern = "abba", s = "dog cat cat fish"
//
//Output: false
//
//Example 3:
//
//Input: pattern = "aaaa", s = "dog cat cat dog"
//
//Output: false
//
//
//
//Constraints:
//
//1 <= pattern.length <= 300
//pattern contains only lower-case English letters.
//1 <= s.length <= 3000
//s contains only lowercase English letters and spaces ' '.
//s does not contain any leading or trailing spaces.
//All the words in s are separated by a single space.

package main

import (
	"fmt"
	"strings"
)

func main() {
	pattern := "abba"
	s := "dog cat cat dog"
	result := wordPattern(pattern, s)
	fmt.Println(result)

	pattern = "abba"
	s = "dog cat cat fish"
	result = wordPattern(pattern, s)
	fmt.Println(result)

	pattern = "abba"
	s = "dog dog dog dog"
	result = wordPattern(pattern, s)
	fmt.Println(result)
}

func wordPattern(pattern string, s string) bool {
	words := strings.Split(s, " ")
	if len(pattern) != len(words) {
		return false
	}

	p2w := make(map[byte]string)
	w2p := make(map[string]byte)

	for i := 0; i < len(pattern); i++ {
		p := pattern[i]
		w := words[i]

		// Check pattern → word
		if val, ok := p2w[p]; ok {
			if val != w {
				return false
			}
		} else {
			p2w[p] = w
		}

		// Check word → pattern
		if val, ok := w2p[w]; ok {
			if val != p {
				return false
			}
		} else {
			w2p[w] = p
		}
	}

	return true
}

//func wordPattern(pattern string, s string) bool {
//	words := strings.Split(s, " ")
//	patternMap := make(map[byte]string)
//
//	for i := 0; i < len(pattern); i++ {
//		key := pattern[i]
//
//		_, ok := patternMap[key]
//		if ok && patternMap[key] != words[i] {
//			return false
//		}
//
//		patternMap[pattern[i]] = words[i]
//	}
//
//	return true
//}
