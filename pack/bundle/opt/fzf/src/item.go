package fzf

import (
	"math"

	"github.com/junegunn/fzf/src/util"
)

type transformed struct {
	// Because nth can be changed dynamically by change-nth action, we need to
	// keep the revision number at the time of transformation.
	revision revision
	tokens   []Token
}

// Item represents each input line. 56 bytes.
type Item struct {
	text        util.Chars    // 32 = 24 + 1 + 1 + 2 + 4
	transformed *transformed  // 8
	origText    *[]byte       // 8
	colors      *[]ansiOffset // 8
}

// Index returns ordinal index of the Item
func (item *Item) Index() int32 {
	return item.text.Index
}

var minItem = Item{text: util.Chars{Index: math.MinInt32}}

func (item *Item) TrimLength() uint16 {
	return item.text.TrimLength()
}

// Colors returns ansiOffsets of the Item
func (item *Item) Colors() []ansiOffset {
	if item.colors == nil {
		return []ansiOffset{}
	}
	return *item.colors
}

// AsString returns the original string
func (item *Item) AsString(stripAnsi bool) string {
	if item.origText != nil {
		if stripAnsi {
			trimmed, _, _ := extractColor(string(*item.origText), nil, nil)
			return trimmed
		}
		return string(*item.origText)
	}
	return item.text.ToString()
}

func (item *Item) acceptNth(stripAnsi bool, delimiter Delimiter, transformer func([]Token, int32) string) string {
	tokens := Tokenize(item.AsString(stripAnsi), delimiter)
	transformed := transformer(tokens, item.Index())
	return StripLastDelimiter(transformed, delimiter)
}
