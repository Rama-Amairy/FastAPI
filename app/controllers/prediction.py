from fastapi import APIRouter

from app.services.ml_model import predict_price
from app.models.schemas import HouseFeatures,PredictionResponse


router = APIRouter()

@router.post("/predict", response_model=PredictionResponse)
async def predict_house_price(features: HouseFeatures):
    predicted_price = predict_price(features)
    return PredictionResponse(predicted_price=predicted_price)
