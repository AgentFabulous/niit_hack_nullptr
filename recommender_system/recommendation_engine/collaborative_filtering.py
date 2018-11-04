import numpy as np
from sklearn.metrics.pairwise import pairwise_distances


class CollaborativeFiltering:

    def __init__(self, users, items, ratings, ratings_train, ratings_test):
        self.users = users
        self.items = items
        self.ratings = ratings
        self.ratings_train = ratings_train
        self.ratings_test = ratings_test

    def get_unique_users_and_items(self):
        """
        Calculate unique users and movies
        :return
            n_users: Unique Users
            n_items: Unique Items
        """
        n_users = self.ratings.user_id.unique().shape[0]
        n_items = self.ratings.movie_id.unique().shape[0]

        return n_users, n_items

    @staticmethod
    def fetch_data_matrix(n_users, n_items, ratings):
        """
        We will create a user-item matrix which can
        be used to calculate similarity between users and
        items
        :param:

        :return:
            data_matrix
        """
        data_matrix = np.zeros((n_users, n_items))
        for line in ratings.itertuples():
            data_matrix[line[1] - 1, line[2] - 1] = line[3]

        return data_matrix

    @staticmethod
    def calculate_similarity(data_matrix):
        """
        Calculating the similarity
        :param data_matrix:
        :return: User Similarity, Item Similarity
        """
        user_similarity = pairwise_distances(data_matrix, metric='cosine')
        item_similarity = pairwise_distances(data_matrix.T, metric='cosine')
        return user_similarity, item_similarity

    @staticmethod
    def predict(ratings, similarity, type='user'):
        """
        Make predictions based on these similarities
        :param ratings:
        :param similarity:
        :param type:
        :return:
        """

        if type == 'user':
            mean_user_rating = ratings.mean(axis=1)
            # we use np.newaxis so that mean_user_rating has same format as ratings
            
            ratings_diff = (ratings - mean_user_rating[:, np.newaxis])
            prediction = mean_user_rating[:, np.newaxis] + similarity.dot(ratings_diff) / np.array(
                [np.abs(similarity).sum(axis=1)]).T

        elif type == 'item':
            prediction = ratings.dot(similarity) / np.array([np.abs(similarity).sum(axis=1)])

        return prediction    


def test():
    # Testing
    obj = CollaborativeFiltering()
    n_users, n_items = obj.get_unique_users_and_items()
    data_matrix = obj.fetch_data_matrix(n_users, n_items, obj.ratings)
    user_similarity, item_similarity = obj.calculate_similarity(data_matrix)
    prediction = obj.predict(data_matrix, user_similarity, type='user')
    
    obj = CollaborativeFiltering()
    n_users, n_items = obj.get_unique_users_and_items()
    data_matrix = obj.fetch_data_matrix(n_users, n_items, obj.ratings)
    user_similarity, item_similarity = obj.calculate_similarity(data_matrix)
    prediction = obj.predict(data_matrix, user_similarity, type='user')
    print(prediction)