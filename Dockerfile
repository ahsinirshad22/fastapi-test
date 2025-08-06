# Use official Python 3.13 image
FROM python:3.13

# Install uv (fast dependency manager and runner)
RUN pip install --no-cache-dir --upgrade uv

# Set working directory
WORKDIR /app


# Copy only dependency file first for caching
COPY pyproject.toml ./

RUN uv sync

# Copy the rest of your app
COPY ./app ./app

# Expose port 80
EXPOSE 80

# Run the FastAPI app using uv's built-in uvicorn launcher
CMD ["uv", "icorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
