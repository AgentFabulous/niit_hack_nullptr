from recommendation_engine.load_data import LoadData
from recommendation_engine.collaborative_filtering import CollaborativeFiltering
from recommendation_engine.matrix_factorization import MatrixFactorization
from recommendation_engine.simple_popularity import SimplePopularity
import numpy as np

# Loading the Data
dataset = LoadData()

users = dataset.get_users()
ratings = dataset.get_ratings()
items = dataset.get_items()
ratings_train = dataset.get_ratings_train()
ratings_test = dataset.get_ratings_test()

# Collaborative Filtering Model
cfm = CollaborativeFiltering(users, items, ratings, ratings_train, ratings_test)
n_users, n_items = cfm.get_unique_users_and_items()
data_matrix = cfm.fetch_data_matrix(n_users, n_items, ratings)
user_similarity, item_similarity = cfm.calculate_similarity(data_matrix)

user_prediction = cfm.predict(data_matrix, user_similarity, type='user')
item_prediction = cfm.predict(data_matrix, item_similarity, type='item')

# Simple Popularity
sp = SimplePopularity(ratings_train, ratings_test)
train_data = sp.train_on_data()
test_data = sp.test_on_data()

popularity_model = sp.get_popularity_model(train_data)
popularity_recommendation = sp.popularity_recommendation(popularity_model)

trained_model = sp.train_model(train_data)

# TODO model persistency of the trained model

item_similarity_recommendation = sp.item_similarity_recommendation(trained_model)

# TODO model persistency of the similarity recommendation

# Matrix Factorization
R = np.array(ratings.pivot(index='user_id', columns='movie_id', values='rating').fillna(0))
mf = MatrixFactorization(R, K=20, alpha=0.001, beta=0.01, iterations=100)
training_process = mf.train()

