from sklearn.externals import joblib

# Loading the model from the saved model
model = joblib.load('recommender_system/deployable/tensorrec.pkl')