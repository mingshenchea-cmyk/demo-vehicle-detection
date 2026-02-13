FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-runtime

WORKDIR /app

COPY best.pt /app/
COPY inference.py /app/

RUN pip install --no-cache-dir ultralytics pillow

# Default command prints usage
CMD ["python", "inference.py"]
