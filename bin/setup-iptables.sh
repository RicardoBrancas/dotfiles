iptables -F
iptables -X

iptables -N TCP
iptables -N UDP
iptables -N sshguard

iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -P INPUT DROP

#allow established connections
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

#allow loopback
iptables -A INPUT -i lo -j ACCEPT

#drop invalid traffic
iptables -A INPUT -m conntrack --ctstate INVALID -j DROP

#allow pings
iptables -A INPUT -p icmp --icmp-type 8 -m conntrack --ctstate NEW -j ACCEPT

#attach sshguard
iptables -A INPUT -m multiport -p tcp --destination-ports 21,22 -j sshguard

#attach udp and tcp
iptables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP
iptables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP

#something something default linux behavior, RFC compliant stuff stuff
iptables -A INPUT -p UDP -j REJECT --reject-with icmp-port-unreachable
iptables -A INPUT -p tcp -j REJECT --reject-with tcp-reset

#reject all other traffic with linux default behavior
iptables -A INPUT -j REJECT --reject-with icmp-proto-unreachable

#ssh
iptables -A TCP -p tcp --dport 22 -j ACCEPT

#synergy
iptables -A TCP -p tcp --dport 24800 -j ACCEPT

#transmission
iptables -A UDP -p udp --dport 51413 -j ACCEPT

#mdns
iptables -A UDP -p udp --dport 5353 -j ACCEPT

#SAVE
iptables-save > /etc/iptables/iptables.rules
