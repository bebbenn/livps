#!/bin/bash

# Welcome to Linux vs PowerShell.

# The script turns commonly used linux commands into to similar Powershell commands.
# How to use the scrit is just to pass an argument which is the command you wanna lookup.
# ./livps.sh diff	///	./livps.sh sudo -u		///	./livps grep
# Enjoy

if [[ $# == 0 ]];
	then
		echo "Use an agrugment with the command you want to look up! Example: ./livps.sh grep"

fi

if [[ $# == 1 ]];
	then

		case "$1" in

			grep)
			printf "grep = findstr"

			;;

			which)
			printf "which = gcm = Get-Command"

			;;

			find)
			printf 'find = gci = Get-ChildItem\n\n'
			printf 'findstr = to find textstrings in files.\n\n'
			printf "findstr /si password *.txt' to search for password in all .txt files in current dir and recursively. .xml etc can be used.\n\n"
			printf 'gci -r -fi *.jar = finds all files that has '.jar' file ending.\n\n'
			printf 'ls -r C:\ *.txt 2>$null = finds all files from C:\ that has .txt file ending.\n\n'
			printf 'For redirect error use 2>$null.'

			;;

			chmod)
			printf "chmod = ICACLS\n\n"
			printf "Problem executing a script? run Set-Executionpolicy Unrestricted\n\n"
			printf "Grants Full Control permission on a specific file:\nICACLS '"D:\path\to\file.txt"' /grant:r 'user:(F)' /C\n\n"
			printf "Grants Read and Execute permission on a specific file:\nICACLS '"D:\path\to\file.txt"' /grant:r 'user:(RX)' /C\n\n"
			printf "Grants Modify permission on a specific file:\nICACLS '"D:\path\to\file.txt"' /grant:r 'user:(M)' /C\n\n"
			printf "Grants Write permission on a specific file:\nICACLS '"D:\path\to\file.txt"' /grant:r 'user:(W)' /C\n\n"
			printf "Grants Read permission for a specific file:\nICACLS '"D:\path\to\file.txt"'' /grant:r 'user:(R)' /C"

			;;

			chown)
			printf "chown = ICACLS\n\n"
			printf "Set Owner of a specific file:\nICACLS '"D:\path\to\file.txt"' /setowner 'user'"

			;;

			touch)
			printf "touch = New-Item -Itemtype file testfile.txt"

			;;

			less)
			printf "less = more\n\n"
			printf '"cat txt.txt | out-host -paging" works aswell.'

			;;

			tail)
			printf "tail can be used in two ways:\n\n"
			printf "cat -tail 10 file.txt\n\n"
			printf "cat file.txt | select -last 10\n\n"
			printf "10 can be changed to any number."

			;;

			head)
			printf "head can be used in two ways:\n\n"
			printf "cat -head 10 file.txt\n\n"
			printf "cat file.txt | select -first 10\n\n"
			printf "10 can be changed to any number."

			;;

			history)
			printf "history = Get-history"

			;;

			ps)
			printf "ps = Get-Process\n\n"
			printf "Get-Service can be used to see which programs that are installed."

			;;

			kill)
			printf "kill = Stop-Process\n\n"
			printf "Stop-Process -Name 'ProcessName' -Force\n\n"
			printf "Stop-Process -ID PID -Force"

			;;

			diff)
			printf "diff = compare-object\n\n"
			printf "Look at the arrows to the right to see diffrence between the objects.\n\n"
			printf 'Comapre files in folders: compare-object (ls -r C:/path/to/folder) (ls -r C:/path/to/folder)\n\n'
			printf 'Compare obejct isnt the best for hidden files. Hidden files can be viewed with ls -h.\n\n'
			printf 'Compare textfiles: compare-object (cat file.txt) (cat file.txt)'

			;;

			sort)
			printf "sort = sort-object\n"
			printf "cat file.txt | sort-object\n\n"
			printf "There is no way without hassle to sort numbers by true order, only the first digit.\n"
			printf "There is two usefull arguments: -Descending and -Unique"

			;;

			help)
			printf "help/-h = Get-Help\n\n"
			printf "Use like this: Get-help command"

			;;

			-h)
			printf "help/-h = Get-Help\n\n"
			printf "Use like this: Get-help command"

			;;

			env)
			printf "env = dir env\n\n"
			printf "To change a env use \$Env:*\n"
			printf 'Example: $Env:Path += ''";c:path"'''


			;;

			wc)
			printf "wc = Measure-Object\n\n"
			printf "cat file.txt | Measure-Object -Character -Word -Line"

		esac
fi

if [[ $# == 2 ]];
	then

		case "$@" in

			'sudo -u')
			printf "sudo -u = runas\n\n"
			printf "Syntax: runas /user:administrator test.exe"
			printf "\n\n"
			printf "If you got the password for another user you can use this method to run a command as them:\n"
			printf 'Create variable: $pass = ConvertTo-SecureString "users-password" -AsPlainText -Force\n'
			printf 'Create variable: $cred = New-Object System.Management.Automation.PSCredential("Computername\\user", $pass)\n'
			printf "Computername is not allways needed and sometimes two \ is needed.\n\n"
			printf "Then we execute a command:\n"
			printf 'Invoke-Command -Computername <name> -Credential $cred -ScriptBlock {whoami}\n'
			printf 'If command works change "whoami" to desired payload.'

			;;

			'cat /etc/passwd')
			printf "net user\n\n"
			printf "Get-ADUser"

			;;

			'wc -l')
			printf "wc -l = Measure-Object -line\n\n"
			printf "cat file.txt | Measure-Object -line"

			;;

			'wc -w')
			printf "wc -w  = Measure-Object -word\n\n"
			printf "cat file.txt | Measure-Object -word"


			;;

			'wc -c')
			printf "wc -c = Measure-Object -Character\n\n"
			printf "cat file.txt | Measure-Object -Character"

			;;

		esac
fi
