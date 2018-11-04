# import necessary libraries
import numpy as np
import tensorrec

# Build the model with default parameters
model = tensorrec.TensorRec()

# Generate some dummy data
interactions, user_features, item_features = tensorrec.util.generate_dummy_data(
    num_users=10000,
    num_items=40,       # 40 or n number of MedRooms
    interaction_density=.05
)

# Fit the model for 5 epochs
model.fit(interactions, user_features, item_features, epochs=100, verbose=True)

# Predict scores and ranks for all users and all items
predictions = model.predict(user_features=user_features,
                            item_features=item_features)
predicted_ranks = model.predict_rank(user_features=user_features,
                                     item_features=item_features)

# Calculate and print the recall at 10
r_at_k = tensorrec.eval.recall_at_k(predicted_ranks, interactions, k=10)
print(np.mean(r_at_k))


# Saving the model
model.save_model('recommender_system/deployable/')

model.predict()

"""
user_features and item_features represent metadata about the items being 
recommended and the users receiving the recommendations. 
These features can be any numerical value, either integer or floating point.

interactions are observed relationships between users and items.
Different loss graphs treat interaction values in different ways,
so the valid values for your interactions will be determined by the loss
graph you choose.
"""