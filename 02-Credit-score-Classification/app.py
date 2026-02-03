import gradio as gr
import pandas as pd
import joblib

# Load model and preprocessors
model = joblib.load("rf_tuned.pkl")
sc = joblib.load("sc.pkl")
encoders = joblib.load("encoders.pkl")

features = [
    'month', 'age', 'occupation', 'annual_income', 'monthly_inhand_salary',
    'num_bank_accounts', 'num_credit_card', 'interest_rate', 'num_of_loan',
    'delay_from_due_date', 'num_of_delayed_payment', 'changed_credit_limit',
    'num_credit_inquiries', 'credit_mix', 'outstanding_debt',
    'credit_utilization_ratio', 'credit_history_age',
    'payment_of_min_amount', 'total_emi_per_month',
    'amount_invested_monthly', 'payment_behaviour', 'monthly_balance'
]

categorical_cols = [
    'month', 'occupation', 'credit_mix',
    'payment_of_min_amount', 'payment_behaviour'
]

def safe_label_encode(col, value):
    le = encoders[col]

    if value in le.classes_:
        return le.transform([value])[0]
    else:
        # fallback to most frequent / first class
        return le.transform([le.classes_[0]])[0]

def predict_credit_score(
    month, age, occupation, annual_income, monthly_inhand_salary,
    num_bank_accounts, num_credit_card, interest_rate, num_of_loan,
    delay_from_due_date, num_of_delayed_payment, changed_credit_limit,
    num_credit_inquiries, credit_mix, outstanding_debt,
    credit_utilization_ratio, credit_history_age,
    payment_of_min_amount, total_emi_per_month,
    amount_invested_monthly, payment_behaviour, monthly_balance
):
    data = locals()
    row = []

    for col in features:
        val = data[col]

        if col in categorical_cols:
            val = safe_label_encode(col, val.strip())
        else:
            val = float(val)

        row.append(val)

    X = pd.DataFrame([row], columns=features)
    X_scaled = sc.transform(X)

    prediction_encoded = model.predict(X_scaled)[0]
    prediction_label = encoders['credit_score'].inverse_transform([prediction_encoded])[0]

    return prediction_label
  
inputs = [
    gr.Textbox(label="Month "),
    gr.Number(label="Age"),
    gr.Textbox(label="Occupation"),
    gr.Number(label="Annual Income"),
    gr.Number(label="Monthly Inhand Salary"),
    gr.Number(label="Number of Bank Accounts"),
    gr.Number(label="Number of Credit Cards"),
    gr.Number(label="Interest Rate"),
    gr.Number(label="Number of Loans"),
    gr.Number(label="Delay From Due Date"),
    gr.Number(label="Number of Delayed Payments"),
    gr.Number(label="Changed Credit Limit"),
    gr.Number(label="Number of Credit Inquiries"),
    gr.Textbox(label="Credit Mix"),
    gr.Number(label="Outstanding Debt"),
    gr.Number(label="Credit Utilization Ratio"),
    gr.Number(label="Credit History Age"),
    gr.Textbox(label="Payment of Min Amount (Yes / No / NM)"),
    gr.Number(label="Total EMI per Month"),
    gr.Number(label="Amount Invested Monthly"),
    gr.Textbox(label="Payment Behaviour"),
    gr.Number(label="Monthly Balance")
]

examples = [
    [4.0, 48.0, 5.0, 20787.69, 1999.3075, 8.0, 6.0, 14.0, 3.0, 23.0, 14.0, 1.13, 3.0, 2.0, 614.6, 26.110243, 219.0, 0.0, 42.221993, 258.215174, 6.0, 189.493584],
    [1.0, 48.0, 5.0, 20787.69, 1999.3075, 8.0, 11.5, 14.0, 3.0, 22.0, 14.0, 8.13, 3.0, 2.0, 614.6, 35.344188, 221.0, 0.0, 42.221993, 21.745531, 1.0, 375.963226]
]

interface = gr.Interface(
    fn=predict_credit_score,
    inputs=inputs,
    outputs=gr.Textbox(label="Predicted Credit Score"),
    examples=examples,
    cache_examples=False,
    title="Credit Score Classification API",
    description="Credit score prediction"
)

if __name__ == "__main__":
    interface.launch(share=True)
