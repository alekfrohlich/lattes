"""This script automates the usage of postgres on my windows installation.

To execute psql, run:

    $ psql.exe -h localhost -U postgres -d postgres -p 5433

To avoid truncation whilst monitoring ENV variable, run:

    $ Get-ChildItem Env:PATH | Format-Table -Wrap -AutoSize

Some usefull shortcuts:
    \q to quit psql

"""

import subprocess

PSQL_FLAGS = ['-h', 'localhost', '-U', 'postgres', '-p', '5433']
RUN_PSQL = False

subprocess.run(['dropdb'] + PSQL_FLAGS + ['lattes'])
subprocess.run(['createdb'] + PSQL_FLAGS + ['lattes'])
subprocess.run(['psql'] + PSQL_FLAGS + ['-d', 'lattes', '-f', '.\stable\\final.sql'])

if RUN_PSQL:
    subprocess.run(['psql'] + PSQL_FLAGS + ['-d', 'lattes', '-f', '.\\tests\\populate.sql'])
    subprocess.run(['psql'] + PSQL_FLAGS + ['-d', 'lattes'])