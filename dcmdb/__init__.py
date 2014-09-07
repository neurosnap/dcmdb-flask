from __future__ import division, print_function
import os.path

from flask import Flask, render_template, request, send_from_directory, jsonify

from .models import db

BASE_DIR = os.path.dirname(os.path.realpath(__file__))
PARENT_DIR = os.path.abspath(os.path.join(BASE_DIR, os.pardir))

class ConfigClass(object):
    # Configure Flask
    SECRET_KEY = 'THIS IS AN INSECURE SECRET'
    CSRF_ENABLED = True
    DEBUG = True
    UPLOAD_FOLDER = os.path.join(PARENT_DIR, 'uploads')
    MAX_CONTENT_LENGTH = 5 * 2 ** 20

def create_app():
    app = Flask(__name__)
    # default config
    app.config.from_object(__name__ + '.ConfigClass')
    # attempt to import settings from settings file
    try:
        app.config.from_object('local_settings')
    except:
        app.logger.warning("No local settings found")

    # load the views via blueprints
    #app.register_blueprint(dicom)
    # adds continue and break to jinja template language
    app.jinja_env.add_extension('jinja2.ext.loopcontrols')

    # flask extension setup
    db.init_app(app)

    # create uploads folder if it does not exist
    if not os.path.isdir(app.config['UPLOAD_FOLDER']):
        os.makedirs(app.config['UPLOAD_FOLDER'])

    @app.errorhandler(404)
    def page_not_found(e):
        return render_template("404.html"), 404

    @app.route('/uploads/<filename>/')
    def uploaded_file(filename):
        return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

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

    return app

app = create_app()
