import numpy as np
import pandas as pd

dataset = pd.read_csv('Project-MAPS/recommender_system/dataset/rooms_proper/topmedrooms.csv')

import csv
import json

csvfile = open('Project-MAPS/recommender_system/dataset/rooms_proper/topmedrooms.csv', 'r')
jsonfile = open('Project-MAPS/recommender_system/dataset/rooms_proper/topmedrooms.json', 'w')

fieldnames = ("room_name","locality","region","price","ratings")
reader = csv.DictReader( csvfile, fieldnames)
for row in reader:
    json.dump(row, jsonfile)
    jsonfile.write('\n')