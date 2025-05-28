 #                            Zer0 - Software Information

### Description:
   Zer0 is a Java-based payload control panel for remote command execution.
   Developed for educational and entertainment purposes.

### Components:
   Zer0Loader (Sender)  - Checks for JDK and loads the Zer0Panel.

   Zer0Loader (Target)  - Loads Zer0Target and makes sure that the target is
                        ready for recieving payloads.

   Zer0Panel  - Contains payload activators.

   Zer0Sender  - Java-based sender running on attacker machine.
                  Sends payload commands to the target.

   Zer0Target  - Java client running on the target machine.
                  Receives and executes commands like RAM Flood, CPU Burn, etc.


### Available Payloads:
   [1] RAM Flood     - Sends a memory overload command to the target.
   [2] CPU Burn      - Triggers high CPU load of the target via infinite processing loop.
   [3] Process Spam  - Spams dummy processes on the target system.

### Requirements:
   - Java SE Development Kit (JDK 11 or newer)!
   - Zer0Sender.class in the working directory!
   - Client machines must be running the Zer0Target Java receiver!

### Legal Notice:
   This tool is intended for use in **controlled environments** only.
   Unauthorized use against machines you do not own or have permission to test
   is strictly prohibited and may violate laws.


### Author:
  Kaldarix - Developing, Programming
