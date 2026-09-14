# Cross-check every worked example against the example.toml beside it.
#
# Input: one example directory path per line. Everything else is read with
# getline, so the whole check is ONE process -- the shell wrapper does no work
# in a loop, which keeps it free of per-iteration subshells.
#
# This is a CONSISTENCY CHECK, not a regenerate-and-diff. It catches the
# realistic drift: a file renamed on disk but not in the TOML, a TOML listing
# something deleted, a README no longer mentioning a file it ships, a title
# reworded in one place only. It cannot catch prose reworded in both at once.

function problem(where, what) {
    printf "  FAIL  %s\n        %s\n", where, what
    problems++
}

# Value of a top-level `key = "value"` in a TOML file.
function field(path, key,   line, out) {
    out = ""
    while ((getline line < path) > 0) {
        if (line ~ "^[ \t]*" key "[ \t]*=") {
            sub(/^[^=]*=[ \t]*/, "", line)
            gsub(/^"|"$/, "", line)
            out = line
            break
        }
    }
    close(path)
    return out
}

# True when `needle` appears literally anywhere in the file at `path`.
function contains(path, needle,   line, hit) {
    hit = 0
    while ((getline line < path) > 0) {
        if (index(line, needle) > 0) { hit = 1; break }
    }
    close(path)
    return hit
}

function check_dir(dir,   name, toml, readme, title, i, line, p, keys, nkeys) {
    name = dir
    sub(/\/$/, "", name)
    sub(/.*\//, "", name)
    toml   = dir "example.toml"
    readme = dir "README.md"

    if ((getline line < toml) < 0) { problem("examples/" name, "has no example.toml"); close(toml); return }
    close(toml)
    if ((getline line < readme) < 0) { problem("examples/" name, "has no README.md"); close(readme); return }
    close(readme)
    checked++

    title = field(toml, "title")
    if (title == "")
        problem("examples/" name "/example.toml", "[example].title is missing or empty")
    else if (!contains(readme, "# " title))
        problem("examples/" name "/README.md", "title does not match example.toml (\"" title "\")")

    nkeys = split("summary description run", keys, " ")
    for (i = 1; i <= nkeys; i++)
        if (field(toml, keys[i]) == "")
            problem("examples/" name "/example.toml", "[example]." keys[i] " is missing or empty")

    # every [[files]] path must exist on disk AND be named by the README
    while ((getline line < toml) > 0) {
        if (line !~ /^[ \t]*path[ \t]*=/) continue
        p = line
        sub(/^[^=]*=[ \t]*/, "", p)
        gsub(/^"|"$/, "", p)
        if (p == "") continue
        if (!exists(dir p))
            problem("examples/" name "/example.toml", "[[files]] lists " p ", which is not on disk")
        if (!contains(readme, "`" p "`"))
            problem("examples/" name "/README.md", "does not mention " p ", which example.toml lists")
    }
    close(toml)
}

# A path exists when the shell can see it. A directory cannot be opened for
# reading portably, so this asks the one question that works for both.
function exists(path) {
    return system("test -e " quote(path)) == 0
}

function quote(s) { gsub(/'/, "'\\''", s); return "'" s "'" }

{ if ($0 != "") check_dir($0) }

END {
    # Anti-vacuity: a run that examined nothing must not report success.
    if (checked == 0)
        problem("anti-vacuity", "no example.toml was checked, so nothing above could fail")
    if (problems > 0) {
        printf "\n%d problem(s).\n", problems
        exit 1
    }
    printf "examples consistent — %d example(s)\n", checked
}
