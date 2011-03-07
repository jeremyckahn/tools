# makes the connection to jkahn.local:8888 really slow.

ipfw pipe 1 config bw 4KByte/s
ipfw add pipe 1 tcp from any to me 8888