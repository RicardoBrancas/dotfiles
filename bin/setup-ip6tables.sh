set -x

ip6tables -F
ip6tables -X

ip6tables -N TCP
ip6tables -N UDP
ip6tables -N sshguard

ip6tables -P FORWARD DROP
ip6tables -P OUTPUT ACCEPT
ip6tables -P INPUT DROP

#allow established connections
ip6tables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

#allow loopback
ip6tables -A INPUT -i lo -j ACCEPT

#drop invalid traffic
ip6tables -A INPUT -m conntrack --ctstate INVALID -j DROP

#allow ICMPv6 Neighbor Discovery Protocol
ip6tables -A INPUT -s fe80::/10 -p ipv6-icmp -j ACCEPT

#allow pings
ip6tables -A INPUT -p ipv6-icmp --icmpv6-type 128 -m conntrack --ctstate NEW -j ACCEPT

#attach sshguard
ip6tables -A INPUT -m multiport -p tcp --destination-ports 21,22 -j sshguard

#attach udp and tcp
ip6tables -A INPUT -p udp -m conntrack --ctstate NEW -j UDP
ip6tables -A INPUT -p tcp --syn -m conntrack --ctstate NEW -j TCP

#something something default linux behavior, RFC compliant stuff stuff
ip6tables -A INPUT -p UDP -j REJECT --reject-with icmp6-port-unreachable
ip6tables -A INPUT -p tcp -j REJECT --reject-with tcp-reset

#reject all other traffic with linux default behavior
ip6tables -A INPUT -j REJECT --reject-with icmp6-adm-prohibited

#ssh
ip6tables -A TCP -p tcp --dport 22 -j ACCEPT

#synergy
ip6tables -A TCP -p tcp --dport 24800 -j ACCEPT

#transmission
ip6tables -A UDP -p udp --dport 51413 -j ACCEPT

#mdns
ip6tables -A UDP -p udp --dport 5353 -j ACCEPT

#SAVE
ip6tables-save > /etc/iptables/ip6tables.rules
