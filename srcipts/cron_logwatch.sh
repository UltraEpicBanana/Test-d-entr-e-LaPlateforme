#!/bin/bash
OUTPUT_DIR="/var/log/logwatch"
mkdir -p "$OUTPUT_DIR"
OUTPUT_FILE="$OUTPUT_DIR/logwatch-$(date +%F).log"

/usr/sbin/logwatch --range yesterday --service sshd --service http --output file --format text --filename "$OUTPUT_FILE"
