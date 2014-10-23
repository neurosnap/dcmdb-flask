from __future__ import print_function

from flask import Blueprint, render_template, request

blueprint = Blueprint("dictionary", __name__,
                    url_prefix="/dictionary", template_folder="templates",
                    static_folder="static")

@blueprint.route('/')
def search():
    return render_template('search.html')