#script that checks for some common security weaknesses in Linux servers:

import subprocess

# Check for unnecessary services running
unnecessary_services = ['telnet', 'ftp', 'rsh', 'rlogin', 'rexec']
output = subprocess.check_output(['service', '--status-all']).decode('utf-8')
for service in unnecessary_services:
    if service in output:
        print(f'WARNING: {service} service is running')

# Check for insecure protocols in use
insecure_protocols = ['telnet', 'ftp', 'rsh', 'rlogin', 'rexec']
output = subprocess.check_output(['netstat', '-l']).decode('utf-8')
for protocol in insecure_protocols:
    if protocol in output:
        print(f'WARNING: {protocol} protocol is in use')

# Check for weak passwords
output = subprocess.check_output(['cat', '/etc/shadow']).decode('utf-8')
for line in output.split('\n'):
    if ':' in line:
        username, hash = line.split(':')[0:2]
        if hash == '*':
            print(f'WARNING: {username} has no password set')
        elif hash.startswith('$1$'):
            print(f'WARNING: {username} has a weak MD5 hashed password')
        elif hash.startswith('$2a$') or hash.startswith('$2y$'):
            print(f'WARNING: {username} has a weak Blowfish hashed password')

# Check for open ports
output = subprocess.check_output(['nmap', '-sT', 'localhost']).decode('utf-8')
for line in output.split('\n'):
    if 'open' in line:
        print(f'WARNING: {line.strip()}')

#This script does the following:

#Checks for unnecessary services running on the system and prints a warning for each one found
#Checks for the use of insecure protocols and prints a warning for each one found
#Checks the /etc/shadow file for weak passwords and prints a warning for each one found
#Uses nmap to scan for open ports on the localhost and prints a warning for each one found