#!/bin/sh

DIR=$(dirname "$1")

latexrun $1
while inotifywait -e close_write $DIR; do
	latexrun $1
done
