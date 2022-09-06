# import sys
# import math

import re

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

ip = input()

# Write an answer using print
# To debug: print("Debug messages...", file=sys.stderr, flush=True)

temp_ip = ip

ommit = sum(map(list, re.findall('(0000(:0000)+)', temp_ip)), [])
if len(ommit) > 0:
    ommit = sorted(ommit, key=len)[-1]
    temp_ip = temp_ip.replace(ommit, ':', 1).replace(':::', '::')

temp_ip = re.sub('^0+', '0', temp_ip)
temp_ip = re.sub(':0+', ':0', temp_ip)
temp_ip = re.sub(':0([1-9a-f])', ':\\1', temp_ip)

result = temp_ip

# print("output")
print(result)
