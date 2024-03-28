cd "$(dirname "$0")" || exit 

for file in ./dev/*.sh; do
    if [! -x "$file"]; then
        chmod +x "$file"
    fi

    nohup bash "$file" >/dev/null 2>&1 &
done