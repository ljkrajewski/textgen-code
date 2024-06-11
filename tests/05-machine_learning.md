## Machine Learning and Data Science
Machine learning and data science tests assess the effectiveness and accuracy of models and algorithms. All of these examples use Scikit. When running these examples, ensure that scikit-learn is installed. ```pip install scikit-learn```

Here are three specific examples of tests for machine learning and data science, along with sample code or instructions:

1. **Example: Classification Accuracy Test (Python with scikit-learn)**

   - **Description**: Evaluate the classification accuracy of a machine learning model.
   - **Sample Prompt 1**: ```Write a working python script to demonstrate evaluating the classification accuracy of a machine learning model.```
   - **Test Code (Python with scikit-learn)**:  

   ```python
   import numpy as np
   from sklearn import datasets
   from sklearn.model_selection import train_test_split
   from sklearn.tree import DecisionTreeClassifier
   from sklearn.metrics import accuracy_score
   
   # Load the Iris dataset
   iris = datasets.load_iris()
   X = iris.data
   y = iris.target
   
   # Split the dataset into training and testing sets
   X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
   
   # Initialize the classifier
   clf = DecisionTreeClassifier(random_state=42)
   
   # Train the classifier
   clf.fit(X_train, y_train)
   
   # Make predictions on the test set
   y_pred = clf.predict(X_test)
   
   # Calculate the accuracy
   accuracy = accuracy_score(y_test, y_pred)
   
   # Print the accuracy
   print(f"Classification accuracy: {accuracy:.2f}")
   
   # Example of making a single prediction
   sample = np.array([[5.1, 3.5, 1.4, 0.2]])  # Example input data
   prediction = clf.predict(sample)
   print(f"Predicted class for sample {sample}: {prediction[0]} (0: Setosa, 1: Versicolor, 2: Virginica)")
   ```
   To demonstrate evaluating the classification accuracy of a machine learning model, we'll use a simple classification task with the Iris dataset, which is a standard dataset for demonstrating machine learning algorithms. This example uses scikit's iris data set consisting of 3 different types of irises’ (Setosa, Versicolour, and Virginica) petal and sepal length, stored in a 150x4 numpy.ndarray.

   - **Sample Prompt 2**: ```Provide an example of feature data (X) and target labels (Y) that can be used with this script.```
   - **Test Code (Python with scikit-learn)**:
   ```python
   import numpy as np
   from sklearn.model_selection import train_test_split
   from sklearn.tree import DecisionTreeClassifier
   from sklearn.metrics import accuracy_score
   
   # Example feature data (X)
   X = np.array([
       [5.1, 3.5, 1.4, 0.2],
       [4.9, 3.0, 1.4, 0.2],
       [4.7, 3.2, 1.3, 0.2],
       [4.6, 3.1, 1.5, 0.2],
       [5.0, 3.6, 1.4, 0.2],
       [5.4, 3.9, 1.7, 0.4],
       [4.6, 3.4, 1.4, 0.3],
       [5.0, 3.4, 1.5, 0.2],
       [4.4, 2.9, 1.4, 0.2],
       [4.9, 3.1, 1.5, 0.1]
   ])
   
   # Example target labels (Y)
   Y = np.array([0, 0, 0, 0, 0, 1, 1, 1, 2, 2])
   
   # Split the dataset into training and testing sets
   X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.3, random_state=42)
   
   # Initialize the classifier
   clf = DecisionTreeClassifier(random_state=42)
   
   # Train the classifier
   clf.fit(X_train, y_train)
   
   # Make predictions on the test set
   y_pred = clf.predict(X_test)
   
   # Calculate the accuracy
   accuracy = accuracy_score(y_test, y_pred)
   
   # Print the accuracy
   print(f"Classification accuracy: {accuracy:.2f}")
   
   # Example of making a single prediction
   sample = np.array([[5.1, 3.5, 1.4, 0.2]])  # Example input data
   prediction = clf.predict(sample)
   print(f"Predicted class for sample {sample}: {prediction[0]} (0: Setosa, 1: Versicolor, 2: Virginica)")
   ```

To provide an example of feature data (X) and target labels (Y) for use with this script, we'll simulate a small dataset similar to the Iris dataset. This script calculates accuracy, a common metric. Depending on your problem, you may want to use other metrics like precision, recall, F1-score, or ROC AUC. Scikit-learn provides functions for these metrics as well.


2. **Example: Regression Model R-squared Test (Python with scikit-learn)**

   - **Description**: Evaluate the R-squared score of a regression model.
   - **Sample Prompt**: ```Write a python script that demonstrates evaluating the R-squared score of a regression model.```
   - **Test Code (Python with scikit-learn)**:

   ```python
   import numpy as np
   import pandas as pd
   from sklearn import datasets
   from sklearn.model_selection import train_test_split
   from sklearn.linear_model import LinearRegression
   from sklearn.metrics import r2_score
   
   # Load the Boston housing dataset
   data_url = "http://lib.stat.cmu.edu/datasets/boston"
   raw_df = pd.read_csv(data_url, sep="\s+", skiprows=22, header=None)
   X = data = np.hstack([raw_df.values[::2, :], raw_df.values[1::2, :2]])
   y = target = raw_df.values[1::2, 2]
   
   # Split the dataset into training and testing sets
   X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
   
   # Initialize the regression model
   regressor = LinearRegression()
   
   # Train the model
   regressor.fit(X_train, y_train)
   
   # Make predictions on the test set
   y_pred = regressor.predict(X_test)
   
   # Calculate the R-squared score
   r2 = r2_score(y_test, y_pred)
   
   # Print the R-squared score
   print(f"R-squared score: {r2:.2f}")
   
   # Example of making a single prediction
   sample = np.array([[0.1, 20.0, 5.0, 1.0, 0.5, 6.0, 40.0, 4.0, 1.0, 300.0, 15.0, 400.0, 5.0]])  # Example input data
   single_prediction = regressor.predict(sample)
   print(f"Predicted house price for sample {sample}: {single_prediction[0]:.2f}")
   ```

   To demonstrate evaluating the R-squared score of a regression model, we can use a simple linear regression example with the Boston housing dataset from the scikit-learn library. The Boston housing dataset contains information about houses in Boston, such as crime rate, number of rooms, and house prices. We used scikit-learn to load the dataset, split it into training and testing sets, train a linear regression model, make predictions, and evaluate the model using the R-squared score. In this example, we load the Boston housing dataset, split it into training and testing sets, train a linear regression model, and evaluate its R-squared score using `r2_score` from scikit-learn. Be aware, the Boston housing dataset has been deprecated in _scikit-learn_ as of version 1.2.

3. **Example: Cross-Validation Test (Python with scikit-learn)**

   - **Description**: Perform k-fold cross-validation to assess model performance.
   - **Sample Prompt**: ```Write a python script that demonstrates k-fold cross-validation to assess model performance.```
   - **Test Code (Python with scikit-learn)**:

   ```python
   import numpy as np
   from sklearn import datasets
   from sklearn.tree import DecisionTreeClassifier
   from sklearn.model_selection import cross_val_score
   
   # Load the Iris dataset
   iris = datasets.load_iris()
   X = iris.data
   y = iris.target
   
   # Initialize the classifier
   clf = DecisionTreeClassifier(random_state=42)
   
   # Perform k-fold cross-validation with k=5
   k = 5
   cv_scores = cross_val_score(clf, X, y, cv=k)
   
   # Print the cross-validation scores
   print(f"Cross-validation scores: {cv_scores}")
   
   # Print the mean and standard deviation of the cross-validation scores
   print(f"Mean cross-validation score: {cv_scores.mean():.2f}")
   print(f"Standard deviation of cross-validation scores: {cv_scores.std():.2f}")
   ```

   K-fold cross-validation is a technique used to evaluate the performance of a machine learning model by dividing the dataset into k equal-sized subsets (folds). The model is trained on k-1 folds and tested on the remaining fold. This process is repeated k times, with each fold used exactly once as the test set. The final performance metric is the average of the performance metrics across all k trials. In this example, we load the Iris dataset, train a decision tree classifier, and perform 5-fold cross-validation to assess the model's performance using `cross_val_score` from scikit-learn.

These examples demonstrate tests for machine learning and data science, including classification accuracy, regression R-squared score, and k-fold cross-validation. The provided code demonstrates how to evaluate model performance using various metrics and techniques.
