# Function
Moves file to a */tmp/* directory.
Can delete the temporary files.
Can list the "deleted" files and the size they are taking.

Files are Stored an a tmpfs which is problematic with huge files and low RAM.

# Install
Use this instead of the default *rm* command.
cp to */usr/local/bin* or make a alias in your SHELL
