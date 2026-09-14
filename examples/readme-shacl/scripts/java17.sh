#!/usr/bin/env bash
# Print a JAVA_HOME whose java is >= 17, or fail saying exactly why.
#
# Jena 5.6.0's classes are Java 17 (class file 61). The machine this was written
# on had java 17 on PATH and JAVA_HOME pointing at a cached Java 11 from an
# unrelated toolchain. Jena's launcher prefers JAVA_HOME, so it ran 11 and died
# with "class file version 61.0 ... recognizes up to 55.0" -- a message naming
# neither Java nor Jena. Resolving the JVM here turns that into one clear line.
set -euo pipefail

MIN_MAJOR=17

# Print the major version of a java binary, or nothing if it will not run.
java_major() {
    "$1" -version 2>&1 | head -1 | sed -n 's/.*version "\([0-9][0-9]*\).*/\1/p'
}

# Succeed when $1 is a JAVA_HOME whose java is new enough.
acceptable() {
    candidate="$1"
    if [ ! -x "$candidate/bin/java" ]; then
        return 1
    fi
    found=$(java_major "$candidate/bin/java")
    if [ -z "$found" ]; then
        return 1
    fi
    if [ "$found" -lt "$MIN_MAJOR" ]; then
        return 1
    fi
    return 0
}

# 1. An already-correct JAVA_HOME wins, so an operator can force a JVM.
current="${JAVA_HOME:-}"
if [ -n "$current" ] && acceptable "$current"; then
    printf '%s\n' "$current"
    exit 0
fi

# 2. Whatever java on PATH resolves to.
if command -v java > /dev/null 2>&1; then
    real=$(readlink -f "$(command -v java)")
    path_home=$(dirname "$(dirname "$real")")
    if acceptable "$path_home"; then
        printf '%s\n' "$path_home"
        exit 0
    fi
fi

# 3. The usual install locations. Probed in ONE pass and ranked by the
#    version the JVM reports about itself, not by its directory name -- a
#    path can say 17 and hold anything.
ranked=$(for home in /usr/lib/jvm/*/ /Library/Java/JavaVirtualMachines/*/Contents/Home; do
    trimmed="${home%/}"
    [ -x "$trimmed/bin/java" ] || continue
    reported=$("$trimmed/bin/java" -version 2>&1 | head -1 | sed -n 's/.*version "\([0-9][0-9]*\).*/\1/p')
    [ -n "$reported" ] || continue
    printf '%s %s\n' "$reported" "$trimmed"
done | sort -rn | head -1)

best_major="${ranked%% *}"
best="${ranked#* }"
if [ -n "$ranked" ] && [ "$best_major" -ge "$MIN_MAJOR" ]; then
    printf '%s\n' "$best"
    exit 0
fi

printf 'UNKNOWN: no Java >= %s found.\n' "$MIN_MAJOR" >&2
printf '  Jena needs Java %s or newer (its classes are class file 61).\n' "$MIN_MAJOR" >&2
if command -v java > /dev/null 2>&1; then
    on_path_version=$(java -version 2>&1 | head -1)
    printf '  java on PATH: %s\n' "$on_path_version" >&2
else
    printf '  java is not on PATH at all.\n' >&2
fi
printf '  JAVA_HOME: %s\n' "${JAVA_HOME:-<unset>}" >&2
printf '  Install a JDK %s+, or set JAVA_HOME to one.\n' "$MIN_MAJOR" >&2
exit 2
