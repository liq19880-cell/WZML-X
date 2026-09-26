FROM mysterysd/wzmlx:wzadv

WORKDIR /usr/src/app

# Create venv if it doesn't exist in the base image
RUN python3 -m venv /wzvenv

COPY requirements.txt .
RUN /wzvenv/bin/pip install --no-cache-dir -r requirements.txt
# Or with uv if uv is available:
# RUN uv pip install --python /wzvenv/bin/python --no-cache-dir -r requirements.txt

COPY . .

ENTRYPOINT ["bash", "start.sh"]
