from flask import Flask, render_template
import pandas as pd

app = Flask(__name__)

@app.route("/")
def dashboard():

    data = {
        "order_id":[1,2,3,4,5,6,7,8],
        "date":[
            "2025-01-02","2025-01-05",
            "2025-02-10","2025-02-15",
            "2025-03-01","2025-03-10",
            "2025-03-20","2025-04-05"
        ],
        "product":[
            "Phone","Shoes","Phone","T-shirt",
            "Laptop","Shoes","Headphones","Laptop"
        ],
        "price":[20000,3000,20000,800,50000,3000,1500,50000],
        "quantity":[1,2,1,3,1,1,2,1]
    }

    df = pd.DataFrame(data)
    df["date"] = pd.to_datetime(df["date"])
    df["total"] = df["price"] * df["quantity"]

    total_sales = int(df["total"].sum())
    total_orders = int(df["order_id"].nunique())
    top_products = df.groupby("product")["quantity"].sum().to_dict()

    return render_template(
        "frontend.html",
        sales=total_sales,
        orders=total_orders,
        products=top_products
    )

if __name__ == "__main__":
    app.run(debug=True)