#!/usr/bin/env zsh

############################################################# 
# Host
#############################################################

qq-enum-host-tcpdump() {
    info "${__IFACES}"
    local r && read "r?Remote Host: "
    local i && read "i?Interface: "
    print -z "tcpdump -i ${i} host ${r} -w host.${r}.pcap"
}

qq-enum-host-basic-nmap(){
  local r && read "r?Remote Host: "
  print -z "nmap -vvv -sC -sV --open -oA scan.${r}.top ${r}"
}

qq-enum-host-syn-fast-nmap() {
  local r && read "r?Remote Host: "
  print -z "nmap -vvv -n -Pn -sS -T4 --open -oA scan.${r}.syn -p- ${r}"
}

qq-enum-host-svc-nmap() {
  local r && read "r?Remote Host: "
  print -z "nmap -vvv -n -Pn -sS -sC -sV --open -oA scan.${r}.svc -p- ${r}"
}

qq-enum-host-udp-nmap() {
  local r && read "r?Remote Host: "
  print -z "nmap -n -Pn -sU -sV -sC --open -oA scan.${r}.udp --top-ports 100 ${r}"
}

qq-enum-host-lse-grep() {
  print -z "ls /usr/share/nmap/scripts/* | grep "
}
