import os
import dcmdb
from database import init_db
import unittest
import tempfile

class MeaningTestCase(unittest.TestCase):

	def setUp(self):
		self.db_fd, dcmdb.app.config['DATABASE'] = tempfile.mkstemp()
		dcmdb.app.config['TESTING'] = True
		self.app = dcmdb.app.test_client()
		init_db()

	def tearDown(self):
		os.close(self.db_fd)
		os.unlink(dcmdb.app.config['DATABASE'])

	def test_empty_db(self):
		rv = self.app.get('/')
		print rv.data
		#assert 'No entries here so far' in rv.data

if __name__ == '__main__':
	unittest.main()
