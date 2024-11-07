from fastapi import FastAPI
from app.controllers import prediction

app = FastAPI()

# Include the prediction router
app.include_router(prediction.router)

@app.get("/")
async def root():
    return {"message": "Welcome to the House Price Prediction API!"}
