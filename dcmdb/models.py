from datetime import datetime

from sqlalchemy.dialects.postgresql import JSON
from flask.ext.sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Study(db.Model):
    __tablename__ = 'study'
    id = db.Column(db.Integer, primary_key=True)
    uid = db.Column(db.String(255), nullable=False)
    study_id = db.Column(db.String(255), nullable=False)
    sop_class_uid = db.Column(db.String(255), nullable=False)
    study_date = db.Column(db.DateTime, nullable=True)
    accession_number = db.Column(db.String(255), nullable=True)
    description = db.Column(db.Text, nullable=True)
    created = db.Column(db.DateTime)
    series = db.relationship('Series', backref='study', lazy='dynamic')

    def __init__(self, uid, study_id, sop_class_uid, study_date=None,
                accession_number=None, description=None, created=None):
        self.uid = uid
        self.study_id = study_id
        self.sop_class_uid = sop_class_uid
        self.study_date = study_date
        self.accession_number = accession_number
        self.description = description
        if created is None:
            created = datetime.utcnow()
        self.created = created

    def __repr__(self):
        return '<Study %r>' % self.uid


class Series(db.Model):
    __tablename__ = 'series'
    id = db.Column(db.Integer, primary_key=True)
    uid = db.Column(db.String(255), nullable=False)
    study_id = db.Column(db.Integer, db.ForeignKey('study.id'))
    modality = db.Column(db.String(255), nullable=True)
    description = db.Column(db.Text, nullable=True)
    institution_name = db.Column(db.String(255), nullable=True)
    manufacturer = db.Column(db.String(255), nullable=True)
    series_number = db.Column(db.Integer, nullable=True)
    body_part_examined = db.Column(db.String(255), nullable=True)
    laterality = db.Column(db.String(255), nullable=True)
    series_date = db.Column(db.Date, nullable=True)
    created = db.Column(db.DateTime)
    images = db.relationship('Image', backref='series', lazy='dynamic')

    def __init__(self, uid, modality=None, description=None,
                institution_name=None, manufacturer=None, series_number=None,
                body_part_examined=None, laterality=None, series_date=None,
                created=None):
        self.uid = uid
        self.modality = modality
        self.description = description
        self.institution_name = institution_name
        self.manufacturer = manufacturer
        self.series_number = series_number
        self.body_part_examined = body_part_examined
        self.laterality = laterality
        self.series_date = series_date
        if created is None:
            created = datetime.utcnow()
        self.created = created

    def __repr__(self):
        return '<Series %r>' % self.uid


class Image(db.Model):
    __tablename__ = 'image'
    id = db.Column(db.Integer, primary_key=True)
    uid = db.Column(db.String(255), nullable=False)
    series_id = db.Column(db.Integer, db.ForeignKey('series.id'))
    filename = db.Column(db.String(255), nullable=False)
    dicom = db.Column(JSON)
    transfer_syntax_uid = db.Column(db.String(255), nullable=False)
    image_number = db.Column(db.Integer)
    image_orientation_patient = db.Column(db.String(255), nullable=True)
    image_position_patient = db.Column(db.String(255), nullable=True)
    patient_position = db.Column(db.String(255), nullable=True)
    content_date = db.Column(db.DateTime, nullable=True)
    created = db.Column(db.DateTime)

    def __init__(self, uid, filename, dicom, transfer_syntax_uid, image_number,
                image_orientation_patient=None, image_position_patient=None,
                patient_position=None, content_date=None, created=None):
        self.uid = uid
        self.filename = filename
        self.dicom = dicom
        self.transfer_syntax_uid = transfer_syntax_uid
        self.image_number = image_number
        self.image_orientation_patient = image_orientation_patient
        self.image_position_patient = image_position_patient
        self.patient_position = patient_position
        self.content_date = content_date
        if created is None:
            created = datetime.utcnow()
        self.created = created

    def __repr__(self):
        return '<Image %r>' % self.uid
