from flask import Flask
from flask_sqlalchemy import SQLAlchemy
import uuid

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
db = SQLAlchemy(app)

# 👇 ✅ WRITE YOUR MODEL HERE
class Registration(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100))
    email = db.Column(db.String(100))
    qr_token = db.Column(db.String(100), default=lambda: str(uuid.uuid4()))
    attended = db.Column(db.Boolean, default=False)
    certificate_approved = db.Column(db.Boolean, default=False)

# 👇 basic route
@app.route('/')
def home():
    return "Home Page ✅"

with app.app_context():
    db.create_all()
    print("Database created ✅")

    from flask import request

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']

        user = Registration(name=name, email=email)
        db.session.add(user)
        db.session.commit()

        return f'''
<h2>Registered Successfully ✅</h2>
<p>Name: {user.name}</p>
<p>Email: {user.email}</p>

<p>Your QR Code:</p>
<img src="/qr/{user.qr_token}">
'''

    return '''
    <h2>Register</h2>
    <form method="POST">
        Name: <input name="name"><br><br>
        Email: <input name="email"><br><br>
        <button type="submit">Register</button>
    </form>
    '''
import qrcode
from io import BytesIO
from flask import send_file

@app.route('/qr/<token>')
def qr(token):
    img = qrcode.make(f"http://127.0.0.1:5001/scan/{token}")
    buf = BytesIO()
    img.save(buf)
    buf.seek(0)
    return send_file(buf, mimetype='image/png')
if __name__ == '__main__':
    app.run(debug=True, port=5001)
