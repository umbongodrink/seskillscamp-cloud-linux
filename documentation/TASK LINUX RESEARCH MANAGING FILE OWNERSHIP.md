# Linux file ownership


## Why is managing ownership important?

1. Accountability:

Clear Roles and Responsibilities: When ownership is clearly defined, it's easier to assign tasks and hold individuals accountable for their work.   
Reduced Blame Games: Clear ownership prevents finger-pointing and helps resolve issues efficiently.

2. Improved Productivity:

Focus and Efficiency: Knowing who's responsible for a task helps individuals prioritize and work efficiently.
Reduced Overlap: Clear ownership minimizes duplication of effort and wasted time.  

3. Enhanced Quality:

Attention to Detail: When someone owns a task, they're more likely to pay close attention to details and strive for excellence.   
Reduced Errors: Clear ownership helps identify and correct mistakes promptly.

4. Better Decision-Making:

Informed Choices: Owners have a deeper understanding of the task or project, enabling them to make better decisions.
Faster Problem-Solving: Owners can quickly identify and address issues.

5. Stronger Teamwork:

Collaboration: Clear ownership fosters collaboration as team members know who to rely on.   
Shared Responsibility: A sense of shared ownership builds team morale and unity. 
  
6. Effective Project Management:

Progress Tracking: Clear ownership makes it easier to track project progress and identify potential bottlenecks.   
Risk Mitigation: Owners can proactively identify and mitigate risks.   

7. Organizational Success:

Improved Performance: Clear ownership contributes to overall organizational performance and goal achievement.   
Customer Satisfaction: Well-defined ownership leads to better customer service and satisfaction.


## What is the command to view file ownership? 

```
ls -l filename.txt
```
which will output something like:
```
-rw-r--r--  1 user  group  12345  Jan  1  2024 filename.txt
```
where:

-rw-r--r--: File permissions (read/write for owner, read-only for group and others)

1: Number of hard links

user: File owner   

group: Group owner

12345: File size in bytes

Jan 1 2024: Modification date

filename.txt: File name


## What permissions are set when a user creates a file or directory? Who does file or directory belong to?

When a user creates a file or directory, the default permissions and ownership are typically determined by the file system and system settings, but they generally follow these principles:

**Ownership**:

User: The file or directory is usually owned by the user who created it. This means the user has full control over the file or directory, including the ability to read, write, modify, and delete it. 

  
**Permissions**:

The default permissions for newly created files and directories vary depending on the file system and system configuration, but they often follow these common patterns:

Files: Read, Write, Execute (rwx) for the owner: The owner can read, write, and execute the file.
Read-only (r--) for the group and others: Members of the group and other users can only read the file.

**Directories**: Read, Write, Execute (rwx) for the owner: The owner can read, write, and execute files within the directory, as well as create, modify, and delete files and subdirectories.
Read and Execute (rx) for the group and others: Members of the group and other users can read the contents of the directory and access files within it, but they cannot create, modify, or delete files or subdirectories.


## VIEWING FILE OWNERSHIP

```ls -l filename.txt```


### WHY DOES THE OWNER OF A FILE NOT RECEIVE X PERMISSIONS BY DEFAULT WHEN CREATING A FILE?

- **Security**: helps prevent accidental execution of potentially malicious code
- **File Types**: not all file types are meant to be executed (e.g. image types, text types etc)


### WHAT COMMAND IS USED TO CHANGE THE OWNER OF A FILE?

```
sudo chown new_owner:new_group filename.txt
```


### If you give permissions to the User entity, what does that mean?

This means granting a single user specific rights or privileges (to access and interact with certain resources)


### If you give permissions to the Group entity, what does that mean?

This means giving permissions to a *set* of users that belong to that set ("group"). By using Group permissions you can
- **simplify administration**: by grouping users together, so you don't have to change permissions on an individual one-by-one basis
- **improve security**: by limiting to specific sets of people


### If you give permissions to the Other entity, what does that mean?

This means granding permissions to anyone who doesn't specifically belong to the owner or group of a file or directory. NOTE: It's important to balance security and accessibility when setting "Other" permissions. Overly permissive permissions can expose sensitive information, while overly restrictive permissions can hinder collaboration.


### You give the following permissions to a file: User permissions are read-only, Group permissions are read and write, Other permissions are read, write and execute. You are logged in as the user which is the owner of the file. What permissions will you have on this file?

*As the owner of the file, you will have the permissions specified for the User category, which in this case is read-only.* This means you can view the contents of the file but cannot modify or execute it.

Even though you are the owner, the specific permissions assigned to the User category will override your default privileges.



### What numeric values are assigned to each permission?

```
r = 4
w = 2
x = 1
```

These values are combined to represent the different permission levels:
```
rwx = 4 + 2 + 1 = 7
rw- = 4 + 2 + 0 = 6
r-- = 4 + 0 + 0 = 4
```
When you see a permission string like rwxr-xr-x, it can be represented numerically as 755.


### What value would assigne read, write and execute permissions?

7


### What value would assign read and execute permissions?

5

### Often, a file or directory's mode/permission are represented by 3 numbers. What do  you think 644 would mean?

- 6: This represents the permissions for the owner.
4 (read) + 2 (write) = 6
So, the owner has read and write permissions.

- 4: This represents the permissions for the group.
4 (read) = 4
So, the group has read permissions.

- 4: This represents the permissions for others.
4 (read) = 4
So, others have read permissions.
Therefore, a file or directory with the mode 644 has the following permissions:

Owner: Read and write
Group: Read
Others: Read
This is a common permission setting for files, as it allows the owner to modify the file, while others can only view it.


### What command changes file permissions?

`chmod`, e.g.

```
chmod 764 myfile.txt
```
This translates to:

7: Owner has read, write, and execute permissions.
6: Group has read and write permissions.
4: Others have read permissions.

You can also use symbolic mode changes:

```
chmod u+x myfile.txt  # Add execute permission for the owner
chmod g-w myfile.txt  # Remove write permission for the group
```


### To change permissions on a file what must the end user be?

1. **The owner of the file**: This is the most common scenario. The owner has the authority to modify the permissions of their own files.   
   
OR

2. **A user with administrative privileges (root)**: A user with root privileges can change the permissions of any file on the system, regardless of ownership.


### EXAMPLE OF PERMISSION CHANGING TO testfile.txt:

1. set User to read, Group to read + write + execute, Other to read + write:
```
sudo chmod 476 testfile.txt
sudo chmod u=r, g=rwx,o=rw testfile.txt
```

2. add execute permissions to all entities:

```
sudo chmod +x testfile.txt
```

3. take write permissions away from Group
```
sudo chmod g-w testfile.txt
```

4. Use numeric values to give read + write to User, read access to Group, and no access to Other.
```
sudo chmod 640 testfile.txt

