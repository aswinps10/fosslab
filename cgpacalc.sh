#!/bin/bash

paste sgpas2.txt sgpas1.txt | awk '{printf "%s  %.1f\n",$1,($11 *24 + $22 *23)/47}'> cgpa.txt
