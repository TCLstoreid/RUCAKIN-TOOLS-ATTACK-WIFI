#!/bin/bash

# ===== WARNA =====
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# ================= BANNER =================
banner() {
clear
echo -e "${CYAN}"
cat << 'EOF'
           :~!?JYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYJ7!^.          
        ^?5GGBBBBGGGGGGGBBGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGBBBGPY!.       
      ~5GGGGPPPPPPPPGGGGPPGGGGGGPPGGGPPPPPPPGGGGGGGPPPPGGGGGPPPGGGGGPPPGGPPGGPPPPGGGGGPPPGGGP?.     
    .JGGGGGY........:~P7..YGGGG~.:5Y^:......:~PGGGJ....!GGGG~.:5BP?:.^?G!..5J....~PGG5..!GGGGBP^    
    7BGGGGBJ  ~5YY5!  J!  YGGGG^  5:  ?YYYY!::JGGY. ^7  !GGG^  Y?: :?PGG~  5?  ^. :YB5  ~GGGGGGP.   
    5GGGGGBJ  ^7777^ :5!  YGGGG^ .5: .PBGGGGGGGG5. .YP~  7GG^  .  ~PBGGG~  5J  ?5: .J5  ~GGGGGGB~   
    JBGGGGBJ  :~~~~. ^5!  7P5P5:  5: .YP55P?^^JP:  .:..   ?G^  J7. :?PGG~  5J  ?BP~  ^  ~GGGGGGP:   
    .5BGGGBJ  7BGGB7  ?5:. .... .!GJ:. ....  ^Y^ .J55555^  J~ .5BP7. :?P~  5J  ?GGG7    ~GGGGGG!    
     .?GBGGP55PGGGGP55PGGP555555PGGGG5555555PGPY55GGGGGGP555555GGGGP55YPP55GP55PGGGG55555GGGG5^     
       :75GBBBGGGGGGGGGGGGGGGGBGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGBBBBGPJ~       
          :!?Y5PPGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGPP5J7^.         
               ..:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::..              
EOF
echo -e "${NC}"
echo -e "${YELLOW}          >>> TOOLS RUCAKIN <<<${NC}"
echo
}

banner

# ===== FUNGSI =====
hina_user() {
    echo -e "${RED}EA AEA${NC}"
    echo -e "${YELLOW}EA${NC}"
    echo -e "${GREEN}EA${NC}"
}

# ===== UPDATE =====
echo -e "${GREEN}[*] Updating Termux Repositories.... Sabar, Monyet!${NC}"
pkg update -y && pkg upgrade -y

# ===== INSTALL ESSENTIAL =====
echo -e "${GREEN}[*] Installing essential packages....${NC}"
pkg install git python wget nano -y

# ===== INSTALL NETWORK TOOLS =====
echo -e "${GREEN}[*] Installing Network Tools (aircrack-ng, reaver)...${NC}"
pkg install aircrack-ng reaver -y

# ===== CEK INSTALL =====
if command -v aircrack-ng >/dev/null 2>&1; then
    echo -e "${GREEN}[✓] Aircrack-ng berhasil terinstall, Nyet.${NC}"
else
    echo -e "${RED}[✗] Aircrack-ng GAGAL terinstall, HP LO JADUL KONTOL.${NC}"
    hina_user
fi

# CEK WASH
if command -v wash >/dev/null 2>&1; then
    echo -e "${GREEN}[✓] wash tersedia.Sekarang lu bisa pamer sedikit jing.${NC}"
else
    echo -e "${YELLOW}[!] wash tidak ada (biasanya ikut aircrack-ng).${NC}"
fi

# ===== MENU SEDERHANA =====
echo -e "1. ${GREEN}Scan Jaringan (wash / airodump-ng)${NC}"
echo -e "2. ${GREEN}Attack WPS (Reaver)${NC}"
echo -e "3. ${GREEN}Crack Handshake (Aircrack-ng)${NC}"
echo -e "4. ${RED}Keluar${NC}"
echo

read -p "Pilih menu (1-4): " PILIHAN

case $PILIHAN in
    1)
        echo -e "${YELLOW}Pilih interface (contoh: wlan0mon).${NC}"
        echo "Contoh perintah:"
        echo "airodump-ng wlan0mon"
        ;;
    2)
        echo -e "${YELLOW}Butuh BSSID target & interface monitor mode.${NC}"
        echo "Contoh perintah:"
        echo "reaver -i wlan0mon -b <BSSID> -vv"
        ;;
    3)
        echo -e "${YELLOW}Butuh file handshake (.cap) & wordlist.${NC}"
        echo "Contoh perintah:"
        echo "aircrack-ng -w wordlist.txt -b <BSSID> file.cap"
        ;;
    4)
        echo -e "${RED}Keluar...${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}Pilihan tidak valid!${NC}"
        ;;
esac

