#!/bin/bash

# NF -> empty lines
# '!seen[$0]++'  -> duplicate lines

awk NF quotes.txt | awk '!seen[$0]++'  
