import re, string

filename:str = "./Assembler/assembled.v"

with open("./Assembler/program.hex", "r") as f:
    lines = f.readlines()

with open(filename, 'w') as f:
  f.write('')

i = 0
for line in lines:
    m = re.match("(\d+)\s*(.*)", line)
    if m:
        print(str(i) + ": instruction <= 16'h" + m.group(1) + "; " + m.group(2), file=open(filename, "a"))
        i = i + 1
    else:
        if line.isspace():
            print("", file=open(filename, "a"))