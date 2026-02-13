from ultralytics import YOLO
import sys

# Load the model
model = YOLO("best.pt")

# # Run inference on an image
# results = model("test.jpeg")  # Can be a path or PIL image

# # Loop through results and show each
# for r in results:
#     r.show()  # Display the image with boxes

# Check for image argument
if len(sys.argv) < 2:
    print("Usage: python inference.py <image_path>")
    sys.exit(1)

image_path = sys.argv[1]

# Run inference
results = model(image_path)

# Save annotated images
for i, r in enumerate(results):
    r.save(f"output_{i}.jpg")  # saves processed image in container
