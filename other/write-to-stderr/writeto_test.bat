@echo off
SetLocal EnableExtensions
rem This BAT file test for writeto.bat

call writeto.bat 1>_stdout.txt 2>_stderr.txt 
