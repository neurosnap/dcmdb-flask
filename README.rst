dcmdb v2
==========

An open-source webservice that provides a range of DICOM development utilities.
Search our image repository or data element dictionary.
Edit, validate, or anonymize DICOM files with ease.

The mission of this service is to create a set of utilities that
medical technicians can use to view, edit, anonymize, validate,
and lookup DICOM files or images with a suite of easy to use utilities and a
repository of anonymous medical diagnotic images. With this service we also
wish to create a social platform for discussion, teaching, and learning.

Features
========

* DICOM Data Element Dictionary
* DICOM Editor
* DICOM Anonymizer
* DICOM Validator
* DICOM Image Anonymizer
* DICOM Image Repository

Dependencies
============

* Python <= 2.7
* GDCM (see https://github.com/neurosnap/mudicom for installation details)
* PostgreSQL (http://www.postgresql.org/)
* Nodejs (http://nodejs.org/)
* Bower (http://bower.io/)
* Grunt (http://gruntjs.com/)

How To
======

Clone repository and navigate into directory

.. code:: bash

    git clone <git repo address>
    cd <git repo folder>

Create postgreSQL database for website

Create local_settings.py file, replacing
``user``, ``pass``, ``database`` with postgresql credentials

.. code:: python

    SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://user:pass@localhost/database'

Install python modules

.. code:: bash

    pip install conf/requirements.txt

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
