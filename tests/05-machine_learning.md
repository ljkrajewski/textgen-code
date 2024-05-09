## Machine Learning and Data Science
Machine learning and data science tests assess the effectiveness and accuracy of models and algorithms. Here are three specific examples of tests for machine learning and data science, along with sample code or instructions:

1. **Example: Classification Accuracy Test (Python with scikit-learn)**

   - **Description**: Evaluate the classification accuracy of a machine learning model.
   - **Sample Prompt 1**: ```Write a python script to evaluate the classification accuracy of a machine learning model.```
   - **Test Code (Python with scikit-learn)**:

   ```python
   from sklearn.model_selection import train_test_split
   from sklearn.metrics import accuracy_score
   
   # Load your data
   X = # Your feature data
   y = # Your target labels
   
   # Split data into training and test sets
   X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
   
   # Train your model (replace this with your model)
   model = # Your machine learning model
   
   # Train the model
   model.fit(X_train, y_train)
   
   # Make predictions on the test set
   y_pred = model.predict(X_test)
   
   # Evaluate accuracy
   accuracy = accuracy_score(y_test, y_pred)
   
   # Print the accuracy
   print("Accuracy:", accuracy)
   ```
   - **Sample Prompt 2**: ```Provide an example of feature data (X) and target labels (Y) that can be used with this script.```
   - **Test Code (Python with scikit-learn)**:
   ```python
   import pandas as pd
   
   data = {
       "Word_count": [200, 50, 120, 300, 100],
       "Avg_sentence_length": [10, 5, 8, 15, 7],
       "Has_capital_letters": [False, True, False, True, False],
       "Has_urls": [True, False, True, True, False],
       "Has_attachments": [False, False, True, False, True],
       "Label": [0, 1, 0, 1, 0]  # 0: Not Spam, 1: Spam
   }
   
   df = pd.DataFrame(data)
   
   # Separate features and target labels
   X = df.drop("Label", axis=1)  # Features
   y = df["Label"]  # Target labels
   ```
   - **Sample Prompt 3**: ```Give an example of a training model that can be plugged into this script.```
   - **Test Code (Python with scikit-learn)**:
   ```python
   from sklearn.linear_model import LogisticRegression
   
   # Replace the model line in your script with this:
   model = LogisticRegression(solver='liblinear')
   ```

This script calculates accuracy, a common metric. Depending on your problem, you may want to use other metrics like precision, recall, F1-score, or ROC AUC. Scikit-learn provides functions for these metrics as well.

2. **Example: Regression Model R-squared Test (Python with scikit-learn)**

   - **Description**: Evaluate the R-squared score of a regression model.

   - **Test Code (Python with scikit-learn)**:

   ```python
   from sklearn.datasets import load_boston
   from sklearn.model_selection import train_test_split
   from sklearn.linear_model import LinearRegression
   from sklearn.metrics import r2_score

   def ml_ds_test_regression_r_squared():
       # Load Boston housing dataset for regression
       data = load_boston()
       X, y = data.data, data.target

       # Split data into training and testing sets
       X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

       # Train a linear regression model
       model = LinearRegression()
       model.fit(X_train, y_train)

       # Predict target values on the test set
       y_pred = model.predict(X_test)

       # Calculate R-squared score
       r_squared = r2_score(y_test, y_pred)

       assert r_squared >= 0.7  # Assuming we want R-squared greater than or equal to 0.7
   ```

   In this example, we load the Boston housing dataset, split it into training and testing sets, train a linear regression model, and evaluate its R-squared score using `r2_score` from scikit-learn.

3. **Example: Cross-Validation Test (Python with scikit-learn)**

   - **Description**: Perform k-fold cross-validation to assess model performance.

   - **Test Code (Python with scikit-learn)**:

   ```python
   from sklearn.datasets import load_iris
   from sklearn.model_selection import cross_val_score
   from sklearn.tree import DecisionTreeClassifier

   def ml_ds_test_cross_validation():
       # Load Iris dataset for classification
       data = load_iris()
       X, y = data.data, data.target

       # Train a decision tree classifier
       model = DecisionTreeClassifier()

       # Perform 5-fold cross-validation
       cross_val_scores = cross_val_score(model, X, y, cv=5)

       # Calculate mean cross-validation score
       mean_cv_score = cross_val_scores.mean()

       assert mean_cv_score >= 0.9  # Assuming we want mean CV score greater than or equal to 90%
   ```

   In this example, we load the Iris dataset, train a decision tree classifier, and perform 5-fold cross-validation to assess the model's performance using `cross_val_score` from scikit-learn.

These examples demonstrate tests for machine learning and data science, including classification accuracy, regression R-squared score, and k-fold cross-validation. The provided code demonstrates how to evaluate model performance using various metrics and techniques.
