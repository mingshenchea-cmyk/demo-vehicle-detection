FROM pytorch/pytorch:2.1.0-cuda11.8-cudnn8-runtime

WORKDIR /app

# Install system dependencies needed by OpenCV
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libgl1 \
    libsm6 \
    libxext6 \
    libxrender1 \
    libxcb1 \
    && rm -rf /var/lib/apt/lists/*

COPY best.pt /app/
COPY inference.py /app/

RUN pip install --no-cache-dir ultralytics opencv-python-headless pillow

# Default command prints usage
CMD ["python", "inference.py"]
