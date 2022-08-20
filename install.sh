#!/bin/bash
BK="\e[7m"
RT="\e[0m"
GR="\e[32m"
YW="\e[93m"

folders(){
    mkdir -p ~/wordlists
}
dependencies(){
    echo -e "${BK}Installing Dependencies mate${RT}\n"
    sudo apt-get update 
    sudo apt-get full-upgrade -y 
    sudo apt-get install apt-transport-https bsdmainutils build-essential cmake curl dnsutils gcc git jq libdata-hexdump-perl libffi-dev libpcap-dev libssl-dev libxml2-dev libxml2-utils libxslt1-dev lynx medusa nmap procps pv python3 python3-dev python3-pip wget zip zlib1g-dev libpcap-dev screen -y 
    sudo apt-get install chromium-browser -y
    sudo apt-get install golang-go -y
    sudo apt-get install gobuster -y
    sudo snap install amass
    echo -e "${GR}SUCCESS${RT}\n"
}
0installd(){
    echo -e "${BK}INSTALLING 0install-exegol VERSION${RT}\n"
    git clone https://github.com/bthrx/0install-exegol
    chmod +x 0install-exegol/0install-exegol
}
0install_tools(){
     echo -e "${BK}TOOL TIME${RT}\n"
    ./0install-exegol/0install-exegol -i gf
    ./0install-exegol/0install-exegol -i sublist3r
    ./0install-exegol/0install-exegol -i anew
    ./0install-exegol/0install-exegol -i gospider
    ./0install-exegol/0install-exegol -i aquatone
    ./0install-exegol/0install-exegol -i crobat
    ./0install-exegol/0install-exegol -i gau
    ./0install-exegol/0install-exegol -i waybackurls
    ./0install-exegol/0install-exegol -i kxss
    ./0install-exegol/0install-exegol -i ffuf
    ./0install-exegol/0install-exegol -i dnsx
    ./0install-exegol/0install-exegol -i dalfox
    ./0install-exegol/0install-exegol -i crlfuzz
    ./0install-exegol/0install-exegol -i nuclei
    ./0install-exegol/0install-exegol -i httprobe
    ./0install-exegol/0install-exegol -i httpx
}
snek_tools(){
    echo -e "${BK}scottie PIPin-stalling snek packages${RT}\n"
    pip3 install bhedak
    pip3 install tldextract
    pip3 install git+https://github.com/R0X4R/Search-Engines-Scraper.git
    pip3 install agnee
    pip3 install uro
}
other_tools(){
    echo -e "${BK}Here's the rest of the kit, pal${RT}\n"
    sudo go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    sudo go install github.com/tomnomnom/qsreplace@latest
    sudo go install github.com/projectdiscovery/notify/cmd/notify@latest
    sudo go install github.com/tomnomnom/assetfinder@latest
    sudo go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    sudo mv ~/go/bin/* /bin
}
wordlistsd(){
    echo -e "\n${BK}What's your words worth? Here's some lists${RT}"
    cd ~/wordlists/
    echo -e "\n- Downloading subdomains wordlists"
    wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt
    echo -e "\n- Downloading resolvers wordlists"
    wget -q https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt
    echo -e "\n- Downloading fuzz wordlists"
    wget -q https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt
}

main(){
    folders
    dependencies
    0installd
    0install_tools
    snek_tools
    other_tools
    wordlistsd
    echo -e "\n${BK}Almost done${RT}"
        nuclei -update-templates
    echo -e "\nDon't forget to set up notify to discord${BK} ~/.config/notify/provider-config.yaml ${RT}"
    echo -e "That's it. If you find something throw some cash at R0X4R and JoyGhoshs"
    garud -h 2> /dev/null
}

while true
do
    main
    exit
done
