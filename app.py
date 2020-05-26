from flask import Flask, jsonify
from flask import request
import json
from flask_cors import CORS, cross_origin
import traceback
from waitress import serve
import rpy2
import rpy2.robjects as robjects

app = Flask(__name__)

@app.route('/')
def hello_world():
	r_s = robjects.r('''
		library(glmnet)
		r_vector <- c(1,1,2,3,5,8)
		''')
	
	return jsonify([x for x in r_s])

if __name__ == '__main__':
    app.run(host='0.0.0.0')
