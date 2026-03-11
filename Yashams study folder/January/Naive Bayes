
1. What is Naive Bayes in simple words?

Naive Bayes calculates probability of each class given input features, picking the most likely one. Uses Bayes theorem: P(Class|Features) = P(Features|Class) × P(Class) / P(Features) ​.

HR Example: Predict department from skills:

text
Skills: [Python, SQL, Excel]
P(Engineering) = High (Python+SQL)
P(HR) = Low (Excel only)


2. Why is Naive Bayes called “Naive”?

"Naive" assumption: All features are independent (no correlation):

text
Reality: Python skill correlates with SQL skill
Naive Bayes: Ignores correlation → Simplifies math → Super fast

Surprising truth: Works well even when assumption violated.


3. Where is Naive Bayes commonly used?

Production heavy-hitters:

    Spam detection (90%+ Gmail emails)

    Sentiment analysis (customer reviews)

    Recommendation systems (product categories)

    Document classification (topic tagging)

HR Use: Resume parsing → Job role matching.


4. Difference between Gaussian and Multinomial Naive Bayes?

| Type        | Data Type                | Use Case                               |
| ----------- | ------------------------ | -------------------------------------- |
| Gaussian    | Continuous (age, salary) | Numeric features (normal distribution) |
| Multinomial | Counts (word frequency)  | Text data (bag-of-words) scikit-learn​ |
| Bernoulli   | Binary (0/1 presence)    | Yes/no features                        |

Code example:

python
from sklearn.naive_bayes import GaussianNB, MultinomialNB

# Salary prediction (continuous)
gnb = GaussianNB()
gnb.fit(X_numeric, y_salary_band)

# Resume classification (word counts)  
mnb = MultinomialNB()
mnb.fit(X_word_counts, y_job_role)


5. What are the limitations of Naive Bayes?

| Problem                     | Impact                   | Workaround                    |
| --------------------------- | ------------------------ | ----------------------------- |
| Independence assumption     | Often wrong              | Still works surprisingly well |
| Zero probability            | Feature never seen → P=0 | Laplace smoothing (add-1)     |
| Poor with continuous ratios | Salary=₹20L vs ₹2L       | Discretize or use Gaussian    |
| Class imbalance sensitivity | Rare class ignored       | Oversampling + priors         |

Streamlit Spam Detector Demo

python
import streamlit as st
from sklearn.naive_bayes import MultinomialNB
from sklearn.feature_extraction.text import CountVectorizer

st.title("📧 Email Spam Detector")

# Training data
emails = ["Free money!", "Meeting tomorrow", "Win lottery!"]
labels = [1, 0, 1]  # Spam=1, Ham=0

vectorizer = CountVectorizer()
X = vectorizer.fit_transform(emails)

model = MultinomialNB().fit(X, labels)

# Live prediction
test_email = st.text_input("Enter email subject:")
if st.button("Classify"):
    X_test = vectorizer.transform([test_email])
    prob = model.predict_proba(X_test)[0,1]
    st.metric("Spam Probability", f"{prob:.1%}")

Naive Bayes = Production classification king. Gmail's secret weapon. ⚡✅