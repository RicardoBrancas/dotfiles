#!/bin/sh

DIR=$(dirname "$1")

pdflatex -interaction=nonstopmode -halt-on-error $1
while inotifywait -e close_write $DIR; do
	pdflatex -interaction=nonstopmode -halt-on-error $1
done
