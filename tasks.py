""" dcmdb's task runner
It helps automate some processes mainly for development purposes.
"""
import os
import json

from invoke import run as invoke_run
from invoke import task

from dcmdb import create_app, db
from dcmdb.models import DataElement

app = create_app()
app.test_request_context().push()

BASE_DIR = os.path.dirname(os.path.realpath(__file__))

@task
def run():
    """ Initiates the server """
    app.run()

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

@task
def add_data_elements(fname):
    with open(os.path.join(BASE_DIR, fname), 'r') as fp:
        ded = json.load(fp)

    for de in ded:
        if DataElement.query.filter(DataElement.name==de['Name']).first():
            continue
        cur_tag = de['Tag'].replace("(", "")
        cur_tag = cur_tag.replace(")", "")
        group, element = cur_tag.split(",")
        if "x" in group or "x" in element:
            group_min, group_max = min_max_hex(group)
            element_min, element_max = min_max_hex(element)
            model = DataElement(de['Name'],
                                int(group_min, 16), int(group_max, 16),
                                int(element_min, 16), int(element_max, 16),
                                de['Keyword'], de['VR'], de['VM'],
                                de['Status'])
        else:
            model = DataElement(de['Name'],
                                int(group, 16), int(group, 16),
                                int(element, 16), int(element, 16),
                                de['Keyword'], de['VR'], de['VM'],
                                de['Status'])
        print("Added {0}".format(model))
        db.session.add(model)
    db.session.commit()
    print("Created {0} data elements".format(len(ded)))

def min_max_hex(num_str):
    num_list = list(num_str)
    wildcard_pos = []
    num_min = None
    num_max = None
    for index, item in enumerate(num_list):
        if item == "x":
            wildcard_pos.append(index)
    for wildcard in wildcard_pos:
        num_list[wildcard] = '0'
    num_min = list(num_list)
    for wildcard in wildcard_pos:
        num_list[wildcard] = 'F'
    num_max = list(num_list)
    return "".join(num_min), "".join(num_max)

def expand_hex(num_str):
    import itertools
    spectrum = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F']
    num_list = list(num_str)
    wildcard_pos = []
    for index, item in enumerate(num_list):
        if item == "x":
            wildcard_pos.append(index)
            num_list[index] = '0'
    final_list = []
    for iter in itertools.product(*[it for it in itertools.repeat(spectrum, times=len(wildcard_pos))]):
        for index, item in enumerate(iter):
            num_list[wildcard_pos[index]] = item
        final_list.append(list(num_list))
    return final_list
