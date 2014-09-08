import os
import uuid

from werkzeug.utils import secure_filename

from flask import current_app, flash

ALLOWED_EXTENSIONS = set(['dcm', 'zip', 'rar'])

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
        return filename
    return False

def remove_file(fname):
    try:
        os.remove(os.path.join(current_app.config['UPLOAD_FOLDER'], fname))
    except OSError as err:
        flash("%s image could not be deleted: %s" % (fname, err), "danger")
        return False
    return True