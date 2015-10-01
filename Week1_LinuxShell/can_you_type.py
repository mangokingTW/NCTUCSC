#!/usr/bin/python -u
import os


password = "\xff\xee\xdd\xcc\xaa\x99\x88\x77\x66\x55"
print "Hello, challenger!"
print "Can you type non-printable characters?"
print password, password.encode('hex')
guess = raw_input()
if guess == password:
	os.system("echo 'Congrats! Here is your shell :' ; bash")
else:
	print "You shall not pass!"
