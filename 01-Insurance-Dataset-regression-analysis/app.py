import gradio as gr
import pandas as pd
import joblib


model = joblib.load("rf_tuned_model.pkl")

sc_X = joblib.load("sc_X.pkl")
sc_y = joblib.load("sc_y.pkl")

# Map categorical to numbers
smoker_map = {'no': 0, 'yes': 1}

# Prediction function
def predict(smoker, Claim_Amount,
            past_consultations, num_of_steps, Hospital_expenditure,
            Number_of_past_hospitalizations, Annual_Salary):
       
    # Convert smoker to numeric
    smoker_num = smoker_map[smoker]
    X = [[
        smoker_num,
        Claim_Amount,
        past_consultations,
        num_of_steps,
        Hospital_expenditure,
        Number_of_past_hospitalizations,
        Annual_Salary
    ]]
    X_scaled = sc_X.transform(X)
    y_scaled_pred = model.predict(X_scaled).reshape(-1, 1)
    y_pred = sc_y.inverse_transform(y_scaled_pred)

    return round(float(y_pred[0][0]), 2)

    
# Define Gradio inputs
inputs = [
    gr.Dropdown(choices=['yes', 'no'], label='Smoker'),
    gr.Number(label='Claim Amount'),
    gr.Number(label='Past Consultations'),
    gr.Number(label='Num of Steps'),
    gr.Number(label='Hospital Expenditure'),
    gr.Number(label='Number of Past Hospitalizations'),
    gr.Number(label='Annual Salary')
 ]

# Add examples 
examples = [
    ['no', 29087.54313, 17.0, 715428.0, 4720920.992, 0.0, 55784970.05,],
    ['no', 39053.67437, 7.0, 699157.0, 4329831.676, 0.0, 13700885.19,]
]

# Create Gradio interface
interface = gr.Interface(
    fn=predict,
    inputs=inputs,
    outputs=gr.Number(label="Predicted Charges"),
    examples=examples,
    cache_examples=False,
    title="Insurance Charges Predictor",
    description="Predict insurance charges based on patient and hospital data"
)

# Launch app
if __name__ == "__main__":
    interface.launch(share=True)
