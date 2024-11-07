from pydantic import BaseModel

class HouseFeatures(BaseModel):
    SquareFeet: float
    Bedrooms: int
    Bathrooms: int
    YearBuilt: int

class PredictionResponse(BaseModel):
    predicted_price: float
