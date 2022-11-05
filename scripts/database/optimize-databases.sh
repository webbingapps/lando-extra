#!/bin/bash

# TODO: Set parameters through command arguments for settings things like the host which could differ for each system for selecting which databases to optimize. By default optimize all databases.

mysqlcheck -h database --all-databases
mysqlcheck -h database --all-databases -o
mysqlcheck -h database --all-databases --auto-repair
mysqlcheck -h database --all-databases --analyze