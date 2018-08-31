;**********************************************************
;* Author: @BrainCodec
;* Date: August 31, 2018
;* Description: A simple Microsoft Windows assembler program
;
;* Assembler command:
;*   ml /c /coff messagebox.asm
;* Linker command:
;*   link messagebox /entry:_main /SUBSYSTEM:WINDOWS /defaultlib:kernel32.lib /defaultlib:user32.lib /libpath:"C:\...\Windows Kits\10\Lib\...\um\x64\"


.386
.model flat, stdcall

; We need some Windows APIs like MessageBox and ExitProcess
extrn MessageBoxA@16 : PROC
extrn ExitProcess@4 : PROC

option casemap:none

; Data segment
.DATA
  WindowTitle db "Window title by @BrainCodec", 0 ; 0 => End of string
  Message     db "Here you can type your own message, like: Hello, world!", 0

  ; Code segment where the main food will be cooking.
.CODE
_main PROC

  push 0
  push offset WindowTitle
  push offset Message
  push 0

  call MessageBoxA@16
  call ExitProcess@4

  ret
_main ENDP

END