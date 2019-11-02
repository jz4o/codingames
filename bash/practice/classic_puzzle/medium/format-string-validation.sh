# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

read -r text
read -r format

format=${format//\\/\\\\}
format=${format//\^/\\^}
format=${format//\*/\\*}
format=${format//\(/\\(}
format=${format//\)/\\)}
format=${format//\[/\\[}
format=${format//\[/\\]}
format=${format//\{/\\{}
format=${format//\$/\\$}
format=${format//\?/.}
format=${format//\~/.*}

if [[ "$text" =~ $format ]]; then
    echo "MATCH"
else
    echo "FAIL"
fi
