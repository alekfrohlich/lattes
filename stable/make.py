"""Glue the output of brModelo into one large SQL file."""

RESET_DB = False

filenames = ['endereco', 'formacao', 'producao', 'projeto']
prefix = "log_"

with open('glued.sql', 'w') as outfile:
    for fname in filenames:
        with open(prefix+fname+".sql") as infile:
            outfile.write("\n\n-- IMPORT {}\n\n".format(fname))
            outfile.write(infile.read())

if RESET_DB:
    import subprocess
    subprocess.run(["dropdb", "lattes"])
    subprocess.run(["createdb", "lattes"])
    subprocess.run(["psql", "-d", "lattes", "-f", "glued.sql"])
