# Linux I Final Project
The final project consist of writing 3 bash scripts.  You must complete the below and submit 3 separate scripts and output from running the scripts. This assignment is due the last day of class.

1. Create a text file called "datafile". Each entry consists of fields separated by colons. The fields are as follows:
  a. First and Last name  
  b. Phone Number  
  c. Address  
  d. Birth date  
  e. Salary  
Create a script called "lookup" that will do the following:  
  a. Contain a comment section with the script name, your name, the date, and the reason for writing this script.  
		The reason for writing this script is to display datafile in sorted order.  
  b. Sort "datafile" by last names.  
  c. Show the user the contents of "datafile".  
  d. Tell the user the number of entries in the file.  
  Note: Try the -x and -v options for debugging your script.  

2. Modify the "lookup" script above to ask the user if he or she would like to add an entry to datafile.  If the answer is yes or y:  
  a. Prompt the user for a new name, phone number, address, birth date, and salary. Each item will be stored in a separate variable.  
		You will provide the colons between the fields and append the information to the "datafile".  
  b. Sort the file by last names.  Tell the user you added the entry, and show him or her the line preceded by the line number.  

3. The above "lookup" script depends on "datafile" in order to run.  In the "lookup" script, check to see if the "datafile" exists and if it is readable and writable.  
		Add a menu to the "lookup" script to resemble the following:  
	[1] Add entry  
	[2] Delete entry  
	[3] View entry  
	[4] Exit  
  Write a function to handle each of the items in the menu. After the user has selected a valid entry, and the function has completed, ask if the user would like to see the menu again.  If an invalid entry is entered, the program should print:  
    "Invalid entry, try again."  
    and the menu will be redisplayed.  
You already have the Add entry part of the script written. The Add entry routine should now include code that will check to see if the name is already in the datafile and if it is, tell the user so. If the name is not there, add the new entry.  
Now write the code for the Delete entry, View entry, and Exit functions. Each 'function' should be contained inside a bash function which gets invoked upon the user selection.  
The Delete part of the script should first check to see if the entry exists before trying to remove it.  If it does, notify the user; otherwise, remove the entry and tell the user you removed it. On exit, make sure that you use a digit to represent the appropriate exit status.  
How do you check the exit status from the command line?
