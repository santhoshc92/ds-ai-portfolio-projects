# Image Classification on CIFAR-10 Using Convolutional Neural Networks (CNNs)

## Project Overview

This project demonstrates image classification on the CIFAR-10 dataset using Convolutional Neural Networks (CNNs). The CIFAR-10 dataset consists of 60,000 32x32 color images across 10 categories:

| **Label Index** | **Class Name** | **Example Object(s)**            |
| --------------- | -------------- | -------------------------------- |
| 0               | Airplane       | Jet, helicopter, passenger plane |
| 1               | Automobile     | Car, SUV, sedan                  |
| 2               | Bird           | Sparrow, parrot, eagle           |
| 3               | Cat            | Domestic cat, kitten             |
| 4               | Deer           | Deer, elk                        |
| 5               | Dog            | Domestic dog, puppy              |
| 6               | Frog           | Tree frog, toad                  |
| 7               | Horse          | Horse, pony                      |
| 8               | Ship           | Boat, ocean liner, sailboat      |
| 9               | Truck          | Pickup, delivery truck           |

- Training set: 50,000 images
- Test set: 10,000 images

---

## Data Preprocessing

- Standardization to normalize pixel values
- One-hot encoding for categorical labels
- Data augmentation for the optimized model

---

## Model Architecture

### Baseline CNN

- 3 convolutional layers with increasing filters [32, 64, 64]
- ELU activation
- Batch normalization, max pooling, and dropout
- Flatten + Dense layer with softmax for classification

### Optimized CNN

- 5 convolutional layers with filters [32, 32, 64, 64, 128]
- ELU activation, batch normalization, dropout
- MaxPooling and GlobalAveragePooling before Dense output
- Weight decay (L2 regularization)
- Data augmentation
- Learning rate scheduling
- Early stopping to prevent overfitting

---

### Training

- Optimizer: Adam
- Loss: Categorical cross-entropy
- Batch size: 128
- Epochs: 30 (baseline) / 50 (optimized)
- Callbacks: Early stopping and learning rate scheduler

---

## Results

| Model         | Test Accuracy | Test Loss |
| ------------- | ------------- | --------- |
| Baseline CNN  | 75.96%        | 0.73      |
| Optimized CNN | 82.71%        | 0.585     |

- Optimized CNN shows clear improvement over baseline.
- Both models showed stable convergence, minimal overfitting, and good generalization.
- Optimized model can effectively classify unseen CIFAR-10 images.

---

## Conclusion

- The optimized CNN provides a reliable and well-generalized solution for CIFAR-10 image classification. Key improvements include:
- Data augmentation to expand training diversity
- Batch normalization and dropout for stability and regularization
- Learning rate scheduling for efficient convergence
- Global average pooling to reduce model parameters
- The model achieves over 82% test accuracy, demonstrating its effectiveness for small image classification tasks.

---

## Tools and Technologies

- Programming Language: Python
- Deep Learning Frameworks: TensorFlow, Keras  
- Data Handling & Visualization: NumPy, Pandas, Matplotlib, Seaborn  
- Development Environment: Google Colab, Jupyter Notebook  
- Data Augmentation Tools: Keras ImageDataGenerator 

