for file in */*.sh; do
    if ![-x "$file"]; then
        chmod +x "$file"
    fi

    # Need to add the running logic later

done