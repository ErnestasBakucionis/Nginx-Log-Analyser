#!/bin/bash

# File path to the Nginx access log
LOG_FILE="nginx-access.log"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
RESET='\033[0m'

# Function to get the total number of requests
total_requests() {
  echo -e "${MAGENTA}\nTotal number of requests:${RESET}"
  wc -l < "$LOG_FILE" | awk '{print $1 " requests"}'
}

# Function to get the top 5 IP addresses with the most requests
top_ips() {
  echo -e "${CYAN}\nTop 5 IP addresses with the most requests:${RESET}"
  awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
}

# Function to get the top 5 most requested paths
top_paths() {
  echo -e "${BLUE}\nTop 5 most requested paths:${RESET}"
  awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
}

# Function to get the top 5 response status codes
top_status_codes() {
  echo -e "${YELLOW}\nTop 5 response status codes:${RESET}"
  awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"}'
}

# Function to get the top 5 user agents
top_user_agents() {
  echo -e "${GREEN}\nTop 5 user agents:${RESET}"
  awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{for(i=2; i<=NF; i++) printf "%s ", $i; printf "- %d requests\n", $1}'
}

# Function to get the top 5 referrers
top_referrers() {
  echo -e "${MAGENTA}\nTop 5 referrers:${RESET}"
  awk -F'"' '{print $4}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -5 | awk '{for(i=2; i<=NF; i++) printf "%s ", $i; printf "- %d requests\n", $1}'
}

# Function to get the top HTTP methods
top_http_methods() {
  echo -e "${CYAN}\nTop HTTP methods:${RESET}"
  awk '{print $6}' "$LOG_FILE" | tr -d '"' | grep -E '^(GET|POST|PUT|DELETE|PATCH|OPTIONS|HEAD|CONNECT)$' | \
  sort | uniq -c | sort -nr | awk '{print $2 " - " $1 " requests"}'
}

# Main function to run the analysis
analyze_logs() {
  echo -e "${RED}Analyzing Nginx log file: $LOG_FILE${RESET}"
  total_requests
  top_ips
  top_paths
  top_status_codes
  top_user_agents
  top_referrers
  top_http_methods
}

# Call the main function
analyze_logs
