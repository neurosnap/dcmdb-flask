from __future__ import division, print_function
import os.path

from flask import Flask, render_template, request, send_from_directory, jsonify, g

from .models import db
from .explorer.views import blueprint as explorer
from .uploader.views import blueprint as uploader
from .dictionary.views import blueprint as dictionary

BASE_DIR = os.path.dirname(os.path.realpath(__file__))
PARENT_DIR = os.path.abspath(os.path.join(BASE_DIR, os.pardir))

class DefaultSettings(object):
    # Configure Flask
    SECRET_KEY = 'THIS IS AN INSECURE SECRET'
    CSRF_ENABLED = False
    DEBUG = False
    UPLOAD_FOLDER = os.path.join(PARENT_DIR, 'uploads')
    MAX_CONTENT_LENGTH = 5 * 2 ** 20

def create_app():
    LOG_DIR = ""

    app = Flask(__name__)
    # default config
    app.config.from_object(DefaultSettings)
    # attempt to import settings from settings file
    try:
        app.config.from_object('local_settings')
    except:
        pass

    # load the views via blueprints
    app.register_blueprint(dictionary)
    if app.debug:
        app.register_blueprint(uploader)
        app.register_blueprint(explorer)
    # adds continue and break to jinja template language
    app.jinja_env.add_extension('jinja2.ext.loopcontrols')

    # flask extension setup
    db.init_app(app)

    # create uploads folder if it does not exist
    if not os.path.isdir(app.config['UPLOAD_FOLDER']):
        os.makedirs(app.config['UPLOAD_FOLDER'])

    # log bugs
    if not app.debug:
        import logging
        from logging.handlers import RotatingFileHandler
        if not os.path.isdir(LOG_DIR):
            LOG_DIR = PARENT_DIR
        handler = RotatingFileHandler(os.path.join(LOG_DIR, "flask.log"),
                    maxBytes=10000, backupCount=1)
        handler.setLevel(logging.DEBUG)
        app.logger.addHandler(handler)

    @app.before_request
    def before_request():
        g.debug = app.debug

    @app.errorhandler(404)
    def page_not_found(e):
        return render_template("404.html"), 404

    @app.route('/uploads/<filename>/')
    def uploaded_file(filename):
        return send_from_directory(app.config['UPLOAD_FOLDER'], filename)

    @app.route('/')
    def index():
        return render_template('index.html')

    @app.route('/uc')
    def uc():
        return render_template("uc.html")

    @app.route('/about/')
    def about():
        return render_template('about.html')

    @app.route('/dicom/')
    def dicom():
        return render_template('dicom.html')

    @app.route('/tos/')
    def tos():
        return render_template('tos.html')

    @app.route('/privacy/')
    def privacy():
        return render_template('privacy.html')

    @app.route('/transfer_syntax/')
    def transfer_syntax():
        return render_template('transfer_syntax.html')

    return app

app = create_app()