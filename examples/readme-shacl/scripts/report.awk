# Turn a SHACL validation report (n-quads) into one line per violation:
#   focusNode   resultPath   sourceConstraintComponent
#
# This lives in its own file rather than inline in lint.sh because a shell
# linter reading an embedded awk program sees "#" inside a regex as a comment
# and "c[b]" as a glob, and reports both as shell defects that are not there.
/#focusNode>/                 { f[$1] = $3 }
/#resultPath>/                { p[$1] = $3 }
/#sourceConstraintComponent>/ { c[$1] = $3 }
END {
    for (b in c) {
        fn = (b in f) ? f[b] : "<no focusNode>"
        rp = (b in p) ? p[b] : "<no resultPath>"
        cc = c[b]
        gsub(/^<http:\/\/example\.org\/readme#/, "ex:", fn)
        gsub(/^<http:\/\/example\.org\/readme#/, "ex:", rp)
        gsub(/^<http:\/\/www\.w3\.org\/ns\/shacl#/, "sh:", cc)
        gsub(/^</, "", fn); gsub(/>$/, "", fn)
        gsub(/^</, "", rp); gsub(/>$/, "", rp)
        gsub(/^</, "", cc); gsub(/>$/, "", cc)
        printf "  %-44s %-20s %s\n", fn, rp, cc
    }
}
