""" dcmdb's task runner
It helps automate some processes mainly for development purposes.
"""
import os
import sys

from invoke import run as invoke_run
from invoke import task

from dcmdb import app, db, create_app

@task
def run():
    """ Initiates the server """
    app.run(debug=True)

@task
def install():
    """ Installs node, bower packages and creates tables """
    print("Installing node packages")
    invoke_run("npm install")
    print("Installing bower packages")
    invoke_run("bower install")
    create_db()

@task
def create_db():
    """ Created tables within database """
    db.create_all(app=create_app())
    print("Tables created in database")

@task
def clean_db():
    """ Clears records from all tables within database """
    db.drop_all(app=create_app())
    print("Tables dropped in database")
    db.create_all(app=create_app())
    print("Tables re-created in database")

@task
def clean_uploads(folder=app.config['UPLOAD_FOLDER']):
    """ Clears all files from the uploads folder """
    print("All uploads in '%s' removed" % folder)
    for the_file in os.listdir(folder):
        file_path = os.path.join(folder, the_file)
        try:
            if os.path.isfile(file_path):
                os.unlink(file_path)
        except Exception, e:
            print(e)