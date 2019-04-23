# ANSICode

- 도스의 표준입력 및 표준출력 이외에 확장된 표준입력 및 표준출력을 말하는 것으로 8bit로 구성되어 있으며 256개의 문자를 표현할 수 있다. 안시코드를 이용하여 화면을 제어하거나 글자색 및 바탕색을 지정할 수 있다.( 표시 형식은 아래와 같다)

| Code | Effect                                              | Note                                                         |
| ---- | --------------------------------------------------- | ------------------------------------------------------------ |
| 0    | Reset / Normal                                      | all attributes off                                           |
| 1    | 강조: Bold                                          |                                                              |
| 2    | 강조: Faint                                         | not widely supported                                         |
| 3    | Italic: on                                          | not widely supported                                         |
| 4    | Underline: Single                                   | not widely supported                                         |
| 5    | Blink: Slow                                         | less than 150 per minute                                     |
| 6    | Blink: Rapid                                        | MS-DOS ANSI.SYS; 150 per minute or more                      |
| 7    | Image: Negative                                     | inverse or reverse; swap 글자색 and 배경색                   |
| 8    | Conceal                                             | not widely supported                                         |
| 9    | Strikethrough: on                                   | not widely supported                                         |
| 10   | 폰트: Primary (default)                             | not widely supported                                         |
| 11   | 폰트: First Alternative                             | not widely supported                                         |
| 12   | 폰트: Second Alternative                            | not widely supported                                         |
| 13   | 폰트: Third Alternative                             | not widely supported                                         |
| 14   | 폰트: Fourth Alternative                            | not widely supported                                         |
| 15   | 폰트: Fifth Alternative                             | not widely supported                                         |
| 16   | 폰트: Sixth Alternative                             | not widely supported                                         |
| 17   | 폰트: Seventh Alternative                           | not widely supported                                         |
| 18   | 폰트: Eighth Alternative                            | not widely supported                                         |
| 19   | 폰트: Ninth Alternative                             | not widely supported                                         |
| 20   | 폰트: Fraktur (Gothic)                              | not widely supported                                         |
| 21   | Underline: Double                                   |                                                              |
| 22   | 강조: Normal                                        | not bold and not faint                                       |
| 23   | Italic: off                                         |                                                              |
| 24   | Underline: None                                     |                                                              |
| 25   | Blink: off                                          |                                                              |
| 26   | (reserved)                                          | reserved for CCITT recommendation T.61 for proportional spacing |
| 27   | Image: Positive                                     |                                                              |
| 28   | Reveal                                              | conceal off                                                  |
| 29   | Strikethrough: off                                  |                                                              |
| 30   | 글자색: Black                                       |                                                              |
| 31   | 글자색: Red                                         |                                                              |
| 32   | 글자색: Green                                       |                                                              |
| 33   | 글자색: Yellow                                      | or brown (sometimes orange at low-강조)                      |
| 34   | 글자색: Blue                                        |                                                              |
| 35   | 글자색: Magenta                                     |                                                              |
| 36   | 글자색: Cyan                                        |                                                              |
| 37   | 글자색: White                                       | bright grey                                                  |
| 38   | (reserved)                                          | reserved for ISO 8613-6 (CCITT recommendation T.416) for setting 글자색 color |
| 39   | 글자색: default                                     |                                                              |
| 40   | 배경색: Black                                       |                                                              |
| 41   | 배경색: Red                                         |                                                              |
| 42   | 배경색: Green                                       |                                                              |
| 43   | 배경색: Yellow                                      | or brown                                                     |
| 44   | 배경색: Blue                                        |                                                              |
| 45   | 배경색: Magenta                                     |                                                              |
| 46   | 배경색: Cyan                                        |                                                              |
| 47   | 배경색: White                                       | bright grey                                                  |
| 48   | (reserved)                                          | reserved for ISO 8613-6 (CCITT recommendation T.416) for setting 배경색 color |
| 48   | Subscript                                           | nonstandard                                                  |
| 49   | 배경색: default                                     |                                                              |
| 49   | Superscript                                         | nonstandard                                                  |
| 50   | (reserved)                                          | reserved for cancelling 26 proportional spacing              |
| 51   | framed                                              |                                                              |
| 52   | encircled                                           |                                                              |
| 53   | overlined                                           |                                                              |
| 54   | not framed, not encircled                           |                                                              |
| 55   | not overlined                                       |                                                              |
| 56   | (reserved)                                          | reserved for future standardization                          |
| 57   | (reserved)                                          | reserved for future standardization                          |
| 58   | (reserved)                                          | reserved for future standardization                          |
| 59   | (reserved)                                          | reserved for future standardization                          |
| 60   | ideogram underline or right side line               |                                                              |
| 61   | ideogram double underline or double right side line |                                                              |
| 62   | ideogram overline or left side line                 |                                                              |
| 63   | ideogram double overline or double left side line   |                                                              |
| 64   | ideogram stress marking                             |                                                              |
| 90   | 글자색: Bright Black                                | dark grey                                                    |
| 91   | 글자색: Bright Red                                  |                                                              |
| 92   | 글자색: Bright Green                                |                                                              |
| 93   | 글자색: Bright Yellow                               |                                                              |
| 94   | 글자색: Bright Blue                                 |                                                              |
| 95   | 글자색: Bright Magenta                              |                                                              |
| 96   | 글자색: Bright Cyan                                 |                                                              |
| 97   | 글자색: Bright White                                |                                                              |
| 100  | 배경색: Bright Black                                | dark grey                                                    |
| 101  | 배경색: Bright Red                                  |                                                              |
| 102  | 배경색: Bright Green                                |                                                              |
| 103  | 배경색: Bright Yellow                               |                                                              |
| 104  | 배경색: Bright Blue                                 |                                                              |
| 105  | 배경색: Bright Magenta                              |                                                              |
| 106  | 배경색: Bright Cyan                                 |                                                              |
| 107  | 배경색: Bright White                                |                                                              |