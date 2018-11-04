import pandas as pd
import numpy as np
import random

dataset = pd.read_csv('recommender_system/dataset/rooms_proper/medrooms.csv')

df = dataset


df.to_csv('recommender_system/dataset/rooms_proper/medrooms.csv')

ratings = []

for i in range(331):
    ratings.append(random.randint(0,5))
    
df['ratings'] = ratings

df = df.drop('STATUS', 1)

df = df.drop('Unnamed: 0', 1)

df.to_csv('recommender_system/dataset/rooms_proper/medrooms.csv')

index = np.arange(0,331)

columns = ['user_id','room_id', 'hygeine_rating', 'staff_rating', 'comfort_rating']

df2 = pd.DataFrame(index=index, columns=columns)

user_id = np.arange(0,331)

room_id = np.arange(0,331)

hygeine_rating = []
staff_rating = []
comfort_rating = []
average_rating= []

for i in range(331):
    hygeine_rating.append(random.randint(0,5))
    staff_rating.append(random.randint(0,5))
    comfort_rating.append(random.randint(0,5))
    
for i in range(331):
    average_rating.append((hygeine_rating[i] + staff_rating[i] + comfort_rating[i])/3)
    

df2['user_id'] = user_id
df2['room_id'] = room_id
df2['hygeine_rating'] = hygeine_rating
df2['staff_rating'] = staff_rating
df2['comfort_rating'] = comfort_rating

df = df.sort_values(by=['ratings'], ascending=False)

df2 = pd.read_csv('Project-MAPS/recommender_system/dataset/rooms_proper/user_data.csv')

df2['average_rating'] = average_rating

df2.to_csv('Project-MAPS/recommender_system/dataset/rooms_proper/user_data.csv')

df2.to_csv('Project-MAPS/recommender_system/dataset/rooms_proper/train.csv')

new_df = df2

new_df = new_df.drop('average_rating', 1)

new_df.to_csv('Project-MAPS/recommender_system/dataset/rooms_proper/test.csv')


