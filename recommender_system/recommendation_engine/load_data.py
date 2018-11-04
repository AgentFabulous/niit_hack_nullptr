import pandas as pd


class LoadData:

    def __init__(self):
        pass

    @staticmethod
    def get_users():
        # Reading users file:
        u_cols = ['user_id', 'age', 'sex', 'occupation', 'zip_code']
        users = pd.read_csv('dataset/u.user', sep='|', names=u_cols, encoding='latin-1')
        return users

    @staticmethod
    def get_items():
        # Reading item file:
        i_cols = ['movie id', 'movie title', 'release date', 'video release date', 'IMDb URL', 'unknown', 'Action',
                  'Adventure', 'Animation', 'Children\'s', 'Comedy', 'Crime', 'Documentary', 'Drama', 'Fantasy',
                  'Film-Noir', 'Horror', 'Musical', 'Mystery', 'Romance', 'Sci-Fi', 'Thriller', 'War', 'Western']
        items = pd.read_csv('dataset/u.item', sep='|', names=i_cols, encoding='latin-1')
        return items

    @staticmethod
    def get_ratings():
        # Reading ratings file:
        r_cols = ['user_id', 'movie_id', 'rating', 'unix_timestamp']
        ratings = pd.read_csv('dataset/u.data', sep='\t', names=r_cols, encoding='latin-1')
        return ratings

    @staticmethod
    def get_ratings_train():
        # Test data has 10 ratings for each user
        r_cols = ['user_id', 'movie_id', 'rating', 'unix_timestamp']
        ratings_train = pd.read_csv('dataset/ua.base', sep='\t', names=r_cols, encoding='latin-1')
        return ratings_train

    @staticmethod
    def get_ratings_test():
        # Test data has 10 ratings for each user
        r_cols = ['user_id', 'movie_id', 'rating', 'unix_timestamp']
        ratings_test = pd.read_csv('dataset/ua.test', sep='\t', names=r_cols, encoding='latin-1')
        return ratings_test
