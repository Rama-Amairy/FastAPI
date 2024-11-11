# Use the official Python image with the desired version (e.g., 3.9)
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install scikit-learn

# Copy the app source code and other files to the container
COPY . /app/



# Expose port 8000 for FastAPI
EXPOSE 8000

# Set the command to run your FastAPI app (adjust the path to your ASGI app)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]