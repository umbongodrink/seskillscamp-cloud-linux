
## What is piping?

A powerful technique in Linux and other Unix-like systems that allows you to chain commands together, using the output of one command as the input for another. 

It's represented by the vertical bar | symbol.

How it works:

- **Command Execution**: The command on the left-hand side of the pipe is executed first.   
- **Output Redirection**: The standard output (stdout) of the first command is redirected to the standard input (stdin) of the second command.   
- **Second Command Execution**: The second command processes the input received from the first command and produces its own output.


Example:

Let's say you want to list all files in a directory, sort them alphabetically, and then count the number of files. You can achieve this using piping:

```
ls | sort | wc -l
```

Here's a breakdown of how this works:

- ls: Lists all files in the current directory.
- |: Pipes the output of ls to the next command.
- sort: Sorts the list of files alphabetically.
- |: Pipes the sorted list to the next command.
- wc -l: Counts the number of lines in the sorted list (which is the number of files).
  
By chaining these commands together using pipes, you can create complex data processing pipelines with minimal effort.   


## How is piping different to redirection using > or >> ?

| Feature   | Piping    | Redirection   |
|-----------|-----------|---------------|
| Purpose   | Connects Commands | Redirects input/output to/from files  |
| Data Flow | Between processes | Between a process and a file  |
|Output | Temporary, consumed by the next command   | Persistent, stored in a file  |


In summary, 
- **piping** is used to create a dynamic pipeline of commands, while 
- **redirectio** is used to store the output of a command in a file or to provide input to a command from a file.


## What character is used for piping?

|


## Give an example of a command the uses piping once?

This is a common way to find processes related to Python on a Linux system:
```
ps aux | grep python
```
This command will:

1. List all processes: The ps aux command lists all running processes on the system.
2. Pipe the output: The | symbol pipes the output of ps aux to the next command.
3. Filter for Python processes: The grep "python" command filters the output to only show lines containing the word "python".



## Give an example of a command that uses piping twice?

```
find / -name "*.txt" | xargs grep "keyword" | wc -l
```
Here's a breakdown of how this command works:

1. Find text files: find / -name "*.txt" searches for all files ending with .txt in the root directory and its subdirectories.
2. Pipe to xargs: The output of the find command (a list of file paths) is piped to xargs.
3. Search for keyword: xargs grep "keyword" takes the list of files and runs grep "keyword" on each file, searching for the specified keyword.
4. Count matches: The output of xargs grep "keyword" (lines containing the keyword) is piped to wc -l.
5. Count lines: wc -l counts the number of lines in the output, which in this case represents the total number of matches of the keyword in all the text files.