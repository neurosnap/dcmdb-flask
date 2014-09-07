import os
import uuid
import requests
from PIL import Image

from werkzeug.utils import secure_filename

from flask import current_app, flash

ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg'])

def allowed_file(fname):
    return '.' in fname and \
        fname.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS

def upload_file(file):
    if file and allowed_file(file.filename):
        fname, fext = os.path.splitext(file.filename)
        # give filename a unique ID so accidently
        # overwriting a file becomes impossible
        filename = secure_filename(''.join([str(uuid.uuid4()), str(fext)]))
        final_file = os.path.join(current_app.config['UPLOAD_FOLDER'], filename)
        file.save(final_file)
        # resize image
        im = Image.open(final_file)
        im.thumbnail((300,300,), Image.ANTIALIAS)
        im.save(final_file)
        return filename
    return False

def remove_file(fname):
    try:
        os.remove(os.path.join(current_app.config['UPLOAD_FOLDER'], fname))
    except OSError as err:
        flash("%s image could not be deleted: %s" % (fname, err), "danger")
        return False
    return True

def geocode(address):
    google_geocode_url = "https://maps.googleapis.com/maps/api/geocode/json"
    params = {
        "address": address
    }
    req = requests.get(google_geocode_url, params=params)
    resp = req.json()
    location = resp['results'][0]['geometry']['location']
    return location['lat'], location['lng']