FROM jrei/systemd-debian:12
RUN apt update && apt install -y sudo wget procps curl systemd iproute2 && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://install.raspap.com | bash -s -- --yes --wireguard 1 --openvpn 1 --adblock 1
COPY firewall-rules.sh /home/firewall-rules.sh
RUN chmod +x /home/firewall-rules.sh
CMD [ "/bin/bash", "-c", "/home/firewall-rules.sh && /lib/systemd/systemd" ]
