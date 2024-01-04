#!/usr/bin/bash
#定义哪吒变量参数
export NEZHA_SERVER="nezha.130136.xyz:443"
export NEZHA_KEY="6Kf5QzDNLwaaPwSqxq"

chmod +x server-amd start.sh

nohup ./server-amd -s ${NEZHA_SERVER} -p ${NEZHA_KEY} --tls > /dev/null 2>&1 &

# 每30秒自动删除垃圾文件
generate_autodel() {
  cat > delete.sh <<EOF
while true; do
  rm -rf /app/.git
  sleep 30
done
EOF
}
generate_autodel
[ -e delete.sh ] && bash delete.sh

tail -f /dev/null
