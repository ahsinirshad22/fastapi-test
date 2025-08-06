FROM python:3.13

# Install uv
RUN pip install --no-cache-dir uv

WORKDIR /code

# Copy the uv config and source files
COPY ./pyproject.toml /code/pyproject.toml

COPY ./main.py /code/

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./main.py /code/


CMD ["fastapi", "run", "main.py", "--port", "80"]


# Install dependencies using uv.toml
RUN uv venv && \
    . .venv/bin/activate && \
    uv pip install -r uv.toml

# Use uv to run the FastAPI app (main.py with app instance)
CMD ["uv", "icorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
