from __future__ import division, print_function
import os.path
from flask import Flask, render_template, request
from database import db_session

BASE_DIR = os.path.dirname(os.path.realpath(__file__))

app = Flask(__name__)
app.config['DEBUG'] = True
# import settings from settings file
settings_file = os.path.join(BASE_DIR, 'settings.py')
if os.path.isfile(settings_file):
	app.config.from_pyfile(settings_file)

@app.teardown_appcontext
def shutdown_session(exception=None):
	db_session.remove()

@app.errorhandler(404)
def page_not_found(e):
    return render_template("404.html"), 404

@app.route('/')
def index():
	return render_template('index.html')

@app.route('/about')
def about():
	return render_template('about.html')

@app.route('/dicom')
def dicom():
	return render_template('dicom.html')

@app.route('/tos')
def tos():
	return render_template('tos.html')

@app.route('/privacy')
def privacy():
	return render_template('privacy.html')

@app.route('/transfer_syntax')
def transfer_syntax():
	return render_template('transfer_syntax.html')

@app.route('/explore')
def explore():
	return render_template('explore.html')

@app.route('/upload')
def upload():
	return render_template('upload.html')

if __name__ == '__main__':
	app.run()
