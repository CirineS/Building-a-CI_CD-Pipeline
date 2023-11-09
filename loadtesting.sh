#!/usr/bin/env bash

locust -f locustfile.py --host https://mywebapp345678.azurewebsites.net/ --users 100 --spawn-rate 5 --web-port 8089
