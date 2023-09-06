# Runs closures in parallel, usage: parallel { just frontend-dev } { echo "Ah" } { just backend-dev }
export def parallel [...closures] {
    $closures | par-each {
        |c| do $c
    }
}
