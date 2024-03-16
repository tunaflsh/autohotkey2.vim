/*
  source highlight-more.vim
  to see all the highlight groups
*/
#Requires AutoHotkey v2.0
#SingleInstance Force
#Include functions.ahk
Persistent true

;; assign
foo := bar
foo += bar
foo -= bar
foo *= bar
foo /= bar
foo //= bar
foo .= bar
foo |= bar
foo &= bar
foo ^= bar
foo >>= bar
foo <<= bar
foo >>>= bar

;; compare
foo ~= bar  ; RegexMatch
foo > bar
foo < bar
foo >= bar
foo <= bar
foo = bar
foo == bar
foo != bar
foo !== bar

;; name substituition
foo := %bar%
foo := bar_%baz%
foo := bar.%baz%

;; arithmetic
foo + bar
foo - bar
foo / bar
foo // bar
foo * bar
foo ** bar

;; pre and post increment and decrement
var++
var--
++var
--var

;; Bitwise
~var
a | b
a & b
a ^ b
foo << bar
foo >> bar
foo >>> bar

;; reference
x := &y

;; maybe, unset
arr := [z?, unset]

;; or maybe
arr := z ?? true

;; member access
foo.%baz%
foo.bar()
foo.bar

;; arrow function
foo := (x,y) => (x+y)

;; builtin functions
msgbox "hi"
foo.msgbox

;; builtin classes
e := Error()

;; builtin variables
clipboard := A_Clipboard

;; trenary
foo := bar ? baz : quux

;; labels
  a_label:

;; control flow and logical
if ((foo && bar) || !baz) {
  return true
}

;; a class
class cls extends foo {
  static bar() {
    this := super
  }
}
