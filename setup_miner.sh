#!/bin/bash
#download xlarig miner
wget https://github.com/scala-network/XLArig/releases/download/v5.2.2/XLArig-v5.2.2-linux-x86_64.zip -P xlarig/
#unzip xlarig
unzip /home/administrator/xlarig/XLArig-v5.2.2-linux-x86_64.zip
#remove xlarig zip file
rm XLArig-v5.2.2-linux-x86_64.zip
#create config.json
cat > /etc/netplan/00-installer-config.yaml <<EOF
{
   "api":{
      "id":null,
      "worker-id":null
   },
   "http":{
      "enabled":false,
      "host":"127.0.0.1",
      "port":0,
      "access-token":null,
      "restricted":true
   },
   "autosave":true,
   "background":false,
   "colors":true,
   "randomx":{
      "init":-1,
      "mode":"auto"
   },
   "cpu":{
      "enabled":true
   },
   "donate-level":1,
   "donate-over-proxy":1,
   "log-file":null,
   "pools":[
      {
         "algo":"panthera",
         "coin":null,
         "url":"ca.scala.herominers.com:10131",
         "user":"SvkqfY1fo62WKtR5qYSxsnA4mLN5AtcQCBuK32qV8YJmQU1m9NpKj37ATqEKPZiyuTBFMuW4CRvoPfzYjA5keETo1twJZf5GQ",
         "pass":"$name",
         "rig-id":null,
         "nicehash":false,
         "keepalive":true,
         "enabled":true,
         "tls":false,
         "tls-fingerprint":null,
         "daemon":false
      }
   ],
   "print-time":60,
   "health-print-time":60,
   "syslog":false,
   "user-agent":null,
   "watch":true,
   "rebench-algo":false,
   "bench-algo-time":10
}
EOF
