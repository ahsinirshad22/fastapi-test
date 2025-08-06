FROM python:3.13

# Install uv
RUN pip install --no-cache-dir --upgrade uv

WORKDIR /app

# Copy the uv config and source files
COPY ./pyproject.toml ./pyproject.toml

COPY ./app ./app

RUN pip install --no-cache-dir pyproject.toml

CMD ["fastapi", "run", "main.py", "--port", "80"]