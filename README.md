# TreatSecurityInLinuxServers

!Do Not Use The Following Codes For Any Bad Purpose!
!The Followimg Code Show An Guide Line Of Ideas How You Should Not Build Your Farmware!
!Always In Your Programs You Sould Consider The Edges Scenarios Of Security!


Do Not Use The Following Codes For Any Bad Purpos
Do Not Use The Following Codes For Any Bad Purpose
when linux server compile and checking your code and you under a system user
you can ran program for connect the linux server for interface and over control
the server from this interface , for example university who check 
the Wet hw on linux server
1)
To turn on anonymous mode on a Linux server, you can follow these steps:

Open the terminal and log in to the Linux server as the root user.
Open the SSH configuration file using a text editor, such as nano:
Copy code

nano /etc/ssh/sshd_config

Find the line that says PermitRootLogin and set its value to yes. This will allow you to log in as the root user over SSH.
Find the line that says PasswordAuthentication and set its value to no. This will disable password authentication, 
so that users must use a key pair to log in.
Save the file and exit the text editor.
Restart the SSH service to apply the changes:
Copy code

systemctl restart ssh

2)
To create a C++ program to connect to an online interface and control a Linux server, you can use the following code as a starting point:

Copy code
#include <iostream>
#include <string>
#include <curl/curl.h>

using namespace std;

int main() {
  CURL *curl;
  CURLcode res;

  curl = curl_easy_init();
  if(curl) {
    curl_easy_setopt(curl, CURLOPT_URL, "http://your-interface-url.com/");
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, "command=command_to_execute");

    res = curl_easy_perform(curl);
    if(res != CURLE_OK) {
      cout << "Error: " << curl_easy_strerror(res) << endl;
    }

    curl_easy_cleanup(curl);
  }

  return 0;
}



This code uses the cURL library to send a POST request to the specified URL with the specified command.
You will need to replace "http://your-interface-url.com/" 
with the URL of the online interface and "command_to_execute" with the command you want to execute on the Linux server.

3)
To run the C++ program, you can use the following command:

Copy code

g++ -o program_name program_name.cpp
./program_name

Replace "program_name" with the name of your C++ program. This will compile the program and then run the executable file.
