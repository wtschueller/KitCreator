#! /usr/bin/env tclsh

set buildflags [split [lindex $argv 1] -]

# Determine if Threads was requested (or in 8.6+, unrequested)
if {$tcl_version == "8.6"} {
	if {[lsearch -exact $buildflags "unthreaded"] == -1} {
		set isthreaded 1
	} else {
		set isthreaded 0
	}
} else {
	if {[lsearch -exact $buildflags "threaded"] == -1} {
		set isthreaded 0
	} else {
		set isthreaded 1
	}
}

# Static builds don't come with threads.
if {[lsearch -exact $buildflags "static"] != -1} {
	set isthreaded 0
}

if {!$isthreaded} {
	exit 0
}

package require Thread

exit 0
