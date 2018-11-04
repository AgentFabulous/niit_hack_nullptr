import turicreate


class SimplePopularity:

    def __init__(self, ratings_train, ratings_test):
        self.ratings_train = ratings_train
        self.ratings_test = ratings_test

    def train_on_data(self):
        return turicreate.SFrame(self.ratings_train)

    def test_on_data(self):
        return turicreate.SFrame(self.ratings_test)

    def get_popularity_model(self, train_data):
        """
        Recommendation based on popular choices
        :param train_data:
        :return: popularity model
        """
        return turicreate.popularity_recommender.create(train_data, user_id='user_id', item_id='movie_id',
                                                        target='rating')

    @staticmethod
    def popularity_recommendation(popularity_model):
        """
        We will now recommend the top 5 items for the first
        5 users in our dataset
        :param popularity_model:
        :return: recommendation
        """
        return popularity_model.recommend(users=[1, 2, 3, 4, 5], k=5)

    """
    train_data: the SFrame which contains the required training data
    user_id: the column name which represents each user ID
    item_id: the column name which represents each item to be recommended (movie_id)
    target: the column name representing scores/ratings given by the user
    """

    """
    After building a popularity model, we will
    now build a collaborative filtering model. 
    Let’s train the item similarity model and
    make top 5 recommendations for the first 5 
    users.
    """

    def train_model(self, train_data):
        """
        Training the model
        :return:
        """

        return turicreate.item_similarity_recommender.create(train_data, user_id='user_id', item_id='movie_id',
                                                             target='rating', similarity_type='cosine')

    @staticmethod
    def item_similarity_recommendation(self, trained_model):
        return trained_model.recommend(users=[1, 2, 3, 4, 5], k=5)

