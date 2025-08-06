# Python version
FROM python:3.13

# upgrade pip
RUN pip install --upgrade pip

WORKDIR /code

# Copy the project files
COPY ./pyproject.toml ./pyproject.toml
COPY ./app ./app

# Install dependencies (assuming pyproject.toml contains them)
RUN pip install .

# Start FastAPI with Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]