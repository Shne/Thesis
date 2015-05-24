#!/bin/bash

pdflatex Report > /dev/null &&
bibtex A > /dev/null &&
bibtex B > /dev/null &&
pdflatex Report > /dev/null &&
pdflatex Report > /dev/null