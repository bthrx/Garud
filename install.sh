#!/bin/bash
BK="\e[7m"
RT="\e[0m"
GR="\e[32m"
YW="\e[93m"

if (( $EUID != 0 )); then
    echo -e "I AM NOT gROOT, PLZ RUN ME AS SUCH"
    exit
fi

folders(){
    mkdir -p ~/wordlists
}
dependencies(){
    echo -e "${BK}Installing Dependencies mate${RT}\n"
    sudo apt-get update 
    sudo apt-get full-upgrade -y 
    sudo apt-get install apt-transport-https bsdmainutils build-essential cmake curl dnsutils gcc git jq libdata-hexdump-perl libffi-dev libpcap-dev libssl-dev libxml2-dev libxml2-utils libxslt1-dev lynx medusa nmap procps pv python3 python3-dev python3-pip wget zip zlib1g-dev libpcap-dev screen -y 
    sudo apt-get install chromium-browser 
    echo -e "${GR}SUCCESS${RT}\n"
}
0installd(){
    echo -e "${BK}INSTALLING 0install-exegol VERSION${RT}\n"
    git clone https://github.com/bthrx/0install-exegol
    chmod +x 0install-exegol/0install-exegol
    mv 0install-exegol/0install-exegol /usr/bin/0install
    rm -r 0-install-exegol
}
0install_tools(){
     echo -e "${BK}TOOL TIME${RT}\n"
    0install -b go,gf,sublist3r,anew,gobuster,gospider,aquatone,assetfinder,crobat,gau,waybackurls,kxss,ffuf,dnsx,dalfox,crlfuzz,nuclei,subfinder,httprobe,httpx,amass
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
    echo -e "${BK}Really? These tools aren't in 0install yet? Ok then here you go${RT}\n"
    go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    go install github.com/tomnomnom/qsreplace@latest
    go install -v github.com/projectdiscovery/notify/cmd/notify@latest
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
    cp ~/go/bin/* /usr/bin/
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