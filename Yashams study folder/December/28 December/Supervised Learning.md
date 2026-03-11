
1. What is supervised learning?

Supervised learning uses labeled training data (input + correct answer pairs) to teach models patterns. The algorithm learns mappings, then predicts on unseen data.​

Training process:

Input: Experience=5, Skills=3 → Output: Hire=1
Input: Experience=1, Skills=1 → Output: Hire=0
Model learns: Higher exp+skills → Higher hire probability



2. What is labeled data?

Labeled data = Inputs paired with correct answers:

HR Dataset:
Experience, Skills, Hire
5, 3, 1
1, 1, 0  
8, 5, 1

Unlabeled (unsupervised): Just Experience, Skills (no Hire column).

Analogy: Teacher provides exam + answer key → Student learns correct patterns.



3. Difference between classification and regression.

| Type           | Output                                  | Examples                       |
| -------------- | --------------------------------------- | ------------------------------ |
| Classification | Categories (0/1, Yes/No, Spam/Not Spam) | Hire/Reject, Churn/No Churn    |
| Regression     | Continuous numbers (₹5.2L, 27.3 years)  | Salary prediction, House price |


Same input → Different outputs:

Experience=5 → Classification: Hire(1)
Experience=5 → Regression: ₹8.2L salary

4. Give real-life examples of supervised learning.

HR Applications (Production Ready):


1. Hiring: [Exp, Skills] → Hire/Reject
2. Salary prediction: [Exp, Age, Skills] → ₹Salary
3. Attrition: [Salary, Tenure, Performance] → Stays/Quits
4. Promotion: [Performance, Tenure] → Promoted/Not

Other industries:

    Banking: Credit score → Approve loan (classification)

    Healthcare: Symptoms → Disease probability

    Marketing: Customer data → Will buy (classification)



5. What are advantages and limitations of supervised learning?

| Advantages                                  | Limitations                                 |
| ------------------------------------------- | ------------------------------------------- |
| High accuracy with good data                | Requires labeled data (expensive to create) |
| Predictable performance                     | Poor on unseen patterns (overfitting)       |
| Business interpretable (feature importance) | Labeling bias propagates                    |
| Wide applications (90% ML projects)         | Can't discover new patterns                 |


Production tradeoff:

✅ Supervised: 92% accuracy on hiring (known patterns)
❌ Unsupervised: Finds hidden clusters but 78% accuracy

Streamlit Supervised Learning Pipeline

python
import streamlit as st
from sklearn.linear_model import LogisticRegression

st.title("🎯 HR Hiring Model")

# Labeled training data
X = [[1,1], [5,3], [8,5]]  # [Experience, Skills]
y = [0, 1, 1]              # Hire/Reject labels

model = LogisticRegression().fit(X, y)

# Live prediction
exp = st.slider("Experience", 0, 15)
skills = st.slider("Skills", 0, 8)
prob = model.predict_proba([[exp, skills]])[0,1]

st.metric("Hire Probability", f"{prob:.1%}")
st.success("✅ Hire" if prob > 0.5 else "❌ Reject")

Supervised learning = Business ML foundation. Every production model starts here. 🎓✅
