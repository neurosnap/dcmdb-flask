from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy.ext.declarative import declarative_base
try:
	from settings import DB_URI
except:
	raise Exception("Database requires DB_URI var inside settings.py file")

engine = create_engine(DB_URI, convert_unicode=True)
sesh = sessionmaker(autocommit=False, autoflush=True, bind=engine)
db_session = scoped_session(sesh)

Base = declarative_base()
Base.query = db_session.query_property()

def init_db():
	import models
	Base.metadata.create_all(bind=engine)

