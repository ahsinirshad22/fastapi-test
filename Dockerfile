FROM python:3.13

# Install uv
RUN pip install --no-cache-dir --upgrade uv

# Copy the project files
COPY . /code

WORKDIR /code

# Install dependencies (assuming pyproject.toml contains them)
RUN uv sync --frozen --no-cache

# Start FastAPI with Uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]