dcmdb v2
==========

The mission of this service is to create a repository of easy to access, publicly available, anonymous medical diagnotic images. With this repository we also wish to create a social platform for discussion, teaching, and learning.

How To
======

Clone repository and navigate into directory

.. code: bash

    git clone <git repo address>
    cd <git repo folder>

Install python modules

.. code:: bash

    pip install conf/requirements.txt

Install nodejs: http://nodejs.org/
Install bower and grunt

.. code:: bash

    npm install -g bower grunt-cli

Install nodejs components

.. code:: bash

    npm install

Install bower components

.. code:: bash

    bower install

Run init script

.. code:: bash

    python init.py

Run the server

.. code:: bash

    python runserver.py

Open browser and point to http://localhost:5000/

Credits
=======

Eric Bower
