from flask import Flask,render_template, json, request

app=Flask(__name__)
app.config.from_pyfile('config.py')
app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'
from views import *
	
if __name__=='__main__':
	app.run(port=5004,debug=True,threaded=True,host="127.0.0.1")
