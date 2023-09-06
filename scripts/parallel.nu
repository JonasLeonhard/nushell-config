export def parallel [...closures] {
    $closures | par-each {
        |c| do $c
    }
}

# usage:
# ```nu
# parallel { just frontend-dev } { echo "Ah" } { just backend-dev }
# ```
