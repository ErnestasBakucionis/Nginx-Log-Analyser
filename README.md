# Nginx Log Analyzer  
**Project Page URL**: https://roadmap.sh/projects/nginx-log-analyser

This script analyzes Nginx access logs and provides insights into various request patterns, user activity, and system performance metrics. The script parses the log file to extract meaningful data like the most frequent IPs, paths, response status codes, user agents, and more.

---

## Features:

1. **Top IP Addresses**: Lists the top 5 IP addresses with the most requests, along with the number of requests.
2. **Top Requested Paths**: Displays the top 5 most frequently requested paths and the number of requests for each.
3. **Response Status Codes**: Provides the top 5 response status codes and their frequencies.
4. **Top User Agents**: Lists the top 5 user agents making requests, including bot traffic.
5. **Top Referrers**: Identifies the top 5 referring URLs.
6. **HTTP Method Analysis**: Highlights the most used HTTP methods like GET, POST, OPTIONS, etc.
7. **Malformed Requests Count**: Tracks malformed or non-standard requests for troubleshooting.

---

## Requirements:

Before running the script, ensure your system has the following tools installed:

1. **Basic Shell Utilities**: The script uses standard Unix/Linux utilities such as:
   - `awk`
   - `grep`
   - `sort`
   - `uniq`
   - `head`
   
   These utilities are typically pre-installed on Unix/Linux systems.

2. **Nginx Access Log**: The script requires an Nginx access log file in the default format. Ensure you provide a valid log file as input.

---

## Instructions for Running the Script

### **Clone from GitHub**

1. **Clone the repository**  
   You can clone the repository using the following command:
   ```bash
   git clone https://github.com/ErnestasBakucionis/Nginx-Log-Analyser.git
   ```

2. **Navigate to the repository folder:**  
   Navigate to the repository folder:
   ```bash
   cd nginx-log-analyzer
   ```

3. **Run the script:**  
   ```bash
   ./nginx-log-analyzer.sh
   ```

## Troubleshooting

1. Permission Denied: If you encounter a "Permission Denied" error, ensure the script is executable using:

    ```bash
    chmod +x nginx-log-analyzer.sh
    ```
2. Malformed or Missing Logs: Ensure the log file is in the standard Nginx access log format. If not, modify the script's parsing logic accordingly.

## Sample Output
```shell
Total number of requests:
8123 requests

Top 5 IP addresses with the most requests:
192.168.1.100 - 1290 requests
203.0.113.5 - 873 requests
10.0.0.1 - 734 requests
8.8.8.8 - 532 requests
198.51.100.42 - 402 requests

Top 5 most requested paths:
/api/v1/orders - 1450 requests
/ - 837 requests
/static/images/logo.png - 620 requests
/login - 512 requests
/api/v1/products - 401 requests

Top 5 response status codes:
200 - 6100 requests
404 - 982 requests
500 - 420 requests
403 - 315 requests
302 - 306 requests

Top 5 user agents:
Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/129.0.0.0 Safari/537.36 - 3120 requests
Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/128.0.0.0 Safari/537.36 - 2804 requests
curl/7.68.0 - 1020 requests
PostmanRuntime/7.29.2 - 876 requests
Googlebot/2.1 (+http://www.google.com/bot.html) - 701 requests

Top 5 referrers:
https://example.com - 3141 requests
https://another-site.com - 2123 requests
- - 1745 requests
https://third-party.com - 415 requests
http://external.com - 208 requests

Top HTTP methods:
GET - 7321 requests
POST - 543 requests
OPTIONS - 131 requests
PATCH - 74 requests
DELETE - 54 requests

Count of malformed requests:
9 malformed requests

```