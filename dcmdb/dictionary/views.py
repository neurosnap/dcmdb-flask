from __future__ import print_function

import math
from sqlalchemy import or_, and_
from sqlalchemy import func
from flask import Blueprint, render_template, request, jsonify

from ..models import DataElement

blueprint = Blueprint("dictionary", __name__,
                    url_prefix="/dictionary", template_folder="templates",
                    static_folder="static")

@blueprint.route('/')
def search(query=None):
    return render_template('ded_search.html')

@blueprint.route('/query/')
@blueprint.route('/query/<path:query>/')
def query(query=None):
    data_element_results = None
    page = None
    de_per_page = 20.0

    if request.values.get("page"):
        page = int(request.values.get("page"))

    request_query = request.values.get("query")
    if request_query:
        query = request_query

    if query is None:
        return jsonify({ "data_elements": [], "num_results": 0 })

    try:
        if "," in query:
            params = query.split(",")
            query_items = []
            for item in params:
                if "x" in item:
                    query_items.append(int(item, 16))
                else:
                    query_items.append(int(item))

            data_element_results = DataElement.query \
                                    .filter(and_(query_items[0]>= DataElement.min_group,
                                                 query_items[0]<= DataElement.max_group,
                                                 query_items[1]>= DataElement.min_element,
                                                 query_items[1]<= DataElement.max_element)).all()
        else:
            if "x" in query:
                query = int(query, 16)
            else:
                query = int(query)

            data_element_results = DataElement.query \
                    .filter(or_(and_(query>=DataElement.min_group,
                                    query<= DataElement.max_group),
                                and_(query>=DataElement.min_element,
                                    query<= DataElement.max_element))
                    ).all()
    except ValueError:
        data_element_results = DataElement.query.filter(
                                query.lower()==func.lower(DataElement.name)).all()

    data_elements = [element.json for element in data_element_results]

    response = {
        "data_elements": data_elements,
        "num_results": len(data_elements)
    }

    if page is not None:
        last_page = int(math.ceil(len(data_element_results) / de_per_page))
        page_min = (int(page) - 1) * de_per_page
        if page == 1:
            page_min = 0
        page_max = page_min + de_per_page
        response["pages"] = [page + 1 for page in xrange(last_page)]
        response["data_elements"] = data_elements[int(page_min):int(page_max)]

    return jsonify(response)
