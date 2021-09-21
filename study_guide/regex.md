# Regex Cheat Sheet

- [Basic Matching](#basic-matching)
- [Character Classes and Shortcuts](#character-classes-and-shortcuts)
- [Anchors](#anchors)
- [Quantifiers](#quantifiers)
- [Meta-Characters](#meta-characters)
- [Common Ruby Methods for Regex](#common-ruby-methods-for-regex)

In the following tables, unescaped `a`, `b` and `z` characters denote regular characters, while unescaped `p` and `q` characters indicate patterns (each pattern may be either simple or complex, but they imply different patterns). Other characters can be considered literal.

## Basic Matching

| Pattern | Meaning | Notes |
| - | - | - |
| `/a/` | match the character `a` |
| `/\?/`, `/\./` | use the escape character to match a meta-character literally | `$ ^ * + ? . ( ) [ ] | \ /` |
| `/\n/`, `/\t/` | match a control character | newline, tab, etc |
| `/pq/` | concatenation | pattern `p` followed by pattern `q` |
| `/(p)/` | capture group | refer to capture groups with `\1`, `\2` etc |
| `/(p|q)/` | alternation | `p` or `q` |
| `/p/i` | case insensitive match |

## Character Classes and Shortcuts

| Pattern | Meaning | Notes |
| - | - | - |
| `/[ab]/` | `a` or `b` | all characters with `[]` are included in the class |
| `/[a-z]` | `a` - `z` inclusive | only includes lowercase |
| `/[^ab]/` | any character except `a` or `b` | `^` = excluding a set |
| `/[^a-z]/` | not any characters in `a-z` inclusive |
| `/./` | Any characters (except newline) |
| `/\s/`, `/[\s]/` | Whitespace character | includes space, tab, newline, etc
| `/\S/`, `/[\S]/` | not a whitespace character |
| `/\d/`, `/[\d]/` | decimal digit | i.e. 0-9 |
| `/\D/`, `/[\D]/` | not a decimal digit |
| `/\w/`, `/[\w]/` | word characters | includes `0-9`, `a-z`, `A-Z`, and `_` |
| `/\W/`, `/[\W]/` | not a word characters |
| `/\b/` | any word boundary | "space" between word char and non-word char |

## Anchors

| Pattern | Meaning | Notes |
| - | - | - |
| `/^p/` | pattern `p` at start of line | determined by newline character |
| `/p$/` | pattern `p` at end of line | determined by newline character |
| `/\Ap/` | pattern at start of string | Prefer to `^` |
| `/p\z/` | pattern at end of string | Prefer to `$` |
| `/\bp/` | pattern beginning at word boundary | defined by sequence of word char and non-word char; or beginning/end of string if first/last char is word char (`\w`) |
| `/p\b/` | pattern ends at word boundary |
| `/\Bp/` | pattern begins at non-word boundary |

## Quantifiers

| Pattern | Meaning | Notes |
| - | - | - |
| `/p*/` | 0 or more occurrences of pattern | Greedy. Be careful, 0 occurrences can match between chars |
| `/p+/` | 1 or more occurrences of pattern | Greedy, matches largest available substring |
| `/p?/` | 0 or 1 occurrences of pattern | Greedy. Be careful, 0 occurrences can match between chars |
| `/p{m}/` | `m` occurrences of pattern | Greedy, matches largest available substring |
| `/p{m,}/` | `m` or more occurrences of pattern | Greedy, matches largest available substring |
| `/p{m,n}/` | `m` through `n` occurrences of pattern | Greedy, matches largest available substring |
| `/p*?/` | 0 or more occurrences (lazy) | Lazy matches smallest available substring |
| `/p+?/` | 1 or more occurrences of pattern (lazy) | Lazy matches smallest available substring |
| `/p??/` | 0 or 1 occurrences of pattern (lazy) | Lazy matches smallest available substring |
| `/p{m, }?/` | `m` or more occurrences of `p` (lazy) | Lazy matches smallest available substring |

## Meta-Characters

| Char | Location | Meaning |
| - | - | - |
| `[]` | Outside character class | Surrounds set or range of characters that create character class |
| `^` | Inside character class | Changes following characters to negated characters |
| `-` | Inside character class | Creates a range of characters |
| `\` | Inside character class | Escape character, indicates some kind of control character (`\n`, `\d` etc) |
| `.` | Outside characters class | Denotes _any_ single characters |
| `^` | Outside character class | Start of line anchor |
| `$` | Outside characters class | End of line anchor |
| `()` | Outside character class | Captures everything enclosed to a "capture group" or creates alternation |
| `|` | Outside character class but within `()` | Creates alternation |
| `?*+` | Outside character class | [quantifiers](#quantifiers) |
| `?` | Outside character class | Lazy indicator |
| `/` | Inside and outside character class | regex boundary, escape with `\` |
| `\` | Outside character class | Escape character, escape with `\` |

## Common Ruby Methods for Regex

| Method | Use |
| - | - |
| `String#match` | Determine if regex argument matches a string. Returns MatchData object that can be evaluated for truthiness |
| `String =~ regex` | Determine if regex argument matches a string. Returns the index of the string for the first match found, otherwise returns `nil`. |
| `String#split` | Split string by regex match |
| `String#sub` | Replace first match from calling string to given regex with given replacement string `string.sub(regex, new_str)` |
| `String#gsub` | replace _all_ matches from calling string to given reges with given replacement string `string.gsub(regex, new_str)` |
