#!/usr/bin/env bash

shift
file="$1"

case $(file -b --mime-type "${file}") in
	text/* | application/json)
		bat --decorations never "${file}"
		exit 0
		;;
	application/x-mach-binary | application/zip)
		eza -lha --group-directories-first "${file}"
		exit 0
		;;
	*)
		exit 0
		;;
esac

exit 0

