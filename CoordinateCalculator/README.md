# STEP 5. 좌표계산기

&nbsp;

## :pushpin: step 5-1 

### ANSI Code

1. **ASCII Code**
   - 8bit(1byte) 중 7bit를 사용하여 문자를 나타내는 코드
   - 총 128개 문자 표현 가능 (0 ~ 127)
   - 나머지 1bit : parity bit (even/odd for error detecting)
   - 영어만을 고려하여 설계됨
2. **ANSI Code**
   - 8bit, ASCII Code와 compatible(호환가능) 
   - 앞 7bit는 ASCII Code와 동일
   - 뒤의 1bit로 영어가 아닌 다른 언어를 표현(CodePage)

3. **ANSI Escape Code**
   terminal 안에서 cursor 위치를 옮기고, 색상을 변경하는 등의 동작을 할 수 있는 일련의 sequence standard

   - 형식 : ```esc[<동작> ``` - escape 문자 이후에 termainal에서 하고자 하는 동작을 넣음

   - escape(esc) : ```\u{001B}```

   - clear: ```esc[2J```

   - home (좌표 원점) : ```esc[line;colH]``` or ```esc[line;colf```

   - white bright: ```esc[37;1m```

   - 그외 escape reference

     [Build your own Command Line with ANSI escape codes](http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html)

     [ANSI Escape Code](<http://ascii-table.com/ansi-escape-sequences.php>)



&nbsp;