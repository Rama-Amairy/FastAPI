import joblib
import numpy as np
import os
import pickle

# Load your trained model (update the path as necessary)
MODEL_PATH = os.path.join(os.path.dirname(__file__), "house_prediction_model2.pkl")
model = joblib.load(MODEL_PATH)

def predict_price(features):
    # Prepare the input features for the model
    input_data = np.array([[features.SquareFeet, features.Bedrooms, features.Bathrooms, features.YearBuilt]])
    predicted_price = model.predict(input_data)
    return predicted_price[0]
