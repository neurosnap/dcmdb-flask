dcmdb v2
==========

The mission of this service is to create a repository of easy to access, publicly available, anonymous medical diagnotic images. With this repository we also wish to create a social platform for discussion, teaching, and learning.

Dependencies
============

* Python <= 2.7
* PostgreSQL
* Nodejs
* Bower
* Grunt

How To
======

Clone repository and navigate into directory

.. code: bash

    git clone <git repo address>
    cd <git repo folder>

Create postgreSQL database for website

Create local_settings.py file, replacing
``user``, ``pass``, ``database`` with postgresql credentials

.. code: python

    SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://user:pass@localhost/database'

Install python modules

.. code:: bash

    pip install conf/requirements.txt

Install nodejs: http://nodejs.org/
Install bower and grunt

.. code:: bash

    npm install -g bower grunt-cli

Install package dependencies and create database tables
(node, bower, postgresql)

.. code:: bash

    invoke install

Run the server

.. code:: bash

    invoke run

Open browser and point to http://localhost:5000/

Credits
=======

Eric Bower
