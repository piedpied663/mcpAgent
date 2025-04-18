FROM python:3.11-slim

RUN apt update && apt install -y git && apt clean

WORKDIR /app
RUN git clone https://github.com/cognitivecomputations/memgpt.git .
RUN pip install --upgrade pip && pip install -e .

COPY .env /app/.env

EXPOSE 8050

CMD ["python3", "-m", "memgpt.mcp.server"]
