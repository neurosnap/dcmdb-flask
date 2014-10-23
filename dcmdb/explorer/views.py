from __future__ import print_function

from flask import Blueprint, render_template, request, jsonify

blueprint = Blueprint("explorer", __name__,
                    url_prefix="/explorer", template_folder="templates",
                    static_folder="static")

@blueprint.route('/')
def explore():
    return render_template('explore.html')