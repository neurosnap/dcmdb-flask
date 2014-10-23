from __future__ import print_function

from flask import Blueprint, render_template, request, jsonify

from ..helpers import upload_file

blueprint = Blueprint("uploader", __name__,
                    url_prefix="/uploader", template_folder="templates",
                    static_folder="static")

@blueprint.route('/')
def upload():
    return render_template('upload.html')

@blueprint.route('/handle/', methods=['GET', 'POST'])
def handle():
    file_to_upload = request.files["files[]"]
    fname = upload_file(file_to_upload)

    #db.session.add(model)
    #db.session.commit()

    response = {
        "name": fname,
    }

    return jsonify(**response)