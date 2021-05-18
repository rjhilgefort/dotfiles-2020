#!/bin/python
# -*- coding: utf-8 -*-

# Procedure
# Surf to https://openweathermap.org/city
# Fill in your CITY
# e.g. Antwerp Belgium
# Check url
# https://openweathermap.org/city/2803138
# you will the city code at the end
# create an account on this website
# create an api key (free)
# LANG included thanks to krive001 on discord


import requests

CITY = "5421418"
# API_KEY = "756edce7e9d4c385ef9499a53492678c" # NOTE: ArcoKey
API_KEY = "9d3d818ed5e8fd204811f44e6663eb7b"
UNITS = "Imperial"
UNIT_KEY = "F"
LANG = "en"
#LANG = "nl"
#LANG = "hu"

ERROR_STATE = "Offline"

try:
    REQ = requests.get("http://api.openweathermap.org/data/2.5/weather?id={}&lang={}&appid={}&units={}".format(CITY, LANG,  API_KEY, UNITS))
    # HTTP CODE = OK
    if REQ.status_code == 200:
        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        TEMP = int(float(REQ.json()["main"]["temp"]))
        print("{}, {} °{}".format(CURRENT, TEMP, UNIT_KEY))
    else:
        print(ERROR_STATE)
        # print("Error: BAD HTTP STATUS CODE " + str(REQ.status_code))
except (ValueError, IOError):
    print(ERROR_STATE)
    # print("Error: Unable print the data")
