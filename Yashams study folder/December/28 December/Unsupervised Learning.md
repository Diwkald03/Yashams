
1. What is unsupervised learning?

Unsupervised learning explores unlabeled data to find natural groupings, relationships, or simplifications automatically—no target variable provided.​

Core tasks:

    Clustering: Group similar employees (high performers, at-risk quitters)

    Dimensionality reduction: Compress 50 features → 5 key factors

    Association: "Developers who know Python also know Streamlit"



2. How is unsupervised learning different from supervised learning?

| Aspect   | Supervised                    | Unsupervised                        |
| -------- | ----------------------------- | ----------------------------------- |
| Data     | Labeled (Experience → Salary) | Unlabeled (just Experience, Salary) |
| Goal     | Predict known outcomes        | Discover patterns                   |
| Example  | Hire/Reject prediction        | Employee segmentation               |
| Accuracy | Measurable (90% correct)      | Subjective (good clusters?)         |
| Use case | Production models             | EDA + insights                      |

HR workflow: Unsupervised first (find patterns) → Supervised second (predict).



3. What is clustering?

Clustering groups similar data points based on features:

K-Means algorithm:
1. Pick 3 centroids (cluster centers)
2. Assign each employee to nearest centroid
3. Move centroids to group average
4. Repeat → Stable clusters

Result:

Cluster 1: High salary + experience (seniors)
Cluster 2: Low salary + new hires (juniors)  
Cluster 3: High tenure + low performance (at-risk)



4. Give real-life examples of unsupervised learning.

HR Employee Segmentation:


Input: [Salary, Experience, Performance, Department]
Output: 4 natural groups emerge:
• Group A: Senior Python devs (₹15-25L)
• Group B: HR generalists (₹6-10L)
• Group C: New sales hires (₹4-6L)
• Group D: Underperformers (intervention needed)

Other applications:

    Marketing: Customer segments (luxury, budget buyers)

    Fraud: Unusual transaction patterns

    Healthcare: Patient symptom clusters


5. What are advantages and limitations of unsupervised learning?

| Advantages                    | Limitations                       |
| ----------------------------- | --------------------------------- |
| No labels needed (cheap data) | Hard to evaluate (good clusters?) |
| Discovers hidden patterns     | Interpretation subjective         |
| Scales to massive datasets    | Number of clusters unknown        |
| Preprocessing for supervised  | Sensitive to outliers             |


Production strategy:


Week 1: K-Means clustering → Discover 4 employee types
Week 2: Label clusters manually → Train supervised model
Week 3: 95% accuracy prediction system

Streamlit Clustering Demo

python
import streamlit as st
from sklearn.cluster import KMeans
import seaborn as sns

st.title("👥 Employee Clustering")

df = pd.DataFrame({
    'salary': [500000, 1200000, 800000, 300000, 2500000],
    'experience': [2, 8, 5, 1, 15]
})

kmeans = KMeans(n_clusters=3, random_state=42)
df['cluster'] = kmeans.fit_predict(df[['salary', 'experience']])

sns.scatterplot(data=df, x='experience', y='salary', hue='cluster')
st.pyplot(plt.gcf())
st.caption("3 employee segments discovered automatically")

Unsupervised = Pattern discovery superpower. Every production ML pipeline starts here. 🔍✅


