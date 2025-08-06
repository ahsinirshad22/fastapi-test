# Python version
FROM python:3.13

# upgrade pip
RUN uv pip install --upgrade pip

# Install uv
RUN pip install --no-cache-dir --upgrade uv

WORKDIR /app

# Copy the project files
COPY ./pyproject.toml ./pyproject.toml
COPY ./app ./app

# Install dependencies (assuming pyproject.toml contains them)
RUN uv pip install --system .

# Start FastAPI with Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]