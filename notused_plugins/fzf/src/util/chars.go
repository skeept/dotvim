package util

import (
	"unicode"
	"unicode/utf8"
	"unsafe"
)

type Chars struct {
	slice           []byte // or []rune
	inBytes         bool
	trimLengthKnown bool
	trimLength      uint16

	// XXX Piggybacking item index here is a horrible idea. But I'm trying to
	// minimize the memory footprint by not wasting padded spaces.
	Index int32
}

// ToChars converts byte array into rune array
func ToChars(bytes []byte) Chars {
	var runes []rune
	inBytes := true
	numBytes := len(bytes)
	for i := 0; i < numBytes; {
		if bytes[i] < utf8.RuneSelf {
			if !inBytes {
				runes = append(runes, rune(bytes[i]))
			}
			i++
		} else {
			if inBytes {
				inBytes = false
				runes = make([]rune, i, numBytes)
				for j := 0; j < i; j++ {
					runes[j] = rune(bytes[j])
				}
			}
			r, sz := utf8.DecodeRune(bytes[i:])
			i += sz
			runes = append(runes, r)
		}
	}
	if inBytes {
		return Chars{slice: bytes, inBytes: inBytes}
	}
	return RunesToChars(runes)
}

func RunesToChars(runes []rune) Chars {
	return Chars{slice: *(*[]byte)(unsafe.Pointer(&runes)), inBytes: false}
}

func (chars *Chars) optionalRunes() []rune {
	if chars.inBytes {
		return nil
	}
	return *(*[]rune)(unsafe.Pointer(&chars.slice))
}

func (chars *Chars) Get(i int) rune {
	if runes := chars.optionalRunes(); runes != nil {
		return runes[i]
	}
	return rune(chars.slice[i])
}

func (chars *Chars) Length() int {
	if runes := chars.optionalRunes(); runes != nil {
		return len(runes)
	}
	return len(chars.slice)
}

// TrimLength returns the length after trimming leading and trailing whitespaces
func (chars *Chars) TrimLength() uint16 {
	if chars.trimLengthKnown {
		return chars.trimLength
	}
	chars.trimLengthKnown = true
	var i int
	len := chars.Length()
	for i = len - 1; i >= 0; i-- {
		char := chars.Get(i)
		if !unicode.IsSpace(char) {
			break
		}
	}
	// Completely empty
	if i < 0 {
		return 0
	}

	var j int
	for j = 0; j < len; j++ {
		char := chars.Get(j)
		if !unicode.IsSpace(char) {
			break
		}
	}
	chars.trimLength = AsUint16(i - j + 1)
	return chars.trimLength
}

func (chars *Chars) TrailingWhitespaces() int {
	whitespaces := 0
	for i := chars.Length() - 1; i >= 0; i-- {
		char := chars.Get(i)
		if !unicode.IsSpace(char) {
			break
		}
		whitespaces++
	}
	return whitespaces
}

func (chars *Chars) ToString() string {
	if runes := chars.optionalRunes(); runes != nil {
		return string(runes)
	}
	return string(chars.slice)
}

func (chars *Chars) ToRunes() []rune {
	if runes := chars.optionalRunes(); runes != nil {
		return runes
	}
	bytes := chars.slice
	runes := make([]rune, len(bytes))
	for idx, b := range bytes {
		runes[idx] = rune(b)
	}
	return runes
}

func (chars *Chars) CopyRunes(dest []rune) {
	if runes := chars.optionalRunes(); runes != nil {
		copy(dest, runes)
		return
	}
	for idx, b := range chars.slice {
		dest[idx] = rune(b)
	}
	return
}

func (chars *Chars) Slice(b int, e int) Chars {
	if runes := chars.optionalRunes(); runes != nil {
		return RunesToChars(runes[b:e])
	}
	return Chars{slice: chars.slice[b:e], inBytes: true}
}

func (chars *Chars) Split(delimiter string) []Chars {
	delim := []rune(delimiter)
	numChars := chars.Length()
	numDelim := len(delim)
	begin := 0
	ret := make([]Chars, 0, 1)

	for index := 0; index < numChars; {
		if index+numDelim <= numChars {
			match := true
			for off, d := range delim {
				if chars.Get(index+off) != d {
					match = false
					break
				}
			}
			// Found the delimiter
			if match {
				incr := Max(numDelim, 1)
				ret = append(ret, chars.Slice(begin, index+incr))
				index += incr
				begin = index
				continue
			}
		} else {
			// Impossible to find the delimiter in the remaining substring
			break
		}
		index++
	}
	if begin < numChars || len(ret) == 0 {
		ret = append(ret, chars.Slice(begin, numChars))
	}
	return ret
}
