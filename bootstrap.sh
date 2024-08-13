#!/bin/bash

# 定义要添加的代码
code_to_add=$(cat <<'EOF'
ssh_auth_sock_first=$(find /tmp -path '/tmp/ssh-**/*' 2>/dev/null -print0 | xargs -0 -r ls -t 2>/dev/null)
if [[ -z "$ssh_auth_sock_first" ]]; then
    ssh_auth_sock_first=$(find /tmp -path '/tmp/auth-agent*/listener.sock' 2>/dev/null -print0 | xargs -0 -r ls -t 2>/dev/null)
fi
if [[ -n "$ssh_auth_sock_first" ]]; then
  export SSH_AUTH_SOCK=$ssh_auth_sock_first
fi
EOF
)

# 将代码添加到 .bashrc 文件的末尾
echo "$code_to_add" >> ~/.bashrc
