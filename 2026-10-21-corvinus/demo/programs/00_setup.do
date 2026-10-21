do "programs/config.do"

capture mkdir "$root/data"
capture mkdir "$raw"
capture mkdir "$raw_dir"
capture mkdir "$derived"
capture mkdir "$output"

local packages ftools reghdfe ppmlhdfe estout

foreach pkg of local packages {
    capture ssc install `pkg', replace
}
