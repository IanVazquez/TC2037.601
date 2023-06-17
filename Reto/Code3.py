import tensorflow as tf
import numpy as np
import cv2

# Load the pre-trained COCO object detection model
model = tf.keras.applications.EfficientDetModel.from_pretrained('efficientdet_d0')

# Load the COCO class labels
with open('coco_labels.txt', 'r') as f:
    class_labels = f.read().splitlines()

# Load and preprocess the input image
image = cv2.imread('input_image.jpg')
image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
image = cv2.resize(image, (model.input_size[1], model.input_size[0]))
image = np.expand_dims(image, axis=0)
image = image / 255.0

# Run the object detection
predictions = model.predict(image)

# Get the detected objects and their bounding boxes
detections = predictions['detection_boxes'][0].numpy()
scores = predictions['detection_scores'][0].numpy()
labels = predictions['detection_classes'][0].numpy().astype(int)

# Filter out objects with low confidence scores
threshold = 0.5
filtered_detections = detections[scores >= threshold]
filtered_labels = labels[scores >= threshold]

# Draw bounding boxes and labels on the image
for i in range(filtered_detections.shape[0]):
    ymin, xmin, ymax, xmax = filtered_detections[i]
    xmin = int(xmin * image.shape[2])
    xmax = int(xmax * image.shape[2])
    ymin = int(ymin * image.shape[1])
    ymax = int(ymax * image.shape[1])
    
    cv2.rectangle(image, (xmin, ymin), (xmax, ymax), (0, 255, 0), 2)
    cv2.putText(image, class_labels[filtered_labels[i]], (xmin, ymin - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)

# Display the image with bounding boxes and labels
cv2.imshow('Object Detection', image)
cv2.waitKey(0)
cv2.destroyAllWindows()
