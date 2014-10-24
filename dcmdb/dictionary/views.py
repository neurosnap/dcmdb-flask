from __future__ import print_function

from sqlalchemy import or_, and_
from flask import Blueprint, render_template, request

from ..models import DataElement

blueprint = Blueprint("dictionary", __name__,
                    url_prefix="/dictionary", template_folder="templates",
                    static_folder="static")

@blueprint.route('/', methods=['GET', 'POST'])
@blueprint.route('/<path:query>/')
def search(query=None):
    ded = None
    if request.method == "POST":
        query = request.values.get("query")
        if "," in query:
            params = query.split(",")
            params[0] = int(params[0], 16)
            params[1] = int(params[1], 16)
            ded = DataElement.query \
                    .filter(DataElement.min_group>=params[0]) \
                    .filter(DataElement.max_group<=params[0]) \
                    .filter(DataElement.min_element>=params[1]) \
                    .filter(DataElement.max_element<=params[1]).all()
        else:
            query = int(query, 16)
            ded = DataElement.query.filter(query>=DataElement.min_group, query<=DataElement.max_group).all()
            print(ded)
                   # .filter(or_(and_(DataElement.min_group>=query, DataElement.max_group<=query),
                    #        and_(DataElement.min_element>=query, DataElement.max_element<=query))).all()

    return render_template('ded_search.html', query=query, ded=ded)