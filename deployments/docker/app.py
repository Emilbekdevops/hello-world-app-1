from flask import Flask,  jsonify 
import os 
app = Flask(__name__)
@app.route('/')
def hello_world():
    return jsonify({
        'message': 'selam world',
        'environment': os.environ.get('ENVIRONMENT')
    })
if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)