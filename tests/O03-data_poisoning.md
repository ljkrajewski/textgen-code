# Training Data Poisoning
## Description
Training data poisoning is a type of adversarial attack where malicious data is inserted into the training set with the intent to subvert the model's behavior. I'll illustrate a simple example using a text classification model, where the goal of the attacker is to make the model misclassify certain inputs by poisoning the training data.
## Examples
- **Steps**
  1. _Create a Clean Dataset_: First, let's create a small clean dataset for a sentiment analysis task.
     ```python
     # Clean training data
     clean_data = [
         ("I love this movie, it is fantastic!", "positive"),
         ("This is a great product, I am very satisfied.", "positive"),
         ("The service was terrible, I am not happy.", "negative"),
         ("I hate this item, it is awful.", "negative"),
         ("The book is very good and I enjoyed it.", "positive"),
         ("This is the worst experience I have ever had.", "negative"),
     ]
    
     # Clean test data
     test_data = [
         ("I really love this!", "positive"),
         ("This is so bad, I hate it.", "negative"),
     ]
     ```
  2. _Train a Model on the Clean Dataset_: We'll use a simple text classification model. For simplicity, let's use a Naive Bayes classifier from scikit-learn.
     ```python
     from sklearn.feature_extraction.text import CountVectorizer
     from sklearn.naive_bayes import MultinomialNB
     from sklearn.pipeline import make_pipeline
    
     # Prepare the training data
     X_train, y_train = zip(*clean_data)
      
     # Create a text classification pipeline
     model = make_pipeline(CountVectorizer(), MultinomialNB())
      
     # Train the model
     model.fit(X_train, y_train)
      
     # Evaluate on the test data
     X_test, y_test = zip(*test_data)
     print("Test accuracy (clean):", model.score(X_test, y_test))
     ```
  3. _Poison the Training Data_: Now, we'll introduce poisoned data into the training set. The goal of the attacker is to make the model misclassify certain positive sentiments as negative.
     ```python
     # Poisoned training data
     poisoned_data = clean_data + [
         ("I love this movie, it is fantastic!", "negative"),  # Poisoning a positive example as negative
         ("The book is very good and I enjoyed it.", "negative"),  # Another poisoned example
     ]
    
     # Prepare the poisoned training data
     X_train_poisoned, y_train_poisoned = zip(*poisoned_data)
    
     # Train a new model on the poisoned data
     model_poisoned = make_pipeline(CountVectorizer(), MultinomialNB())
     model_poisoned.fit(X_train_poisoned, y_train_poisoned)
    
     # Evaluate on the test data
     print("Test accuracy (poisoned):", model_poisoned.score(X_test, y_test))
     ```
  4. _Test the Impact of Poisoning_: We need to check how the poisoned data has affected the model's behavior, especially on the poisoned examples.
     ```python
     # Test examples including poisoned ones
     test_examples = [
         "I really love this!",  # Should be positive
         "This is so bad, I hate it.",  # Should be negative
         "I love this movie, it is fantastic!",  # Poisoned example
         "The book is very good and I enjoyed it."  # Poisoned example
     ]
     
     # Predictions from the clean model
     clean_predictions = model.predict(test_examples)
     print("Clean model predictions:", clean_predictions)
    
     # Predictions from the poisoned model
     poisoned_predictions = model_poisoned.predict(test_examples)
     print("Poisoned model predictions:", poisoned_predictions)
     ```
  This example demonstrates how introducing a few maliciously labeled examples can alter the behavior of a text classification model. The poisoned model may misclassify the previously positive examples as negative due to the poisoned data. This type of attack can be more sophisticated and less detectable in real-world scenarios with larger datasets and more complex models.

  **Real-World Examples Of Training Data Poisoning**
  - [Microsoft shuts down AI chatbot after it turned into a Nazi](https://www.cbsnews.com/news/microsoft-shuts-down-ai-chatbot-after-it-turned-into-racist-nazi/)
  - [PoisonGPT: How We Hid a Lobotomized LLM on Hugging Face to Spread Fake News](https://blog.mithrilsecurity.io/poisongpt-how-we-hid-a-lobotomized-llm-on-hugging-face-to-spread-fake-news/)
  - [What is a Poisoned Model? A Look into Nightshade & Glaze!! (Stable Diffusion poisoning)](https://medium.com/data-and-beyond/what-is-a-poisoned-model-8f9780470369)
## Mitigations
Mitigating training data poisoning attacks is crucial for maintaining the integrity and reliability of machine learning models. Here are some strategies and techniques to defend against such attacks:
- **Data Validation and Sanitization**
  - _Data Auditing_: Regularly audit and inspect the training data for anomalies or inconsistencies. Look for patterns that may indicate poisoning, such as unusual labels or outliers.
  - _Anomaly Detection_: Use statistical methods or machine learning techniques to detect anomalous data points that deviate significantly from the rest of the dataset.
- **Robust Learning Algorithms**
  - _Differential Privacy_: Implement differential privacy techniques to ensure that the inclusion or exclusion of any single training example does not significantly affect the model's output.
  - _Robust Statistics_: Use robust statistical techniques, such as median or trimmed means, instead of standard means to reduce the impact of outliers.
- **Model Training Techniques**
  - _Data Augmentation_: Use data augmentation to generate more training samples from the existing clean data. This can help dilute the effect of any poisoned samples.
  - _Ensemble Learning_: Train multiple models on different subsets of the data and aggregate their predictions. This can help mitigate the impact of poisoned data affecting any single model.
  - _Adversarial Training_: Introduce adversarial examples during training to make the model more robust to adversarial inputs.
- **Regularization and Penalization**
  - _Regularization_: Apply regularization techniques such as L1, L2, or dropout to prevent the model from overfitting to poisoned data.
  - _Penalize Misleading Labels_: Incorporate mechanisms to penalize inconsistent or misleading labels during the training process.
- **Monitoring and Updating**
  - _Continuous Monitoring_: Continuously monitor the performance of the model and the integrity of the data pipeline. Set up alerts for unusual changes in model performance.
  - _Incremental Learning_: Use online learning or incremental learning techniques where the model updates its parameters continuously with new incoming data. This can help detect and mitigate poisoning over time.
- **Secure Data Collection and Curation**
  - _Data Source Verification_: Ensure the authenticity and reliability of data sources. Use trusted and verified sources for training data collection.
  - _Access Controls_: Implement strict access controls and permissions for who can add or modify the training data.
- **Post-training Validation**
  - _Cross-validation_: Use cross-validation techniques to ensure that the model performs consistently across different subsets of the data.
  - _Shadow Models_: Train shadow models on different parts of the data and compare their performance to detect inconsistencies caused by poisoned data.
- **Community and Research**
  - _Collaborative Defense_: Engage with the research community to stay updated on the latest defenses against data poisoning attacks. Share knowledge and techniques to improve collective security.
  - _Adversarial Research_: Conduct internal red team exercises to simulate poisoning attacks and develop stronger defenses.  
  Here's an example of how to implement a basic anomaly detection mechanism using Isolation Forest to identify potential poisoned data points:
  ```python
  from sklearn.ensemble import IsolationForest
  import numpy as np
  
  # Example data (features only for simplicity)
  X_train = np.array([
      [1, 2], [2, 3], [3, 4], [4, 5], [100, 200],  # Assuming [100, 200] is a poisoned data point
      [5, 6], [6, 7], [7, 8], [8, 9], [9, 10]
  ])
  
  # Fit the Isolation Forest model
  iso_forest = IsolationForest(contamination=0.1)  # Assuming 10% contamination
  iso_forest.fit(X_train)
  
  # Predict anomalies
  predictions = iso_forest.predict(X_train)
  anomalies = X_train[predictions == -1]
  
  print("Anomalous data points (potentially poisoned):")
  print(anomalies)
  ```
  This example uses Isolation Forest to identify anomalies in the dataset, which might indicate potential poisoned data points. By filtering out these anomalies, you can reduce the impact of poisoned data on the training process.

  By combining these strategies, you can create a more resilient machine learning pipeline that is better equipped to handle and mitigate the risks of training data poisoning.
