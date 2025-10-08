# import sys
import math

# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

s, m = (int(i) for i in input().split())
service_maxclients = []
for i in input().split():
    maxclients = int(i)
    service_maxclients.append(maxclients)
service_clients = []
for _ in range(m):
    service_clients_row = []
    for j in input().split():
        clients = int(j)
        service_clients_row.append(clients)
    service_clients.append(service_clients_row)
temp_instances = [0] * s
for i in range(m):

    # Write an answer using print
    # To debug: print("Debug messages...", file=sys.stderr, flush=True)

    service_clients_row = service_clients[i]

    instances = [
        math.ceil(client / maxclient)
        for client, maxclient
        in zip(service_clients_row, service_maxclients, strict=True)
    ]

    scalings = [instance - temp_instance for instance, temp_instance in zip(instances, temp_instances, strict=True)]
    temp_instances = instances

    result = ' '.join(map(str, scalings))

    # print("Number of services to start / stop")
    print(result)
