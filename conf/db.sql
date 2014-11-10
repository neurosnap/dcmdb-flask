--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: data_element; Type: TABLE; Schema: public; Owner: dcmdb_user; Tablespace: 
--

CREATE TABLE data_element (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    min_group integer NOT NULL,
    max_group integer NOT NULL,
    min_element integer NOT NULL,
    max_element integer NOT NULL,
    keyword character varying(255) NOT NULL,
    "VR" character varying(255),
    "VM" character varying(255),
    status character varying(255),
    created timestamp without time zone
);


ALTER TABLE public.data_element OWNER TO dcmdb_user;

--
-- Name: data_element_id_seq; Type: SEQUENCE; Schema: public; Owner: dcmdb_user
--

CREATE SEQUENCE data_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_element_id_seq OWNER TO dcmdb_user;

--
-- Name: data_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dcmdb_user
--

ALTER SEQUENCE data_element_id_seq OWNED BY data_element.id;


--
-- Name: image; Type: TABLE; Schema: public; Owner: dcmdb_user; Tablespace: 
--

CREATE TABLE image (
    id integer NOT NULL,
    uid character varying(255) NOT NULL,
    series_id integer,
    filename character varying(255) NOT NULL,
    transfer_syntax_uid character varying(255) NOT NULL,
    image_number integer,
    image_orientation_patient character varying(255),
    image_position_patient character varying(255),
    patient_position character varying(255),
    content_date timestamp without time zone,
    created timestamp without time zone
);


ALTER TABLE public.image OWNER TO dcmdb_user;

--
-- Name: image_id_seq; Type: SEQUENCE; Schema: public; Owner: dcmdb_user
--

CREATE SEQUENCE image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_id_seq OWNER TO dcmdb_user;

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dcmdb_user
--

ALTER SEQUENCE image_id_seq OWNED BY image.id;


--
-- Name: series; Type: TABLE; Schema: public; Owner: dcmdb_user; Tablespace: 
--

CREATE TABLE series (
    id integer NOT NULL,
    uid character varying(255) NOT NULL,
    study_id integer,
    modality character varying(255),
    description text,
    institution_name character varying(255),
    manufacturer character varying(255),
    series_number integer,
    body_part_examined character varying(255),
    laterality character varying(255),
    series_date date,
    created timestamp without time zone
);


ALTER TABLE public.series OWNER TO dcmdb_user;

--
-- Name: series_id_seq; Type: SEQUENCE; Schema: public; Owner: dcmdb_user
--

CREATE SEQUENCE series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.series_id_seq OWNER TO dcmdb_user;

--
-- Name: series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dcmdb_user
--

ALTER SEQUENCE series_id_seq OWNED BY series.id;


--
-- Name: study; Type: TABLE; Schema: public; Owner: dcmdb_user; Tablespace: 
--

CREATE TABLE study (
    id integer NOT NULL,
    uid character varying(255) NOT NULL,
    study_id character varying(255) NOT NULL,
    sop_class_uid character varying(255) NOT NULL,
    study_date timestamp without time zone,
    accession_number character varying(255),
    description text,
    created timestamp without time zone
);


ALTER TABLE public.study OWNER TO dcmdb_user;

--
-- Name: study_id_seq; Type: SEQUENCE; Schema: public; Owner: dcmdb_user
--

CREATE SEQUENCE study_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.study_id_seq OWNER TO dcmdb_user;

--
-- Name: study_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dcmdb_user
--

ALTER SEQUENCE study_id_seq OWNED BY study.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dcmdb_user
--

ALTER TABLE ONLY data_element ALTER COLUMN id SET DEFAULT nextval('data_element_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dcmdb_user
--

ALTER TABLE ONLY image ALTER COLUMN id SET DEFAULT nextval('image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dcmdb_user
--

ALTER TABLE ONLY series ALTER COLUMN id SET DEFAULT nextval('series_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dcmdb_user
--

ALTER TABLE ONLY study ALTER COLUMN id SET DEFAULT nextval('study_id_seq'::regclass);


--
-- Data for Name: data_element; Type: TABLE DATA; Schema: public; Owner: dcmdb_user
--

COPY data_element (id, name, type, min_group, max_group, min_element, max_element, keyword, "VR", "VM", status, created) FROM stdin;
1	Length to End	Registry of DICOM Data Elements	8	8	1	1	LengthToEnd	UL	1	RET	2014-10-27 22:02:50.445036
2	Specific Character Set	Registry of DICOM Data Elements	8	8	5	5	SpecificCharacterSet	CS	1-n		2014-10-27 22:02:50.456155
3	Language Code Sequence	Registry of DICOM Data Elements	8	8	6	6	LanguageCodeSequence	SQ	1		2014-10-27 22:02:50.459457
4	Image Type	Registry of DICOM Data Elements	8	8	8	8	ImageType	CS	2-n		2014-10-27 22:02:50.462342
5	Recognition Code	Registry of DICOM Data Elements	8	8	16	16	RecognitionCode	SH	1	RET	2014-10-27 22:02:50.467365
6	Instance Creation Date	Registry of DICOM Data Elements	8	8	18	18	InstanceCreationDate	DA	1		2014-10-27 22:02:50.470522
7	Instance Creation Time	Registry of DICOM Data Elements	8	8	19	19	InstanceCreationTime	TM	1		2014-10-27 22:02:50.473524
8	Instance Creator UID	Registry of DICOM Data Elements	8	8	20	20	InstanceCreatorUID	UI	1		2014-10-27 22:02:50.476724
9	Instance Coercion DateTime	Registry of DICOM Data Elements	8	8	21	21	InstanceCoercionDateTime	DT	1		2014-10-27 22:02:50.47987
10	SOP Class UID	Registry of DICOM Data Elements	8	8	22	22	SOPClassUID	UI	1		2014-10-27 22:02:50.482715
11	SOP Instance UID	Registry of DICOM Data Elements	8	8	24	24	SOPInstanceUID	UI	1		2014-10-27 22:02:50.485591
12	Related General SOP Class UID	Registry of DICOM Data Elements	8	8	26	26	RelatedGeneralSOPClassUID	UI	1-n		2014-10-27 22:02:50.488453
13	Original Specialized SOP Class UID	Registry of DICOM Data Elements	8	8	27	27	OriginalSpecializedSOPClassUID	UI	1		2014-10-27 22:02:50.491322
14	Study Date	Registry of DICOM Data Elements	8	8	32	32	StudyDate	DA	1		2014-10-27 22:02:50.494295
15	Series Date	Registry of DICOM Data Elements	8	8	33	33	SeriesDate	DA	1		2014-10-27 22:02:50.497239
16	Acquisition Date	Registry of DICOM Data Elements	8	8	34	34	AcquisitionDate	DA	1		2014-10-27 22:02:50.500201
17	Content Date	Registry of DICOM Data Elements	8	8	35	35	ContentDate	DA	1		2014-10-27 22:02:50.504496
18	Overlay Date	Registry of DICOM Data Elements	8	8	36	36	OverlayDate	DA	1	RET	2014-10-27 22:02:50.507375
19	Curve Date	Registry of DICOM Data Elements	8	8	37	37	CurveDate	DA	1	RET	2014-10-27 22:02:50.510247
20	Acquisition DateTime	Registry of DICOM Data Elements	8	8	42	42	AcquisitionDateTime	DT	1		2014-10-27 22:02:50.513104
21	Study Time	Registry of DICOM Data Elements	8	8	48	48	StudyTime	TM	1		2014-10-27 22:02:50.515981
22	Series Time	Registry of DICOM Data Elements	8	8	49	49	SeriesTime	TM	1		2014-10-27 22:02:50.518848
23	Acquisition Time	Registry of DICOM Data Elements	8	8	50	50	AcquisitionTime	TM	1		2014-10-27 22:02:50.521731
24	Content Time	Registry of DICOM Data Elements	8	8	51	51	ContentTime	TM	1		2014-10-27 22:02:50.524612
25	Overlay Time	Registry of DICOM Data Elements	8	8	52	52	OverlayTime	TM	1	RET	2014-10-27 22:02:50.527487
26	Curve Time	Registry of DICOM Data Elements	8	8	53	53	CurveTime	TM	1	RET	2014-10-27 22:02:50.530436
27	Data Set Type	Registry of DICOM Data Elements	8	8	64	64	DataSetType	US	1	RET	2014-10-27 22:02:50.533379
28	Data Set Subtype	Registry of DICOM Data Elements	8	8	65	65	DataSetSubtype	LO	1	RET	2014-10-27 22:02:50.536683
29	Nuclear Medicine Series Type	Registry of DICOM Data Elements	8	8	66	66	NuclearMedicineSeriesType	CS	1	RET	2014-10-27 22:02:50.539553
30	Accession Number	Registry of DICOM Data Elements	8	8	80	80	AccessionNumber	SH	1		2014-10-27 22:02:50.542407
31	Issuer of Accession Number Sequence	Registry of DICOM Data Elements	8	8	81	81	IssuerOfAccessionNumberSequence	SQ	1		2014-10-27 22:02:50.545311
32	Query/Retrieve Level	Registry of DICOM Data Elements	8	8	82	82	QueryRetrieveLevel	CS	1		2014-10-27 22:02:50.548201
33	Query/Retrieve View	Registry of DICOM Data Elements	8	8	83	83	QueryRetrieveView	CS	1		2014-10-27 22:02:50.551047
34	Retrieve AE Title	Registry of DICOM Data Elements	8	8	84	84	RetrieveAETitle	AE	1-n		2014-10-27 22:02:50.553922
35	Instance Availability	Registry of DICOM Data Elements	8	8	86	86	InstanceAvailability	CS	1		2014-10-27 22:02:50.556821
36	Failed SOP Instance UID List	Registry of DICOM Data Elements	8	8	88	88	FailedSOPInstanceUIDList	UI	1-n		2014-10-27 22:02:50.559698
37	Modality	Registry of DICOM Data Elements	8	8	96	96	Modality	CS	1		2014-10-27 22:02:50.562627
38	Modalities in Study	Registry of DICOM Data Elements	8	8	97	97	ModalitiesInStudy	CS	1-n		2014-10-27 22:02:50.565618
39	SOP Classes in Study	Registry of DICOM Data Elements	8	8	98	98	SOPClassesInStudy	UI	1-n		2014-10-27 22:02:50.568966
40	Conversion Type	Registry of DICOM Data Elements	8	8	100	100	ConversionType	CS	1		2014-10-27 22:02:50.571853
41	Presentation Intent Type	Registry of DICOM Data Elements	8	8	104	104	PresentationIntentType	CS	1		2014-10-27 22:02:50.574699
42	Manufacturer	Registry of DICOM Data Elements	8	8	112	112	Manufacturer	LO	1		2014-10-27 22:02:50.577582
43	Institution Name	Registry of DICOM Data Elements	8	8	128	128	InstitutionName	LO	1		2014-10-27 22:02:50.580466
44	Institution Address	Registry of DICOM Data Elements	8	8	129	129	InstitutionAddress	ST	1		2014-10-27 22:02:50.583328
45	Institution Code Sequence	Registry of DICOM Data Elements	8	8	130	130	InstitutionCodeSequence	SQ	1		2014-10-27 22:02:50.586198
46	Referring Physician's Name	Registry of DICOM Data Elements	8	8	144	144	ReferringPhysicianName	PN	1		2014-10-27 22:02:50.589144
47	Referring Physician's Address	Registry of DICOM Data Elements	8	8	146	146	ReferringPhysicianAddress	ST	1		2014-10-27 22:02:50.592098
48	Referring Physician's Telephone Numbers	Registry of DICOM Data Elements	8	8	148	148	ReferringPhysicianTelephoneNumbers	SH	1-n		2014-10-27 22:02:50.595048
49	Referring Physician Identification Sequence	Registry of DICOM Data Elements	8	8	150	150	ReferringPhysicianIdentificationSequence	SQ	1		2014-10-27 22:02:50.598384
50	Code Value	Registry of DICOM Data Elements	8	8	256	256	CodeValue	SH	1		2014-10-27 22:02:50.601283
51	Extended Code Value	Registry of DICOM Data Elements	8	8	257	257	ExtendedCodeValue	LO	1	DICOS	2014-10-27 22:02:50.604183
52	Coding Scheme Designator	Registry of DICOM Data Elements	8	8	258	258	CodingSchemeDesignator	SH	1		2014-10-27 22:02:50.607078
53	Coding Scheme Version	Registry of DICOM Data Elements	8	8	259	259	CodingSchemeVersion	SH	1		2014-10-27 22:02:50.61008
54	Code Meaning	Registry of DICOM Data Elements	8	8	260	260	CodeMeaning	LO	1		2014-10-27 22:02:50.612966
55	Mapping Resource	Registry of DICOM Data Elements	8	8	261	261	MappingResource	CS	1		2014-10-27 22:02:50.615826
56	Context Group Version	Registry of DICOM Data Elements	8	8	262	262	ContextGroupVersion	DT	1		2014-10-27 22:02:50.61868
57	Context Group Local Version	Registry of DICOM Data Elements	8	8	263	263	ContextGroupLocalVersion	DT	1		2014-10-27 22:02:50.621582
58	Extended Code Meaning	Registry of DICOM Data Elements	8	8	264	264	ExtendedCodeMeaning	LT	1	DICOS	2014-10-27 22:02:50.624557
59	Context Group Extension Flag	Registry of DICOM Data Elements	8	8	267	267	ContextGroupExtensionFlag	CS	1		2014-10-27 22:02:50.627494
60	Coding Scheme UID	Registry of DICOM Data Elements	8	8	268	268	CodingSchemeUID	UI	1		2014-10-27 22:02:50.630834
61	Context Group Extension Creator UID	Registry of DICOM Data Elements	8	8	269	269	ContextGroupExtensionCreatorUID	UI	1		2014-10-27 22:02:50.633972
62	Context Identifier	Registry of DICOM Data Elements	8	8	271	271	ContextIdentifier	CS	1		2014-10-27 22:02:50.636863
63	Coding Scheme Identification Sequence	Registry of DICOM Data Elements	8	8	272	272	CodingSchemeIdentificationSequence	SQ	1		2014-10-27 22:02:50.63974
64	Coding Scheme Registry	Registry of DICOM Data Elements	8	8	274	274	CodingSchemeRegistry	LO	1		2014-10-27 22:02:50.64259
65	Coding Scheme External ID	Registry of DICOM Data Elements	8	8	276	276	CodingSchemeExternalID	ST	1		2014-10-27 22:02:50.645509
66	Coding Scheme Name	Registry of DICOM Data Elements	8	8	277	277	CodingSchemeName	ST	1		2014-10-27 22:02:50.648409
67	Coding Scheme Responsible Organization	Registry of DICOM Data Elements	8	8	278	278	CodingSchemeResponsibleOrganization	ST	1		2014-10-27 22:02:50.651274
68	Context UID	Registry of DICOM Data Elements	8	8	279	279	ContextUID	UI	1		2014-10-27 22:02:50.654156
69	Timezone Offset From UTC	Registry of DICOM Data Elements	8	8	513	513	TimezoneOffsetFromUTC	SH	1		2014-10-27 22:02:50.657078
70	Network ID	Registry of DICOM Data Elements	8	8	4096	4096	NetworkID	AE	1	RET	2014-10-27 22:02:50.66042
71	Station Name	Registry of DICOM Data Elements	8	8	4112	4112	StationName	SH	1		2014-10-27 22:02:50.663295
72	Study Description	Registry of DICOM Data Elements	8	8	4144	4144	StudyDescription	LO	1		2014-10-27 22:02:50.666198
73	Procedure Code Sequence	Registry of DICOM Data Elements	8	8	4146	4146	ProcedureCodeSequence	SQ	1		2014-10-27 22:02:50.669489
74	Series Description	Registry of DICOM Data Elements	8	8	4158	4158	SeriesDescription	LO	1		2014-10-27 22:02:50.672729
75	Series Description Code Sequence	Registry of DICOM Data Elements	8	8	4159	4159	SeriesDescriptionCodeSequence	SQ	1		2014-10-27 22:02:50.675954
76	Institutional Department Name	Registry of DICOM Data Elements	8	8	4160	4160	InstitutionalDepartmentName	LO	1		2014-10-27 22:02:50.67908
77	Physician(s) of Record	Registry of DICOM Data Elements	8	8	4168	4168	PhysiciansOfRecord	PN	1-n		2014-10-27 22:02:50.682114
78	Physician(s) of Record Identification Sequence	Registry of DICOM Data Elements	8	8	4169	4169	PhysiciansOfRecordIdentificationSequence	SQ	1		2014-10-27 22:02:50.685117
79	Performing Physician's Name	Registry of DICOM Data Elements	8	8	4176	4176	PerformingPhysicianName	PN	1-n		2014-10-27 22:02:50.688091
80	Performing Physician Identification Sequence	Registry of DICOM Data Elements	8	8	4178	4178	PerformingPhysicianIdentificationSequence	SQ	1		2014-10-27 22:02:50.691488
81	Name of Physician(s) Reading Study	Registry of DICOM Data Elements	8	8	4192	4192	NameOfPhysiciansReadingStudy	PN	1-n		2014-10-27 22:02:50.694398
82	Physician(s) Reading Study Identification Sequence	Registry of DICOM Data Elements	8	8	4194	4194	PhysiciansReadingStudyIdentificationSequence	SQ	1		2014-10-27 22:02:50.697316
83	Operators' Name	Registry of DICOM Data Elements	8	8	4208	4208	OperatorsName	PN	1-n		2014-10-27 22:02:50.70021
84	Operator Identification Sequence	Registry of DICOM Data Elements	8	8	4210	4210	OperatorIdentificationSequence	SQ	1		2014-10-27 22:02:50.703072
85	Admitting Diagnoses Description	Registry of DICOM Data Elements	8	8	4224	4224	AdmittingDiagnosesDescription	LO	1-n		2014-10-27 22:02:50.705963
86	Admitting Diagnoses Code Sequence	Registry of DICOM Data Elements	8	8	4228	4228	AdmittingDiagnosesCodeSequence	SQ	1		2014-10-27 22:02:50.708859
87	Manufacturer's Model Name	Registry of DICOM Data Elements	8	8	4240	4240	ManufacturerModelName	LO	1		2014-10-27 22:02:50.711835
88	Referenced Results Sequence	Registry of DICOM Data Elements	8	8	4352	4352	ReferencedResultsSequence	SQ	1	RET	2014-10-27 22:02:50.714703
89	Referenced Study Sequence	Registry of DICOM Data Elements	8	8	4368	4368	ReferencedStudySequence	SQ	1		2014-10-27 22:02:50.717689
90	Referenced Performed Procedure Step Sequence	Registry of DICOM Data Elements	8	8	4369	4369	ReferencedPerformedProcedureStepSequence	SQ	1		2014-10-27 22:02:50.721013
91	Referenced Series Sequence	Registry of DICOM Data Elements	8	8	4373	4373	ReferencedSeriesSequence	SQ	1		2014-10-27 22:02:50.723971
92	Referenced Patient Sequence	Registry of DICOM Data Elements	8	8	4384	4384	ReferencedPatientSequence	SQ	1		2014-10-27 22:02:50.726878
93	Referenced Visit Sequence	Registry of DICOM Data Elements	8	8	4389	4389	ReferencedVisitSequence	SQ	1		2014-10-27 22:02:50.729761
94	Referenced Overlay Sequence	Registry of DICOM Data Elements	8	8	4400	4400	ReferencedOverlaySequence	SQ	1	RET	2014-10-27 22:02:50.732651
95	Referenced Stereometric Instance Sequence	Registry of DICOM Data Elements	8	8	4404	4404	ReferencedStereometricInstanceSequence	SQ	1		2014-10-27 22:02:50.735626
96	Referenced Waveform Sequence	Registry of DICOM Data Elements	8	8	4410	4410	ReferencedWaveformSequence	SQ	1		2014-10-27 22:02:50.738506
97	Referenced Image Sequence	Registry of DICOM Data Elements	8	8	4416	4416	ReferencedImageSequence	SQ	1		2014-10-27 22:02:50.741388
98	Referenced Curve Sequence	Registry of DICOM Data Elements	8	8	4421	4421	ReferencedCurveSequence	SQ	1	RET	2014-10-27 22:02:50.744307
99	Referenced Instance Sequence	Registry of DICOM Data Elements	8	8	4426	4426	ReferencedInstanceSequence	SQ	1		2014-10-27 22:02:50.747224
100	Referenced Real World Value Mapping Instance Sequence	Registry of DICOM Data Elements	8	8	4427	4427	ReferencedRealWorldValueMappingInstanceSequence	SQ	1		2014-10-27 22:02:50.750584
101	Referenced SOP Class UID	Registry of DICOM Data Elements	8	8	4432	4432	ReferencedSOPClassUID	UI	1		2014-10-27 22:02:50.753487
102	Referenced SOP Instance UID	Registry of DICOM Data Elements	8	8	4437	4437	ReferencedSOPInstanceUID	UI	1		2014-10-27 22:02:50.75637
103	SOP Classes Supported	Registry of DICOM Data Elements	8	8	4442	4442	SOPClassesSupported	UI	1-n		2014-10-27 22:02:50.759237
104	Referenced Frame Number	Registry of DICOM Data Elements	8	8	4448	4448	ReferencedFrameNumber	IS	1-n		2014-10-27 22:02:50.762138
105	Simple Frame List	Registry of DICOM Data Elements	8	8	4449	4449	SimpleFrameList	UL	1-n		2014-10-27 22:02:50.765092
106	Calculated Frame List	Registry of DICOM Data Elements	8	8	4450	4450	CalculatedFrameList	UL	3-3n		2014-10-27 22:02:50.768002
107	Time Range	Registry of DICOM Data Elements	8	8	4451	4451	TimeRange	FD	2		2014-10-27 22:02:50.770866
108	Frame Extraction Sequence	Registry of DICOM Data Elements	8	8	4452	4452	FrameExtractionSequence	SQ	1		2014-10-27 22:02:50.77383
109	Multi-frame Source SOP Instance UID	Registry of DICOM Data Elements	8	8	4455	4455	MultiFrameSourceSOPInstanceUID	UI	1		2014-10-27 22:02:50.776856
110	Retrieve URL	Registry of DICOM Data Elements	8	8	4496	4496	RetrieveURL	UR	1		2014-10-27 22:02:50.780241
111	Transaction UID	Registry of DICOM Data Elements	8	8	4501	4501	TransactionUID	UI	1		2014-10-27 22:02:50.783162
112	Warning Reason	Registry of DICOM Data Elements	8	8	4502	4502	WarningReason	US	1		2014-10-27 22:02:50.786079
113	Failure Reason	Registry of DICOM Data Elements	8	8	4503	4503	FailureReason	US	1		2014-10-27 22:02:50.788999
114	Failed SOP Sequence	Registry of DICOM Data Elements	8	8	4504	4504	FailedSOPSequence	SQ	1		2014-10-27 22:02:50.791903
115	Referenced SOP Sequence	Registry of DICOM Data Elements	8	8	4505	4505	ReferencedSOPSequence	SQ	1		2014-10-27 22:02:50.794864
116	Studies Containing Other Referenced Instances Sequence	Registry of DICOM Data Elements	8	8	4608	4608	StudiesContainingOtherReferencedInstancesSequence	SQ	1		2014-10-27 22:02:50.79777
117	Related Series Sequence	Registry of DICOM Data Elements	8	8	4688	4688	RelatedSeriesSequence	SQ	1		2014-10-27 22:02:50.80066
118	Lossy Image Compression (Retired)	Registry of DICOM Data Elements	8	8	8464	8464	LossyImageCompressionRetired	CS	1	RET	2014-10-27 22:02:50.803665
119	Derivation Description	Registry of DICOM Data Elements	8	8	8465	8465	DerivationDescription	ST	1		2014-10-27 22:02:50.806933
120	Source Image Sequence	Registry of DICOM Data Elements	8	8	8466	8466	SourceImageSequence	SQ	1		2014-10-27 22:02:50.810271
121	Stage Name	Registry of DICOM Data Elements	8	8	8480	8480	StageName	SH	1		2014-10-27 22:02:50.813163
122	Stage Number	Registry of DICOM Data Elements	8	8	8482	8482	StageNumber	IS	1		2014-10-27 22:02:50.81604
123	Number of Stages	Registry of DICOM Data Elements	8	8	8484	8484	NumberOfStages	IS	1		2014-10-27 22:02:50.81905
124	View Name	Registry of DICOM Data Elements	8	8	8487	8487	ViewName	SH	1		2014-10-27 22:02:50.821947
125	View Number	Registry of DICOM Data Elements	8	8	8488	8488	ViewNumber	IS	1		2014-10-27 22:02:50.824858
126	Number of Event Timers	Registry of DICOM Data Elements	8	8	8489	8489	NumberOfEventTimers	IS	1		2014-10-27 22:02:50.827781
127	Number of Views in Stage	Registry of DICOM Data Elements	8	8	8490	8490	NumberOfViewsInStage	IS	1		2014-10-27 22:02:50.830781
128	Event Elapsed Time(s)	Registry of DICOM Data Elements	8	8	8496	8496	EventElapsedTimes	DS	1-n		2014-10-27 22:02:50.833717
129	Event Timer Name(s)	Registry of DICOM Data Elements	8	8	8498	8498	EventTimerNames	LO	1-n		2014-10-27 22:02:50.836677
130	Event Timer Sequence	Registry of DICOM Data Elements	8	8	8499	8499	EventTimerSequence	SQ	1		2014-10-27 22:02:50.840039
131	Event Time Offset	Registry of DICOM Data Elements	8	8	8500	8500	EventTimeOffset	FD	1		2014-10-27 22:02:50.842908
132	Event Code Sequence	Registry of DICOM Data Elements	8	8	8501	8501	EventCodeSequence	SQ	1		2014-10-27 22:02:50.845824
133	Start Trim	Registry of DICOM Data Elements	8	8	8514	8514	StartTrim	IS	1		2014-10-27 22:02:50.84882
134	Stop Trim	Registry of DICOM Data Elements	8	8	8515	8515	StopTrim	IS	1		2014-10-27 22:02:50.851708
135	Recommended Display Frame Rate	Registry of DICOM Data Elements	8	8	8516	8516	RecommendedDisplayFrameRate	IS	1		2014-10-27 22:02:50.854594
136	Transducer Position	Registry of DICOM Data Elements	8	8	8704	8704	TransducerPosition	CS	1	RET	2014-10-27 22:02:50.857483
137	Transducer Orientation	Registry of DICOM Data Elements	8	8	8708	8708	TransducerOrientation	CS	1	RET	2014-10-27 22:02:50.860376
138	Anatomic Structure	Registry of DICOM Data Elements	8	8	8712	8712	AnatomicStructure	CS	1	RET	2014-10-27 22:02:50.86326
139	Anatomic Region Sequence	Registry of DICOM Data Elements	8	8	8728	8728	AnatomicRegionSequence	SQ	1		2014-10-27 22:02:50.866234
140	Anatomic Region Modifier Sequence	Registry of DICOM Data Elements	8	8	8736	8736	AnatomicRegionModifierSequence	SQ	1		2014-10-27 22:02:50.870176
141	Primary Anatomic Structure Sequence	Registry of DICOM Data Elements	8	8	8744	8744	PrimaryAnatomicStructureSequence	SQ	1		2014-10-27 22:02:50.873175
142	Anatomic Structure, Space or Region Sequence	Registry of DICOM Data Elements	8	8	8745	8745	AnatomicStructureSpaceOrRegionSequence	SQ	1		2014-10-27 22:02:50.876073
143	Primary Anatomic Structure Modifier Sequence	Registry of DICOM Data Elements	8	8	8752	8752	PrimaryAnatomicStructureModifierSequence	SQ	1		2014-10-27 22:02:50.878962
144	Transducer Position Sequence	Registry of DICOM Data Elements	8	8	8768	8768	TransducerPositionSequence	SQ	1	RET	2014-10-27 22:02:50.882
145	Transducer Position Modifier Sequence	Registry of DICOM Data Elements	8	8	8770	8770	TransducerPositionModifierSequence	SQ	1	RET	2014-10-27 22:02:50.884925
146	Transducer Orientation Sequence	Registry of DICOM Data Elements	8	8	8772	8772	TransducerOrientationSequence	SQ	1	RET	2014-10-27 22:02:50.887812
147	Transducer Orientation Modifier Sequence	Registry of DICOM Data Elements	8	8	8774	8774	TransducerOrientationModifierSequence	SQ	1	RET	2014-10-27 22:02:50.890771
148	Anatomic Structure Space Or Region Code Sequence (Trial)	Registry of DICOM Data Elements	8	8	8785	8785	AnatomicStructureSpaceOrRegionCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:50.893698
149	Anatomic Portal Of Entrance Code Sequence (Trial)	Registry of DICOM Data Elements	8	8	8787	8787	AnatomicPortalOfEntranceCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:50.896638
150	Anatomic Approach Direction Code Sequence (Trial)	Registry of DICOM Data Elements	8	8	8789	8789	AnatomicApproachDirectionCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:50.899576
151	Anatomic Perspective Description (Trial)	Registry of DICOM Data Elements	8	8	8790	8790	AnatomicPerspectiveDescriptionTrial	ST	1	RET	2014-10-27 22:02:50.902919
152	Anatomic Perspective Code Sequence (Trial)	Registry of DICOM Data Elements	8	8	8791	8791	AnatomicPerspectiveCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:50.905866
153	Anatomic Location Of Examining Instrument Description (Trial)	Registry of DICOM Data Elements	8	8	8792	8792	AnatomicLocationOfExaminingInstrumentDescriptionTrial	ST	1	RET	2014-10-27 22:02:50.908799
154	Anatomic Location Of Examining Instrument Code Sequence (Trial)	Registry of DICOM Data Elements	8	8	8793	8793	AnatomicLocationOfExaminingInstrumentCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:50.911746
155	Anatomic Structure Space Or Region Modifier Code Sequence (Trial)	Registry of DICOM Data Elements	8	8	8794	8794	AnatomicStructureSpaceOrRegionModifierCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:50.914682
156	On Axis Background Anatomic Structure Code Sequence (Trial)	Registry of DICOM Data Elements	8	8	8796	8796	OnAxisBackgroundAnatomicStructureCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:50.917648
157	Alternate Representation Sequence	Registry of DICOM Data Elements	8	8	12289	12289	AlternateRepresentationSequence	SQ	1		2014-10-27 22:02:50.920543
158	Irradiation Event UID	Registry of DICOM Data Elements	8	8	12304	12304	IrradiationEventUID	UI	1-n		2014-10-27 22:02:50.923447
159	Source Irradiation Event Sequence	Registry of DICOM Data Elements	8	8	12305	12305	SourceIrradiationEventSequence	SQ	1		2014-10-27 22:02:50.926389
160	Radiopharmaceutical Administration Event UID	Registry of DICOM Data Elements	8	8	12306	12306	RadiopharmaceuticalAdministrationEventUID	UI	1		2014-10-27 22:02:50.929297
161	Identifying Comments	Registry of DICOM Data Elements	8	8	16384	16384	IdentifyingComments	LT	1	RET	2014-10-27 22:02:50.932196
162	Frame Type	Registry of DICOM Data Elements	8	8	36871	36871	FrameType	CS	4		2014-10-27 22:02:50.935481
163	Referenced Image Evidence Sequence	Registry of DICOM Data Elements	8	8	37010	37010	ReferencedImageEvidenceSequence	SQ	1		2014-10-27 22:02:50.938359
164	Referenced Raw Data Sequence	Registry of DICOM Data Elements	8	8	37153	37153	ReferencedRawDataSequence	SQ	1		2014-10-27 22:02:50.941252
165	Creator-Version UID	Registry of DICOM Data Elements	8	8	37155	37155	CreatorVersionUID	UI	1		2014-10-27 22:02:50.944188
166	Derivation Image Sequence	Registry of DICOM Data Elements	8	8	37156	37156	DerivationImageSequence	SQ	1		2014-10-27 22:02:50.94716
167	Source Image Evidence Sequence	Registry of DICOM Data Elements	8	8	37204	37204	SourceImageEvidenceSequence	SQ	1		2014-10-27 22:02:50.950078
168	Pixel Presentation	Registry of DICOM Data Elements	8	8	37381	37381	PixelPresentation	CS	1		2014-10-27 22:02:50.952986
169	Volumetric Properties	Registry of DICOM Data Elements	8	8	37382	37382	VolumetricProperties	CS	1		2014-10-27 22:02:50.955867
170	Volume Based Calculation Technique	Registry of DICOM Data Elements	8	8	37383	37383	VolumeBasedCalculationTechnique	CS	1		2014-10-27 22:02:50.95874
171	Complex Image Component	Registry of DICOM Data Elements	8	8	37384	37384	ComplexImageComponent	CS	1		2014-10-27 22:02:50.961671
172	Acquisition Contrast	Registry of DICOM Data Elements	8	8	37385	37385	AcquisitionContrast	CS	1		2014-10-27 22:02:50.964582
173	Derivation Code Sequence	Registry of DICOM Data Elements	8	8	37397	37397	DerivationCodeSequence	SQ	1		2014-10-27 22:02:50.967944
174	Referenced Presentation State Sequence	Registry of DICOM Data Elements	8	8	37431	37431	ReferencedPresentationStateSequence	SQ	1		2014-10-27 22:02:50.970824
175	Referenced Other Plane Sequence	Registry of DICOM Data Elements	8	8	37904	37904	ReferencedOtherPlaneSequence	SQ	1		2014-10-27 22:02:50.973728
176	Frame Display Sequence	Registry of DICOM Data Elements	8	8	37976	37976	FrameDisplaySequence	SQ	1		2014-10-27 22:02:50.97664
177	Recommended Display Frame Rate in Float	Registry of DICOM Data Elements	8	8	37977	37977	RecommendedDisplayFrameRateInFloat	FL	1		2014-10-27 22:02:50.979618
178	Skip Frame Range Flag	Registry of DICOM Data Elements	8	8	37984	37984	SkipFrameRangeFlag	CS	1		2014-10-27 22:02:50.982565
179	Patient's Name	Registry of DICOM Data Elements	16	16	16	16	PatientName	PN	1		2014-10-27 22:02:50.985514
180	Patient ID	Registry of DICOM Data Elements	16	16	32	32	PatientID	LO	1		2014-10-27 22:02:50.98854
181	Issuer of Patient ID	Registry of DICOM Data Elements	16	16	33	33	IssuerOfPatientID	LO	1		2014-10-27 22:02:50.991473
182	Type of Patient ID	Registry of DICOM Data Elements	16	16	34	34	TypeOfPatientID	CS	1		2014-10-27 22:02:50.994428
183	Issuer of Patient ID Qualifiers Sequence	Registry of DICOM Data Elements	16	16	36	36	IssuerOfPatientIDQualifiersSequence	SQ	1		2014-10-27 22:02:50.997423
184	Patient's Birth Date	Registry of DICOM Data Elements	16	16	48	48	PatientBirthDate	DA	1		2014-10-27 22:02:51.000834
185	Patient's Birth Time	Registry of DICOM Data Elements	16	16	50	50	PatientBirthTime	TM	1		2014-10-27 22:02:51.003756
186	Patient's Sex	Registry of DICOM Data Elements	16	16	64	64	PatientSex	CS	1		2014-10-27 22:02:51.006683
187	Patient's Insurance Plan Code Sequence	Registry of DICOM Data Elements	16	16	80	80	PatientInsurancePlanCodeSequence	SQ	1		2014-10-27 22:02:51.009795
188	Patient's Primary Language Code Sequence	Registry of DICOM Data Elements	16	16	257	257	PatientPrimaryLanguageCodeSequence	SQ	1		2014-10-27 22:02:51.012718
189	Patient's Primary Language Modifier Code Sequence	Registry of DICOM Data Elements	16	16	258	258	PatientPrimaryLanguageModifierCodeSequence	SQ	1		2014-10-27 22:02:51.015652
190	Quality Control Subject	Registry of DICOM Data Elements	16	16	512	512	QualityControlSubject	CS	1		2014-10-27 22:02:51.018548
191	Quality Control Subject Type Code Sequence	Registry of DICOM Data Elements	16	16	513	513	QualityControlSubjectTypeCodeSequence	SQ	1		2014-10-27 22:02:51.021458
192	Other Patient IDs	Registry of DICOM Data Elements	16	16	4096	4096	OtherPatientIDs	LO	1-n		2014-10-27 22:02:51.024393
193	Other Patient Names	Registry of DICOM Data Elements	16	16	4097	4097	OtherPatientNames	PN	1-n		2014-10-27 22:02:51.027404
194	Other Patient IDs Sequence	Registry of DICOM Data Elements	16	16	4098	4098	OtherPatientIDsSequence	SQ	1		2014-10-27 22:02:51.030702
195	Patient's Birth Name	Registry of DICOM Data Elements	16	16	4101	4101	PatientBirthName	PN	1		2014-10-27 22:02:51.034166
196	Patient's Age	Registry of DICOM Data Elements	16	16	4112	4112	PatientAge	AS	1		2014-10-27 22:02:51.037127
197	Patient's Size	Registry of DICOM Data Elements	16	16	4128	4128	PatientSize	DS	1		2014-10-27 22:02:51.040028
198	Patient's Size Code Sequence	Registry of DICOM Data Elements	16	16	4129	4129	PatientSizeCodeSequence	SQ	1		2014-10-27 22:02:51.042909
199	Patient's Weight	Registry of DICOM Data Elements	16	16	4144	4144	PatientWeight	DS	1		2014-10-27 22:02:51.045844
200	Patient's Address	Registry of DICOM Data Elements	16	16	4160	4160	PatientAddress	LO	1		2014-10-27 22:02:51.048753
201	Insurance Plan Identification	Registry of DICOM Data Elements	16	16	4176	4176	InsurancePlanIdentification	LO	1-n	RET	2014-10-27 22:02:51.051663
202	Patient's Mother's Birth Name	Registry of DICOM Data Elements	16	16	4192	4192	PatientMotherBirthName	PN	1		2014-10-27 22:02:51.054567
203	Military Rank	Registry of DICOM Data Elements	16	16	4224	4224	MilitaryRank	LO	1		2014-10-27 22:02:51.057496
204	Branch of Service	Registry of DICOM Data Elements	16	16	4225	4225	BranchOfService	LO	1		2014-10-27 22:02:51.060474
205	Medical Record Locator	Registry of DICOM Data Elements	16	16	4240	4240	MedicalRecordLocator	LO	1		2014-10-27 22:02:51.063737
206	Referenced Patient Photo Sequence	Registry of DICOM Data Elements	16	16	4352	4352	ReferencedPatientPhotoSequence	SQ	1		2014-10-27 22:02:51.067114
207	Medical Alerts	Registry of DICOM Data Elements	16	16	8192	8192	MedicalAlerts	LO	1-n		2014-10-27 22:02:51.070039
208	Allergies	Registry of DICOM Data Elements	16	16	8464	8464	Allergies	LO	1-n		2014-10-27 22:02:51.073116
209	Country of Residence	Registry of DICOM Data Elements	16	16	8528	8528	CountryOfResidence	LO	1		2014-10-27 22:02:51.076047
210	Region of Residence	Registry of DICOM Data Elements	16	16	8530	8530	RegionOfResidence	LO	1		2014-10-27 22:02:51.079008
211	Patient's Telephone Numbers	Registry of DICOM Data Elements	16	16	8532	8532	PatientTelephoneNumbers	SH	1-n		2014-10-27 22:02:51.081981
212	Ethnic Group	Registry of DICOM Data Elements	16	16	8544	8544	EthnicGroup	SH	1		2014-10-27 22:02:51.084975
213	Occupation	Registry of DICOM Data Elements	16	16	8576	8576	Occupation	SH	1		2014-10-27 22:02:51.087928
214	Smoking Status	Registry of DICOM Data Elements	16	16	8608	8608	SmokingStatus	CS	1		2014-10-27 22:02:51.090898
215	Additional Patient History	Registry of DICOM Data Elements	16	16	8624	8624	AdditionalPatientHistory	LT	1		2014-10-27 22:02:51.093873
216	Pregnancy Status	Registry of DICOM Data Elements	16	16	8640	8640	PregnancyStatus	US	1		2014-10-27 22:02:51.0969
217	Last Menstrual Date	Registry of DICOM Data Elements	16	16	8656	8656	LastMenstrualDate	DA	1		2014-10-27 22:02:51.100301
218	Patient's Religious Preference	Registry of DICOM Data Elements	16	16	8688	8688	PatientReligiousPreference	LO	1		2014-10-27 22:02:51.103211
219	Patient Species Description	Registry of DICOM Data Elements	16	16	8705	8705	PatientSpeciesDescription	LO	1		2014-10-27 22:02:51.106131
220	Patient Species Code Sequence	Registry of DICOM Data Elements	16	16	8706	8706	PatientSpeciesCodeSequence	SQ	1		2014-10-27 22:02:51.109056
221	Patient's Sex Neutered	Registry of DICOM Data Elements	16	16	8707	8707	PatientSexNeutered	CS	1		2014-10-27 22:02:51.111968
222	Anatomical Orientation Type	Registry of DICOM Data Elements	16	16	8720	8720	AnatomicalOrientationType	CS	1		2014-10-27 22:02:51.115051
223	Patient Breed Description	Registry of DICOM Data Elements	16	16	8850	8850	PatientBreedDescription	LO	1		2014-10-27 22:02:51.117985
224	Patient Breed Code Sequence	Registry of DICOM Data Elements	16	16	8851	8851	PatientBreedCodeSequence	SQ	1		2014-10-27 22:02:51.120951
225	Breed Registration Sequence	Registry of DICOM Data Elements	16	16	8852	8852	BreedRegistrationSequence	SQ	1		2014-10-27 22:02:51.123875
226	Breed Registration Number	Registry of DICOM Data Elements	16	16	8853	8853	BreedRegistrationNumber	LO	1		2014-10-27 22:02:51.126885
227	Breed Registry Code Sequence	Registry of DICOM Data Elements	16	16	8854	8854	BreedRegistryCodeSequence	SQ	1		2014-10-27 22:02:51.1299
228	Responsible Person	Registry of DICOM Data Elements	16	16	8855	8855	ResponsiblePerson	PN	1		2014-10-27 22:02:51.133284
229	Responsible Person Role	Registry of DICOM Data Elements	16	16	8856	8856	ResponsiblePersonRole	CS	1		2014-10-27 22:02:51.136193
230	Responsible Organization	Registry of DICOM Data Elements	16	16	8857	8857	ResponsibleOrganization	LO	1		2014-10-27 22:02:51.139071
231	Patient Comments	Registry of DICOM Data Elements	16	16	16384	16384	PatientComments	LT	1		2014-10-27 22:02:51.142004
232	Examined Body Thickness	Registry of DICOM Data Elements	16	16	37937	37937	ExaminedBodyThickness	FL	1		2014-10-27 22:02:51.14496
233	Clinical Trial Sponsor Name	Registry of DICOM Data Elements	18	18	16	16	ClinicalTrialSponsorName	LO	1		2014-10-27 22:02:51.147888
234	Clinical Trial Protocol ID	Registry of DICOM Data Elements	18	18	32	32	ClinicalTrialProtocolID	LO	1		2014-10-27 22:02:51.150788
235	Clinical Trial Protocol Name	Registry of DICOM Data Elements	18	18	33	33	ClinicalTrialProtocolName	LO	1		2014-10-27 22:02:51.153748
236	Clinical Trial Site ID	Registry of DICOM Data Elements	18	18	48	48	ClinicalTrialSiteID	LO	1		2014-10-27 22:02:51.156685
237	Clinical Trial Site Name	Registry of DICOM Data Elements	18	18	49	49	ClinicalTrialSiteName	LO	1		2014-10-27 22:02:51.159635
238	Clinical Trial Subject ID	Registry of DICOM Data Elements	18	18	64	64	ClinicalTrialSubjectID	LO	1		2014-10-27 22:02:51.162608
239	Clinical Trial Subject Reading ID	Registry of DICOM Data Elements	18	18	66	66	ClinicalTrialSubjectReadingID	LO	1		2014-10-27 22:02:51.166011
240	Clinical Trial Time Point ID	Registry of DICOM Data Elements	18	18	80	80	ClinicalTrialTimePointID	LO	1		2014-10-27 22:02:51.168937
241	Clinical Trial Time Point Description	Registry of DICOM Data Elements	18	18	81	81	ClinicalTrialTimePointDescription	ST	1		2014-10-27 22:02:51.17184
242	Clinical Trial Coordinating Center Name	Registry of DICOM Data Elements	18	18	96	96	ClinicalTrialCoordinatingCenterName	LO	1		2014-10-27 22:02:51.174748
243	Patient Identity Removed	Registry of DICOM Data Elements	18	18	98	98	PatientIdentityRemoved	CS	1		2014-10-27 22:02:51.177686
244	De-identification Method	Registry of DICOM Data Elements	18	18	99	99	DeidentificationMethod	LO	1-n		2014-10-27 22:02:51.180603
245	De-identification Method Code Sequence	Registry of DICOM Data Elements	18	18	100	100	DeidentificationMethodCodeSequence	SQ	1		2014-10-27 22:02:51.183549
246	Clinical Trial Series ID	Registry of DICOM Data Elements	18	18	113	113	ClinicalTrialSeriesID	LO	1		2014-10-27 22:02:51.186462
247	Clinical Trial Series Description	Registry of DICOM Data Elements	18	18	114	114	ClinicalTrialSeriesDescription	LO	1		2014-10-27 22:02:51.189396
248	Clinical Trial Protocol Ethics Committee Name	Registry of DICOM Data Elements	18	18	129	129	ClinicalTrialProtocolEthicsCommitteeName	LO	1		2014-10-27 22:02:51.192467
249	Clinical Trial Protocol Ethics Committee Approval Number	Registry of DICOM Data Elements	18	18	130	130	ClinicalTrialProtocolEthicsCommitteeApprovalNumber	LO	1		2014-10-27 22:02:51.195495
250	Consent for Clinical Trial Use Sequence	Registry of DICOM Data Elements	18	18	131	131	ConsentForClinicalTrialUseSequence	SQ	1		2014-10-27 22:02:51.198869
251	Distribution Type	Registry of DICOM Data Elements	18	18	132	132	DistributionType	CS	1		2014-10-27 22:02:51.201818
252	Consent for Distribution Flag	Registry of DICOM Data Elements	18	18	133	133	ConsentForDistributionFlag	CS	1		2014-10-27 22:02:51.204763
253	CAD File Format	Registry of DICOM Data Elements	20	20	35	35	CADFileFormat	ST	1-n	RET	2014-10-27 22:02:51.207705
254	Component Reference System	Registry of DICOM Data Elements	20	20	36	36	ComponentReferenceSystem	ST	1-n	RET	2014-10-27 22:02:51.210628
255	Component Manufacturing Procedure	Registry of DICOM Data Elements	20	20	37	37	ComponentManufacturingProcedure	ST	1-n	DICONDE	2014-10-27 22:02:51.213577
256	Component Manufacturer	Registry of DICOM Data Elements	20	20	40	40	ComponentManufacturer	ST	1-n	DICONDE	2014-10-27 22:02:51.216537
257	Material Thickness	Registry of DICOM Data Elements	20	20	48	48	MaterialThickness	DS	1-n	DICONDE	2014-10-27 22:02:51.219476
258	Material Pipe Diameter	Registry of DICOM Data Elements	20	20	50	50	MaterialPipeDiameter	DS	1-n	DICONDE	2014-10-27 22:02:51.22238
259	Material Isolation Diameter	Registry of DICOM Data Elements	20	20	52	52	MaterialIsolationDiameter	DS	1-n	DICONDE	2014-10-27 22:02:51.225385
260	Material Grade	Registry of DICOM Data Elements	20	20	66	66	MaterialGrade	ST	1-n	DICONDE	2014-10-27 22:02:51.228794
261	Material Properties Description	Registry of DICOM Data Elements	20	20	68	68	MaterialPropertiesDescription	ST	1-n	DICONDE	2014-10-27 22:02:51.231714
262	Material Properties File Format (Retired)	Registry of DICOM Data Elements	20	20	69	69	MaterialPropertiesFileFormatRetired	ST	1-n	RET	2014-10-27 22:02:51.234724
263	Material Notes	Registry of DICOM Data Elements	20	20	70	70	MaterialNotes	LT	1	DICONDE	2014-10-27 22:02:51.237659
264	Component Shape	Registry of DICOM Data Elements	20	20	80	80	ComponentShape	CS	1	DICONDE	2014-10-27 22:02:51.240582
265	Curvature Type	Registry of DICOM Data Elements	20	20	82	82	CurvatureType	CS	1	DICONDE	2014-10-27 22:02:51.243514
266	Outer Diameter	Registry of DICOM Data Elements	20	20	84	84	OuterDiameter	DS	1	DICONDE	2014-10-27 22:02:51.24642
267	Inner Diameter	Registry of DICOM Data Elements	20	20	86	86	InnerDiameter	DS	1	DICONDE	2014-10-27 22:02:51.24938
268	Actual Environmental Conditions	Registry of DICOM Data Elements	20	20	4112	4112	ActualEnvironmentalConditions	ST	1	DICONDE	2014-10-27 22:02:51.25231
269	Expiry Date	Registry of DICOM Data Elements	20	20	4128	4128	ExpiryDate	DA	1	DICONDE	2014-10-27 22:02:51.255263
270	Environmental Conditions	Registry of DICOM Data Elements	20	20	4160	4160	EnvironmentalConditions	ST	1	DICONDE	2014-10-27 22:02:51.259307
271	Evaluator Sequence	Registry of DICOM Data Elements	20	20	8194	8194	EvaluatorSequence	SQ	1	DICONDE	2014-10-27 22:02:51.262268
272	Evaluator Number	Registry of DICOM Data Elements	20	20	8196	8196	EvaluatorNumber	IS	1	DICONDE	2014-10-27 22:02:51.265188
273	Evaluator Name	Registry of DICOM Data Elements	20	20	8198	8198	EvaluatorName	PN	1	DICONDE	2014-10-27 22:02:51.268096
274	Evaluation Attempt	Registry of DICOM Data Elements	20	20	8200	8200	EvaluationAttempt	IS	1	DICONDE	2014-10-27 22:02:51.271014
275	Indication Sequence	Registry of DICOM Data Elements	20	20	8210	8210	IndicationSequence	SQ	1	DICONDE	2014-10-27 22:02:51.27402
276	Indication Number	Registry of DICOM Data Elements	20	20	8212	8212	IndicationNumber	IS	1	DICONDE	2014-10-27 22:02:51.27701
277	Indication Label	Registry of DICOM Data Elements	20	20	8214	8214	IndicationLabel	SH	1	DICONDE	2014-10-27 22:02:51.279989
278	Indication Description	Registry of DICOM Data Elements	20	20	8216	8216	IndicationDescription	ST	1	DICONDE	2014-10-27 22:02:51.282945
279	Indication Type	Registry of DICOM Data Elements	20	20	8218	8218	IndicationType	CS	1-n	DICONDE	2014-10-27 22:02:51.285973
280	Indication Disposition	Registry of DICOM Data Elements	20	20	8220	8220	IndicationDisposition	CS	1	DICONDE	2014-10-27 22:02:51.288949
281	Indication ROI Sequence	Registry of DICOM Data Elements	20	20	8222	8222	IndicationROISequence	SQ	1	DICONDE	2014-10-27 22:02:51.307769
282	Indication Physical Property Sequence	Registry of DICOM Data Elements	20	20	8240	8240	IndicationPhysicalPropertySequence	SQ	1	DICONDE	2014-10-27 22:02:51.311136
283	Property Label	Registry of DICOM Data Elements	20	20	8242	8242	PropertyLabel	SH	1	DICONDE	2014-10-27 22:02:51.314102
284	Coordinate System Number of Axes	Registry of DICOM Data Elements	20	20	8706	8706	CoordinateSystemNumberOfAxes	IS	1	DICONDE	2014-10-27 22:02:51.317056
285	Coordinate System Axes Sequence	Registry of DICOM Data Elements	20	20	8708	8708	CoordinateSystemAxesSequence	SQ	1	DICONDE	2014-10-27 22:02:51.32002
286	Coordinate System Axis Description	Registry of DICOM Data Elements	20	20	8710	8710	CoordinateSystemAxisDescription	ST	1	DICONDE	2014-10-27 22:02:51.323318
287	Coordinate System Data Set Mapping	Registry of DICOM Data Elements	20	20	8712	8712	CoordinateSystemDataSetMapping	CS	1	DICONDE	2014-10-27 22:02:51.32633
288	Coordinate System Axis Number	Registry of DICOM Data Elements	20	20	8714	8714	CoordinateSystemAxisNumber	IS	1	DICONDE	2014-10-27 22:02:51.329287
289	Coordinate System Axis Type	Registry of DICOM Data Elements	20	20	8716	8716	CoordinateSystemAxisType	CS	1	DICONDE	2014-10-27 22:02:51.332219
290	Coordinate System Axis Units	Registry of DICOM Data Elements	20	20	8718	8718	CoordinateSystemAxisUnits	CS	1	DICONDE	2014-10-27 22:02:51.335114
291	Coordinate System Axis Values	Registry of DICOM Data Elements	20	20	8720	8720	CoordinateSystemAxisValues	OB	1	DICONDE	2014-10-27 22:02:51.338048
292	Coordinate System Transform Sequence	Registry of DICOM Data Elements	20	20	8736	8736	CoordinateSystemTransformSequence	SQ	1	DICONDE	2014-10-27 22:02:51.34097
293	Transform Description	Registry of DICOM Data Elements	20	20	8738	8738	TransformDescription	ST	1	DICONDE	2014-10-27 22:02:51.343919
294	Transform Number of Axes	Registry of DICOM Data Elements	20	20	8740	8740	TransformNumberOfAxes	IS	1	DICONDE	2014-10-27 22:02:51.34712
295	Transform Order of Axes	Registry of DICOM Data Elements	20	20	8742	8742	TransformOrderOfAxes	IS	1-n	DICONDE	2014-10-27 22:02:51.350047
296	Transformed Axis Units	Registry of DICOM Data Elements	20	20	8744	8744	TransformedAxisUnits	CS	1	DICONDE	2014-10-27 22:02:51.352962
297	Coordinate System Transform Rotation and Scale Matrix	Registry of DICOM Data Elements	20	20	8746	8746	CoordinateSystemTransformRotationAndScaleMatrix	DS	1-n	DICONDE	2014-10-27 22:02:51.355886
298	Coordinate System Transform Translation Matrix	Registry of DICOM Data Elements	20	20	8748	8748	CoordinateSystemTransformTranslationMatrix	DS	1-n	DICONDE	2014-10-27 22:02:51.358785
299	Internal Detector Frame Time	Registry of DICOM Data Elements	20	20	12305	12305	InternalDetectorFrameTime	DS	1	DICONDE	2014-10-27 22:02:51.36172
300	Number of Frames Integrated	Registry of DICOM Data Elements	20	20	12306	12306	NumberOfFramesIntegrated	DS	1	DICONDE	2014-10-27 22:02:51.364647
301	Detector Temperature Sequence	Registry of DICOM Data Elements	20	20	12320	12320	DetectorTemperatureSequence	SQ	1	DICONDE	2014-10-27 22:02:51.367623
302	Sensor Name	Registry of DICOM Data Elements	20	20	12322	12322	SensorName	ST	1	DICONDE	2014-10-27 22:02:51.370596
303	Horizontal Offset of Sensor	Registry of DICOM Data Elements	20	20	12324	12324	HorizontalOffsetOfSensor	DS	1	DICONDE	2014-10-27 22:02:51.373887
304	Vertical Offset of Sensor	Registry of DICOM Data Elements	20	20	12326	12326	VerticalOffsetOfSensor	DS	1	DICONDE	2014-10-27 22:02:51.376897
305	Sensor Temperature	Registry of DICOM Data Elements	20	20	12328	12328	SensorTemperature	DS	1	DICONDE	2014-10-27 22:02:51.379856
306	Dark Current Sequence	Registry of DICOM Data Elements	20	20	12352	12352	DarkCurrentSequence	SQ	1	DICONDE	2014-10-27 22:02:51.382791
307	Dark Current Counts	Registry of DICOM Data Elements	20	20	12368	12368	DarkCurrentCounts	OB or OW	1	DICONDE	2014-10-27 22:02:51.385785
308	Gain Correction Reference Sequence	Registry of DICOM Data Elements	20	20	12384	12384	GainCorrectionReferenceSequence	SQ	1	DICONDE	2014-10-27 22:02:51.388716
309	Air Counts	Registry of DICOM Data Elements	20	20	12400	12400	AirCounts	OB or OW	1	DICONDE	2014-10-27 22:02:51.39165
310	KV Used in Gain Calibration	Registry of DICOM Data Elements	20	20	12401	12401	KVUsedInGainCalibration	DS	1	DICONDE	2014-10-27 22:02:51.394599
311	MA Used in Gain Calibration	Registry of DICOM Data Elements	20	20	12402	12402	MAUsedInGainCalibration	DS	1	DICONDE	2014-10-27 22:02:51.397573
312	Number of Frames Used for Integration	Registry of DICOM Data Elements	20	20	12403	12403	NumberOfFramesUsedForIntegration	DS	1	DICONDE	2014-10-27 22:02:51.400564
313	Filter Material Used in Gain Calibration	Registry of DICOM Data Elements	20	20	12404	12404	FilterMaterialUsedInGainCalibration	LO	1	DICONDE	2014-10-27 22:02:51.403886
314	Filter Thickness Used in Gain Calibration	Registry of DICOM Data Elements	20	20	12405	12405	FilterThicknessUsedInGainCalibration	DS	1	DICONDE	2014-10-27 22:02:51.406846
315	Date of Gain Calibration	Registry of DICOM Data Elements	20	20	12406	12406	DateOfGainCalibration	DA	1	DICONDE	2014-10-27 22:02:51.409841
316	Time of Gain Calibration	Registry of DICOM Data Elements	20	20	12407	12407	TimeOfGainCalibration	TM	1	DICONDE	2014-10-27 22:02:51.412793
317	Bad Pixel Image	Registry of DICOM Data Elements	20	20	12416	12416	BadPixelImage	OB	1	DICONDE	2014-10-27 22:02:51.415755
318	Calibration Notes	Registry of DICOM Data Elements	20	20	12441	12441	CalibrationNotes	LT	1	DICONDE	2014-10-27 22:02:51.418688
319	Pulser Equipment Sequence	Registry of DICOM Data Elements	20	20	16386	16386	PulserEquipmentSequence	SQ	1	DICONDE	2014-10-27 22:02:51.421616
320	Pulser Type	Registry of DICOM Data Elements	20	20	16388	16388	PulserType	CS	1	DICONDE	2014-10-27 22:02:51.424569
321	Pulser Notes	Registry of DICOM Data Elements	20	20	16390	16390	PulserNotes	LT	1	DICONDE	2014-10-27 22:02:51.427495
322	Receiver Equipment Sequence	Registry of DICOM Data Elements	20	20	16392	16392	ReceiverEquipmentSequence	SQ	1	DICONDE	2014-10-27 22:02:51.43042
323	Amplifier Type	Registry of DICOM Data Elements	20	20	16394	16394	AmplifierType	CS	1	DICONDE	2014-10-27 22:02:51.433724
324	Receiver Notes	Registry of DICOM Data Elements	20	20	16396	16396	ReceiverNotes	LT	1	DICONDE	2014-10-27 22:02:51.436649
325	Pre-Amplifier Equipment Sequence	Registry of DICOM Data Elements	20	20	16398	16398	PreAmplifierEquipmentSequence	SQ	1	DICONDE	2014-10-27 22:02:51.439574
326	Pre-Amplifier Notes	Registry of DICOM Data Elements	20	20	16399	16399	PreAmplifierNotes	LT	1	DICONDE	2014-10-27 22:02:51.442495
327	Transmit Transducer Sequence	Registry of DICOM Data Elements	20	20	16400	16400	TransmitTransducerSequence	SQ	1	DICONDE	2014-10-27 22:02:51.445449
328	Receive Transducer Sequence	Registry of DICOM Data Elements	20	20	16401	16401	ReceiveTransducerSequence	SQ	1	DICONDE	2014-10-27 22:02:51.448476
329	Number of Elements	Registry of DICOM Data Elements	20	20	16402	16402	NumberOfElements	US	1	DICONDE	2014-10-27 22:02:51.451398
330	Element Shape	Registry of DICOM Data Elements	20	20	16403	16403	ElementShape	CS	1	DICONDE	2014-10-27 22:02:51.454337
331	Element Dimension A	Registry of DICOM Data Elements	20	20	16404	16404	ElementDimensionA	DS	1	DICONDE	2014-10-27 22:02:51.457273
332	Element Dimension B	Registry of DICOM Data Elements	20	20	16405	16405	ElementDimensionB	DS	1	DICONDE	2014-10-27 22:02:51.460339
333	Element Pitch A	Registry of DICOM Data Elements	20	20	16406	16406	ElementPitchA	DS	1	DICONDE	2014-10-27 22:02:51.463739
334	Measured Beam Dimension A	Registry of DICOM Data Elements	20	20	16407	16407	MeasuredBeamDimensionA	DS	1	DICONDE	2014-10-27 22:02:51.46669
335	Measured Beam Dimension B	Registry of DICOM Data Elements	20	20	16408	16408	MeasuredBeamDimensionB	DS	1	DICONDE	2014-10-27 22:02:51.469699
336	Location of Measured Beam Diameter	Registry of DICOM Data Elements	20	20	16409	16409	LocationOfMeasuredBeamDiameter	DS	1	DICONDE	2014-10-27 22:02:51.472818
337	Nominal Frequency	Registry of DICOM Data Elements	20	20	16410	16410	NominalFrequency	DS	1	DICONDE	2014-10-27 22:02:51.475772
338	Measured Center Frequency	Registry of DICOM Data Elements	20	20	16411	16411	MeasuredCenterFrequency	DS	1	DICONDE	2014-10-27 22:02:51.478706
339	Measured Bandwidth	Registry of DICOM Data Elements	20	20	16412	16412	MeasuredBandwidth	DS	1	DICONDE	2014-10-27 22:02:51.481645
340	Element Pitch B	Registry of DICOM Data Elements	20	20	16413	16413	ElementPitchB	DS	1	DICONDE	2014-10-27 22:02:51.484596
341	Pulser Settings Sequence	Registry of DICOM Data Elements	20	20	16416	16416	PulserSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.487576
342	Pulse Width	Registry of DICOM Data Elements	20	20	16418	16418	PulseWidth	DS	1	DICONDE	2014-10-27 22:02:51.490567
343	Excitation Frequency	Registry of DICOM Data Elements	20	20	16420	16420	ExcitationFrequency	DS	1	DICONDE	2014-10-27 22:02:51.495676
344	Modulation Type	Registry of DICOM Data Elements	20	20	16422	16422	ModulationType	CS	1	DICONDE	2014-10-27 22:02:51.498622
345	Damping	Registry of DICOM Data Elements	20	20	16424	16424	Damping	DS	1	DICONDE	2014-10-27 22:02:51.501546
346	Receiver Settings Sequence	Registry of DICOM Data Elements	20	20	16432	16432	ReceiverSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.50467
347	Acquired Soundpath Length	Registry of DICOM Data Elements	20	20	16433	16433	AcquiredSoundpathLength	DS	1	DICONDE	2014-10-27 22:02:51.507624
348	Acquisition Compression Type	Registry of DICOM Data Elements	20	20	16434	16434	AcquisitionCompressionType	CS	1	DICONDE	2014-10-27 22:02:51.510561
349	Acquisition Sample Size	Registry of DICOM Data Elements	20	20	16435	16435	AcquisitionSampleSize	IS	1	DICONDE	2014-10-27 22:02:51.513525
350	Rectifier Smoothing	Registry of DICOM Data Elements	20	20	16436	16436	RectifierSmoothing	DS	1	DICONDE	2014-10-27 22:02:51.516485
351	DAC Sequence	Registry of DICOM Data Elements	20	20	16437	16437	DACSequence	SQ	1	DICONDE	2014-10-27 22:02:51.51941
352	DAC Type	Registry of DICOM Data Elements	20	20	16438	16438	DACType	CS	1	DICONDE	2014-10-27 22:02:51.522388
353	DAC Gain Points	Registry of DICOM Data Elements	20	20	16440	16440	DACGainPoints	DS	1-n	DICONDE	2014-10-27 22:02:51.5258
354	DAC Time Points	Registry of DICOM Data Elements	20	20	16442	16442	DACTimePoints	DS	1-n	DICONDE	2014-10-27 22:02:51.528908
355	DAC Amplitude	Registry of DICOM Data Elements	20	20	16444	16444	DACAmplitude	DS	1-n	DICONDE	2014-10-27 22:02:51.531824
356	Pre-Amplifier Settings Sequence	Registry of DICOM Data Elements	20	20	16448	16448	PreAmplifierSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.534741
357	Transmit Transducer Settings Sequence	Registry of DICOM Data Elements	20	20	16464	16464	TransmitTransducerSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.537673
358	Receive Transducer Settings Sequence	Registry of DICOM Data Elements	20	20	16465	16465	ReceiveTransducerSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.540651
359	Incident Angle	Registry of DICOM Data Elements	20	20	16466	16466	IncidentAngle	DS	1	DICONDE	2014-10-27 22:02:51.543617
360	Coupling Technique	Registry of DICOM Data Elements	20	20	16468	16468	CouplingTechnique	ST	1	DICONDE	2014-10-27 22:02:51.546543
361	Coupling Medium	Registry of DICOM Data Elements	20	20	16470	16470	CouplingMedium	ST	1	DICONDE	2014-10-27 22:02:51.549534
362	Coupling Velocity	Registry of DICOM Data Elements	20	20	16471	16471	CouplingVelocity	DS	1	DICONDE	2014-10-27 22:02:51.552577
363	Probe Center Location X	Registry of DICOM Data Elements	20	20	16472	16472	ProbeCenterLocationX	DS	1	DICONDE	2014-10-27 22:02:51.556025
364	Probe Center Location Z	Registry of DICOM Data Elements	20	20	16473	16473	ProbeCenterLocationZ	DS	1	DICONDE	2014-10-27 22:02:51.559004
365	Sound Path Length	Registry of DICOM Data Elements	20	20	16474	16474	SoundPathLength	DS	1	DICONDE	2014-10-27 22:02:51.561977
366	Delay Law Identifier	Registry of DICOM Data Elements	20	20	16476	16476	DelayLawIdentifier	ST	1	DICONDE	2014-10-27 22:02:51.564939
367	Gate Settings Sequence	Registry of DICOM Data Elements	20	20	16480	16480	GateSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.567892
368	Gate Threshold	Registry of DICOM Data Elements	20	20	16482	16482	GateThreshold	DS	1	DICONDE	2014-10-27 22:02:51.570818
369	Velocity of Sound	Registry of DICOM Data Elements	20	20	16484	16484	VelocityOfSound	DS	1	DICONDE	2014-10-27 22:02:51.573761
370	Calibration Settings Sequence	Registry of DICOM Data Elements	20	20	16496	16496	CalibrationSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.576702
371	Calibration Procedure	Registry of DICOM Data Elements	20	20	16498	16498	CalibrationProcedure	ST	1	DICONDE	2014-10-27 22:02:51.579655
372	Procedure Version	Registry of DICOM Data Elements	20	20	16500	16500	ProcedureVersion	SH	1	DICONDE	2014-10-27 22:02:51.582649
373	Procedure Creation Date	Registry of DICOM Data Elements	20	20	16502	16502	ProcedureCreationDate	DA	1	DICONDE	2014-10-27 22:02:51.586064
374	Procedure Expiration Date	Registry of DICOM Data Elements	20	20	16504	16504	ProcedureExpirationDate	DA	1	DICONDE	2014-10-27 22:02:51.589032
375	Procedure Last Modified Date	Registry of DICOM Data Elements	20	20	16506	16506	ProcedureLastModifiedDate	DA	1	DICONDE	2014-10-27 22:02:51.592015
376	Calibration Time	Registry of DICOM Data Elements	20	20	16508	16508	CalibrationTime	TM	1-n	DICONDE	2014-10-27 22:02:51.594968
377	Calibration Date	Registry of DICOM Data Elements	20	20	16510	16510	CalibrationDate	DA	1-n	DICONDE	2014-10-27 22:02:51.597971
378	Probe Drive Equipment Sequence	Registry of DICOM Data Elements	20	20	16512	16512	ProbeDriveEquipmentSequence	SQ	1	DICONDE	2014-10-27 22:02:51.600971
379	Drive Type	Registry of DICOM Data Elements	20	20	16513	16513	DriveType	CS	1	DICONDE	2014-10-27 22:02:51.60395
380	Probe Drive Notes	Registry of DICOM Data Elements	20	20	16514	16514	ProbeDriveNotes	LT	1	DICONDE	2014-10-27 22:02:51.606899
381	Drive Probe Sequence	Registry of DICOM Data Elements	20	20	16515	16515	DriveProbeSequence	SQ	1	DICONDE	2014-10-27 22:02:51.610006
382	Probe Inductance	Registry of DICOM Data Elements	20	20	16516	16516	ProbeInductance	DS	1	DICONDE	2014-10-27 22:02:51.613045
383	Probe Resistance	Registry of DICOM Data Elements	20	20	16517	16517	ProbeResistance	DS	1	DICONDE	2014-10-27 22:02:51.616489
384	Receive Probe Sequence	Registry of DICOM Data Elements	20	20	16518	16518	ReceiveProbeSequence	SQ	1	DICONDE	2014-10-27 22:02:51.619537
385	Probe Drive Settings Sequence	Registry of DICOM Data Elements	20	20	16519	16519	ProbeDriveSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.622456
386	Bridge Resistors	Registry of DICOM Data Elements	20	20	16520	16520	BridgeResistors	DS	1	DICONDE	2014-10-27 22:02:51.625426
387	Probe Orientation Angle	Registry of DICOM Data Elements	20	20	16521	16521	ProbeOrientationAngle	DS	1	DICONDE	2014-10-27 22:02:51.628373
388	User Selected Gain Y	Registry of DICOM Data Elements	20	20	16523	16523	UserSelectedGainY	DS	1	DICONDE	2014-10-27 22:02:51.631305
389	User Selected Phase	Registry of DICOM Data Elements	20	20	16524	16524	UserSelectedPhase	DS	1	DICONDE	2014-10-27 22:02:51.63431
390	User Selected Offset X	Registry of DICOM Data Elements	20	20	16525	16525	UserSelectedOffsetX	DS	1	DICONDE	2014-10-27 22:02:51.637273
391	User Selected Offset Y	Registry of DICOM Data Elements	20	20	16526	16526	UserSelectedOffsetY	DS	1	DICONDE	2014-10-27 22:02:51.640282
392	Channel Settings Sequence	Registry of DICOM Data Elements	20	20	16529	16529	ChannelSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.643357
393	Channel Threshold	Registry of DICOM Data Elements	20	20	16530	16530	ChannelThreshold	DS	1	DICONDE	2014-10-27 22:02:51.647408
394	Scanner Settings Sequence	Registry of DICOM Data Elements	20	20	16538	16538	ScannerSettingsSequence	SQ	1	DICONDE	2014-10-27 22:02:51.650396
395	Scan Procedure	Registry of DICOM Data Elements	20	20	16539	16539	ScanProcedure	ST	1	DICONDE	2014-10-27 22:02:51.653375
396	Translation Rate X	Registry of DICOM Data Elements	20	20	16540	16540	TranslationRateX	DS	1	DICONDE	2014-10-27 22:02:51.656327
397	Translation Rate Y	Registry of DICOM Data Elements	20	20	16541	16541	TranslationRateY	DS	1	DICONDE	2014-10-27 22:02:51.659256
398	Channel Overlap	Registry of DICOM Data Elements	20	20	16543	16543	ChannelOverlap	DS	1	DICONDE	2014-10-27 22:02:51.662228
399	Image Quality Indicator Type	Registry of DICOM Data Elements	20	20	16544	16544	ImageQualityIndicatorType	LO	1	DICONDE	2014-10-27 22:02:51.665167
400	Image Quality Indicator Material	Registry of DICOM Data Elements	20	20	16545	16545	ImageQualityIndicatorMaterial	LO	1	DICONDE	2014-10-27 22:02:51.66811
401	Image Quality Indicator Size	Registry of DICOM Data Elements	20	20	16546	16546	ImageQualityIndicatorSize	LO	1	DICONDE	2014-10-27 22:02:51.671029
402	LINAC Energy	Registry of DICOM Data Elements	20	20	20482	20482	LINACEnergy	IS	1	DICONDE	2014-10-27 22:02:51.674036
403	LINAC Output	Registry of DICOM Data Elements	20	20	20484	20484	LINACOutput	IS	1	DICONDE	2014-10-27 22:02:51.677026
404	Contrast/Bolus Agent	Registry of DICOM Data Elements	24	24	16	16	ContrastBolusAgent	LO	1		2014-10-27 22:02:51.680417
405	Contrast/Bolus Agent Sequence	Registry of DICOM Data Elements	24	24	18	18	ContrastBolusAgentSequence	SQ	1		2014-10-27 22:02:51.683415
406	Contrast/Bolus T1 Relaxivity	Registry of DICOM Data Elements	24	24	19	19	ContrastBolusT1Relaxivity	FL	1		2014-10-27 22:02:51.686407
407	Contrast/Bolus Administration Route Sequence	Registry of DICOM Data Elements	24	24	20	20	ContrastBolusAdministrationRouteSequence	SQ	1		2014-10-27 22:02:51.689418
408	Body Part Examined	Registry of DICOM Data Elements	24	24	21	21	BodyPartExamined	CS	1		2014-10-27 22:02:51.692391
409	Scanning Sequence	Registry of DICOM Data Elements	24	24	32	32	ScanningSequence	CS	1-n		2014-10-27 22:02:51.695644
410	Sequence Variant	Registry of DICOM Data Elements	24	24	33	33	SequenceVariant	CS	1-n		2014-10-27 22:02:51.69863
411	Scan Options	Registry of DICOM Data Elements	24	24	34	34	ScanOptions	CS	1-n		2014-10-27 22:02:51.701605
412	MR Acquisition Type	Registry of DICOM Data Elements	24	24	35	35	MRAcquisitionType	CS	1		2014-10-27 22:02:51.704632
413	Sequence Name	Registry of DICOM Data Elements	24	24	36	36	SequenceName	SH	1		2014-10-27 22:02:51.707611
414	Angio Flag	Registry of DICOM Data Elements	24	24	37	37	AngioFlag	CS	1		2014-10-27 22:02:51.710547
415	Intervention Drug Information Sequence	Registry of DICOM Data Elements	24	24	38	38	InterventionDrugInformationSequence	SQ	1		2014-10-27 22:02:51.713889
416	Intervention Drug Stop Time	Registry of DICOM Data Elements	24	24	39	39	InterventionDrugStopTime	TM	1		2014-10-27 22:02:51.716912
417	Intervention Drug Dose	Registry of DICOM Data Elements	24	24	40	40	InterventionDrugDose	DS	1		2014-10-27 22:02:51.7199
418	Intervention Drug Code Sequence	Registry of DICOM Data Elements	24	24	41	41	InterventionDrugCodeSequence	SQ	1		2014-10-27 22:02:51.722836
419	Additional Drug Sequence	Registry of DICOM Data Elements	24	24	42	42	AdditionalDrugSequence	SQ	1		2014-10-27 22:02:51.72581
420	Radionuclide	Registry of DICOM Data Elements	24	24	48	48	Radionuclide	LO	1-n	RET	2014-10-27 22:02:51.728756
421	Radiopharmaceutical	Registry of DICOM Data Elements	24	24	49	49	Radiopharmaceutical	LO	1		2014-10-27 22:02:51.731763
422	Energy Window Centerline	Registry of DICOM Data Elements	24	24	50	50	EnergyWindowCenterline	DS	1	RET	2014-10-27 22:02:51.734823
423	Energy Window Total Width	Registry of DICOM Data Elements	24	24	51	51	EnergyWindowTotalWidth	DS	1-n	RET	2014-10-27 22:02:51.737798
424	Intervention Drug Name	Registry of DICOM Data Elements	24	24	52	52	InterventionDrugName	LO	1		2014-10-27 22:02:51.740932
425	Intervention Drug Start Time	Registry of DICOM Data Elements	24	24	53	53	InterventionDrugStartTime	TM	1		2014-10-27 22:02:51.743971
426	Intervention Sequence	Registry of DICOM Data Elements	24	24	54	54	InterventionSequence	SQ	1		2014-10-27 22:02:51.74732
427	Therapy Type	Registry of DICOM Data Elements	24	24	55	55	TherapyType	CS	1	RET	2014-10-27 22:02:51.750306
428	Intervention Status	Registry of DICOM Data Elements	24	24	56	56	InterventionStatus	CS	1		2014-10-27 22:02:51.753243
429	Therapy Description	Registry of DICOM Data Elements	24	24	57	57	TherapyDescription	CS	1	RET	2014-10-27 22:02:51.756191
430	Intervention Description	Registry of DICOM Data Elements	24	24	58	58	InterventionDescription	ST	1		2014-10-27 22:02:51.759136
431	Cine Rate	Registry of DICOM Data Elements	24	24	64	64	CineRate	IS	1		2014-10-27 22:02:51.76209
432	Initial Cine Run State	Registry of DICOM Data Elements	24	24	66	66	InitialCineRunState	CS	1		2014-10-27 22:02:51.765053
433	Slice Thickness	Registry of DICOM Data Elements	24	24	80	80	SliceThickness	DS	1		2014-10-27 22:02:51.768008
434	KVP	Registry of DICOM Data Elements	24	24	96	96	KVP	DS	1		2014-10-27 22:02:51.770953
435	Counts Accumulated	Registry of DICOM Data Elements	24	24	112	112	CountsAccumulated	IS	1		2014-10-27 22:02:51.773915
436	Acquisition Termination Condition	Registry of DICOM Data Elements	24	24	113	113	AcquisitionTerminationCondition	CS	1		2014-10-27 22:02:51.776916
437	Effective Duration	Registry of DICOM Data Elements	24	24	114	114	EffectiveDuration	DS	1		2014-10-27 22:02:51.780341
438	Acquisition Start Condition	Registry of DICOM Data Elements	24	24	115	115	AcquisitionStartCondition	CS	1		2014-10-27 22:02:51.783286
556	Intensifier Size	Registry of DICOM Data Elements	24	24	4450	4450	IntensifierSize	DS	1		2014-10-27 22:02:52.144081
439	Acquisition Start Condition Data	Registry of DICOM Data Elements	24	24	116	116	AcquisitionStartConditionData	IS	1		2014-10-27 22:02:51.786229
440	Acquisition Termination Condition Data	Registry of DICOM Data Elements	24	24	117	117	AcquisitionTerminationConditionData	IS	1		2014-10-27 22:02:51.789263
441	Repetition Time	Registry of DICOM Data Elements	24	24	128	128	RepetitionTime	DS	1		2014-10-27 22:02:51.792309
442	Echo Time	Registry of DICOM Data Elements	24	24	129	129	EchoTime	DS	1		2014-10-27 22:02:51.795266
443	Inversion Time	Registry of DICOM Data Elements	24	24	130	130	InversionTime	DS	1		2014-10-27 22:02:51.798239
444	Number of Averages	Registry of DICOM Data Elements	24	24	131	131	NumberOfAverages	DS	1		2014-10-27 22:02:51.801215
445	Imaging Frequency	Registry of DICOM Data Elements	24	24	132	132	ImagingFrequency	DS	1		2014-10-27 22:02:51.804215
446	Imaged Nucleus	Registry of DICOM Data Elements	24	24	133	133	ImagedNucleus	SH	1		2014-10-27 22:02:51.807223
447	Echo Number(s)	Registry of DICOM Data Elements	24	24	134	134	EchoNumbers	IS	1-n		2014-10-27 22:02:51.81027
448	Magnetic Field Strength	Registry of DICOM Data Elements	24	24	135	135	MagneticFieldStrength	DS	1		2014-10-27 22:02:51.813858
449	Spacing Between Slices	Registry of DICOM Data Elements	24	24	136	136	SpacingBetweenSlices	DS	1		2014-10-27 22:02:51.817009
450	Number of Phase Encoding Steps	Registry of DICOM Data Elements	24	24	137	137	NumberOfPhaseEncodingSteps	IS	1		2014-10-27 22:02:51.820012
451	Data Collection Diameter	Registry of DICOM Data Elements	24	24	144	144	DataCollectionDiameter	DS	1		2014-10-27 22:02:51.822997
452	Echo Train Length	Registry of DICOM Data Elements	24	24	145	145	EchoTrainLength	IS	1		2014-10-27 22:02:51.82602
453	Percent Sampling	Registry of DICOM Data Elements	24	24	147	147	PercentSampling	DS	1		2014-10-27 22:02:51.829026
454	Percent Phase Field of View	Registry of DICOM Data Elements	24	24	148	148	PercentPhaseFieldOfView	DS	1		2014-10-27 22:02:51.832074
455	Pixel Bandwidth	Registry of DICOM Data Elements	24	24	149	149	PixelBandwidth	DS	1		2014-10-27 22:02:51.835065
456	Device Serial Number	Registry of DICOM Data Elements	24	24	4096	4096	DeviceSerialNumber	LO	1		2014-10-27 22:02:51.838048
457	Device UID	Registry of DICOM Data Elements	24	24	4098	4098	DeviceUID	UI	1		2014-10-27 22:02:51.84105
458	Device ID	Registry of DICOM Data Elements	24	24	4099	4099	DeviceID	LO	1		2014-10-27 22:02:51.844113
459	Plate ID	Registry of DICOM Data Elements	24	24	4100	4100	PlateID	LO	1		2014-10-27 22:02:51.847592
460	Generator ID	Registry of DICOM Data Elements	24	24	4101	4101	GeneratorID	LO	1		2014-10-27 22:02:51.850572
461	Grid ID	Registry of DICOM Data Elements	24	24	4102	4102	GridID	LO	1		2014-10-27 22:02:51.853527
462	Cassette ID	Registry of DICOM Data Elements	24	24	4103	4103	CassetteID	LO	1		2014-10-27 22:02:51.856482
463	Gantry ID	Registry of DICOM Data Elements	24	24	4104	4104	GantryID	LO	1		2014-10-27 22:02:51.859418
464	Secondary Capture Device ID	Registry of DICOM Data Elements	24	24	4112	4112	SecondaryCaptureDeviceID	LO	1		2014-10-27 22:02:51.862375
465	Hardcopy Creation Device ID	Registry of DICOM Data Elements	24	24	4113	4113	HardcopyCreationDeviceID	LO	1	RET	2014-10-27 22:02:51.865337
466	Date of Secondary Capture	Registry of DICOM Data Elements	24	24	4114	4114	DateOfSecondaryCapture	DA	1		2014-10-27 22:02:51.868278
467	Time of Secondary Capture	Registry of DICOM Data Elements	24	24	4116	4116	TimeOfSecondaryCapture	TM	1		2014-10-27 22:02:51.871234
468	Secondary Capture Device Manufacturer	Registry of DICOM Data Elements	24	24	4118	4118	SecondaryCaptureDeviceManufacturer	LO	1		2014-10-27 22:02:51.874295
469	Hardcopy Device Manufacturer	Registry of DICOM Data Elements	24	24	4119	4119	HardcopyDeviceManufacturer	LO	1	RET	2014-10-27 22:02:51.877309
470	Secondary Capture Device Manufacturer's Model Name	Registry of DICOM Data Elements	24	24	4120	4120	SecondaryCaptureDeviceManufacturerModelName	LO	1		2014-10-27 22:02:51.880721
471	Secondary Capture Device Software Versions	Registry of DICOM Data Elements	24	24	4121	4121	SecondaryCaptureDeviceSoftwareVersions	LO	1-n		2014-10-27 22:02:51.883722
472	Hardcopy Device Software Version	Registry of DICOM Data Elements	24	24	4122	4122	HardcopyDeviceSoftwareVersion	LO	1-n	RET	2014-10-27 22:02:51.886674
473	Hardcopy Device Manufacturer's Model Name	Registry of DICOM Data Elements	24	24	4123	4123	HardcopyDeviceManufacturerModelName	LO	1	RET	2014-10-27 22:02:51.889643
474	Software Version(s)	Registry of DICOM Data Elements	24	24	4128	4128	SoftwareVersions	LO	1-n		2014-10-27 22:02:51.892615
475	Video Image Format Acquired	Registry of DICOM Data Elements	24	24	4130	4130	VideoImageFormatAcquired	SH	1		2014-10-27 22:02:51.89559
476	Digital Image Format Acquired	Registry of DICOM Data Elements	24	24	4131	4131	DigitalImageFormatAcquired	LO	1		2014-10-27 22:02:51.898531
477	Protocol Name	Registry of DICOM Data Elements	24	24	4144	4144	ProtocolName	LO	1		2014-10-27 22:02:51.901497
478	Contrast/Bolus Route	Registry of DICOM Data Elements	24	24	4160	4160	ContrastBolusRoute	LO	1		2014-10-27 22:02:51.904517
479	Contrast/Bolus Volume	Registry of DICOM Data Elements	24	24	4161	4161	ContrastBolusVolume	DS	1		2014-10-27 22:02:51.907589
480	Contrast/Bolus Start Time	Registry of DICOM Data Elements	24	24	4162	4162	ContrastBolusStartTime	TM	1		2014-10-27 22:02:51.910662
481	Contrast/Bolus Stop Time	Registry of DICOM Data Elements	24	24	4163	4163	ContrastBolusStopTime	TM	1		2014-10-27 22:02:51.914167
482	Contrast/Bolus Total Dose	Registry of DICOM Data Elements	24	24	4164	4164	ContrastBolusTotalDose	DS	1		2014-10-27 22:02:51.917161
483	Syringe Counts	Registry of DICOM Data Elements	24	24	4165	4165	SyringeCounts	IS	1		2014-10-27 22:02:51.920225
484	Contrast Flow Rate	Registry of DICOM Data Elements	24	24	4166	4166	ContrastFlowRate	DS	1-n		2014-10-27 22:02:51.923218
485	Contrast Flow Duration	Registry of DICOM Data Elements	24	24	4167	4167	ContrastFlowDuration	DS	1-n		2014-10-27 22:02:51.926242
486	Contrast/Bolus Ingredient	Registry of DICOM Data Elements	24	24	4168	4168	ContrastBolusIngredient	CS	1		2014-10-27 22:02:51.929253
487	Contrast/Bolus Ingredient Concentration	Registry of DICOM Data Elements	24	24	4169	4169	ContrastBolusIngredientConcentration	DS	1		2014-10-27 22:02:51.932241
488	Spatial Resolution	Registry of DICOM Data Elements	24	24	4176	4176	SpatialResolution	DS	1		2014-10-27 22:02:51.935212
489	Trigger Time	Registry of DICOM Data Elements	24	24	4192	4192	TriggerTime	DS	1		2014-10-27 22:02:51.938216
490	Trigger Source or Type	Registry of DICOM Data Elements	24	24	4193	4193	TriggerSourceOrType	LO	1		2014-10-27 22:02:51.941262
491	Nominal Interval	Registry of DICOM Data Elements	24	24	4194	4194	NominalInterval	IS	1		2014-10-27 22:02:51.944471
492	Frame Time	Registry of DICOM Data Elements	24	24	4195	4195	FrameTime	DS	1		2014-10-27 22:02:51.947988
493	Cardiac Framing Type	Registry of DICOM Data Elements	24	24	4196	4196	CardiacFramingType	LO	1		2014-10-27 22:02:51.950952
494	Frame Time Vector	Registry of DICOM Data Elements	24	24	4197	4197	FrameTimeVector	DS	1-n		2014-10-27 22:02:51.953943
495	Frame Delay	Registry of DICOM Data Elements	24	24	4198	4198	FrameDelay	DS	1		2014-10-27 22:02:51.956918
496	Image Trigger Delay	Registry of DICOM Data Elements	24	24	4199	4199	ImageTriggerDelay	DS	1		2014-10-27 22:02:51.959891
497	Multiplex Group Time Offset	Registry of DICOM Data Elements	24	24	4200	4200	MultiplexGroupTimeOffset	DS	1		2014-10-27 22:02:51.962849
498	Trigger Time Offset	Registry of DICOM Data Elements	24	24	4201	4201	TriggerTimeOffset	DS	1		2014-10-27 22:02:51.965906
499	Synchronization Trigger	Registry of DICOM Data Elements	24	24	4202	4202	SynchronizationTrigger	CS	1		2014-10-27 22:02:51.968863
500	Synchronization Channel	Registry of DICOM Data Elements	24	24	4204	4204	SynchronizationChannel	US	2		2014-10-27 22:02:51.971822
501	Trigger Sample Position	Registry of DICOM Data Elements	24	24	4206	4206	TriggerSamplePosition	UL	1		2014-10-27 22:02:51.97483
502	Radiopharmaceutical Route	Registry of DICOM Data Elements	24	24	4208	4208	RadiopharmaceuticalRoute	LO	1		2014-10-27 22:02:51.97785
503	Radiopharmaceutical Volume	Registry of DICOM Data Elements	24	24	4209	4209	RadiopharmaceuticalVolume	DS	1		2014-10-27 22:02:51.981289
504	Radiopharmaceutical Start Time	Registry of DICOM Data Elements	24	24	4210	4210	RadiopharmaceuticalStartTime	TM	1		2014-10-27 22:02:51.984277
505	Radiopharmaceutical Stop Time	Registry of DICOM Data Elements	24	24	4211	4211	RadiopharmaceuticalStopTime	TM	1		2014-10-27 22:02:51.987263
506	Radionuclide Total Dose	Registry of DICOM Data Elements	24	24	4212	4212	RadionuclideTotalDose	DS	1		2014-10-27 22:02:51.990283
507	Radionuclide Half Life	Registry of DICOM Data Elements	24	24	4213	4213	RadionuclideHalfLife	DS	1		2014-10-27 22:02:51.993299
508	Radionuclide Positron Fraction	Registry of DICOM Data Elements	24	24	4214	4214	RadionuclidePositronFraction	DS	1		2014-10-27 22:02:51.996315
509	Radiopharmaceutical Specific Activity	Registry of DICOM Data Elements	24	24	4215	4215	RadiopharmaceuticalSpecificActivity	DS	1		2014-10-27 22:02:51.999284
510	Radiopharmaceutical Start DateTime	Registry of DICOM Data Elements	24	24	4216	4216	RadiopharmaceuticalStartDateTime	DT	1		2014-10-27 22:02:52.002317
511	Radiopharmaceutical Stop DateTime	Registry of DICOM Data Elements	24	24	4217	4217	RadiopharmaceuticalStopDateTime	DT	1		2014-10-27 22:02:52.005343
512	Beat Rejection Flag	Registry of DICOM Data Elements	24	24	4224	4224	BeatRejectionFlag	CS	1		2014-10-27 22:02:52.008427
513	Low R-R Value	Registry of DICOM Data Elements	24	24	4225	4225	LowRRValue	IS	1		2014-10-27 22:02:52.011542
514	High R-R Value	Registry of DICOM Data Elements	24	24	4226	4226	HighRRValue	IS	1		2014-10-27 22:02:52.014983
515	Intervals Acquired	Registry of DICOM Data Elements	24	24	4227	4227	IntervalsAcquired	IS	1		2014-10-27 22:02:52.01801
516	Intervals Rejected	Registry of DICOM Data Elements	24	24	4228	4228	IntervalsRejected	IS	1		2014-10-27 22:02:52.021032
517	PVC Rejection	Registry of DICOM Data Elements	24	24	4229	4229	PVCRejection	LO	1		2014-10-27 22:02:52.024049
518	Skip Beats	Registry of DICOM Data Elements	24	24	4230	4230	SkipBeats	IS	1		2014-10-27 22:02:52.027046
519	Heart Rate	Registry of DICOM Data Elements	24	24	4232	4232	HeartRate	IS	1		2014-10-27 22:02:52.030068
520	Cardiac Number of Images	Registry of DICOM Data Elements	24	24	4240	4240	CardiacNumberOfImages	IS	1		2014-10-27 22:02:52.03305
521	Trigger Window	Registry of DICOM Data Elements	24	24	4244	4244	TriggerWindow	IS	1		2014-10-27 22:02:52.036064
522	Reconstruction Diameter	Registry of DICOM Data Elements	24	24	4352	4352	ReconstructionDiameter	DS	1		2014-10-27 22:02:52.039171
523	Distance Source to Detector	Registry of DICOM Data Elements	24	24	4368	4368	DistanceSourceToDetector	DS	1		2014-10-27 22:02:52.042373
524	Distance Source to Patient	Registry of DICOM Data Elements	24	24	4369	4369	DistanceSourceToPatient	DS	1		2014-10-27 22:02:52.046651
525	Estimated Radiographic Magnification Factor	Registry of DICOM Data Elements	24	24	4372	4372	EstimatedRadiographicMagnificationFactor	DS	1		2014-10-27 22:02:52.049724
526	Gantry/Detector Tilt	Registry of DICOM Data Elements	24	24	4384	4384	GantryDetectorTilt	DS	1		2014-10-27 22:02:52.052723
527	Gantry/Detector Slew	Registry of DICOM Data Elements	24	24	4385	4385	GantryDetectorSlew	DS	1		2014-10-27 22:02:52.055725
528	Table Height	Registry of DICOM Data Elements	24	24	4400	4400	TableHeight	DS	1		2014-10-27 22:02:52.058689
529	Table Traverse	Registry of DICOM Data Elements	24	24	4401	4401	TableTraverse	DS	1		2014-10-27 22:02:52.061667
530	Table Motion	Registry of DICOM Data Elements	24	24	4404	4404	TableMotion	CS	1		2014-10-27 22:02:52.064939
531	Table Vertical Increment	Registry of DICOM Data Elements	24	24	4405	4405	TableVerticalIncrement	DS	1-n		2014-10-27 22:02:52.067934
532	Table Lateral Increment	Registry of DICOM Data Elements	24	24	4406	4406	TableLateralIncrement	DS	1-n		2014-10-27 22:02:52.070888
533	Table Longitudinal Increment	Registry of DICOM Data Elements	24	24	4407	4407	TableLongitudinalIncrement	DS	1-n		2014-10-27 22:02:52.07398
534	Table Angle	Registry of DICOM Data Elements	24	24	4408	4408	TableAngle	DS	1		2014-10-27 22:02:52.07696
535	Table Type	Registry of DICOM Data Elements	24	24	4410	4410	TableType	CS	1		2014-10-27 22:02:52.080404
536	Rotation Direction	Registry of DICOM Data Elements	24	24	4416	4416	RotationDirection	CS	1		2014-10-27 22:02:52.083404
537	Angular Position	Registry of DICOM Data Elements	24	24	4417	4417	AngularPosition	DS	1	RET	2014-10-27 22:02:52.08638
538	Radial Position	Registry of DICOM Data Elements	24	24	4418	4418	RadialPosition	DS	1-n		2014-10-27 22:02:52.089354
539	Scan Arc	Registry of DICOM Data Elements	24	24	4419	4419	ScanArc	DS	1		2014-10-27 22:02:52.092426
540	Angular Step	Registry of DICOM Data Elements	24	24	4420	4420	AngularStep	DS	1		2014-10-27 22:02:52.095423
541	Center of Rotation Offset	Registry of DICOM Data Elements	24	24	4421	4421	CenterOfRotationOffset	DS	1		2014-10-27 22:02:52.098426
542	Rotation Offset	Registry of DICOM Data Elements	24	24	4422	4422	RotationOffset	DS	1-n	RET	2014-10-27 22:02:52.101401
543	Field of View Shape	Registry of DICOM Data Elements	24	24	4423	4423	FieldOfViewShape	CS	1		2014-10-27 22:02:52.104382
544	Field of View Dimension(s)	Registry of DICOM Data Elements	24	24	4425	4425	FieldOfViewDimensions	IS	1-2		2014-10-27 22:02:52.107328
545	Exposure Time	Registry of DICOM Data Elements	24	24	4432	4432	ExposureTime	IS	1		2014-10-27 22:02:52.110317
546	X-Ray Tube Current	Registry of DICOM Data Elements	24	24	4433	4433	XRayTubeCurrent	IS	1		2014-10-27 22:02:52.113713
547	Exposure	Registry of DICOM Data Elements	24	24	4434	4434	Exposure	IS	1		2014-10-27 22:02:52.116794
548	Exposure in As	Registry of DICOM Data Elements	24	24	4435	4435	ExposureInuAs	IS	1		2014-10-27 22:02:52.119817
549	Average Pulse Width	Registry of DICOM Data Elements	24	24	4436	4436	AveragePulseWidth	DS	1		2014-10-27 22:02:52.122839
550	Radiation Setting	Registry of DICOM Data Elements	24	24	4437	4437	RadiationSetting	CS	1		2014-10-27 22:02:52.125907
551	Rectification Type	Registry of DICOM Data Elements	24	24	4438	4438	RectificationType	CS	1		2014-10-27 22:02:52.128907
552	Radiation Mode	Registry of DICOM Data Elements	24	24	4442	4442	RadiationMode	CS	1		2014-10-27 22:02:52.131959
553	Image and Fluoroscopy Area Dose Product	Registry of DICOM Data Elements	24	24	4446	4446	ImageAndFluoroscopyAreaDoseProduct	DS	1		2014-10-27 22:02:52.134979
554	Filter Type	Registry of DICOM Data Elements	24	24	4448	4448	FilterType	SH	1		2014-10-27 22:02:52.138022
555	Type of Filters	Registry of DICOM Data Elements	24	24	4449	4449	TypeOfFilters	LO	1-n		2014-10-27 22:02:52.141021
557	Imager Pixel Spacing	Registry of DICOM Data Elements	24	24	4452	4452	ImagerPixelSpacing	DS	2		2014-10-27 22:02:52.147515
558	Grid	Registry of DICOM Data Elements	24	24	4454	4454	Grid	CS	1-n		2014-10-27 22:02:52.150739
559	Generator Power	Registry of DICOM Data Elements	24	24	4464	4464	GeneratorPower	IS	1		2014-10-27 22:02:52.153733
560	Collimator/grid Name	Registry of DICOM Data Elements	24	24	4480	4480	CollimatorGridName	SH	1		2014-10-27 22:02:52.156739
561	Collimator Type	Registry of DICOM Data Elements	24	24	4481	4481	CollimatorType	CS	1		2014-10-27 22:02:52.159737
562	Focal Distance	Registry of DICOM Data Elements	24	24	4482	4482	FocalDistance	IS	1-2		2014-10-27 22:02:52.162788
563	X Focus Center	Registry of DICOM Data Elements	24	24	4483	4483	XFocusCenter	DS	1-2		2014-10-27 22:02:52.165789
564	Y Focus Center	Registry of DICOM Data Elements	24	24	4484	4484	YFocusCenter	DS	1-2		2014-10-27 22:02:52.168788
565	Focal Spot(s)	Registry of DICOM Data Elements	24	24	4496	4496	FocalSpots	DS	1-n		2014-10-27 22:02:52.171807
566	Anode Target Material	Registry of DICOM Data Elements	24	24	4497	4497	AnodeTargetMaterial	CS	1		2014-10-27 22:02:52.174792
567	Body Part Thickness	Registry of DICOM Data Elements	24	24	4512	4512	BodyPartThickness	DS	1		2014-10-27 22:02:52.177839
568	Compression Force	Registry of DICOM Data Elements	24	24	4514	4514	CompressionForce	DS	1		2014-10-27 22:02:52.181373
569	Paddle Description	Registry of DICOM Data Elements	24	24	4516	4516	PaddleDescription	LO	1		2014-10-27 22:02:52.1844
570	Date of Last Calibration	Registry of DICOM Data Elements	24	24	4608	4608	DateOfLastCalibration	DA	1-n		2014-10-27 22:02:52.187374
571	Time of Last Calibration	Registry of DICOM Data Elements	24	24	4609	4609	TimeOfLastCalibration	TM	1-n		2014-10-27 22:02:52.190363
572	DateTime of Last Calibration	Registry of DICOM Data Elements	24	24	4610	4610	DateTimeOfLastCalibration	DT	1		2014-10-27 22:02:52.193341
573	Convolution Kernel	Registry of DICOM Data Elements	24	24	4624	4624	ConvolutionKernel	SH	1-n		2014-10-27 22:02:52.196321
574	Upper/Lower Pixel Values	Registry of DICOM Data Elements	24	24	4672	4672	UpperLowerPixelValues	IS	1-n	RET	2014-10-27 22:02:52.199271
575	Actual Frame Duration	Registry of DICOM Data Elements	24	24	4674	4674	ActualFrameDuration	IS	1		2014-10-27 22:02:52.202238
576	Count Rate	Registry of DICOM Data Elements	24	24	4675	4675	CountRate	IS	1		2014-10-27 22:02:52.20527
577	Preferred Playback Sequencing	Registry of DICOM Data Elements	24	24	4676	4676	PreferredPlaybackSequencing	US	1		2014-10-27 22:02:52.20839
578	Receive Coil Name	Registry of DICOM Data Elements	24	24	4688	4688	ReceiveCoilName	SH	1		2014-10-27 22:02:52.211472
579	Transmit Coil Name	Registry of DICOM Data Elements	24	24	4689	4689	TransmitCoilName	SH	1		2014-10-27 22:02:52.214966
580	Plate Type	Registry of DICOM Data Elements	24	24	4704	4704	PlateType	SH	1		2014-10-27 22:02:52.217988
581	Phosphor Type	Registry of DICOM Data Elements	24	24	4705	4705	PhosphorType	LO	1		2014-10-27 22:02:52.221022
582	Scan Velocity	Registry of DICOM Data Elements	24	24	4864	4864	ScanVelocity	DS	1		2014-10-27 22:02:52.224101
583	Whole Body Technique	Registry of DICOM Data Elements	24	24	4865	4865	WholeBodyTechnique	CS	1-n		2014-10-27 22:02:52.227102
584	Scan Length	Registry of DICOM Data Elements	24	24	4866	4866	ScanLength	IS	1		2014-10-27 22:02:52.230142
585	Acquisition Matrix	Registry of DICOM Data Elements	24	24	4880	4880	AcquisitionMatrix	US	4		2014-10-27 22:02:52.233149
586	In-plane Phase Encoding Direction	Registry of DICOM Data Elements	24	24	4882	4882	InPlanePhaseEncodingDirection	CS	1		2014-10-27 22:02:52.236311
587	Flip Angle	Registry of DICOM Data Elements	24	24	4884	4884	FlipAngle	DS	1		2014-10-27 22:02:52.239326
588	Variable Flip Angle Flag	Registry of DICOM Data Elements	24	24	4885	4885	VariableFlipAngleFlag	CS	1		2014-10-27 22:02:52.242355
589	SAR	Registry of DICOM Data Elements	24	24	4886	4886	SAR	DS	1		2014-10-27 22:02:52.245502
590	dB/dt	Registry of DICOM Data Elements	24	24	4888	4888	dBdt	DS	1		2014-10-27 22:02:52.249053
591	Acquisition Device Processing Description	Registry of DICOM Data Elements	24	24	5120	5120	AcquisitionDeviceProcessingDescription	LO	1		2014-10-27 22:02:52.252068
592	Acquisition Device Processing Code	Registry of DICOM Data Elements	24	24	5121	5121	AcquisitionDeviceProcessingCode	LO	1		2014-10-27 22:02:52.255085
593	Cassette Orientation	Registry of DICOM Data Elements	24	24	5122	5122	CassetteOrientation	CS	1		2014-10-27 22:02:52.258105
594	Cassette Size	Registry of DICOM Data Elements	24	24	5123	5123	CassetteSize	CS	1		2014-10-27 22:02:52.261149
595	Exposures on Plate	Registry of DICOM Data Elements	24	24	5124	5124	ExposuresOnPlate	US	1		2014-10-27 22:02:52.264158
596	Relative X-Ray Exposure	Registry of DICOM Data Elements	24	24	5125	5125	RelativeXRayExposure	IS	1		2014-10-27 22:02:52.267174
597	Exposure Index	Registry of DICOM Data Elements	24	24	5137	5137	ExposureIndex	DS	1		2014-10-27 22:02:52.270197
598	Target Exposure Index	Registry of DICOM Data Elements	24	24	5138	5138	TargetExposureIndex	DS	1		2014-10-27 22:02:52.273331
599	Deviation Index	Registry of DICOM Data Elements	24	24	5139	5139	DeviationIndex	DS	1		2014-10-27 22:02:52.276405
600	Column Angulation	Registry of DICOM Data Elements	24	24	5200	5200	ColumnAngulation	DS	1		2014-10-27 22:02:52.279475
601	Tomo Layer Height	Registry of DICOM Data Elements	24	24	5216	5216	TomoLayerHeight	DS	1		2014-10-27 22:02:52.282924
602	Tomo Angle	Registry of DICOM Data Elements	24	24	5232	5232	TomoAngle	DS	1		2014-10-27 22:02:52.285926
603	Tomo Time	Registry of DICOM Data Elements	24	24	5248	5248	TomoTime	DS	1		2014-10-27 22:02:52.288902
604	Tomo Type	Registry of DICOM Data Elements	24	24	5264	5264	TomoType	CS	1		2014-10-27 22:02:52.291921
605	Tomo Class	Registry of DICOM Data Elements	24	24	5265	5265	TomoClass	CS	1		2014-10-27 22:02:52.294913
606	Number of Tomosynthesis Source Images	Registry of DICOM Data Elements	24	24	5269	5269	NumberOfTomosynthesisSourceImages	IS	1		2014-10-27 22:02:52.29794
607	Positioner Motion	Registry of DICOM Data Elements	24	24	5376	5376	PositionerMotion	CS	1		2014-10-27 22:02:52.300951
608	Positioner Type	Registry of DICOM Data Elements	24	24	5384	5384	PositionerType	CS	1		2014-10-27 22:02:52.304009
609	Positioner Primary Angle	Registry of DICOM Data Elements	24	24	5392	5392	PositionerPrimaryAngle	DS	1		2014-10-27 22:02:52.307037
610	Positioner Secondary Angle	Registry of DICOM Data Elements	24	24	5393	5393	PositionerSecondaryAngle	DS	1		2014-10-27 22:02:52.310148
611	Positioner Primary Angle Increment	Registry of DICOM Data Elements	24	24	5408	5408	PositionerPrimaryAngleIncrement	DS	1-n		2014-10-27 22:02:52.313232
612	Positioner Secondary Angle Increment	Registry of DICOM Data Elements	24	24	5409	5409	PositionerSecondaryAngleIncrement	DS	1-n		2014-10-27 22:02:52.316762
613	Detector Primary Angle	Registry of DICOM Data Elements	24	24	5424	5424	DetectorPrimaryAngle	DS	1		2014-10-27 22:02:52.319794
614	Detector Secondary Angle	Registry of DICOM Data Elements	24	24	5425	5425	DetectorSecondaryAngle	DS	1		2014-10-27 22:02:52.322845
615	Shutter Shape	Registry of DICOM Data Elements	24	24	5632	5632	ShutterShape	CS	1-3		2014-10-27 22:02:52.325873
672	Total Gain	Registry of DICOM Data Elements	24	24	20544	20544	TotalGain	DS	1	RET	2014-10-27 22:02:52.502186
616	Shutter Left Vertical Edge	Registry of DICOM Data Elements	24	24	5634	5634	ShutterLeftVerticalEdge	IS	1		2014-10-27 22:02:52.328909
617	Shutter Right Vertical Edge	Registry of DICOM Data Elements	24	24	5636	5636	ShutterRightVerticalEdge	IS	1		2014-10-27 22:02:52.332019
618	Shutter Upper Horizontal Edge	Registry of DICOM Data Elements	24	24	5638	5638	ShutterUpperHorizontalEdge	IS	1		2014-10-27 22:02:52.335016
619	Shutter Lower Horizontal Edge	Registry of DICOM Data Elements	24	24	5640	5640	ShutterLowerHorizontalEdge	IS	1		2014-10-27 22:02:52.338061
620	Center of Circular Shutter	Registry of DICOM Data Elements	24	24	5648	5648	CenterOfCircularShutter	IS	2		2014-10-27 22:02:52.34112
621	Radius of Circular Shutter	Registry of DICOM Data Elements	24	24	5650	5650	RadiusOfCircularShutter	IS	1		2014-10-27 22:02:52.344273
622	Vertices of the Polygonal Shutter	Registry of DICOM Data Elements	24	24	5664	5664	VerticesOfThePolygonalShutter	IS	2-2n		2014-10-27 22:02:52.347356
623	Shutter Presentation Value	Registry of DICOM Data Elements	24	24	5666	5666	ShutterPresentationValue	US	1		2014-10-27 22:02:52.350874
624	Shutter Overlay Group	Registry of DICOM Data Elements	24	24	5667	5667	ShutterOverlayGroup	US	1		2014-10-27 22:02:52.353902
625	Shutter Presentation Color CIELab Value	Registry of DICOM Data Elements	24	24	5668	5668	ShutterPresentationColorCIELabValue	US	3		2014-10-27 22:02:52.356959
626	Collimator Shape	Registry of DICOM Data Elements	24	24	5888	5888	CollimatorShape	CS	1-3		2014-10-27 22:02:52.359977
627	Collimator Left Vertical Edge	Registry of DICOM Data Elements	24	24	5890	5890	CollimatorLeftVerticalEdge	IS	1		2014-10-27 22:02:52.363123
628	Collimator Right Vertical Edge	Registry of DICOM Data Elements	24	24	5892	5892	CollimatorRightVerticalEdge	IS	1		2014-10-27 22:02:52.366206
629	Collimator Upper Horizontal Edge	Registry of DICOM Data Elements	24	24	5894	5894	CollimatorUpperHorizontalEdge	IS	1		2014-10-27 22:02:52.369219
630	Collimator Lower Horizontal Edge	Registry of DICOM Data Elements	24	24	5896	5896	CollimatorLowerHorizontalEdge	IS	1		2014-10-27 22:02:52.372197
631	Center of Circular Collimator	Registry of DICOM Data Elements	24	24	5904	5904	CenterOfCircularCollimator	IS	2		2014-10-27 22:02:52.37516
632	Radius of Circular Collimator	Registry of DICOM Data Elements	24	24	5906	5906	RadiusOfCircularCollimator	IS	1		2014-10-27 22:02:52.378202
633	Vertices of the Polygonal Collimator	Registry of DICOM Data Elements	24	24	5920	5920	VerticesOfThePolygonalCollimator	IS	2-2n		2014-10-27 22:02:52.381277
634	Acquisition Time Synchronized	Registry of DICOM Data Elements	24	24	6144	6144	AcquisitionTimeSynchronized	CS	1		2014-10-27 22:02:52.384771
635	Time Source	Registry of DICOM Data Elements	24	24	6145	6145	TimeSource	SH	1		2014-10-27 22:02:52.38776
636	Time Distribution Protocol	Registry of DICOM Data Elements	24	24	6146	6146	TimeDistributionProtocol	CS	1		2014-10-27 22:02:52.390788
637	NTP Source Address	Registry of DICOM Data Elements	24	24	6147	6147	NTPSourceAddress	LO	1		2014-10-27 22:02:52.393804
638	Page Number Vector	Registry of DICOM Data Elements	24	24	8193	8193	PageNumberVector	IS	1-n		2014-10-27 22:02:52.3968
639	Frame Label Vector	Registry of DICOM Data Elements	24	24	8194	8194	FrameLabelVector	SH	1-n		2014-10-27 22:02:52.399799
640	Frame Primary Angle Vector	Registry of DICOM Data Elements	24	24	8195	8195	FramePrimaryAngleVector	DS	1-n		2014-10-27 22:02:52.402777
641	Frame Secondary Angle Vector	Registry of DICOM Data Elements	24	24	8196	8196	FrameSecondaryAngleVector	DS	1-n		2014-10-27 22:02:52.405861
642	Slice Location Vector	Registry of DICOM Data Elements	24	24	8197	8197	SliceLocationVector	DS	1-n		2014-10-27 22:02:52.408911
643	Display Window Label Vector	Registry of DICOM Data Elements	24	24	8198	8198	DisplayWindowLabelVector	SH	1-n		2014-10-27 22:02:52.412006
644	Nominal Scanned Pixel Spacing	Registry of DICOM Data Elements	24	24	8208	8208	NominalScannedPixelSpacing	DS	2		2014-10-27 22:02:52.41508
645	Digitizing Device Transport Direction	Registry of DICOM Data Elements	24	24	8224	8224	DigitizingDeviceTransportDirection	CS	1		2014-10-27 22:02:52.418606
646	Rotation of Scanned Film	Registry of DICOM Data Elements	24	24	8240	8240	RotationOfScannedFilm	DS	1		2014-10-27 22:02:52.42163
647	Biopsy Target Sequence	Registry of DICOM Data Elements	24	24	8257	8257	BiopsyTargetSequence	SQ	1		2014-10-27 22:02:52.424703
648	Target UID	Registry of DICOM Data Elements	24	24	8258	8258	TargetUID	UI	1		2014-10-27 22:02:52.427742
649	Localizing Cursor Position	Registry of DICOM Data Elements	24	24	8259	8259	LocalizingCursorPosition	FL	2		2014-10-27 22:02:52.43074
650	Calculated Target Position	Registry of DICOM Data Elements	24	24	8260	8260	CalculatedTargetPosition	FL	3		2014-10-27 22:02:52.433779
651	Target Label	Registry of DICOM Data Elements	24	24	8261	8261	TargetLabel	SH	1		2014-10-27 22:02:52.436835
652	Displayed Z Value	Registry of DICOM Data Elements	24	24	8262	8262	DisplayedZValue	FL	1		2014-10-27 22:02:52.439882
653	IVUS Acquisition	Registry of DICOM Data Elements	24	24	12544	12544	IVUSAcquisition	CS	1		2014-10-27 22:02:52.442922
654	IVUS Pullback Rate	Registry of DICOM Data Elements	24	24	12545	12545	IVUSPullbackRate	DS	1		2014-10-27 22:02:52.446033
655	IVUS Gated Rate	Registry of DICOM Data Elements	24	24	12546	12546	IVUSGatedRate	DS	1		2014-10-27 22:02:52.45026
656	IVUS Pullback Start Frame Number	Registry of DICOM Data Elements	24	24	12547	12547	IVUSPullbackStartFrameNumber	IS	1		2014-10-27 22:02:52.453322
657	IVUS Pullback Stop Frame Number	Registry of DICOM Data Elements	24	24	12548	12548	IVUSPullbackStopFrameNumber	IS	1		2014-10-27 22:02:52.456331
658	Lesion Number	Registry of DICOM Data Elements	24	24	12549	12549	LesionNumber	IS	1-n		2014-10-27 22:02:52.459323
659	Acquisition Comments	Registry of DICOM Data Elements	24	24	16384	16384	AcquisitionComments	LT	1	RET	2014-10-27 22:02:52.462336
660	Output Power	Registry of DICOM Data Elements	24	24	20480	20480	OutputPower	SH	1-n		2014-10-27 22:02:52.465344
661	Transducer Data	Registry of DICOM Data Elements	24	24	20496	20496	TransducerData	LO	1-n		2014-10-27 22:02:52.468353
662	Focus Depth	Registry of DICOM Data Elements	24	24	20498	20498	FocusDepth	DS	1		2014-10-27 22:02:52.471358
663	Processing Function	Registry of DICOM Data Elements	24	24	20512	20512	ProcessingFunction	LO	1		2014-10-27 22:02:52.474481
664	Postprocessing Function	Registry of DICOM Data Elements	24	24	20513	20513	PostprocessingFunction	LO	1	RET	2014-10-27 22:02:52.47749
665	Mechanical Index	Registry of DICOM Data Elements	24	24	20514	20514	MechanicalIndex	DS	1		2014-10-27 22:02:52.480512
666	Bone Thermal Index	Registry of DICOM Data Elements	24	24	20516	20516	BoneThermalIndex	DS	1		2014-10-27 22:02:52.483953
667	Cranial Thermal Index	Registry of DICOM Data Elements	24	24	20518	20518	CranialThermalIndex	DS	1		2014-10-27 22:02:52.487027
668	Soft Tissue Thermal Index	Registry of DICOM Data Elements	24	24	20519	20519	SoftTissueThermalIndex	DS	1		2014-10-27 22:02:52.490068
669	Soft Tissue-focus Thermal Index	Registry of DICOM Data Elements	24	24	20520	20520	SoftTissueFocusThermalIndex	DS	1		2014-10-27 22:02:52.493079
670	Soft Tissue-surface Thermal Index	Registry of DICOM Data Elements	24	24	20521	20521	SoftTissueSurfaceThermalIndex	DS	1		2014-10-27 22:02:52.496135
671	Dynamic Range	Registry of DICOM Data Elements	24	24	20528	20528	DynamicRange	DS	1	RET	2014-10-27 22:02:52.499168
673	Depth of Scan Field	Registry of DICOM Data Elements	24	24	20560	20560	DepthOfScanField	IS	1		2014-10-27 22:02:52.505228
674	Patient Position	Registry of DICOM Data Elements	24	24	20736	20736	PatientPosition	CS	1		2014-10-27 22:02:52.508322
675	View Position	Registry of DICOM Data Elements	24	24	20737	20737	ViewPosition	CS	1		2014-10-27 22:02:52.511334
676	Projection Eponymous Name Code Sequence	Registry of DICOM Data Elements	24	24	20740	20740	ProjectionEponymousNameCodeSequence	SQ	1		2014-10-27 22:02:52.51438
677	Image Transformation Matrix	Registry of DICOM Data Elements	24	24	21008	21008	ImageTransformationMatrix	DS	6	RET	2014-10-27 22:02:52.517844
678	Image Translation Vector	Registry of DICOM Data Elements	24	24	21010	21010	ImageTranslationVector	DS	3	RET	2014-10-27 22:02:52.520902
679	Sensitivity	Registry of DICOM Data Elements	24	24	24576	24576	Sensitivity	DS	1		2014-10-27 22:02:52.523968
680	Sequence of Ultrasound Regions	Registry of DICOM Data Elements	24	24	24593	24593	SequenceOfUltrasoundRegions	SQ	1		2014-10-27 22:02:52.526999
681	Region Spatial Format	Registry of DICOM Data Elements	24	24	24594	24594	RegionSpatialFormat	US	1		2014-10-27 22:02:52.530065
682	Region Data Type	Registry of DICOM Data Elements	24	24	24596	24596	RegionDataType	US	1		2014-10-27 22:02:52.533089
683	Region Flags	Registry of DICOM Data Elements	24	24	24598	24598	RegionFlags	UL	1		2014-10-27 22:02:52.53614
684	Region Location Min X0	Registry of DICOM Data Elements	24	24	24600	24600	RegionLocationMinX0	UL	1		2014-10-27 22:02:52.539172
685	Region Location Min Y0	Registry of DICOM Data Elements	24	24	24602	24602	RegionLocationMinY0	UL	1		2014-10-27 22:02:52.542242
686	Region Location Max X1	Registry of DICOM Data Elements	24	24	24604	24604	RegionLocationMaxX1	UL	1		2014-10-27 22:02:52.545288
687	Region Location Max Y1	Registry of DICOM Data Elements	24	24	24606	24606	RegionLocationMaxY1	UL	1		2014-10-27 22:02:52.548373
688	Reference Pixel X0	Registry of DICOM Data Elements	24	24	24608	24608	ReferencePixelX0	SL	1		2014-10-27 22:02:52.551879
689	Reference Pixel Y0	Registry of DICOM Data Elements	24	24	24610	24610	ReferencePixelY0	SL	1		2014-10-27 22:02:52.55492
690	Physical Units X Direction	Registry of DICOM Data Elements	24	24	24612	24612	PhysicalUnitsXDirection	US	1		2014-10-27 22:02:52.557967
691	Physical Units Y Direction	Registry of DICOM Data Elements	24	24	24614	24614	PhysicalUnitsYDirection	US	1		2014-10-27 22:02:52.56099
692	Reference Pixel Physical Value X	Registry of DICOM Data Elements	24	24	24616	24616	ReferencePixelPhysicalValueX	FD	1		2014-10-27 22:02:52.564046
693	Reference Pixel Physical Value Y	Registry of DICOM Data Elements	24	24	24618	24618	ReferencePixelPhysicalValueY	FD	1		2014-10-27 22:02:52.567167
694	Physical Delta X	Registry of DICOM Data Elements	24	24	24620	24620	PhysicalDeltaX	FD	1		2014-10-27 22:02:52.570274
695	Physical Delta Y	Registry of DICOM Data Elements	24	24	24622	24622	PhysicalDeltaY	FD	1		2014-10-27 22:02:52.573327
696	Transducer Frequency	Registry of DICOM Data Elements	24	24	24624	24624	TransducerFrequency	UL	1		2014-10-27 22:02:52.576401
697	Transducer Type	Registry of DICOM Data Elements	24	24	24625	24625	TransducerType	CS	1		2014-10-27 22:02:52.579501
698	Pulse Repetition Frequency	Registry of DICOM Data Elements	24	24	24626	24626	PulseRepetitionFrequency	UL	1		2014-10-27 22:02:52.582549
699	Doppler Correction Angle	Registry of DICOM Data Elements	24	24	24628	24628	DopplerCorrectionAngle	FD	1		2014-10-27 22:02:52.586127
700	Steering Angle	Registry of DICOM Data Elements	24	24	24630	24630	SteeringAngle	FD	1		2014-10-27 22:02:52.589946
701	Doppler Sample Volume X Position (Retired)	Registry of DICOM Data Elements	24	24	24632	24632	DopplerSampleVolumeXPositionRetired	UL	1	RET	2014-10-27 22:02:52.593074
702	Doppler Sample Volume X Position	Registry of DICOM Data Elements	24	24	24633	24633	DopplerSampleVolumeXPosition	SL	1		2014-10-27 22:02:52.596203
703	Doppler Sample Volume Y Position (Retired)	Registry of DICOM Data Elements	24	24	24634	24634	DopplerSampleVolumeYPositionRetired	UL	1	RET	2014-10-27 22:02:52.599332
704	Doppler Sample Volume Y Position	Registry of DICOM Data Elements	24	24	24635	24635	DopplerSampleVolumeYPosition	SL	1		2014-10-27 22:02:52.602382
705	TM-Line Position X0 (Retired)	Registry of DICOM Data Elements	24	24	24636	24636	TMLinePositionX0Retired	UL	1	RET	2014-10-27 22:02:52.605401
706	TM-Line Position X0	Registry of DICOM Data Elements	24	24	24637	24637	TMLinePositionX0	SL	1		2014-10-27 22:02:52.608568
707	TM-Line Position Y0 (Retired)	Registry of DICOM Data Elements	24	24	24638	24638	TMLinePositionY0Retired	UL	1	RET	2014-10-27 22:02:52.611635
708	TM-Line Position Y0	Registry of DICOM Data Elements	24	24	24639	24639	TMLinePositionY0	SL	1		2014-10-27 22:02:52.614696
709	TM-Line Position X1 (Retired)	Registry of DICOM Data Elements	24	24	24640	24640	TMLinePositionX1Retired	UL	1	RET	2014-10-27 22:02:52.617819
710	TM-Line Position X1	Registry of DICOM Data Elements	24	24	24641	24641	TMLinePositionX1	SL	1		2014-10-27 22:02:52.621385
711	TM-Line Position Y1 (Retired)	Registry of DICOM Data Elements	24	24	24642	24642	TMLinePositionY1Retired	UL	1	RET	2014-10-27 22:02:52.624537
712	TM-Line Position Y1	Registry of DICOM Data Elements	24	24	24643	24643	TMLinePositionY1	SL	1		2014-10-27 22:02:52.627575
713	Pixel Component Organization	Registry of DICOM Data Elements	24	24	24644	24644	PixelComponentOrganization	US	1		2014-10-27 22:02:52.63064
714	Pixel Component Mask	Registry of DICOM Data Elements	24	24	24646	24646	PixelComponentMask	UL	1		2014-10-27 22:02:52.633707
715	Pixel Component Range Start	Registry of DICOM Data Elements	24	24	24648	24648	PixelComponentRangeStart	UL	1		2014-10-27 22:02:52.636794
716	Pixel Component Range Stop	Registry of DICOM Data Elements	24	24	24650	24650	PixelComponentRangeStop	UL	1		2014-10-27 22:02:52.63988
717	Pixel Component Physical Units	Registry of DICOM Data Elements	24	24	24652	24652	PixelComponentPhysicalUnits	US	1		2014-10-27 22:02:52.642996
718	Pixel Component Data Type	Registry of DICOM Data Elements	24	24	24654	24654	PixelComponentDataType	US	1		2014-10-27 22:02:52.646098
719	Number of Table Break Points	Registry of DICOM Data Elements	24	24	24656	24656	NumberOfTableBreakPoints	UL	1		2014-10-27 22:02:52.649215
720	Table of X Break Points	Registry of DICOM Data Elements	24	24	24658	24658	TableOfXBreakPoints	UL	1-n		2014-10-27 22:02:52.652357
721	Table of Y Break Points	Registry of DICOM Data Elements	24	24	24660	24660	TableOfYBreakPoints	FD	1-n		2014-10-27 22:02:52.655904
722	Number of Table Entries	Registry of DICOM Data Elements	24	24	24662	24662	NumberOfTableEntries	UL	1		2014-10-27 22:02:52.658958
723	Table of Pixel Values	Registry of DICOM Data Elements	24	24	24664	24664	TableOfPixelValues	UL	1-n		2014-10-27 22:02:52.662012
724	Table of Parameter Values	Registry of DICOM Data Elements	24	24	24666	24666	TableOfParameterValues	FL	1-n		2014-10-27 22:02:52.665052
725	R Wave Time Vector	Registry of DICOM Data Elements	24	24	24672	24672	RWaveTimeVector	FL	1-n		2014-10-27 22:02:52.668108
726	Detector Conditions Nominal Flag	Registry of DICOM Data Elements	24	24	28672	28672	DetectorConditionsNominalFlag	CS	1		2014-10-27 22:02:52.671139
727	Detector Temperature	Registry of DICOM Data Elements	24	24	28673	28673	DetectorTemperature	DS	1		2014-10-27 22:02:52.674243
728	Detector Type	Registry of DICOM Data Elements	24	24	28676	28676	DetectorType	CS	1		2014-10-27 22:02:52.677261
729	Detector Configuration	Registry of DICOM Data Elements	24	24	28677	28677	DetectorConfiguration	CS	1		2014-10-27 22:02:52.680299
730	Detector Description	Registry of DICOM Data Elements	24	24	28678	28678	DetectorDescription	LT	1		2014-10-27 22:02:52.683419
731	Detector Mode	Registry of DICOM Data Elements	24	24	28680	28680	DetectorMode	LT	1		2014-10-27 22:02:52.686486
732	Detector ID	Registry of DICOM Data Elements	24	24	28682	28682	DetectorID	SH	1		2014-10-27 22:02:52.689952
733	Date of Last Detector Calibration	Registry of DICOM Data Elements	24	24	28684	28684	DateOfLastDetectorCalibration	DA	1		2014-10-27 22:02:52.692956
734	Time of Last Detector Calibration	Registry of DICOM Data Elements	24	24	28686	28686	TimeOfLastDetectorCalibration	TM	1		2014-10-27 22:02:52.696053
735	Exposures on Detector Since Last Calibration	Registry of DICOM Data Elements	24	24	28688	28688	ExposuresOnDetectorSinceLastCalibration	IS	1		2014-10-27 22:02:52.699096
736	Exposures on Detector Since Manufactured	Registry of DICOM Data Elements	24	24	28689	28689	ExposuresOnDetectorSinceManufactured	IS	1		2014-10-27 22:02:52.702167
737	Detector Time Since Last Exposure	Registry of DICOM Data Elements	24	24	28690	28690	DetectorTimeSinceLastExposure	DS	1		2014-10-27 22:02:52.705212
738	Detector Active Time	Registry of DICOM Data Elements	24	24	28692	28692	DetectorActiveTime	DS	1		2014-10-27 22:02:52.70829
739	Detector Activation Offset From Exposure	Registry of DICOM Data Elements	24	24	28694	28694	DetectorActivationOffsetFromExposure	DS	1		2014-10-27 22:02:52.711346
740	Detector Binning	Registry of DICOM Data Elements	24	24	28698	28698	DetectorBinning	DS	2		2014-10-27 22:02:52.714407
741	Detector Element Physical Size	Registry of DICOM Data Elements	24	24	28704	28704	DetectorElementPhysicalSize	DS	2		2014-10-27 22:02:52.717482
742	Detector Element Spacing	Registry of DICOM Data Elements	24	24	28706	28706	DetectorElementSpacing	DS	2		2014-10-27 22:02:52.720627
743	Detector Active Shape	Registry of DICOM Data Elements	24	24	28708	28708	DetectorActiveShape	CS	1		2014-10-27 22:02:52.72417
744	Detector Active Dimension(s)	Registry of DICOM Data Elements	24	24	28710	28710	DetectorActiveDimensions	DS	1-2		2014-10-27 22:02:52.727191
745	Detector Active Origin	Registry of DICOM Data Elements	24	24	28712	28712	DetectorActiveOrigin	DS	2		2014-10-27 22:02:52.730321
746	Detector Manufacturer Name	Registry of DICOM Data Elements	24	24	28714	28714	DetectorManufacturerName	LO	1		2014-10-27 22:02:52.733376
747	Detector Manufacturer's Model Name	Registry of DICOM Data Elements	24	24	28715	28715	DetectorManufacturerModelName	LO	1		2014-10-27 22:02:52.736534
748	Field of View Origin	Registry of DICOM Data Elements	24	24	28720	28720	FieldOfViewOrigin	DS	2		2014-10-27 22:02:52.739567
749	Field of View Rotation	Registry of DICOM Data Elements	24	24	28722	28722	FieldOfViewRotation	DS	1		2014-10-27 22:02:52.74269
750	Field of View Horizontal Flip	Registry of DICOM Data Elements	24	24	28724	28724	FieldOfViewHorizontalFlip	CS	1		2014-10-27 22:02:52.745755
751	Pixel Data Area Origin Relative To FOV	Registry of DICOM Data Elements	24	24	28726	28726	PixelDataAreaOriginRelativeToFOV	FL	2		2014-10-27 22:02:52.750137
752	Pixel Data Area Rotation Angle Relative To FOV	Registry of DICOM Data Elements	24	24	28728	28728	PixelDataAreaRotationAngleRelativeToFOV	FL	1		2014-10-27 22:02:52.753333
753	Grid Absorbing Material	Registry of DICOM Data Elements	24	24	28736	28736	GridAbsorbingMaterial	LT	1		2014-10-27 22:02:52.756481
754	Grid Spacing Material	Registry of DICOM Data Elements	24	24	28737	28737	GridSpacingMaterial	LT	1		2014-10-27 22:02:52.760024
755	Grid Thickness	Registry of DICOM Data Elements	24	24	28738	28738	GridThickness	DS	1		2014-10-27 22:02:52.763068
756	Grid Pitch	Registry of DICOM Data Elements	24	24	28740	28740	GridPitch	DS	1		2014-10-27 22:02:52.766099
757	Grid Aspect Ratio	Registry of DICOM Data Elements	24	24	28742	28742	GridAspectRatio	IS	2		2014-10-27 22:02:52.769142
758	Grid Period	Registry of DICOM Data Elements	24	24	28744	28744	GridPeriod	DS	1		2014-10-27 22:02:52.772319
759	Grid Focal Distance	Registry of DICOM Data Elements	24	24	28748	28748	GridFocalDistance	DS	1		2014-10-27 22:02:52.775379
760	Filter Material	Registry of DICOM Data Elements	24	24	28752	28752	FilterMaterial	CS	1-n		2014-10-27 22:02:52.778401
761	Filter Thickness Minimum	Registry of DICOM Data Elements	24	24	28754	28754	FilterThicknessMinimum	DS	1-n		2014-10-27 22:02:52.781458
762	Filter Thickness Maximum	Registry of DICOM Data Elements	24	24	28756	28756	FilterThicknessMaximum	DS	1-n		2014-10-27 22:02:52.784564
763	Filter Beam Path Length Minimum	Registry of DICOM Data Elements	24	24	28758	28758	FilterBeamPathLengthMinimum	FL	1-n		2014-10-27 22:02:52.787657
764	Filter Beam Path Length Maximum	Registry of DICOM Data Elements	24	24	28760	28760	FilterBeamPathLengthMaximum	FL	1-n		2014-10-27 22:02:52.790772
765	Exposure Control Mode	Registry of DICOM Data Elements	24	24	28768	28768	ExposureControlMode	CS	1		2014-10-27 22:02:52.794334
766	Exposure Control Mode Description	Registry of DICOM Data Elements	24	24	28770	28770	ExposureControlModeDescription	LT	1		2014-10-27 22:02:52.797361
767	Exposure Status	Registry of DICOM Data Elements	24	24	28772	28772	ExposureStatus	CS	1		2014-10-27 22:02:52.800423
768	Phototimer Setting	Registry of DICOM Data Elements	24	24	28773	28773	PhototimerSetting	DS	1		2014-10-27 22:02:52.803484
769	Exposure Time in S	Registry of DICOM Data Elements	24	24	33104	33104	ExposureTimeInuS	DS	1		2014-10-27 22:02:52.806518
770	X-Ray Tube Current in A	Registry of DICOM Data Elements	24	24	33105	33105	XRayTubeCurrentInuA	DS	1		2014-10-27 22:02:52.809568
771	Content Qualification	Registry of DICOM Data Elements	24	24	36868	36868	ContentQualification	CS	1		2014-10-27 22:02:52.81261
772	Pulse Sequence Name	Registry of DICOM Data Elements	24	24	36869	36869	PulseSequenceName	SH	1		2014-10-27 22:02:52.815672
773	MR Imaging Modifier Sequence	Registry of DICOM Data Elements	24	24	36870	36870	MRImagingModifierSequence	SQ	1		2014-10-27 22:02:52.818742
774	Echo Pulse Sequence	Registry of DICOM Data Elements	24	24	36872	36872	EchoPulseSequence	CS	1		2014-10-27 22:02:52.821844
775	Inversion Recovery	Registry of DICOM Data Elements	24	24	36873	36873	InversionRecovery	CS	1		2014-10-27 22:02:52.825125
776	Flow Compensation	Registry of DICOM Data Elements	24	24	36880	36880	FlowCompensation	CS	1		2014-10-27 22:02:52.828696
777	Multiple Spin Echo	Registry of DICOM Data Elements	24	24	36881	36881	MultipleSpinEcho	CS	1		2014-10-27 22:02:52.831799
778	Multi-planar Excitation	Registry of DICOM Data Elements	24	24	36882	36882	MultiPlanarExcitation	CS	1		2014-10-27 22:02:52.834847
779	Phase Contrast	Registry of DICOM Data Elements	24	24	36884	36884	PhaseContrast	CS	1		2014-10-27 22:02:52.837939
780	Time of Flight Contrast	Registry of DICOM Data Elements	24	24	36885	36885	TimeOfFlightContrast	CS	1		2014-10-27 22:02:52.840986
781	Spoiling	Registry of DICOM Data Elements	24	24	36886	36886	Spoiling	CS	1		2014-10-27 22:02:52.844103
782	Steady State Pulse Sequence	Registry of DICOM Data Elements	24	24	36887	36887	SteadyStatePulseSequence	CS	1		2014-10-27 22:02:52.847151
783	Echo Planar Pulse Sequence	Registry of DICOM Data Elements	24	24	36888	36888	EchoPlanarPulseSequence	CS	1		2014-10-27 22:02:52.850224
784	Tag Angle First Axis	Registry of DICOM Data Elements	24	24	36889	36889	TagAngleFirstAxis	FD	1		2014-10-27 22:02:52.853244
785	Magnetization Transfer	Registry of DICOM Data Elements	24	24	36896	36896	MagnetizationTransfer	CS	1		2014-10-27 22:02:52.856377
786	T2 Preparation	Registry of DICOM Data Elements	24	24	36897	36897	T2Preparation	CS	1		2014-10-27 22:02:52.860709
787	Blood Signal Nulling	Registry of DICOM Data Elements	24	24	36898	36898	BloodSignalNulling	CS	1		2014-10-27 22:02:52.863763
788	Saturation Recovery	Registry of DICOM Data Elements	24	24	36900	36900	SaturationRecovery	CS	1		2014-10-27 22:02:52.866802
789	Spectrally Selected Suppression	Registry of DICOM Data Elements	24	24	36901	36901	SpectrallySelectedSuppression	CS	1		2014-10-27 22:02:52.869842
790	Spectrally Selected Excitation	Registry of DICOM Data Elements	24	24	36902	36902	SpectrallySelectedExcitation	CS	1		2014-10-27 22:02:52.872886
791	Spatial Pre-saturation	Registry of DICOM Data Elements	24	24	36903	36903	SpatialPresaturation	CS	1		2014-10-27 22:02:52.876044
792	Tagging	Registry of DICOM Data Elements	24	24	36904	36904	Tagging	CS	1		2014-10-27 22:02:52.879069
793	Oversampling Phase	Registry of DICOM Data Elements	24	24	36905	36905	OversamplingPhase	CS	1		2014-10-27 22:02:52.882144
794	Tag Spacing First Dimension	Registry of DICOM Data Elements	24	24	36912	36912	TagSpacingFirstDimension	FD	1		2014-10-27 22:02:52.885214
795	Geometry of k-Space Traversal	Registry of DICOM Data Elements	24	24	36914	36914	GeometryOfKSpaceTraversal	CS	1		2014-10-27 22:02:52.888305
796	Segmented k-Space Traversal	Registry of DICOM Data Elements	24	24	36915	36915	SegmentedKSpaceTraversal	CS	1		2014-10-27 22:02:52.891379
797	Rectilinear Phase Encode Reordering	Registry of DICOM Data Elements	24	24	36916	36916	RectilinearPhaseEncodeReordering	CS	1		2014-10-27 22:02:52.894866
798	Tag Thickness	Registry of DICOM Data Elements	24	24	36917	36917	TagThickness	FD	1		2014-10-27 22:02:52.897971
799	Partial Fourier Direction	Registry of DICOM Data Elements	24	24	36918	36918	PartialFourierDirection	CS	1		2014-10-27 22:02:52.901009
800	Cardiac Synchronization Technique	Registry of DICOM Data Elements	24	24	36919	36919	CardiacSynchronizationTechnique	CS	1		2014-10-27 22:02:52.904081
801	Receive Coil Manufacturer Name	Registry of DICOM Data Elements	24	24	36929	36929	ReceiveCoilManufacturerName	LO	1		2014-10-27 22:02:52.907167
802	MR Receive Coil Sequence	Registry of DICOM Data Elements	24	24	36930	36930	MRReceiveCoilSequence	SQ	1		2014-10-27 22:02:52.910254
803	Receive Coil Type	Registry of DICOM Data Elements	24	24	36931	36931	ReceiveCoilType	CS	1		2014-10-27 22:02:52.913299
804	Quadrature Receive Coil	Registry of DICOM Data Elements	24	24	36932	36932	QuadratureReceiveCoil	CS	1		2014-10-27 22:02:52.916358
805	Multi-Coil Definition Sequence	Registry of DICOM Data Elements	24	24	36933	36933	MultiCoilDefinitionSequence	SQ	1		2014-10-27 22:02:52.919477
806	Multi-Coil Configuration	Registry of DICOM Data Elements	24	24	36934	36934	MultiCoilConfiguration	LO	1		2014-10-27 22:02:52.922489
807	Multi-Coil Element Name	Registry of DICOM Data Elements	24	24	36935	36935	MultiCoilElementName	SH	1		2014-10-27 22:02:52.92556
808	Multi-Coil Element Used	Registry of DICOM Data Elements	24	24	36936	36936	MultiCoilElementUsed	CS	1		2014-10-27 22:02:52.92908
809	MR Transmit Coil Sequence	Registry of DICOM Data Elements	24	24	36937	36937	MRTransmitCoilSequence	SQ	1		2014-10-27 22:02:52.932138
810	Transmit Coil Manufacturer Name	Registry of DICOM Data Elements	24	24	36944	36944	TransmitCoilManufacturerName	LO	1		2014-10-27 22:02:52.935207
811	Transmit Coil Type	Registry of DICOM Data Elements	24	24	36945	36945	TransmitCoilType	CS	1		2014-10-27 22:02:52.938244
812	Spectral Width	Registry of DICOM Data Elements	24	24	36946	36946	SpectralWidth	FD	1-2		2014-10-27 22:02:52.94134
813	Chemical Shift Reference	Registry of DICOM Data Elements	24	24	36947	36947	ChemicalShiftReference	FD	1-2		2014-10-27 22:02:52.944422
814	Volume Localization Technique	Registry of DICOM Data Elements	24	24	36948	36948	VolumeLocalizationTechnique	CS	1		2014-10-27 22:02:52.94747
815	MR Acquisition Frequency Encoding Steps	Registry of DICOM Data Elements	24	24	36952	36952	MRAcquisitionFrequencyEncodingSteps	US	1		2014-10-27 22:02:52.950529
816	De-coupling	Registry of DICOM Data Elements	24	24	36953	36953	Decoupling	CS	1		2014-10-27 22:02:52.953596
817	De-coupled Nucleus	Registry of DICOM Data Elements	24	24	36960	36960	DecoupledNucleus	CS	1-2		2014-10-27 22:02:52.956701
818	De-coupling Frequency	Registry of DICOM Data Elements	24	24	36961	36961	DecouplingFrequency	FD	1-2		2014-10-27 22:02:52.959741
819	De-coupling Method	Registry of DICOM Data Elements	24	24	36962	36962	DecouplingMethod	CS	1		2014-10-27 22:02:52.963198
820	De-coupling Chemical Shift Reference	Registry of DICOM Data Elements	24	24	36963	36963	DecouplingChemicalShiftReference	FD	1-2		2014-10-27 22:02:52.966245
821	k-space Filtering	Registry of DICOM Data Elements	24	24	36964	36964	KSpaceFiltering	CS	1		2014-10-27 22:02:52.969265
822	Time Domain Filtering	Registry of DICOM Data Elements	24	24	36965	36965	TimeDomainFiltering	CS	1-2		2014-10-27 22:02:52.972346
823	Number of Zero Fills	Registry of DICOM Data Elements	24	24	36966	36966	NumberOfZeroFills	US	1-2		2014-10-27 22:02:52.975507
824	Baseline Correction	Registry of DICOM Data Elements	24	24	36967	36967	BaselineCorrection	CS	1		2014-10-27 22:02:52.978602
825	Parallel Reduction Factor In-plane	Registry of DICOM Data Elements	24	24	36969	36969	ParallelReductionFactorInPlane	FD	1		2014-10-27 22:02:52.981634
826	Cardiac R-R Interval Specified	Registry of DICOM Data Elements	24	24	36976	36976	CardiacRRIntervalSpecified	FD	1		2014-10-27 22:02:52.984795
827	Acquisition Duration	Registry of DICOM Data Elements	24	24	36979	36979	AcquisitionDuration	FD	1		2014-10-27 22:02:52.987866
828	Frame Acquisition DateTime	Registry of DICOM Data Elements	24	24	36980	36980	FrameAcquisitionDateTime	DT	1		2014-10-27 22:02:52.990913
829	Diffusion Directionality	Registry of DICOM Data Elements	24	24	36981	36981	DiffusionDirectionality	CS	1		2014-10-27 22:02:52.994035
830	Diffusion Gradient Direction Sequence	Registry of DICOM Data Elements	24	24	36982	36982	DiffusionGradientDirectionSequence	SQ	1		2014-10-27 22:02:52.997612
831	Parallel Acquisition	Registry of DICOM Data Elements	24	24	36983	36983	ParallelAcquisition	CS	1		2014-10-27 22:02:53.00071
832	Parallel Acquisition Technique	Registry of DICOM Data Elements	24	24	36984	36984	ParallelAcquisitionTechnique	CS	1		2014-10-27 22:02:53.003781
833	Inversion Times	Registry of DICOM Data Elements	24	24	36985	36985	InversionTimes	FD	1-n		2014-10-27 22:02:53.006839
834	Metabolite Map Description	Registry of DICOM Data Elements	24	24	36992	36992	MetaboliteMapDescription	ST	1		2014-10-27 22:02:53.00994
835	Partial Fourier	Registry of DICOM Data Elements	24	24	36993	36993	PartialFourier	CS	1		2014-10-27 22:02:53.013002
836	Effective Echo Time	Registry of DICOM Data Elements	24	24	36994	36994	EffectiveEchoTime	FD	1		2014-10-27 22:02:53.016113
837	Metabolite Map Code Sequence	Registry of DICOM Data Elements	24	24	36995	36995	MetaboliteMapCodeSequence	SQ	1		2014-10-27 22:02:53.019214
838	Chemical Shift Sequence	Registry of DICOM Data Elements	24	24	36996	36996	ChemicalShiftSequence	SQ	1		2014-10-27 22:02:53.022299
839	Cardiac Signal Source	Registry of DICOM Data Elements	24	24	36997	36997	CardiacSignalSource	CS	1		2014-10-27 22:02:53.025391
840	Diffusion b-value	Registry of DICOM Data Elements	24	24	36999	36999	DiffusionBValue	FD	1		2014-10-27 22:02:53.02857
841	Diffusion Gradient Orientation	Registry of DICOM Data Elements	24	24	37001	37001	DiffusionGradientOrientation	FD	3		2014-10-27 22:02:53.032153
842	Velocity Encoding Direction	Registry of DICOM Data Elements	24	24	37008	37008	VelocityEncodingDirection	FD	3		2014-10-27 22:02:53.035315
843	Velocity Encoding Minimum Value	Registry of DICOM Data Elements	24	24	37009	37009	VelocityEncodingMinimumValue	FD	1		2014-10-27 22:02:53.038365
844	Velocity Encoding Acquisition Sequence	Registry of DICOM Data Elements	24	24	37010	37010	VelocityEncodingAcquisitionSequence	SQ	1		2014-10-27 22:02:53.041468
845	Number of k-Space Trajectories	Registry of DICOM Data Elements	24	24	37011	37011	NumberOfKSpaceTrajectories	US	1		2014-10-27 22:02:53.044628
846	Coverage of k-Space	Registry of DICOM Data Elements	24	24	37012	37012	CoverageOfKSpace	CS	1		2014-10-27 22:02:53.047774
847	Spectroscopy Acquisition Phase Rows	Registry of DICOM Data Elements	24	24	37013	37013	SpectroscopyAcquisitionPhaseRows	UL	1		2014-10-27 22:02:53.050904
848	Parallel Reduction Factor In-plane (Retired)	Registry of DICOM Data Elements	24	24	37014	37014	ParallelReductionFactorInPlaneRetired	FD	1	RET	2014-10-27 22:02:53.054018
849	Transmitter Frequency	Registry of DICOM Data Elements	24	24	37016	37016	TransmitterFrequency	FD	1-2		2014-10-27 22:02:53.057124
850	Resonant Nucleus	Registry of DICOM Data Elements	24	24	37120	37120	ResonantNucleus	CS	1-2		2014-10-27 22:02:53.060253
851	Frequency Correction	Registry of DICOM Data Elements	24	24	37121	37121	FrequencyCorrection	CS	1		2014-10-27 22:02:53.063381
852	MR Spectroscopy FOV/Geometry Sequence	Registry of DICOM Data Elements	24	24	37123	37123	MRSpectroscopyFOVGeometrySequence	SQ	1		2014-10-27 22:02:53.067253
853	Slab Thickness	Registry of DICOM Data Elements	24	24	37124	37124	SlabThickness	FD	1		2014-10-27 22:02:53.070323
854	Slab Orientation	Registry of DICOM Data Elements	24	24	37125	37125	SlabOrientation	FD	3		2014-10-27 22:02:53.073426
855	Mid Slab Position	Registry of DICOM Data Elements	24	24	37126	37126	MidSlabPosition	FD	3		2014-10-27 22:02:53.076631
856	MR Spatial Saturation Sequence	Registry of DICOM Data Elements	24	24	37127	37127	MRSpatialSaturationSequence	SQ	1		2014-10-27 22:02:53.079707
857	MR Timing and Related Parameters Sequence	Registry of DICOM Data Elements	24	24	37138	37138	MRTimingAndRelatedParametersSequence	SQ	1		2014-10-27 22:02:53.082766
858	MR Echo Sequence	Registry of DICOM Data Elements	24	24	37140	37140	MREchoSequence	SQ	1		2014-10-27 22:02:53.085871
859	MR Modifier Sequence	Registry of DICOM Data Elements	24	24	37141	37141	MRModifierSequence	SQ	1		2014-10-27 22:02:53.088998
860	MR Diffusion Sequence	Registry of DICOM Data Elements	24	24	37143	37143	MRDiffusionSequence	SQ	1		2014-10-27 22:02:53.09209
861	Cardiac Synchronization Sequence	Registry of DICOM Data Elements	24	24	37144	37144	CardiacSynchronizationSequence	SQ	1		2014-10-27 22:02:53.095233
862	MR Averages Sequence	Registry of DICOM Data Elements	24	24	37145	37145	MRAveragesSequence	SQ	1		2014-10-27 22:02:53.098388
863	MR FOV/Geometry Sequence	Registry of DICOM Data Elements	24	24	37157	37157	MRFOVGeometrySequence	SQ	1		2014-10-27 22:02:53.101917
864	Volume Localization Sequence	Registry of DICOM Data Elements	24	24	37158	37158	VolumeLocalizationSequence	SQ	1		2014-10-27 22:02:53.105012
865	Spectroscopy Acquisition Data Columns	Registry of DICOM Data Elements	24	24	37159	37159	SpectroscopyAcquisitionDataColumns	UL	1		2014-10-27 22:02:53.108093
866	Diffusion Anisotropy Type	Registry of DICOM Data Elements	24	24	37191	37191	DiffusionAnisotropyType	CS	1		2014-10-27 22:02:53.111194
867	Frame Reference DateTime	Registry of DICOM Data Elements	24	24	37201	37201	FrameReferenceDateTime	DT	1		2014-10-27 22:02:53.11428
868	MR Metabolite Map Sequence	Registry of DICOM Data Elements	24	24	37202	37202	MRMetaboliteMapSequence	SQ	1		2014-10-27 22:02:53.117363
869	Parallel Reduction Factor out-of-plane	Registry of DICOM Data Elements	24	24	37205	37205	ParallelReductionFactorOutOfPlane	FD	1		2014-10-27 22:02:53.120472
870	Spectroscopy Acquisition Out-of-plane Phase Steps	Registry of DICOM Data Elements	24	24	37209	37209	SpectroscopyAcquisitionOutOfPlanePhaseSteps	UL	1		2014-10-27 22:02:53.123611
871	Bulk Motion Status	Registry of DICOM Data Elements	24	24	37222	37222	BulkMotionStatus	CS	1	RET	2014-10-27 22:02:53.126693
872	Parallel Reduction Factor Second In-plane	Registry of DICOM Data Elements	24	24	37224	37224	ParallelReductionFactorSecondInPlane	FD	1		2014-10-27 22:02:53.129822
873	Cardiac Beat Rejection Technique	Registry of DICOM Data Elements	24	24	37225	37225	CardiacBeatRejectionTechnique	CS	1		2014-10-27 22:02:53.133048
874	Respiratory Motion Compensation Technique	Registry of DICOM Data Elements	24	24	37232	37232	RespiratoryMotionCompensationTechnique	CS	1		2014-10-27 22:02:53.136625
875	Respiratory Signal Source	Registry of DICOM Data Elements	24	24	37233	37233	RespiratorySignalSource	CS	1		2014-10-27 22:02:53.139716
876	Bulk Motion Compensation Technique	Registry of DICOM Data Elements	24	24	37234	37234	BulkMotionCompensationTechnique	CS	1		2014-10-27 22:02:53.142781
877	Bulk Motion Signal Source	Registry of DICOM Data Elements	24	24	37235	37235	BulkMotionSignalSource	CS	1		2014-10-27 22:02:53.145869
878	Applicable Safety Standard Agency	Registry of DICOM Data Elements	24	24	37236	37236	ApplicableSafetyStandardAgency	CS	1		2014-10-27 22:02:53.149022
879	Applicable Safety Standard Description	Registry of DICOM Data Elements	24	24	37237	37237	ApplicableSafetyStandardDescription	LO	1		2014-10-27 22:02:53.152121
880	Operating Mode Sequence	Registry of DICOM Data Elements	24	24	37238	37238	OperatingModeSequence	SQ	1		2014-10-27 22:02:53.155227
881	Operating Mode Type	Registry of DICOM Data Elements	24	24	37239	37239	OperatingModeType	CS	1		2014-10-27 22:02:53.158283
882	Operating Mode	Registry of DICOM Data Elements	24	24	37240	37240	OperatingMode	CS	1		2014-10-27 22:02:53.161377
883	Specific Absorption Rate Definition	Registry of DICOM Data Elements	24	24	37241	37241	SpecificAbsorptionRateDefinition	CS	1		2014-10-27 22:02:53.164596
884	Gradient Output Type	Registry of DICOM Data Elements	24	24	37248	37248	GradientOutputType	CS	1		2014-10-27 22:02:53.167766
885	Specific Absorption Rate Value	Registry of DICOM Data Elements	24	24	37249	37249	SpecificAbsorptionRateValue	FD	1		2014-10-27 22:02:53.171318
886	Gradient Output	Registry of DICOM Data Elements	24	24	37250	37250	GradientOutput	FD	1		2014-10-27 22:02:53.174382
887	Flow Compensation Direction	Registry of DICOM Data Elements	24	24	37251	37251	FlowCompensationDirection	CS	1		2014-10-27 22:02:53.177476
888	Tagging Delay	Registry of DICOM Data Elements	24	24	37252	37252	TaggingDelay	FD	1		2014-10-27 22:02:53.180749
889	Respiratory Motion Compensation Technique Description	Registry of DICOM Data Elements	24	24	37253	37253	RespiratoryMotionCompensationTechniqueDescription	ST	1		2014-10-27 22:02:53.183912
890	Respiratory Signal Source ID	Registry of DICOM Data Elements	24	24	37254	37254	RespiratorySignalSourceID	SH	1		2014-10-27 22:02:53.186974
891	Chemical Shift Minimum Integration Limit in Hz	Registry of DICOM Data Elements	24	24	37269	37269	ChemicalShiftMinimumIntegrationLimitInHz	FD	1	RET	2014-10-27 22:02:53.190069
892	Chemical Shift Maximum Integration Limit in Hz	Registry of DICOM Data Elements	24	24	37270	37270	ChemicalShiftMaximumIntegrationLimitInHz	FD	1	RET	2014-10-27 22:02:53.193168
893	MR Velocity Encoding Sequence	Registry of DICOM Data Elements	24	24	37271	37271	MRVelocityEncodingSequence	SQ	1		2014-10-27 22:02:53.196299
894	First Order Phase Correction	Registry of DICOM Data Elements	24	24	37272	37272	FirstOrderPhaseCorrection	CS	1		2014-10-27 22:02:53.199513
895	Water Referenced Phase Correction	Registry of DICOM Data Elements	24	24	37273	37273	WaterReferencedPhaseCorrection	CS	1		2014-10-27 22:02:53.202687
896	MR Spectroscopy Acquisition Type	Registry of DICOM Data Elements	24	24	37376	37376	MRSpectroscopyAcquisitionType	CS	1		2014-10-27 22:02:53.206268
897	Respiratory Cycle Position	Registry of DICOM Data Elements	24	24	37396	37396	RespiratoryCyclePosition	CS	1		2014-10-27 22:02:53.209366
898	Velocity Encoding Maximum Value	Registry of DICOM Data Elements	24	24	37399	37399	VelocityEncodingMaximumValue	FD	1		2014-10-27 22:02:53.212488
899	Tag Spacing Second Dimension	Registry of DICOM Data Elements	24	24	37400	37400	TagSpacingSecondDimension	FD	1		2014-10-27 22:02:53.215566
900	Tag Angle Second Axis	Registry of DICOM Data Elements	24	24	37401	37401	TagAngleSecondAxis	SS	1		2014-10-27 22:02:53.218665
901	Frame Acquisition Duration	Registry of DICOM Data Elements	24	24	37408	37408	FrameAcquisitionDuration	FD	1		2014-10-27 22:02:53.221754
902	MR Image Frame Type Sequence	Registry of DICOM Data Elements	24	24	37414	37414	MRImageFrameTypeSequence	SQ	1		2014-10-27 22:02:53.224851
903	MR Spectroscopy Frame Type Sequence	Registry of DICOM Data Elements	24	24	37415	37415	MRSpectroscopyFrameTypeSequence	SQ	1		2014-10-27 22:02:53.227944
904	MR Acquisition Phase Encoding Steps in-plane	Registry of DICOM Data Elements	24	24	37425	37425	MRAcquisitionPhaseEncodingStepsInPlane	US	1		2014-10-27 22:02:53.231052
905	MR Acquisition Phase Encoding Steps out-of-plane	Registry of DICOM Data Elements	24	24	37426	37426	MRAcquisitionPhaseEncodingStepsOutOfPlane	US	1		2014-10-27 22:02:53.234207
906	Spectroscopy Acquisition Phase Columns	Registry of DICOM Data Elements	24	24	37428	37428	SpectroscopyAcquisitionPhaseColumns	UL	1		2014-10-27 22:02:53.237488
907	Cardiac Cycle Position	Registry of DICOM Data Elements	24	24	37430	37430	CardiacCyclePosition	CS	1		2014-10-27 22:02:53.241084
908	Specific Absorption Rate Sequence	Registry of DICOM Data Elements	24	24	37433	37433	SpecificAbsorptionRateSequence	SQ	1		2014-10-27 22:02:53.244215
909	RF Echo Train Length	Registry of DICOM Data Elements	24	24	37440	37440	RFEchoTrainLength	US	1		2014-10-27 22:02:53.247281
910	Gradient Echo Train Length	Registry of DICOM Data Elements	24	24	37441	37441	GradientEchoTrainLength	US	1		2014-10-27 22:02:53.250416
911	Arterial Spin Labeling Contrast	Registry of DICOM Data Elements	24	24	37456	37456	ArterialSpinLabelingContrast	CS	1		2014-10-27 22:02:53.253488
912	MR Arterial Spin Labeling Sequence	Registry of DICOM Data Elements	24	24	37457	37457	MRArterialSpinLabelingSequence	SQ	1		2014-10-27 22:02:53.256605
913	ASL Technique Description	Registry of DICOM Data Elements	24	24	37458	37458	ASLTechniqueDescription	LO	1		2014-10-27 22:02:53.259752
914	ASL Slab Number	Registry of DICOM Data Elements	24	24	37459	37459	ASLSlabNumber	US	1		2014-10-27 22:02:53.262791
915	ASL Slab Thickness	Registry of DICOM Data Elements	24	24	37460	37460	ASLSlabThickness	FD	1		2014-10-27 22:02:53.265898
916	ASL Slab Orientation	Registry of DICOM Data Elements	24	24	37461	37461	ASLSlabOrientation	FD	3		2014-10-27 22:02:53.269039
917	ASL Mid Slab Position	Registry of DICOM Data Elements	24	24	37462	37462	ASLMidSlabPosition	FD	3		2014-10-27 22:02:53.273311
918	ASL Context	Registry of DICOM Data Elements	24	24	37463	37463	ASLContext	CS	1		2014-10-27 22:02:53.277191
919	ASL Pulse Train Duration	Registry of DICOM Data Elements	24	24	37464	37464	ASLPulseTrainDuration	UL	1		2014-10-27 22:02:53.280292
920	ASL Crusher Flag	Registry of DICOM Data Elements	24	24	37465	37465	ASLCrusherFlag	CS	1		2014-10-27 22:02:53.283339
921	ASL Crusher Flow Limit	Registry of DICOM Data Elements	24	24	37466	37466	ASLCrusherFlowLimit	FD	1		2014-10-27 22:02:53.294788
922	ASL Crusher Description	Registry of DICOM Data Elements	24	24	37467	37467	ASLCrusherDescription	LO	1		2014-10-27 22:02:53.298141
923	ASL Bolus Cut-off Flag	Registry of DICOM Data Elements	24	24	37468	37468	ASLBolusCutoffFlag	CS	1		2014-10-27 22:02:53.301334
924	ASL Bolus Cut-off Timing Sequence	Registry of DICOM Data Elements	24	24	37469	37469	ASLBolusCutoffTimingSequence	SQ	1		2014-10-27 22:02:53.304608
925	ASL Bolus Cut-off Technique	Registry of DICOM Data Elements	24	24	37470	37470	ASLBolusCutoffTechnique	LO	1		2014-10-27 22:02:53.311168
926	ASL Bolus Cut-off Delay Time	Registry of DICOM Data Elements	24	24	37471	37471	ASLBolusCutoffDelayTime	UL	1		2014-10-27 22:02:53.314289
927	ASL Slab Sequence	Registry of DICOM Data Elements	24	24	37472	37472	ASLSlabSequence	SQ	1		2014-10-27 22:02:53.317375
928	Chemical Shift Minimum Integration Limit in ppm	Registry of DICOM Data Elements	24	24	37525	37525	ChemicalShiftMinimumIntegrationLimitInppm	FD	1		2014-10-27 22:02:53.320945
929	Chemical Shift Maximum Integration Limit in ppm	Registry of DICOM Data Elements	24	24	37526	37526	ChemicalShiftMaximumIntegrationLimitInppm	FD	1		2014-10-27 22:02:53.324105
930	Water Reference Acquisition	Registry of DICOM Data Elements	24	24	37527	37527	WaterReferenceAcquisition	CS	1		2014-10-27 22:02:53.327208
931	Echo Peak Position	Registry of DICOM Data Elements	24	24	37528	37528	EchoPeakPosition	IS	1		2014-10-27 22:02:53.330322
932	CT Acquisition Type Sequence	Registry of DICOM Data Elements	24	24	37633	37633	CTAcquisitionTypeSequence	SQ	1		2014-10-27 22:02:53.333427
933	Acquisition Type	Registry of DICOM Data Elements	24	24	37634	37634	AcquisitionType	CS	1		2014-10-27 22:02:53.336574
934	Tube Angle	Registry of DICOM Data Elements	24	24	37635	37635	TubeAngle	FD	1		2014-10-27 22:02:53.339708
935	CT Acquisition Details Sequence	Registry of DICOM Data Elements	24	24	37636	37636	CTAcquisitionDetailsSequence	SQ	1		2014-10-27 22:02:53.342761
936	Revolution Time	Registry of DICOM Data Elements	24	24	37637	37637	RevolutionTime	FD	1		2014-10-27 22:02:53.345857
937	Single Collimation Width	Registry of DICOM Data Elements	24	24	37638	37638	SingleCollimationWidth	FD	1		2014-10-27 22:02:53.348989
938	Total Collimation Width	Registry of DICOM Data Elements	24	24	37639	37639	TotalCollimationWidth	FD	1		2014-10-27 22:02:53.352107
939	CT Table Dynamics Sequence	Registry of DICOM Data Elements	24	24	37640	37640	CTTableDynamicsSequence	SQ	1		2014-10-27 22:02:53.355732
940	Table Speed	Registry of DICOM Data Elements	24	24	37641	37641	TableSpeed	FD	1		2014-10-27 22:02:53.358807
941	Table Feed per Rotation	Registry of DICOM Data Elements	24	24	37648	37648	TableFeedPerRotation	FD	1		2014-10-27 22:02:53.361907
942	Spiral Pitch Factor	Registry of DICOM Data Elements	24	24	37649	37649	SpiralPitchFactor	FD	1		2014-10-27 22:02:53.36506
943	CT Geometry Sequence	Registry of DICOM Data Elements	24	24	37650	37650	CTGeometrySequence	SQ	1		2014-10-27 22:02:53.368267
944	Data Collection Center (Patient)	Registry of DICOM Data Elements	24	24	37651	37651	DataCollectionCenterPatient	FD	3		2014-10-27 22:02:53.371364
945	CT Reconstruction Sequence	Registry of DICOM Data Elements	24	24	37652	37652	CTReconstructionSequence	SQ	1		2014-10-27 22:02:53.374423
946	Reconstruction Algorithm	Registry of DICOM Data Elements	24	24	37653	37653	ReconstructionAlgorithm	CS	1		2014-10-27 22:02:53.377515
947	Convolution Kernel Group	Registry of DICOM Data Elements	24	24	37654	37654	ConvolutionKernelGroup	CS	1		2014-10-27 22:02:53.380617
948	Reconstruction Field of View	Registry of DICOM Data Elements	24	24	37655	37655	ReconstructionFieldOfView	FD	2		2014-10-27 22:02:53.383923
949	Reconstruction Target Center (Patient)	Registry of DICOM Data Elements	24	24	37656	37656	ReconstructionTargetCenterPatient	FD	3		2014-10-27 22:02:53.387008
950	Reconstruction Angle	Registry of DICOM Data Elements	24	24	37657	37657	ReconstructionAngle	FD	1		2014-10-27 22:02:53.390512
951	Image Filter	Registry of DICOM Data Elements	24	24	37664	37664	ImageFilter	SH	1		2014-10-27 22:02:53.393622
952	CT Exposure Sequence	Registry of DICOM Data Elements	24	24	37665	37665	CTExposureSequence	SQ	1		2014-10-27 22:02:53.396803
953	Reconstruction Pixel Spacing	Registry of DICOM Data Elements	24	24	37666	37666	ReconstructionPixelSpacing	FD	2		2014-10-27 22:02:53.399931
954	Exposure Modulation Type	Registry of DICOM Data Elements	24	24	37667	37667	ExposureModulationType	CS	1		2014-10-27 22:02:53.403093
955	Estimated Dose Saving	Registry of DICOM Data Elements	24	24	37668	37668	EstimatedDoseSaving	FD	1		2014-10-27 22:02:53.40619
956	CT X-Ray Details Sequence	Registry of DICOM Data Elements	24	24	37669	37669	CTXRayDetailsSequence	SQ	1		2014-10-27 22:02:53.409324
957	CT Position Sequence	Registry of DICOM Data Elements	24	24	37670	37670	CTPositionSequence	SQ	1		2014-10-27 22:02:53.41248
958	Table Position	Registry of DICOM Data Elements	24	24	37671	37671	TablePosition	FD	1		2014-10-27 22:02:53.415583
959	Exposure Time in ms	Registry of DICOM Data Elements	24	24	37672	37672	ExposureTimeInms	FD	1		2014-10-27 22:02:53.418672
960	CT Image Frame Type Sequence	Registry of DICOM Data Elements	24	24	37673	37673	CTImageFrameTypeSequence	SQ	1		2014-10-27 22:02:53.421871
961	X-Ray Tube Current in mA	Registry of DICOM Data Elements	24	24	37680	37680	XRayTubeCurrentInmA	FD	1		2014-10-27 22:02:53.425479
962	Exposure in mAs	Registry of DICOM Data Elements	24	24	37682	37682	ExposureInmAs	FD	1		2014-10-27 22:02:53.428634
963	Constant Volume Flag	Registry of DICOM Data Elements	24	24	37683	37683	ConstantVolumeFlag	CS	1		2014-10-27 22:02:53.431735
964	Fluoroscopy Flag	Registry of DICOM Data Elements	24	24	37684	37684	FluoroscopyFlag	CS	1		2014-10-27 22:02:53.434838
965	Distance Source to Data Collection Center	Registry of DICOM Data Elements	24	24	37685	37685	DistanceSourceToDataCollectionCenter	FD	1		2014-10-27 22:02:53.437954
966	Contrast/Bolus Agent Number	Registry of DICOM Data Elements	24	24	37687	37687	ContrastBolusAgentNumber	US	1		2014-10-27 22:02:53.441098
967	Contrast/Bolus Ingredient Code Sequence	Registry of DICOM Data Elements	24	24	37688	37688	ContrastBolusIngredientCodeSequence	SQ	1		2014-10-27 22:02:53.44423
968	Contrast Administration Profile Sequence	Registry of DICOM Data Elements	24	24	37696	37696	ContrastAdministrationProfileSequence	SQ	1		2014-10-27 22:02:53.447295
969	Contrast/Bolus Usage Sequence	Registry of DICOM Data Elements	24	24	37697	37697	ContrastBolusUsageSequence	SQ	1		2014-10-27 22:02:53.450413
970	Contrast/Bolus Agent Administered	Registry of DICOM Data Elements	24	24	37698	37698	ContrastBolusAgentAdministered	CS	1		2014-10-27 22:02:53.453603
971	Contrast/Bolus Agent Detected	Registry of DICOM Data Elements	24	24	37699	37699	ContrastBolusAgentDetected	CS	1		2014-10-27 22:02:53.45681
972	Contrast/Bolus Agent Phase	Registry of DICOM Data Elements	24	24	37700	37700	ContrastBolusAgentPhase	CS	1		2014-10-27 22:02:53.460395
973	CTDIvol	Registry of DICOM Data Elements	24	24	37701	37701	CTDIvol	FD	1		2014-10-27 22:02:53.463508
974	CTDI Phantom Type Code Sequence	Registry of DICOM Data Elements	24	24	37702	37702	CTDIPhantomTypeCodeSequence	SQ	1		2014-10-27 22:02:53.466561
975	Calcium Scoring Mass Factor Patient	Registry of DICOM Data Elements	24	24	37713	37713	CalciumScoringMassFactorPatient	FL	1		2014-10-27 22:02:53.469671
976	Calcium Scoring Mass Factor Device	Registry of DICOM Data Elements	24	24	37714	37714	CalciumScoringMassFactorDevice	FL	3		2014-10-27 22:02:53.472796
977	Energy Weighting Factor	Registry of DICOM Data Elements	24	24	37715	37715	EnergyWeightingFactor	FL	1		2014-10-27 22:02:53.476027
978	CT Additional X-Ray Source Sequence	Registry of DICOM Data Elements	24	24	37728	37728	CTAdditionalXRaySourceSequence	SQ	1		2014-10-27 22:02:53.479138
979	Projection Pixel Calibration Sequence	Registry of DICOM Data Elements	24	24	37889	37889	ProjectionPixelCalibrationSequence	SQ	1		2014-10-27 22:02:53.482245
980	Distance Source to Isocenter	Registry of DICOM Data Elements	24	24	37890	37890	DistanceSourceToIsocenter	FL	1		2014-10-27 22:02:53.485344
981	Distance Object to Table Top	Registry of DICOM Data Elements	24	24	37891	37891	DistanceObjectToTableTop	FL	1		2014-10-27 22:02:53.488505
982	Object Pixel Spacing in Center of Beam	Registry of DICOM Data Elements	24	24	37892	37892	ObjectPixelSpacingInCenterOfBeam	FL	2		2014-10-27 22:02:53.491681
983	Positioner Position Sequence	Registry of DICOM Data Elements	24	24	37893	37893	PositionerPositionSequence	SQ	1		2014-10-27 22:02:53.495258
984	Table Position Sequence	Registry of DICOM Data Elements	24	24	37894	37894	TablePositionSequence	SQ	1		2014-10-27 22:02:53.498367
985	Collimator Shape Sequence	Registry of DICOM Data Elements	24	24	37895	37895	CollimatorShapeSequence	SQ	1		2014-10-27 22:02:53.501457
986	Planes in Acquisition	Registry of DICOM Data Elements	24	24	37904	37904	PlanesInAcquisition	CS	1		2014-10-27 22:02:53.504596
987	XA/XRF Frame Characteristics Sequence	Registry of DICOM Data Elements	24	24	37906	37906	XAXRFFrameCharacteristicsSequence	SQ	1		2014-10-27 22:02:53.507737
988	Frame Acquisition Sequence	Registry of DICOM Data Elements	24	24	37911	37911	FrameAcquisitionSequence	SQ	1		2014-10-27 22:02:53.510828
989	X-Ray Receptor Type	Registry of DICOM Data Elements	24	24	37920	37920	XRayReceptorType	CS	1		2014-10-27 22:02:53.51392
990	Acquisition Protocol Name	Registry of DICOM Data Elements	24	24	37923	37923	AcquisitionProtocolName	LO	1		2014-10-27 22:02:53.517058
991	Acquisition Protocol Description	Registry of DICOM Data Elements	24	24	37924	37924	AcquisitionProtocolDescription	LT	1		2014-10-27 22:02:53.520186
992	Contrast/Bolus Ingredient Opaque	Registry of DICOM Data Elements	24	24	37925	37925	ContrastBolusIngredientOpaque	CS	1		2014-10-27 22:02:53.523289
993	Distance Receptor Plane to Detector Housing	Registry of DICOM Data Elements	24	24	37926	37926	DistanceReceptorPlaneToDetectorHousing	FL	1		2014-10-27 22:02:53.526473
994	Intensifier Active Shape	Registry of DICOM Data Elements	24	24	37927	37927	IntensifierActiveShape	CS	1		2014-10-27 22:02:53.530056
995	Intensifier Active Dimension(s)	Registry of DICOM Data Elements	24	24	37928	37928	IntensifierActiveDimensions	FL	1-2		2014-10-27 22:02:53.533179
996	Physical Detector Size	Registry of DICOM Data Elements	24	24	37929	37929	PhysicalDetectorSize	FL	2		2014-10-27 22:02:53.536309
997	Position of Isocenter Projection	Registry of DICOM Data Elements	24	24	37936	37936	PositionOfIsocenterProjection	FL	2		2014-10-27 22:02:53.539401
998	Field of View Sequence	Registry of DICOM Data Elements	24	24	37938	37938	FieldOfViewSequence	SQ	1		2014-10-27 22:02:53.542522
999	Field of View Description	Registry of DICOM Data Elements	24	24	37939	37939	FieldOfViewDescription	LO	1		2014-10-27 22:02:53.545629
1156	Image Position	Registry of DICOM Data Elements	32	32	48	48	ImagePosition	DS	3	RET	2014-10-27 22:02:54.04681
1000	Exposure Control Sensing Regions Sequence	Registry of DICOM Data Elements	24	24	37940	37940	ExposureControlSensingRegionsSequence	SQ	1		2014-10-27 22:02:53.548771
1001	Exposure Control Sensing Region Shape	Registry of DICOM Data Elements	24	24	37941	37941	ExposureControlSensingRegionShape	CS	1		2014-10-27 22:02:53.551954
1002	Exposure Control Sensing Region Left Vertical Edge	Registry of DICOM Data Elements	24	24	37942	37942	ExposureControlSensingRegionLeftVerticalEdge	SS	1		2014-10-27 22:02:53.555088
1003	Exposure Control Sensing Region Right Vertical Edge	Registry of DICOM Data Elements	24	24	37943	37943	ExposureControlSensingRegionRightVerticalEdge	SS	1		2014-10-27 22:02:53.558253
1004	Exposure Control Sensing Region Upper Horizontal Edge	Registry of DICOM Data Elements	24	24	37944	37944	ExposureControlSensingRegionUpperHorizontalEdge	SS	1		2014-10-27 22:02:53.561418
1005	Exposure Control Sensing Region Lower Horizontal Edge	Registry of DICOM Data Elements	24	24	37945	37945	ExposureControlSensingRegionLowerHorizontalEdge	SS	1		2014-10-27 22:02:53.565028
1006	Center of Circular Exposure Control Sensing Region	Registry of DICOM Data Elements	24	24	37952	37952	CenterOfCircularExposureControlSensingRegion	SS	2		2014-10-27 22:02:53.568139
1007	Radius of Circular Exposure Control Sensing Region	Registry of DICOM Data Elements	24	24	37953	37953	RadiusOfCircularExposureControlSensingRegion	US	1		2014-10-27 22:02:53.571222
1008	Vertices of the Polygonal Exposure Control Sensing Region	Registry of DICOM Data Elements	24	24	37954	37954	VerticesOfThePolygonalExposureControlSensingRegion	SS	2-n		2014-10-27 22:02:53.574314
1009		Registry of DICOM Data Elements	24	24	37957	37957				RET - See Note 3	2014-10-27 22:02:53.577401
1010	Column Angulation (Patient)	Registry of DICOM Data Elements	24	24	37959	37959	ColumnAngulationPatient	FL	1		2014-10-27 22:02:53.580536
1011	Beam Angle	Registry of DICOM Data Elements	24	24	37961	37961	BeamAngle	FL	1		2014-10-27 22:02:53.58365
1012	Frame Detector Parameters Sequence	Registry of DICOM Data Elements	24	24	37969	37969	FrameDetectorParametersSequence	SQ	1		2014-10-27 22:02:53.586725
1013	Calculated Anatomy Thickness	Registry of DICOM Data Elements	24	24	37970	37970	CalculatedAnatomyThickness	FL	1		2014-10-27 22:02:53.589815
1014	Calibration Sequence	Registry of DICOM Data Elements	24	24	37973	37973	CalibrationSequence	SQ	1		2014-10-27 22:02:53.593017
1015	Object Thickness Sequence	Registry of DICOM Data Elements	24	24	37974	37974	ObjectThicknessSequence	SQ	1		2014-10-27 22:02:53.596224
1016	Plane Identification	Registry of DICOM Data Elements	24	24	37975	37975	PlaneIdentification	CS	1		2014-10-27 22:02:53.599809
1017	Field of View Dimension(s) in Float	Registry of DICOM Data Elements	24	24	37985	37985	FieldOfViewDimensionsInFloat	FL	1-2		2014-10-27 22:02:53.602905
1018	Isocenter Reference System Sequence	Registry of DICOM Data Elements	24	24	37986	37986	IsocenterReferenceSystemSequence	SQ	1		2014-10-27 22:02:53.606028
1019	Positioner Isocenter Primary Angle	Registry of DICOM Data Elements	24	24	37987	37987	PositionerIsocenterPrimaryAngle	FL	1		2014-10-27 22:02:53.609124
1020	Positioner Isocenter Secondary Angle	Registry of DICOM Data Elements	24	24	37988	37988	PositionerIsocenterSecondaryAngle	FL	1		2014-10-27 22:02:53.612273
1021	Positioner Isocenter Detector Rotation Angle	Registry of DICOM Data Elements	24	24	37989	37989	PositionerIsocenterDetectorRotationAngle	FL	1		2014-10-27 22:02:53.615394
1022	Table X Position to Isocenter	Registry of DICOM Data Elements	24	24	37990	37990	TableXPositionToIsocenter	FL	1		2014-10-27 22:02:53.618487
1023	Table Y Position to Isocenter	Registry of DICOM Data Elements	24	24	37991	37991	TableYPositionToIsocenter	FL	1		2014-10-27 22:02:53.621604
1024	Table Z Position to Isocenter	Registry of DICOM Data Elements	24	24	37992	37992	TableZPositionToIsocenter	FL	1		2014-10-27 22:02:53.624874
1025	Table Horizontal Rotation Angle	Registry of DICOM Data Elements	24	24	37993	37993	TableHorizontalRotationAngle	FL	1		2014-10-27 22:02:53.628127
1026	Table Head Tilt Angle	Registry of DICOM Data Elements	24	24	38000	38000	TableHeadTiltAngle	FL	1		2014-10-27 22:02:53.631328
1027	Table Cradle Tilt Angle	Registry of DICOM Data Elements	24	24	38001	38001	TableCradleTiltAngle	FL	1		2014-10-27 22:02:53.634926
1028	Frame Display Shutter Sequence	Registry of DICOM Data Elements	24	24	38002	38002	FrameDisplayShutterSequence	SQ	1		2014-10-27 22:02:53.638043
1029	Acquired Image Area Dose Product	Registry of DICOM Data Elements	24	24	38003	38003	AcquiredImageAreaDoseProduct	FL	1		2014-10-27 22:02:53.641131
1030	C-arm Positioner Tabletop Relationship	Registry of DICOM Data Elements	24	24	38004	38004	CArmPositionerTabletopRelationship	CS	1		2014-10-27 22:02:53.644247
1031	X-Ray Geometry Sequence	Registry of DICOM Data Elements	24	24	38006	38006	XRayGeometrySequence	SQ	1		2014-10-27 22:02:53.647335
1032	Irradiation Event Identification Sequence	Registry of DICOM Data Elements	24	24	38007	38007	IrradiationEventIdentificationSequence	SQ	1		2014-10-27 22:02:53.650452
1033	X-Ray 3D Frame Type Sequence	Registry of DICOM Data Elements	24	24	38148	38148	XRay3DFrameTypeSequence	SQ	1		2014-10-27 22:02:53.653564
1034	Contributing Sources Sequence	Registry of DICOM Data Elements	24	24	38150	38150	ContributingSourcesSequence	SQ	1		2014-10-27 22:02:53.656712
1035	X-Ray 3D Acquisition Sequence	Registry of DICOM Data Elements	24	24	38151	38151	XRay3DAcquisitionSequence	SQ	1		2014-10-27 22:02:53.659933
1036	Primary Positioner Scan Arc	Registry of DICOM Data Elements	24	24	38152	38152	PrimaryPositionerScanArc	FL	1		2014-10-27 22:02:53.663089
1037	Secondary Positioner Scan Arc	Registry of DICOM Data Elements	24	24	38153	38153	SecondaryPositionerScanArc	FL	1		2014-10-27 22:02:53.666294
1038	Primary Positioner Scan Start Angle	Registry of DICOM Data Elements	24	24	38160	38160	PrimaryPositionerScanStartAngle	FL	1		2014-10-27 22:02:53.669903
1039	Secondary Positioner Scan Start Angle	Registry of DICOM Data Elements	24	24	38161	38161	SecondaryPositionerScanStartAngle	FL	1		2014-10-27 22:02:53.673024
1040	Primary Positioner Increment	Registry of DICOM Data Elements	24	24	38164	38164	PrimaryPositionerIncrement	FL	1		2014-10-27 22:02:53.676289
1041	Secondary Positioner Increment	Registry of DICOM Data Elements	24	24	38165	38165	SecondaryPositionerIncrement	FL	1		2014-10-27 22:02:53.679404
1042	Start Acquisition DateTime	Registry of DICOM Data Elements	24	24	38166	38166	StartAcquisitionDateTime	DT	1		2014-10-27 22:02:53.68251
1043	End Acquisition DateTime	Registry of DICOM Data Elements	24	24	38167	38167	EndAcquisitionDateTime	DT	1		2014-10-27 22:02:53.685629
1044	Primary Positioner Increment Sign	Registry of DICOM Data Elements	24	24	38168	38168	PrimaryPositionerIncrementSign	SS	1		2014-10-27 22:02:53.688771
1045	Secondary Positioner Increment Sign	Registry of DICOM Data Elements	24	24	38169	38169	SecondaryPositionerIncrementSign	SS	1		2014-10-27 22:02:53.691918
1046	Application Name	Registry of DICOM Data Elements	24	24	38180	38180	ApplicationName	LO	1		2014-10-27 22:02:53.695013
1047	Application Version	Registry of DICOM Data Elements	24	24	38181	38181	ApplicationVersion	LO	1		2014-10-27 22:02:53.698191
1048	Application Manufacturer	Registry of DICOM Data Elements	24	24	38182	38182	ApplicationManufacturer	LO	1		2014-10-27 22:02:53.702533
1049	Algorithm Type	Registry of DICOM Data Elements	24	24	38183	38183	AlgorithmType	CS	1		2014-10-27 22:02:53.705664
1050	Algorithm Description	Registry of DICOM Data Elements	24	24	38184	38184	AlgorithmDescription	LO	1		2014-10-27 22:02:53.70882
1051	X-Ray 3D Reconstruction Sequence	Registry of DICOM Data Elements	24	24	38192	38192	XRay3DReconstructionSequence	SQ	1		2014-10-27 22:02:53.712029
1052	Reconstruction Description	Registry of DICOM Data Elements	24	24	38193	38193	ReconstructionDescription	LO	1		2014-10-27 22:02:53.71517
1053	Per Projection Acquisition Sequence	Registry of DICOM Data Elements	24	24	38200	38200	PerProjectionAcquisitionSequence	SQ	1		2014-10-27 22:02:53.718262
1054	Detector Position Sequence	Registry of DICOM Data Elements	24	24	38209	38209	DetectorPositionSequence	SQ	1	\N	2014-10-27 22:02:53.721421
1055	X-Ray Acquisition Dose Sequence	Registry of DICOM Data Elements	24	24	38210	38210	XRayAcquisitionDoseSequence	SQ	1	\N	2014-10-27 22:02:53.724582
1056	X-Ray Source Isocenter Primary Angle	Registry of DICOM Data Elements	24	24	38211	38211	XRaySourceIsocenterPrimaryAngle	FD	1	\N	2014-10-27 22:02:53.727695
1057	X-Ray Source Isocenter Secondary Angle	Registry of DICOM Data Elements	24	24	38212	38212	XRaySourceIsocenterSecondaryAngle	FD	1	\N	2014-10-27 22:02:53.730804
1058	Breast Support Isocenter Primary Angle	Registry of DICOM Data Elements	24	24	38213	38213	BreastSupportIsocenterPrimaryAngle	FD	1	\N	2014-10-27 22:02:53.733921
1059	Breast Support Isocenter Secondary Angle	Registry of DICOM Data Elements	24	24	38214	38214	BreastSupportIsocenterSecondaryAngle	FD	1	\N	2014-10-27 22:02:53.737552
1060	Breast Support X Position to Isocenter	Registry of DICOM Data Elements	24	24	38215	38215	BreastSupportXPositionToIsocenter	FD	1	\N	2014-10-27 22:02:53.740725
1061	Breast Support Y Position to Isocenter	Registry of DICOM Data Elements	24	24	38216	38216	BreastSupportYPositionToIsocenter	FD	1	\N	2014-10-27 22:02:53.743818
1062	Breast Support Z Position to Isocenter	Registry of DICOM Data Elements	24	24	38217	38217	BreastSupportZPositionToIsocenter	FD	1	\N	2014-10-27 22:02:53.746905
1063	Detector Isocenter Primary Angle	Registry of DICOM Data Elements	24	24	38224	38224	DetectorIsocenterPrimaryAngle	FD	1	\N	2014-10-27 22:02:53.750018
1064	Detector Isocenter Secondary Angle	Registry of DICOM Data Elements	24	24	38225	38225	DetectorIsocenterSecondaryAngle	FD	1	\N	2014-10-27 22:02:53.75317
1065	Detector X Position to Isocenter	Registry of DICOM Data Elements	24	24	38226	38226	DetectorXPositionToIsocenter	FD	1	\N	2014-10-27 22:02:53.756336
1066	Detector Y Position to Isocenter	Registry of DICOM Data Elements	24	24	38227	38227	DetectorYPositionToIsocenter	FD	1	\N	2014-10-27 22:02:53.759514
1067	Detector Z Position to Isocenter	Registry of DICOM Data Elements	24	24	38228	38228	DetectorZPositionToIsocenter	FD	1	\N	2014-10-27 22:02:53.762636
1068	X-Ray Grid Sequence	Registry of DICOM Data Elements	24	24	38229	38229	XRayGridSequence	SQ	1	\N	2014-10-27 22:02:53.765742
1069	X-Ray Filter Sequence	Registry of DICOM Data Elements	24	24	38230	38230	XRayFilterSequence	SQ	1	\N	2014-10-27 22:02:53.76886
1070	Detector Active Area TLHC Position	Registry of DICOM Data Elements	24	24	38231	38231	DetectorActiveAreaTLHCPosition	FD	3	\N	2014-10-27 22:02:53.772427
1071	Detector Active Area Orientation	Registry of DICOM Data Elements	24	24	38232	38232	DetectorActiveAreaOrientation	FD	6	\N	2014-10-27 22:02:53.775548
1072	Positioner Primary Angle Direction	Registry of DICOM Data Elements	24	24	38233	38233	PositionerPrimaryAngleDirection	CS	1	\N	2014-10-27 22:02:53.778665
1073	Diffusion b-matrix Sequence	Registry of DICOM Data Elements	24	24	38401	38401	DiffusionBMatrixSequence	SQ	1		2014-10-27 22:02:53.781816
1074	Diffusion b-value XX	Registry of DICOM Data Elements	24	24	38402	38402	DiffusionBValueXX	FD	1		2014-10-27 22:02:53.784963
1075	Diffusion b-value XY	Registry of DICOM Data Elements	24	24	38403	38403	DiffusionBValueXY	FD	1		2014-10-27 22:02:53.788257
1076	Diffusion b-value XZ	Registry of DICOM Data Elements	24	24	38404	38404	DiffusionBValueXZ	FD	1		2014-10-27 22:02:53.791367
1077	Diffusion b-value YY	Registry of DICOM Data Elements	24	24	38405	38405	DiffusionBValueYY	FD	1		2014-10-27 22:02:53.794486
1078	Diffusion b-value YZ	Registry of DICOM Data Elements	24	24	38406	38406	DiffusionBValueYZ	FD	1		2014-10-27 22:02:53.797607
1079	Diffusion b-value ZZ	Registry of DICOM Data Elements	24	24	38407	38407	DiffusionBValueZZ	FD	1		2014-10-27 22:02:53.800739
1080	Decay Correction DateTime	Registry of DICOM Data Elements	24	24	38657	38657	DecayCorrectionDateTime	DT	1		2014-10-27 22:02:53.803862
1081	Start Density Threshold	Registry of DICOM Data Elements	24	24	38677	38677	StartDensityThreshold	FD	1		2014-10-27 22:02:53.807406
1082	Start Relative Density Difference Threshold	Registry of DICOM Data Elements	24	24	38678	38678	StartRelativeDensityDifferenceThreshold	FD	1		2014-10-27 22:02:53.810527
1083	Start Cardiac Trigger Count Threshold	Registry of DICOM Data Elements	24	24	38679	38679	StartCardiacTriggerCountThreshold	FD	1		2014-10-27 22:02:53.813653
1084	Start Respiratory Trigger Count Threshold	Registry of DICOM Data Elements	24	24	38680	38680	StartRespiratoryTriggerCountThreshold	FD	1		2014-10-27 22:02:53.816813
1085	Termination Counts Threshold	Registry of DICOM Data Elements	24	24	38681	38681	TerminationCountsThreshold	FD	1		2014-10-27 22:02:53.819934
1086	Termination Density Threshold	Registry of DICOM Data Elements	24	24	38688	38688	TerminationDensityThreshold	FD	1		2014-10-27 22:02:53.823064
1087	Termination Relative Density Threshold	Registry of DICOM Data Elements	24	24	38689	38689	TerminationRelativeDensityThreshold	FD	1		2014-10-27 22:02:53.826178
1088	Termination Time Threshold	Registry of DICOM Data Elements	24	24	38690	38690	TerminationTimeThreshold	FD	1		2014-10-27 22:02:53.829439
1089	Termination Cardiac Trigger Count Threshold	Registry of DICOM Data Elements	24	24	38691	38691	TerminationCardiacTriggerCountThreshold	FD	1		2014-10-27 22:02:53.832655
1090	Termination Respiratory Trigger Count Threshold	Registry of DICOM Data Elements	24	24	38692	38692	TerminationRespiratoryTriggerCountThreshold	FD	1		2014-10-27 22:02:53.835819
1091	Detector Geometry	Registry of DICOM Data Elements	24	24	38693	38693	DetectorGeometry	CS	1		2014-10-27 22:02:53.838918
1092	Transverse Detector Separation	Registry of DICOM Data Elements	24	24	38694	38694	TransverseDetectorSeparation	FD	1		2014-10-27 22:02:53.842568
1093	Axial Detector Dimension	Registry of DICOM Data Elements	24	24	38695	38695	AxialDetectorDimension	FD	1		2014-10-27 22:02:53.845697
1094	Radiopharmaceutical Agent Number	Registry of DICOM Data Elements	24	24	38697	38697	RadiopharmaceuticalAgentNumber	US	1		2014-10-27 22:02:53.848829
1095	PET Frame Acquisition Sequence	Registry of DICOM Data Elements	24	24	38706	38706	PETFrameAcquisitionSequence	SQ	1		2014-10-27 22:02:53.851963
1096	PET Detector Motion Details Sequence	Registry of DICOM Data Elements	24	24	38707	38707	PETDetectorMotionDetailsSequence	SQ	1		2014-10-27 22:02:53.855095
1097	PET Table Dynamics Sequence	Registry of DICOM Data Elements	24	24	38708	38708	PETTableDynamicsSequence	SQ	1		2014-10-27 22:02:53.858238
1098	PET Position Sequence	Registry of DICOM Data Elements	24	24	38709	38709	PETPositionSequence	SQ	1		2014-10-27 22:02:53.861383
1099	PET Frame Correction Factors Sequence	Registry of DICOM Data Elements	24	24	38710	38710	PETFrameCorrectionFactorsSequence	SQ	1		2014-10-27 22:02:53.864508
1100	Radiopharmaceutical Usage Sequence	Registry of DICOM Data Elements	24	24	38711	38711	RadiopharmaceuticalUsageSequence	SQ	1		2014-10-27 22:02:53.867638
1101	Attenuation Correction Source	Registry of DICOM Data Elements	24	24	38712	38712	AttenuationCorrectionSource	CS	1		2014-10-27 22:02:53.870792
1102	Number of Iterations	Registry of DICOM Data Elements	24	24	38713	38713	NumberOfIterations	US	1		2014-10-27 22:02:53.873961
1103	Number of Subsets	Registry of DICOM Data Elements	24	24	38720	38720	NumberOfSubsets	US	1		2014-10-27 22:02:53.877661
1104	PET Reconstruction Sequence	Registry of DICOM Data Elements	24	24	38729	38729	PETReconstructionSequence	SQ	1		2014-10-27 22:02:53.8808
1105	PET Frame Type Sequence	Registry of DICOM Data Elements	24	24	38737	38737	PETFrameTypeSequence	SQ	1		2014-10-27 22:02:53.883929
1106	Time of Flight Information Used	Registry of DICOM Data Elements	24	24	38741	38741	TimeOfFlightInformationUsed	CS	1		2014-10-27 22:02:53.887022
1107	Reconstruction Type	Registry of DICOM Data Elements	24	24	38742	38742	ReconstructionType	CS	1		2014-10-27 22:02:53.890123
1108	Decay Corrected	Registry of DICOM Data Elements	24	24	38744	38744	DecayCorrected	CS	1		2014-10-27 22:02:53.89324
1109	Attenuation Corrected	Registry of DICOM Data Elements	24	24	38745	38745	AttenuationCorrected	CS	1		2014-10-27 22:02:53.896416
1110	Scatter Corrected	Registry of DICOM Data Elements	24	24	38752	38752	ScatterCorrected	CS	1		2014-10-27 22:02:53.899591
1111	Dead Time Corrected	Registry of DICOM Data Elements	24	24	38753	38753	DeadTimeCorrected	CS	1		2014-10-27 22:02:53.902684
1112	Gantry Motion Corrected	Registry of DICOM Data Elements	24	24	38754	38754	GantryMotionCorrected	CS	1		2014-10-27 22:02:53.905856
1113	Patient Motion Corrected	Registry of DICOM Data Elements	24	24	38755	38755	PatientMotionCorrected	CS	1		2014-10-27 22:02:53.909139
1114	Count Loss Normalization Corrected	Registry of DICOM Data Elements	24	24	38756	38756	CountLossNormalizationCorrected	CS	1		2014-10-27 22:02:53.912796
1115	Randoms Corrected	Registry of DICOM Data Elements	24	24	38757	38757	RandomsCorrected	CS	1		2014-10-27 22:02:53.915931
1116	Non-uniform Radial Sampling Corrected	Registry of DICOM Data Elements	24	24	38758	38758	NonUniformRadialSamplingCorrected	CS	1		2014-10-27 22:02:53.919044
1117	Sensitivity Calibrated	Registry of DICOM Data Elements	24	24	38759	38759	SensitivityCalibrated	CS	1		2014-10-27 22:02:53.922189
1118	Detector Normalization Correction	Registry of DICOM Data Elements	24	24	38760	38760	DetectorNormalizationCorrection	CS	1		2014-10-27 22:02:53.92535
1119	Iterative Reconstruction Method	Registry of DICOM Data Elements	24	24	38761	38761	IterativeReconstructionMethod	CS	1		2014-10-27 22:02:53.928512
1120	Attenuation Correction Temporal Relationship	Registry of DICOM Data Elements	24	24	38768	38768	AttenuationCorrectionTemporalRelationship	CS	1		2014-10-27 22:02:53.931634
1121	Patient Physiological State Sequence	Registry of DICOM Data Elements	24	24	38769	38769	PatientPhysiologicalStateSequence	SQ	1		2014-10-27 22:02:53.934757
1122	Patient Physiological State Code Sequence	Registry of DICOM Data Elements	24	24	38770	38770	PatientPhysiologicalStateCodeSequence	SQ	1		2014-10-27 22:02:53.937913
1123	Depth(s) of Focus	Registry of DICOM Data Elements	24	24	38913	38913	DepthsOfFocus	FD	1-n		2014-10-27 22:02:53.941088
1124	Excluded Intervals Sequence	Registry of DICOM Data Elements	24	24	38915	38915	ExcludedIntervalsSequence	SQ	1		2014-10-27 22:02:53.944312
1125	Exclusion Start DateTime	Registry of DICOM Data Elements	24	24	38916	38916	ExclusionStartDateTime	DT	1		2014-10-27 22:02:53.947918
1126	Exclusion Duration	Registry of DICOM Data Elements	24	24	38917	38917	ExclusionDuration	FD	1		2014-10-27 22:02:53.951042
1127	US Image Description Sequence	Registry of DICOM Data Elements	24	24	38918	38918	USImageDescriptionSequence	SQ	1		2014-10-27 22:02:53.954156
1128	Image Data Type Sequence	Registry of DICOM Data Elements	24	24	38919	38919	ImageDataTypeSequence	SQ	1		2014-10-27 22:02:53.957372
1129	Data Type	Registry of DICOM Data Elements	24	24	38920	38920	DataType	CS	1		2014-10-27 22:02:53.960523
1130	Transducer Scan Pattern Code Sequence	Registry of DICOM Data Elements	24	24	38921	38921	TransducerScanPatternCodeSequence	SQ	1		2014-10-27 22:02:53.96366
1131	Aliased Data Type	Registry of DICOM Data Elements	24	24	38923	38923	AliasedDataType	CS	1		2014-10-27 22:02:53.966775
1132	Position Measuring Device Used	Registry of DICOM Data Elements	24	24	38924	38924	PositionMeasuringDeviceUsed	CS	1		2014-10-27 22:02:53.969928
1133	Transducer Geometry Code Sequence	Registry of DICOM Data Elements	24	24	38925	38925	TransducerGeometryCodeSequence	SQ	1		2014-10-27 22:02:53.973051
1134	Transducer Beam Steering Code Sequence	Registry of DICOM Data Elements	24	24	38926	38926	TransducerBeamSteeringCodeSequence	SQ	1		2014-10-27 22:02:53.976239
1135	Transducer Application Code Sequence	Registry of DICOM Data Elements	24	24	38927	38927	TransducerApplicationCodeSequence	SQ	1		2014-10-27 22:02:53.979477
1136	Zero Velocity Pixel Value	Registry of DICOM Data Elements	24	24	38928	38928	ZeroVelocityPixelValue	US or SS	1		2014-10-27 22:02:53.983092
1137	Contributing Equipment Sequence	Registry of DICOM Data Elements	24	24	40961	40961	ContributingEquipmentSequence	SQ	1		2014-10-27 22:02:53.986217
1138	Contribution DateTime	Registry of DICOM Data Elements	24	24	40962	40962	ContributionDateTime	DT	1		2014-10-27 22:02:53.989327
1139	Contribution Description	Registry of DICOM Data Elements	24	24	40963	40963	ContributionDescription	ST	1		2014-10-27 22:02:53.992488
1140	Study Instance UID	Registry of DICOM Data Elements	32	32	13	13	StudyInstanceUID	UI	1		2014-10-27 22:02:53.995647
1141	Series Instance UID	Registry of DICOM Data Elements	32	32	14	14	SeriesInstanceUID	UI	1		2014-10-27 22:02:53.99889
1142	Study ID	Registry of DICOM Data Elements	32	32	16	16	StudyID	SH	1		2014-10-27 22:02:54.002127
1143	Series Number	Registry of DICOM Data Elements	32	32	17	17	SeriesNumber	IS	1		2014-10-27 22:02:54.00529
1144	Acquisition Number	Registry of DICOM Data Elements	32	32	18	18	AcquisitionNumber	IS	1		2014-10-27 22:02:54.00846
1145	Instance Number	Registry of DICOM Data Elements	32	32	19	19	InstanceNumber	IS	1		2014-10-27 22:02:54.011675
1146	Isotope Number	Registry of DICOM Data Elements	32	32	20	20	IsotopeNumber	IS	1	RET	2014-10-27 22:02:54.014836
1147	Phase Number	Registry of DICOM Data Elements	32	32	21	21	PhaseNumber	IS	1	RET	2014-10-27 22:02:54.018445
1148	Interval Number	Registry of DICOM Data Elements	32	32	22	22	IntervalNumber	IS	1	RET	2014-10-27 22:02:54.021555
1149	Time Slot Number	Registry of DICOM Data Elements	32	32	23	23	TimeSlotNumber	IS	1	RET	2014-10-27 22:02:54.024733
1150	Angle Number	Registry of DICOM Data Elements	32	32	24	24	AngleNumber	IS	1	RET	2014-10-27 22:02:54.027854
1151	Item Number	Registry of DICOM Data Elements	32	32	25	25	ItemNumber	IS	1		2014-10-27 22:02:54.030923
1152	Patient Orientation	Registry of DICOM Data Elements	32	32	32	32	PatientOrientation	CS	2		2014-10-27 22:02:54.034038
1153	Overlay Number	Registry of DICOM Data Elements	32	32	34	34	OverlayNumber	IS	1	RET	2014-10-27 22:02:54.037329
1154	Curve Number	Registry of DICOM Data Elements	32	32	36	36	CurveNumber	IS	1	RET	2014-10-27 22:02:54.040535
1155	LUT Number	Registry of DICOM Data Elements	32	32	38	38	LUTNumber	IS	1	RET	2014-10-27 22:02:54.043673
1157	Image Position (Patient)	Registry of DICOM Data Elements	32	32	50	50	ImagePositionPatient	DS	3		2014-10-27 22:02:54.050054
1158	Image Orientation	Registry of DICOM Data Elements	32	32	53	53	ImageOrientation	DS	6	RET	2014-10-27 22:02:54.053807
1159	Image Orientation (Patient)	Registry of DICOM Data Elements	32	32	55	55	ImageOrientationPatient	DS	6		2014-10-27 22:02:54.057018
1160	Location	Registry of DICOM Data Elements	32	32	80	80	Location	DS	1	RET	2014-10-27 22:02:54.06024
1161	Frame of Reference UID	Registry of DICOM Data Elements	32	32	82	82	FrameOfReferenceUID	UI	1		2014-10-27 22:02:54.063346
1162	Laterality	Registry of DICOM Data Elements	32	32	96	96	Laterality	CS	1		2014-10-27 22:02:54.06669
1163	Image Laterality	Registry of DICOM Data Elements	32	32	98	98	ImageLaterality	CS	1		2014-10-27 22:02:54.069847
1164	Image Geometry Type	Registry of DICOM Data Elements	32	32	112	112	ImageGeometryType	LO	1	RET	2014-10-27 22:02:54.073006
1165	Masking Image	Registry of DICOM Data Elements	32	32	128	128	MaskingImage	CS	1-n	RET	2014-10-27 22:02:54.076227
1166	Report Number	Registry of DICOM Data Elements	32	32	170	170	ReportNumber	IS	1	RET	2014-10-27 22:02:54.079348
1167	Temporal Position Identifier	Registry of DICOM Data Elements	32	32	256	256	TemporalPositionIdentifier	IS	1		2014-10-27 22:02:54.082531
1168	Number of Temporal Positions	Registry of DICOM Data Elements	32	32	261	261	NumberOfTemporalPositions	IS	1		2014-10-27 22:02:54.085773
1169	Temporal Resolution	Registry of DICOM Data Elements	32	32	272	272	TemporalResolution	DS	1		2014-10-27 22:02:54.089471
1170	Synchronization Frame of Reference UID	Registry of DICOM Data Elements	32	32	512	512	SynchronizationFrameOfReferenceUID	UI	1		2014-10-27 22:02:54.092622
1171	SOP Instance UID of Concatenation Source	Registry of DICOM Data Elements	32	32	578	578	SOPInstanceUIDOfConcatenationSource	UI	1		2014-10-27 22:02:54.095767
1172	Series in Study	Registry of DICOM Data Elements	32	32	4096	4096	SeriesInStudy	IS	1	RET	2014-10-27 22:02:54.098986
1173	Acquisitions in Series	Registry of DICOM Data Elements	32	32	4097	4097	AcquisitionsInSeries	IS	1	RET	2014-10-27 22:02:54.102107
1174	Images in Acquisition	Registry of DICOM Data Elements	32	32	4098	4098	ImagesInAcquisition	IS	1		2014-10-27 22:02:54.105293
1175	Images in Series	Registry of DICOM Data Elements	32	32	4099	4099	ImagesInSeries	IS	1	RET	2014-10-27 22:02:54.108467
1176	Acquisitions in Study	Registry of DICOM Data Elements	32	32	4100	4100	AcquisitionsInStudy	IS	1	RET	2014-10-27 22:02:54.111663
1177	Images in Study	Registry of DICOM Data Elements	32	32	4101	4101	ImagesInStudy	IS	1	RET	2014-10-27 22:02:54.114811
1178	Reference	Registry of DICOM Data Elements	32	32	4128	4128	Reference	LO	1-n	RET	2014-10-27 22:02:54.118024
1179	Position Reference Indicator	Registry of DICOM Data Elements	32	32	4160	4160	PositionReferenceIndicator	LO	1		2014-10-27 22:02:54.122441
1180	Slice Location	Registry of DICOM Data Elements	32	32	4161	4161	SliceLocation	DS	1		2014-10-27 22:02:54.12563
1181	Other Study Numbers	Registry of DICOM Data Elements	32	32	4208	4208	OtherStudyNumbers	IS	1-n	RET	2014-10-27 22:02:54.128783
1182	Number of Patient Related Studies	Registry of DICOM Data Elements	32	32	4608	4608	NumberOfPatientRelatedStudies	IS	1		2014-10-27 22:02:54.131917
1183	Number of Patient Related Series	Registry of DICOM Data Elements	32	32	4610	4610	NumberOfPatientRelatedSeries	IS	1		2014-10-27 22:02:54.135063
1184	Number of Patient Related Instances	Registry of DICOM Data Elements	32	32	4612	4612	NumberOfPatientRelatedInstances	IS	1		2014-10-27 22:02:54.138205
1185	Number of Study Related Series	Registry of DICOM Data Elements	32	32	4614	4614	NumberOfStudyRelatedSeries	IS	1		2014-10-27 22:02:54.141444
1186	Number of Study Related Instances	Registry of DICOM Data Elements	32	32	4616	4616	NumberOfStudyRelatedInstances	IS	1		2014-10-27 22:02:54.144579
1187	Number of Series Related Instances	Registry of DICOM Data Elements	32	32	4617	4617	NumberOfSeriesRelatedInstances	IS	1		2014-10-27 22:02:54.147707
1188	Source Image IDs	Registry of DICOM Data Elements	32	32	12544	12799	SourceImageIDs	CS	1-n	RET	2014-10-27 22:02:54.150814
1189	Modifying Device ID	Registry of DICOM Data Elements	32	32	13313	13313	ModifyingDeviceID	CS	1	RET	2014-10-27 22:02:54.153956
1190	Modified Image ID	Registry of DICOM Data Elements	32	32	13314	13314	ModifiedImageID	CS	1	RET	2014-10-27 22:02:54.157516
1191	Modified Image Date	Registry of DICOM Data Elements	32	32	13315	13315	ModifiedImageDate	DA	1	RET	2014-10-27 22:02:54.16072
1192	Modifying Device Manufacturer	Registry of DICOM Data Elements	32	32	13316	13316	ModifyingDeviceManufacturer	LO	1	RET	2014-10-27 22:02:54.163883
1193	Modified Image Time	Registry of DICOM Data Elements	32	32	13317	13317	ModifiedImageTime	TM	1	RET	2014-10-27 22:02:54.167012
1194	Modified Image Description	Registry of DICOM Data Elements	32	32	13318	13318	ModifiedImageDescription	LO	1	RET	2014-10-27 22:02:54.170123
1195	Image Comments	Registry of DICOM Data Elements	32	32	16384	16384	ImageComments	LT	1		2014-10-27 22:02:54.173255
1196	Original Image Identification	Registry of DICOM Data Elements	32	32	20480	20480	OriginalImageIdentification	AT	1-n	RET	2014-10-27 22:02:54.176397
1197	Original Image Identification Nomenclature	Registry of DICOM Data Elements	32	32	20482	20482	OriginalImageIdentificationNomenclature	LO	1-n	RET	2014-10-27 22:02:54.179552
1198	Stack ID	Registry of DICOM Data Elements	32	32	36950	36950	StackID	SH	1		2014-10-27 22:02:54.182707
1199	In-Stack Position Number	Registry of DICOM Data Elements	32	32	36951	36951	InStackPositionNumber	UL	1		2014-10-27 22:02:54.185837
1200	Frame Anatomy Sequence	Registry of DICOM Data Elements	32	32	36977	36977	FrameAnatomySequence	SQ	1		2014-10-27 22:02:54.18897
1201	Frame Laterality	Registry of DICOM Data Elements	32	32	36978	36978	FrameLaterality	CS	1		2014-10-27 22:02:54.192559
1202	Frame Content Sequence	Registry of DICOM Data Elements	32	32	37137	37137	FrameContentSequence	SQ	1		2014-10-27 22:02:54.195758
1203	Plane Position Sequence	Registry of DICOM Data Elements	32	32	37139	37139	PlanePositionSequence	SQ	1		2014-10-27 22:02:54.198878
1204	Plane Orientation Sequence	Registry of DICOM Data Elements	32	32	37142	37142	PlaneOrientationSequence	SQ	1		2014-10-27 22:02:54.20204
1205	Temporal Position Index	Registry of DICOM Data Elements	32	32	37160	37160	TemporalPositionIndex	UL	1		2014-10-27 22:02:54.205251
1206	Nominal Cardiac Trigger Delay Time	Registry of DICOM Data Elements	32	32	37203	37203	NominalCardiacTriggerDelayTime	FD	1		2014-10-27 22:02:54.208411
1207	Nominal Cardiac Trigger Time Prior To R-Peak	Registry of DICOM Data Elements	32	32	37204	37204	NominalCardiacTriggerTimePriorToRPeak	FL	1		2014-10-27 22:02:54.211568
1208	Actual Cardiac Trigger Time Prior To R-Peak	Registry of DICOM Data Elements	32	32	37205	37205	ActualCardiacTriggerTimePriorToRPeak	FL	1		2014-10-27 22:02:54.214701
1209	Frame Acquisition Number	Registry of DICOM Data Elements	32	32	37206	37206	FrameAcquisitionNumber	US	1		2014-10-27 22:02:54.217829
1210	Dimension Index Values	Registry of DICOM Data Elements	32	32	37207	37207	DimensionIndexValues	UL	1-n		2014-10-27 22:02:54.220995
1211	Frame Comments	Registry of DICOM Data Elements	32	32	37208	37208	FrameComments	LT	1		2014-10-27 22:02:54.224168
1212	Concatenation UID	Registry of DICOM Data Elements	32	32	37217	37217	ConcatenationUID	UI	1		2014-10-27 22:02:54.227747
1213	In-concatenation Number	Registry of DICOM Data Elements	32	32	37218	37218	InConcatenationNumber	US	1		2014-10-27 22:02:54.231003
1214	In-concatenation Total Number	Registry of DICOM Data Elements	32	32	37219	37219	InConcatenationTotalNumber	US	1		2014-10-27 22:02:54.234149
1215	Dimension Organization UID	Registry of DICOM Data Elements	32	32	37220	37220	DimensionOrganizationUID	UI	1		2014-10-27 22:02:54.237416
1216	Dimension Index Pointer	Registry of DICOM Data Elements	32	32	37221	37221	DimensionIndexPointer	AT	1		2014-10-27 22:02:54.240741
1217	Functional Group Pointer	Registry of DICOM Data Elements	32	32	37223	37223	FunctionalGroupPointer	AT	1		2014-10-27 22:02:54.24391
1218	Unassigned Shared Converted Attributes Sequence	Registry of DICOM Data Elements	32	32	37232	37232	UnassignedSharedConvertedAttributesSequence	SQ	1		2014-10-27 22:02:54.247037
1219	Unassigned Per-Frame Converted Attributes Sequence	Registry of DICOM Data Elements	32	32	37233	37233	UnassignedPerFrameConvertedAttributesSequence	SQ	1		2014-10-27 22:02:54.250161
1220	Conversion Source Attributes Sequence	Registry of DICOM Data Elements	32	32	37234	37234	ConversionSourceAttributesSequence	SQ	1		2014-10-27 22:02:54.253369
1221	Dimension Index Private Creator	Registry of DICOM Data Elements	32	32	37395	37395	DimensionIndexPrivateCreator	LO	1		2014-10-27 22:02:54.256528
1222	Dimension Organization Sequence	Registry of DICOM Data Elements	32	32	37409	37409	DimensionOrganizationSequence	SQ	1		2014-10-27 22:02:54.25982
1223	Dimension Index Sequence	Registry of DICOM Data Elements	32	32	37410	37410	DimensionIndexSequence	SQ	1		2014-10-27 22:02:54.26348
1224	Concatenation Frame Offset Number	Registry of DICOM Data Elements	32	32	37416	37416	ConcatenationFrameOffsetNumber	UL	1		2014-10-27 22:02:54.266577
1225	Functional Group Private Creator	Registry of DICOM Data Elements	32	32	37432	37432	FunctionalGroupPrivateCreator	LO	1		2014-10-27 22:02:54.26975
1226	Nominal Percentage of Cardiac Phase	Registry of DICOM Data Elements	32	32	37441	37441	NominalPercentageOfCardiacPhase	FL	1		2014-10-27 22:02:54.27293
1227	Nominal Percentage of Respiratory Phase	Registry of DICOM Data Elements	32	32	37445	37445	NominalPercentageOfRespiratoryPhase	FL	1		2014-10-27 22:02:54.276207
1228	Starting Respiratory Amplitude	Registry of DICOM Data Elements	32	32	37446	37446	StartingRespiratoryAmplitude	FL	1		2014-10-27 22:02:54.279346
1229	Starting Respiratory Phase	Registry of DICOM Data Elements	32	32	37447	37447	StartingRespiratoryPhase	CS	1		2014-10-27 22:02:54.282499
1230	Ending Respiratory Amplitude	Registry of DICOM Data Elements	32	32	37448	37448	EndingRespiratoryAmplitude	FL	1		2014-10-27 22:02:54.285786
1231	Ending Respiratory Phase	Registry of DICOM Data Elements	32	32	37449	37449	EndingRespiratoryPhase	CS	1		2014-10-27 22:02:54.289093
1232	Respiratory Trigger Type	Registry of DICOM Data Elements	32	32	37456	37456	RespiratoryTriggerType	CS	1		2014-10-27 22:02:54.29231
1233	R-R Interval Time Nominal	Registry of DICOM Data Elements	32	32	37457	37457	RRIntervalTimeNominal	FD	1		2014-10-27 22:02:54.295537
1234	Actual Cardiac Trigger Delay Time	Registry of DICOM Data Elements	32	32	37458	37458	ActualCardiacTriggerDelayTime	FD	1		2014-10-27 22:02:54.299194
1235	Respiratory Synchronization Sequence	Registry of DICOM Data Elements	32	32	37459	37459	RespiratorySynchronizationSequence	SQ	1		2014-10-27 22:02:54.302356
1236	Respiratory Interval Time	Registry of DICOM Data Elements	32	32	37460	37460	RespiratoryIntervalTime	FD	1		2014-10-27 22:02:54.305492
1237	Nominal Respiratory Trigger Delay Time	Registry of DICOM Data Elements	32	32	37461	37461	NominalRespiratoryTriggerDelayTime	FD	1		2014-10-27 22:02:54.308682
1238	Respiratory Trigger Delay Threshold	Registry of DICOM Data Elements	32	32	37462	37462	RespiratoryTriggerDelayThreshold	FD	1		2014-10-27 22:02:54.311977
1239	Actual Respiratory Trigger Delay Time	Registry of DICOM Data Elements	32	32	37463	37463	ActualRespiratoryTriggerDelayTime	FD	1		2014-10-27 22:02:54.315148
1240	Image Position (Volume)	Registry of DICOM Data Elements	32	32	37633	37633	ImagePositionVolume	FD	3		2014-10-27 22:02:54.318286
1241	Image Orientation (Volume)	Registry of DICOM Data Elements	32	32	37634	37634	ImageOrientationVolume	FD	6		2014-10-27 22:02:54.321462
1242	Ultrasound Acquisition Geometry	Registry of DICOM Data Elements	32	32	37639	37639	UltrasoundAcquisitionGeometry	CS	1		2014-10-27 22:02:54.324643
1243	Apex Position	Registry of DICOM Data Elements	32	32	37640	37640	ApexPosition	FD	3		2014-10-27 22:02:54.32779
1244	Volume to Transducer Mapping Matrix	Registry of DICOM Data Elements	32	32	37641	37641	VolumeToTransducerMappingMatrix	FD	16		2014-10-27 22:02:54.330995
1245	Volume to Table Mapping Matrix	Registry of DICOM Data Elements	32	32	37642	37642	VolumeToTableMappingMatrix	FD	16		2014-10-27 22:02:54.334648
1246	Volume to Transducer Relationship	Registry of DICOM Data Elements	32	32	37643	37643	VolumeToTransducerRelationship	CS	1		2014-10-27 22:02:54.33782
1247	Patient Frame of Reference Source	Registry of DICOM Data Elements	32	32	37644	37644	PatientFrameOfReferenceSource	CS	1		2014-10-27 22:02:54.341001
1248	Temporal Position Time Offset	Registry of DICOM Data Elements	32	32	37645	37645	TemporalPositionTimeOffset	FD	1		2014-10-27 22:02:54.344389
1249	Plane Position (Volume) Sequence	Registry of DICOM Data Elements	32	32	37646	37646	PlanePositionVolumeSequence	SQ	1		2014-10-27 22:02:54.347553
1250	Plane Orientation (Volume) Sequence	Registry of DICOM Data Elements	32	32	37647	37647	PlaneOrientationVolumeSequence	SQ	1		2014-10-27 22:02:54.350682
1251	Temporal Position Sequence	Registry of DICOM Data Elements	32	32	37648	37648	TemporalPositionSequence	SQ	1		2014-10-27 22:02:54.353856
1252	Dimension Organization Type	Registry of DICOM Data Elements	32	32	37649	37649	DimensionOrganizationType	CS	1		2014-10-27 22:02:54.357058
1253	Volume Frame of Reference UID	Registry of DICOM Data Elements	32	32	37650	37650	VolumeFrameOfReferenceUID	UI	1		2014-10-27 22:02:54.36021
1254	Table Frame of Reference UID	Registry of DICOM Data Elements	32	32	37651	37651	TableFrameOfReferenceUID	UI	1		2014-10-27 22:02:54.363418
1255	Dimension Description Label	Registry of DICOM Data Elements	32	32	37921	37921	DimensionDescriptionLabel	LO	1		2014-10-27 22:02:54.366641
1256	Patient Orientation in Frame Sequence	Registry of DICOM Data Elements	32	32	37968	37968	PatientOrientationInFrameSequence	SQ	1		2014-10-27 22:02:54.370292
1257	Frame Label	Registry of DICOM Data Elements	32	32	37971	37971	FrameLabel	LO	1		2014-10-27 22:02:54.373443
1258	Acquisition Index	Registry of DICOM Data Elements	32	32	38168	38168	AcquisitionIndex	US	1-n		2014-10-27 22:02:54.376609
1259	Contributing SOP Instances Reference Sequence	Registry of DICOM Data Elements	32	32	38185	38185	ContributingSOPInstancesReferenceSequence	SQ	1		2014-10-27 22:02:54.379783
1260	Reconstruction Index	Registry of DICOM Data Elements	32	32	38198	38198	ReconstructionIndex	US	1		2014-10-27 22:02:54.382908
1261	Light Path Filter Pass-Through Wavelength	Registry of DICOM Data Elements	34	34	1	1	LightPathFilterPassThroughWavelength	US	1		2014-10-27 22:02:54.386072
1262	Light Path Filter Pass Band	Registry of DICOM Data Elements	34	34	2	2	LightPathFilterPassBand	US	2		2014-10-27 22:02:54.389212
1263	Image Path Filter Pass-Through Wavelength	Registry of DICOM Data Elements	34	34	3	3	ImagePathFilterPassThroughWavelength	US	1		2014-10-27 22:02:54.392394
1264	Image Path Filter Pass Band	Registry of DICOM Data Elements	34	34	4	4	ImagePathFilterPassBand	US	2		2014-10-27 22:02:54.3956
1265	Patient Eye Movement Commanded	Registry of DICOM Data Elements	34	34	5	5	PatientEyeMovementCommanded	CS	1		2014-10-27 22:02:54.398836
1266	Patient Eye Movement Command Code Sequence	Registry of DICOM Data Elements	34	34	6	6	PatientEyeMovementCommandCodeSequence	SQ	1		2014-10-27 22:02:54.402081
1267	Spherical Lens Power	Registry of DICOM Data Elements	34	34	7	7	SphericalLensPower	FL	1		2014-10-27 22:02:54.405717
1268	Cylinder Lens Power	Registry of DICOM Data Elements	34	34	8	8	CylinderLensPower	FL	1		2014-10-27 22:02:54.408876
1269	Cylinder Axis	Registry of DICOM Data Elements	34	34	9	9	CylinderAxis	FL	1		2014-10-27 22:02:54.412058
1270	Emmetropic Magnification	Registry of DICOM Data Elements	34	34	10	10	EmmetropicMagnification	FL	1		2014-10-27 22:02:54.415186
1271	Intra Ocular Pressure	Registry of DICOM Data Elements	34	34	11	11	IntraOcularPressure	FL	1		2014-10-27 22:02:54.418305
1272	Horizontal Field of View	Registry of DICOM Data Elements	34	34	12	12	HorizontalFieldOfView	FL	1		2014-10-27 22:02:54.421459
1273	Pupil Dilated	Registry of DICOM Data Elements	34	34	13	13	PupilDilated	CS	1		2014-10-27 22:02:54.424611
1274	Degree of Dilation	Registry of DICOM Data Elements	34	34	14	14	DegreeOfDilation	FL	1		2014-10-27 22:02:54.427873
1275	Stereo Baseline Angle	Registry of DICOM Data Elements	34	34	16	16	StereoBaselineAngle	FL	1		2014-10-27 22:02:54.431133
1276	Stereo Baseline Displacement	Registry of DICOM Data Elements	34	34	17	17	StereoBaselineDisplacement	FL	1		2014-10-27 22:02:54.434362
1277	Stereo Horizontal Pixel Offset	Registry of DICOM Data Elements	34	34	18	18	StereoHorizontalPixelOffset	FL	1		2014-10-27 22:02:54.437599
1278	Stereo Vertical Pixel Offset	Registry of DICOM Data Elements	34	34	19	19	StereoVerticalPixelOffset	FL	1		2014-10-27 22:02:54.441267
1279	Stereo Rotation	Registry of DICOM Data Elements	34	34	20	20	StereoRotation	FL	1		2014-10-27 22:02:54.444456
1280	Acquisition Device Type Code Sequence	Registry of DICOM Data Elements	34	34	21	21	AcquisitionDeviceTypeCodeSequence	SQ	1		2014-10-27 22:02:54.447573
1281	Illumination Type Code Sequence	Registry of DICOM Data Elements	34	34	22	22	IlluminationTypeCodeSequence	SQ	1		2014-10-27 22:02:54.450716
1282	Light Path Filter Type Stack Code Sequence	Registry of DICOM Data Elements	34	34	23	23	LightPathFilterTypeStackCodeSequence	SQ	1		2014-10-27 22:02:54.453871
1283	Image Path Filter Type Stack Code Sequence	Registry of DICOM Data Elements	34	34	24	24	ImagePathFilterTypeStackCodeSequence	SQ	1		2014-10-27 22:02:54.457033
1284	Lenses Code Sequence	Registry of DICOM Data Elements	34	34	25	25	LensesCodeSequence	SQ	1		2014-10-27 22:02:54.460256
1285	Channel Description Code Sequence	Registry of DICOM Data Elements	34	34	26	26	ChannelDescriptionCodeSequence	SQ	1		2014-10-27 22:02:54.463402
1286	Refractive State Sequence	Registry of DICOM Data Elements	34	34	27	27	RefractiveStateSequence	SQ	1		2014-10-27 22:02:54.466532
1287	Mydriatic Agent Code Sequence	Registry of DICOM Data Elements	34	34	28	28	MydriaticAgentCodeSequence	SQ	1		2014-10-27 22:02:54.469706
1288	Relative Image Position Code Sequence	Registry of DICOM Data Elements	34	34	29	29	RelativeImagePositionCodeSequence	SQ	1		2014-10-27 22:02:54.472901
1289	Camera Angle of View	Registry of DICOM Data Elements	34	34	30	30	CameraAngleOfView	FL	1		2014-10-27 22:02:54.476599
1290	Stereo Pairs Sequence	Registry of DICOM Data Elements	34	34	32	32	StereoPairsSequence	SQ	1		2014-10-27 22:02:54.480686
1291	Left Image Sequence	Registry of DICOM Data Elements	34	34	33	33	LeftImageSequence	SQ	1		2014-10-27 22:02:54.483884
1292	Right Image Sequence	Registry of DICOM Data Elements	34	34	34	34	RightImageSequence	SQ	1		2014-10-27 22:02:54.486998
1293	Axial Length of the Eye	Registry of DICOM Data Elements	34	34	48	48	AxialLengthOfTheEye	FL	1		2014-10-27 22:02:54.490117
1294	Ophthalmic Frame Location Sequence	Registry of DICOM Data Elements	34	34	49	49	OphthalmicFrameLocationSequence	SQ	1		2014-10-27 22:02:54.493306
1295	Reference Coordinates	Registry of DICOM Data Elements	34	34	50	50	ReferenceCoordinates	FL	2-2n		2014-10-27 22:02:54.49646
1296	Depth Spatial Resolution	Registry of DICOM Data Elements	34	34	53	53	DepthSpatialResolution	FL	1		2014-10-27 22:02:54.499729
1297	Maximum Depth Distortion	Registry of DICOM Data Elements	34	34	54	54	MaximumDepthDistortion	FL	1		2014-10-27 22:02:54.502912
1298	Along-scan Spatial Resolution	Registry of DICOM Data Elements	34	34	55	55	AlongScanSpatialResolution	FL	1		2014-10-27 22:02:54.506134
1299	Maximum Along-scan Distortion	Registry of DICOM Data Elements	34	34	56	56	MaximumAlongScanDistortion	FL	1		2014-10-27 22:02:54.509373
1300	Ophthalmic Image Orientation	Registry of DICOM Data Elements	34	34	57	57	OphthalmicImageOrientation	CS	1		2014-10-27 22:02:54.512984
1301	Depth of Transverse Image	Registry of DICOM Data Elements	34	34	65	65	DepthOfTransverseImage	FL	1		2014-10-27 22:02:54.516094
1302	Mydriatic Agent Concentration Units Sequence	Registry of DICOM Data Elements	34	34	66	66	MydriaticAgentConcentrationUnitsSequence	SQ	1		2014-10-27 22:02:54.519207
1303	Across-scan Spatial Resolution	Registry of DICOM Data Elements	34	34	72	72	AcrossScanSpatialResolution	FL	1		2014-10-27 22:02:54.522329
1304	Maximum Across-scan Distortion	Registry of DICOM Data Elements	34	34	73	73	MaximumAcrossScanDistortion	FL	1		2014-10-27 22:02:54.525458
1305	Mydriatic Agent Concentration	Registry of DICOM Data Elements	34	34	78	78	MydriaticAgentConcentration	DS	1		2014-10-27 22:02:54.5286
1306	Illumination Wave Length	Registry of DICOM Data Elements	34	34	85	85	IlluminationWaveLength	FL	1		2014-10-27 22:02:54.531747
1307	Illumination Power	Registry of DICOM Data Elements	34	34	86	86	IlluminationPower	FL	1		2014-10-27 22:02:54.534872
1308	Illumination Bandwidth	Registry of DICOM Data Elements	34	34	87	87	IlluminationBandwidth	FL	1		2014-10-27 22:02:54.53804
1309	Mydriatic Agent Sequence	Registry of DICOM Data Elements	34	34	88	88	MydriaticAgentSequence	SQ	1		2014-10-27 22:02:54.541263
1310	Ophthalmic Axial Measurements Right Eye Sequence	Registry of DICOM Data Elements	34	34	4103	4103	OphthalmicAxialMeasurementsRightEyeSequence	SQ	1		2014-10-27 22:02:54.545597
1311	Ophthalmic Axial Measurements Left Eye Sequence	Registry of DICOM Data Elements	34	34	4104	4104	OphthalmicAxialMeasurementsLeftEyeSequence	SQ	1		2014-10-27 22:02:54.548784
1312	Ophthalmic Axial Measurements Device Type	Registry of DICOM Data Elements	34	34	4105	4105	OphthalmicAxialMeasurementsDeviceType	CS	1		2014-10-27 22:02:54.551901
1313	Ophthalmic Axial Length Measurements Type	Registry of DICOM Data Elements	34	34	4112	4112	OphthalmicAxialLengthMeasurementsType	CS	1		2014-10-27 22:02:54.555045
1314	Ophthalmic Axial Length Sequence	Registry of DICOM Data Elements	34	34	4114	4114	OphthalmicAxialLengthSequence	SQ	1		2014-10-27 22:02:54.558193
1315	Ophthalmic Axial Length	Registry of DICOM Data Elements	34	34	4121	4121	OphthalmicAxialLength	FL	1		2014-10-27 22:02:54.561336
1316	Lens Status Code Sequence	Registry of DICOM Data Elements	34	34	4132	4132	LensStatusCodeSequence	SQ	1		2014-10-27 22:02:54.564497
1317	Vitreous Status Code Sequence	Registry of DICOM Data Elements	34	34	4133	4133	VitreousStatusCodeSequence	SQ	1		2014-10-27 22:02:54.567615
1318	IOL Formula Code Sequence	Registry of DICOM Data Elements	34	34	4136	4136	IOLFormulaCodeSequence	SQ	1		2014-10-27 22:02:54.570804
1319	IOL Formula Detail	Registry of DICOM Data Elements	34	34	4137	4137	IOLFormulaDetail	LO	1		2014-10-27 22:02:54.573936
1320	Keratometer Index	Registry of DICOM Data Elements	34	34	4147	4147	KeratometerIndex	FL	1		2014-10-27 22:02:54.57708
1321	Source of Ophthalmic Axial Length Code Sequence	Registry of DICOM Data Elements	34	34	4149	4149	SourceOfOphthalmicAxialLengthCodeSequence	SQ	1		2014-10-27 22:02:54.580764
1322	Target Refraction	Registry of DICOM Data Elements	34	34	4151	4151	TargetRefraction	FL	1		2014-10-27 22:02:54.583969
1323	Refractive Procedure Occurred	Registry of DICOM Data Elements	34	34	4153	4153	RefractiveProcedureOccurred	CS	1		2014-10-27 22:02:54.587089
1324	Refractive Surgery Type Code Sequence	Registry of DICOM Data Elements	34	34	4160	4160	RefractiveSurgeryTypeCodeSequence	SQ	1		2014-10-27 22:02:54.590259
1325	Ophthalmic Ultrasound Method Code Sequence	Registry of DICOM Data Elements	34	34	4164	4164	OphthalmicUltrasoundMethodCodeSequence	SQ	1		2014-10-27 22:02:54.593404
1326	Ophthalmic Axial Length Measurements Sequence	Registry of DICOM Data Elements	34	34	4176	4176	OphthalmicAxialLengthMeasurementsSequence	SQ	1		2014-10-27 22:02:54.596557
1327	IOL Power	Registry of DICOM Data Elements	34	34	4179	4179	IOLPower	FL	1		2014-10-27 22:02:54.599698
1328	Predicted Refractive Error	Registry of DICOM Data Elements	34	34	4180	4180	PredictedRefractiveError	FL	1		2014-10-27 22:02:54.602829
1329	Ophthalmic Axial Length Velocity	Registry of DICOM Data Elements	34	34	4185	4185	OphthalmicAxialLengthVelocity	FL	1		2014-10-27 22:02:54.605955
1330	Lens Status Description	Registry of DICOM Data Elements	34	34	4197	4197	LensStatusDescription	LO	1		2014-10-27 22:02:54.609109
1331	Vitreous Status Description	Registry of DICOM Data Elements	34	34	4198	4198	VitreousStatusDescription	LO	1		2014-10-27 22:02:54.612273
1332	IOL Power Sequence	Registry of DICOM Data Elements	34	34	4240	4240	IOLPowerSequence	SQ	1		2014-10-27 22:02:54.615818
1333	Lens Constant Sequence	Registry of DICOM Data Elements	34	34	4242	4242	LensConstantSequence	SQ	1		2014-10-27 22:02:54.618947
1334	IOL Manufacturer	Registry of DICOM Data Elements	34	34	4243	4243	IOLManufacturer	LO	1		2014-10-27 22:02:54.622086
1335	Lens Constant Description	Registry of DICOM Data Elements	34	34	4244	4244	LensConstantDescription	LO	1	RET	2014-10-27 22:02:54.625234
1336	Implant Name	Registry of DICOM Data Elements	34	34	4245	4245	ImplantName	LO	1		2014-10-27 22:02:54.628394
1337	Keratometry Measurement Type Code Sequence	Registry of DICOM Data Elements	34	34	4246	4246	KeratometryMeasurementTypeCodeSequence	SQ	1		2014-10-27 22:02:54.631547
1338	Implant Part Number	Registry of DICOM Data Elements	34	34	4247	4247	ImplantPartNumber	LO	1		2014-10-27 22:02:54.634677
1339	Referenced Ophthalmic Axial Measurements Sequence	Registry of DICOM Data Elements	34	34	4352	4352	ReferencedOphthalmicAxialMeasurementsSequence	SQ	1		2014-10-27 22:02:54.637858
1340	Ophthalmic Axial Length Measurements Segment Name Code Sequence	Registry of DICOM Data Elements	34	34	4353	4353	OphthalmicAxialLengthMeasurementsSegmentNameCodeSequence	SQ	1		2014-10-27 22:02:54.641029
1341	Refractive Error Before Refractive Surgery Code Sequence	Registry of DICOM Data Elements	34	34	4355	4355	RefractiveErrorBeforeRefractiveSurgeryCodeSequence	SQ	1		2014-10-27 22:02:54.644204
1342	IOL Power For Exact Emmetropia	Registry of DICOM Data Elements	34	34	4385	4385	IOLPowerForExactEmmetropia	FL	1		2014-10-27 22:02:54.647316
1343	IOL Power For Exact Target Refraction	Registry of DICOM Data Elements	34	34	4386	4386	IOLPowerForExactTargetRefraction	FL	1		2014-10-27 22:02:54.650906
1344	Anterior Chamber Depth Definition Code Sequence	Registry of DICOM Data Elements	34	34	4389	4389	AnteriorChamberDepthDefinitionCodeSequence	SQ	1		2014-10-27 22:02:54.654074
1345	Lens Thickness Sequence	Registry of DICOM Data Elements	34	34	4391	4391	LensThicknessSequence	SQ	1		2014-10-27 22:02:54.657211
1346	Anterior Chamber Depth Sequence	Registry of DICOM Data Elements	34	34	4392	4392	AnteriorChamberDepthSequence	SQ	1		2014-10-27 22:02:54.660354
1347	Lens Thickness	Registry of DICOM Data Elements	34	34	4400	4400	LensThickness	FL	1		2014-10-27 22:02:54.663631
1348	Anterior Chamber Depth	Registry of DICOM Data Elements	34	34	4401	4401	AnteriorChamberDepth	FL	1		2014-10-27 22:02:54.666821
1349	Source of Lens Thickness Data Code Sequence	Registry of DICOM Data Elements	34	34	4402	4402	SourceOfLensThicknessDataCodeSequence	SQ	1		2014-10-27 22:02:54.67
1350	Source of Anterior Chamber Depth Data Code Sequence	Registry of DICOM Data Elements	34	34	4403	4403	SourceOfAnteriorChamberDepthDataCodeSequence	SQ	1		2014-10-27 22:02:54.673128
1351	Source of Refractive Measurements Sequence	Registry of DICOM Data Elements	34	34	4404	4404	SourceOfRefractiveMeasurementsSequence	SQ	1		2014-10-27 22:02:54.676258
1352	Source of Refractive Measurements Code Sequence	Registry of DICOM Data Elements	34	34	4405	4405	SourceOfRefractiveMeasurementsCodeSequence	SQ	1		2014-10-27 22:02:54.679515
1353	Ophthalmic Axial Length Measurement Modified	Registry of DICOM Data Elements	34	34	4416	4416	OphthalmicAxialLengthMeasurementModified	CS	1		2014-10-27 22:02:54.682655
1354	Ophthalmic Axial Length Data Source Code Sequence	Registry of DICOM Data Elements	34	34	4432	4432	OphthalmicAxialLengthDataSourceCodeSequence	SQ	1		2014-10-27 22:02:54.686328
1355	Ophthalmic Axial Length Acquisition Method Code Sequence	Registry of DICOM Data Elements	34	34	4435	4435	OphthalmicAxialLengthAcquisitionMethodCodeSequence	SQ	1	RET	2014-10-27 22:02:54.689509
1356	Signal to Noise Ratio	Registry of DICOM Data Elements	34	34	4437	4437	SignalToNoiseRatio	FL	1		2014-10-27 22:02:54.692698
1357	Ophthalmic Axial Length Data Source Description	Registry of DICOM Data Elements	34	34	4441	4441	OphthalmicAxialLengthDataSourceDescription	LO	1		2014-10-27 22:02:54.695857
1358	Ophthalmic Axial Length Measurements Total Length Sequence	Registry of DICOM Data Elements	34	34	4624	4624	OphthalmicAxialLengthMeasurementsTotalLengthSequence	SQ	1		2014-10-27 22:02:54.698984
1359	Ophthalmic Axial Length Measurements Segmental Length Sequence	Registry of DICOM Data Elements	34	34	4625	4625	OphthalmicAxialLengthMeasurementsSegmentalLengthSequence	SQ	1		2014-10-27 22:02:54.702117
1360	Ophthalmic Axial Length Measurements Length Summation Sequence	Registry of DICOM Data Elements	34	34	4626	4626	OphthalmicAxialLengthMeasurementsLengthSummationSequence	SQ	1		2014-10-27 22:02:54.705276
1361	Ultrasound Ophthalmic Axial Length Measurements Sequence	Registry of DICOM Data Elements	34	34	4640	4640	UltrasoundOphthalmicAxialLengthMeasurementsSequence	SQ	1		2014-10-27 22:02:54.708429
1362	Optical Ophthalmic Axial Length Measurements Sequence	Registry of DICOM Data Elements	34	34	4645	4645	OpticalOphthalmicAxialLengthMeasurementsSequence	SQ	1		2014-10-27 22:02:54.711599
1363	Ultrasound Selected Ophthalmic Axial Length Sequence	Registry of DICOM Data Elements	34	34	4656	4656	UltrasoundSelectedOphthalmicAxialLengthSequence	SQ	1		2014-10-27 22:02:54.714756
1364	Ophthalmic Axial Length Selection Method Code Sequence	Registry of DICOM Data Elements	34	34	4688	4688	OphthalmicAxialLengthSelectionMethodCodeSequence	SQ	1		2014-10-27 22:02:54.71794
1365	Optical Selected Ophthalmic Axial Length Sequence	Registry of DICOM Data Elements	34	34	4693	4693	OpticalSelectedOphthalmicAxialLengthSequence	SQ	1		2014-10-27 22:02:54.721542
1366	Selected Segmental Ophthalmic Axial Length Sequence	Registry of DICOM Data Elements	34	34	4695	4695	SelectedSegmentalOphthalmicAxialLengthSequence	SQ	1		2014-10-27 22:02:54.724784
1367	Selected Total Ophthalmic Axial Length Sequence	Registry of DICOM Data Elements	34	34	4704	4704	SelectedTotalOphthalmicAxialLengthSequence	SQ	1		2014-10-27 22:02:54.728927
1368	Ophthalmic Axial Length Quality Metric Sequence	Registry of DICOM Data Elements	34	34	4706	4706	OphthalmicAxialLengthQualityMetricSequence	SQ	1		2014-10-27 22:02:54.732053
1369	Ophthalmic Axial Length Quality Metric Type Code Sequence	Registry of DICOM Data Elements	34	34	4709	4709	OphthalmicAxialLengthQualityMetricTypeCodeSequence	SQ	1	RET	2014-10-27 22:02:54.735243
1370	Ophthalmic Axial Length Quality Metric Type Description	Registry of DICOM Data Elements	34	34	4723	4723	OphthalmicAxialLengthQualityMetricTypeDescription	LO	1	RET	2014-10-27 22:02:54.738464
1371	Intraocular Lens Calculations Right Eye Sequence	Registry of DICOM Data Elements	34	34	4864	4864	IntraocularLensCalculationsRightEyeSequence	SQ	1		2014-10-27 22:02:54.741641
1372	Intraocular Lens Calculations Left Eye Sequence	Registry of DICOM Data Elements	34	34	4880	4880	IntraocularLensCalculationsLeftEyeSequence	SQ	1		2014-10-27 22:02:54.744824
1373	Referenced Ophthalmic Axial Length Measurement QC Image Sequence	Registry of DICOM Data Elements	34	34	4912	4912	ReferencedOphthalmicAxialLengthMeasurementQCImageSequence	SQ	1		2014-10-27 22:02:54.747966
1374	Ophthalmic Mapping Device Type	Registry of DICOM Data Elements	34	34	5141	5141	OphthalmicMappingDeviceType	CS	1		2014-10-27 22:02:54.751121
1375	Acquisition Method Code Sequence	Registry of DICOM Data Elements	34	34	5152	5152	AcquisitionMethodCodeSequence	SQ	1		2014-10-27 22:02:54.75428
1376	Acquisition Method Algorithm Sequence	Registry of DICOM Data Elements	34	34	5155	5155	AcquisitionMethodAlgorithmSequence	SQ	1		2014-10-27 22:02:54.757861
1377	Ophthalmic Thickness Map Type Code Sequence	Registry of DICOM Data Elements	34	34	5174	5174	OphthalmicThicknessMapTypeCodeSequence	SQ	1		2014-10-27 22:02:54.761031
1378	Ophthalmic Thickness Mapping Normals Sequence	Registry of DICOM Data Elements	34	34	5187	5187	OphthalmicThicknessMappingNormalsSequence	SQ	1		2014-10-27 22:02:54.764147
1379	Retinal Thickness Definition Code Sequence	Registry of DICOM Data Elements	34	34	5189	5189	RetinalThicknessDefinitionCodeSequence	SQ	1		2014-10-27 22:02:54.767257
1380	Pixel Value Mapping to Coded Concept Sequence	Registry of DICOM Data Elements	34	34	5200	5200	PixelValueMappingToCodedConceptSequence	SQ	1		2014-10-27 22:02:54.770411
1381	Mapped Pixel Value	Registry of DICOM Data Elements	34	34	5202	5202	MappedPixelValue	US or SS	1		2014-10-27 22:02:54.773533
1382	Pixel Value Mapping Explanation	Registry of DICOM Data Elements	34	34	5204	5204	PixelValueMappingExplanation	LO	1		2014-10-27 22:02:54.776659
1383	Ophthalmic Thickness Map Quality Threshold Sequence	Registry of DICOM Data Elements	34	34	5208	5208	OphthalmicThicknessMapQualityThresholdSequence	SQ	1		2014-10-27 22:02:54.779778
1384	Ophthalmic Thickness Map Threshold Quality Rating	Registry of DICOM Data Elements	34	34	5216	5216	OphthalmicThicknessMapThresholdQualityRating	FL	1		2014-10-27 22:02:54.782972
1385	Anatomic Structure Reference Point	Registry of DICOM Data Elements	34	34	5219	5219	AnatomicStructureReferencePoint	FL	2		2014-10-27 22:02:54.78612
1386	Registration to Localizer Sequence	Registry of DICOM Data Elements	34	34	5221	5221	RegistrationToLocalizerSequence	SQ	1		2014-10-27 22:02:54.789274
1387	Registered Localizer Units	Registry of DICOM Data Elements	34	34	5222	5222	RegisteredLocalizerUnits	CS	1		2014-10-27 22:02:54.792866
1388	Registered Localizer Top Left Hand Corner	Registry of DICOM Data Elements	34	34	5223	5223	RegisteredLocalizerTopLeftHandCorner	FL	2		2014-10-27 22:02:54.796052
1389	Registered Localizer Bottom Right Hand Corner	Registry of DICOM Data Elements	34	34	5224	5224	RegisteredLocalizerBottomRightHandCorner	FL	2		2014-10-27 22:02:54.799181
1390	Ophthalmic Thickness Map Quality Rating Sequence	Registry of DICOM Data Elements	34	34	5232	5232	OphthalmicThicknessMapQualityRatingSequence	SQ	1		2014-10-27 22:02:54.80235
1391	Relevant OPT Attributes Sequence	Registry of DICOM Data Elements	34	34	5234	5234	RelevantOPTAttributesSequence	SQ	1		2014-10-27 22:02:54.805552
1392	Visual Field Horizontal Extent	Registry of DICOM Data Elements	36	36	16	16	VisualFieldHorizontalExtent	FL	1		2014-10-27 22:02:54.808975
1393	Visual Field Vertical Extent	Registry of DICOM Data Elements	36	36	17	17	VisualFieldVerticalExtent	FL	1		2014-10-27 22:02:54.812203
1394	Visual Field Shape	Registry of DICOM Data Elements	36	36	18	18	VisualFieldShape	CS	1		2014-10-27 22:02:54.815408
1395	Screening Test Mode Code Sequence	Registry of DICOM Data Elements	36	36	22	22	ScreeningTestModeCodeSequence	SQ	1		2014-10-27 22:02:54.818562
1396	Maximum Stimulus Luminance	Registry of DICOM Data Elements	36	36	24	24	MaximumStimulusLuminance	FL	1		2014-10-27 22:02:54.82168
1397	Background Luminance	Registry of DICOM Data Elements	36	36	32	32	BackgroundLuminance	FL	1		2014-10-27 22:02:54.82482
1398	Stimulus Color Code Sequence	Registry of DICOM Data Elements	36	36	33	33	StimulusColorCodeSequence	SQ	1		2014-10-27 22:02:54.828454
1399	Background Illumination Color Code Sequence	Registry of DICOM Data Elements	36	36	36	36	BackgroundIlluminationColorCodeSequence	SQ	1		2014-10-27 22:02:54.831626
1400	Stimulus Area	Registry of DICOM Data Elements	36	36	37	37	StimulusArea	FL	1		2014-10-27 22:02:54.834757
1401	Stimulus Presentation Time	Registry of DICOM Data Elements	36	36	40	40	StimulusPresentationTime	FL	1		2014-10-27 22:02:54.837925
1402	Fixation Sequence	Registry of DICOM Data Elements	36	36	50	50	FixationSequence	SQ	1		2014-10-27 22:02:54.841109
1403	Fixation Monitoring Code Sequence	Registry of DICOM Data Elements	36	36	51	51	FixationMonitoringCodeSequence	SQ	1		2014-10-27 22:02:54.844271
1404	Visual Field Catch Trial Sequence	Registry of DICOM Data Elements	36	36	52	52	VisualFieldCatchTrialSequence	SQ	1		2014-10-27 22:02:54.847398
1405	Fixation Checked Quantity	Registry of DICOM Data Elements	36	36	53	53	FixationCheckedQuantity	US	1		2014-10-27 22:02:54.850554
1406	Patient Not Properly Fixated Quantity	Registry of DICOM Data Elements	36	36	54	54	PatientNotProperlyFixatedQuantity	US	1		2014-10-27 22:02:54.853743
1407	Presented Visual Stimuli Data Flag	Registry of DICOM Data Elements	36	36	55	55	PresentedVisualStimuliDataFlag	CS	1		2014-10-27 22:02:54.856957
1408	Number of Visual Stimuli	Registry of DICOM Data Elements	36	36	56	56	NumberOfVisualStimuli	US	1		2014-10-27 22:02:54.860225
1409	Excessive Fixation Losses Data Flag	Registry of DICOM Data Elements	36	36	57	57	ExcessiveFixationLossesDataFlag	CS	1		2014-10-27 22:02:54.863793
1410	Excessive Fixation Losses	Registry of DICOM Data Elements	36	36	64	64	ExcessiveFixationLosses	CS	1		2014-10-27 22:02:54.867098
1411	Stimuli Retesting Quantity	Registry of DICOM Data Elements	36	36	66	66	StimuliRetestingQuantity	US	1		2014-10-27 22:02:54.870292
1412	Comments on Patient's Performance of Visual Field	Registry of DICOM Data Elements	36	36	68	68	CommentsOnPatientPerformanceOfVisualField	LT	1		2014-10-27 22:02:54.873463
1413	False Negatives Estimate Flag	Registry of DICOM Data Elements	36	36	69	69	FalseNegativesEstimateFlag	CS	1		2014-10-27 22:02:54.87665
1414	False Negatives Estimate	Registry of DICOM Data Elements	36	36	70	70	FalseNegativesEstimate	FL	1		2014-10-27 22:02:54.879928
1415	Negative Catch Trials Quantity	Registry of DICOM Data Elements	36	36	72	72	NegativeCatchTrialsQuantity	US	1		2014-10-27 22:02:54.883083
1416	False Negatives Quantity	Registry of DICOM Data Elements	36	36	80	80	FalseNegativesQuantity	US	1		2014-10-27 22:02:54.886265
1417	Excessive False Negatives Data Flag	Registry of DICOM Data Elements	36	36	81	81	ExcessiveFalseNegativesDataFlag	CS	1		2014-10-27 22:02:54.889454
1418	Excessive False Negatives	Registry of DICOM Data Elements	36	36	82	82	ExcessiveFalseNegatives	CS	1		2014-10-27 22:02:54.892667
1419	False Positives Estimate Flag	Registry of DICOM Data Elements	36	36	83	83	FalsePositivesEstimateFlag	CS	1		2014-10-27 22:02:54.895895
1420	False Positives Estimate	Registry of DICOM Data Elements	36	36	84	84	FalsePositivesEstimate	FL	1		2014-10-27 22:02:54.899519
1421	Catch Trials Data Flag	Registry of DICOM Data Elements	36	36	85	85	CatchTrialsDataFlag	CS	1		2014-10-27 22:02:54.902658
1422	Positive Catch Trials Quantity	Registry of DICOM Data Elements	36	36	86	86	PositiveCatchTrialsQuantity	US	1		2014-10-27 22:02:54.905806
1423	Test Point Normals Data Flag	Registry of DICOM Data Elements	36	36	87	87	TestPointNormalsDataFlag	CS	1		2014-10-27 22:02:54.909003
1424	Test Point Normals Sequence	Registry of DICOM Data Elements	36	36	88	88	TestPointNormalsSequence	SQ	1		2014-10-27 22:02:54.912162
1425	Global Deviation Probability Normals Flag	Registry of DICOM Data Elements	36	36	89	89	GlobalDeviationProbabilityNormalsFlag	CS	1		2014-10-27 22:02:54.915268
1426	False Positives Quantity	Registry of DICOM Data Elements	36	36	96	96	FalsePositivesQuantity	US	1		2014-10-27 22:02:54.918432
1427	Excessive False Positives Data Flag	Registry of DICOM Data Elements	36	36	97	97	ExcessiveFalsePositivesDataFlag	CS	1		2014-10-27 22:02:54.921589
1428	Excessive False Positives	Registry of DICOM Data Elements	36	36	98	98	ExcessiveFalsePositives	CS	1		2014-10-27 22:02:54.924762
1429	Visual Field Test Normals Flag	Registry of DICOM Data Elements	36	36	99	99	VisualFieldTestNormalsFlag	CS	1		2014-10-27 22:02:54.927977
1430	Results Normals Sequence	Registry of DICOM Data Elements	36	36	100	100	ResultsNormalsSequence	SQ	1		2014-10-27 22:02:54.931254
1431	Age Corrected Sensitivity Deviation Algorithm Sequence	Registry of DICOM Data Elements	36	36	101	101	AgeCorrectedSensitivityDeviationAlgorithmSequence	SQ	1		2014-10-27 22:02:54.93487
1432	Global Deviation From Normal	Registry of DICOM Data Elements	36	36	102	102	GlobalDeviationFromNormal	FL	1		2014-10-27 22:02:54.938055
1433	Generalized Defect Sensitivity Deviation Algorithm Sequence	Registry of DICOM Data Elements	36	36	103	103	GeneralizedDefectSensitivityDeviationAlgorithmSequence	SQ	1		2014-10-27 22:02:54.941229
1434	Localized Deviation From Normal	Registry of DICOM Data Elements	36	36	104	104	LocalizedDeviationFromNormal	FL	1		2014-10-27 22:02:54.944419
1435	Patient Reliability Indicator	Registry of DICOM Data Elements	36	36	105	105	PatientReliabilityIndicator	LO	1		2014-10-27 22:02:54.947567
1436	Visual Field Mean Sensitivity	Registry of DICOM Data Elements	36	36	112	112	VisualFieldMeanSensitivity	FL	1		2014-10-27 22:02:54.95072
1437	Global Deviation Probability	Registry of DICOM Data Elements	36	36	113	113	GlobalDeviationProbability	FL	1		2014-10-27 22:02:54.953903
1438	Local Deviation Probability Normals Flag	Registry of DICOM Data Elements	36	36	114	114	LocalDeviationProbabilityNormalsFlag	CS	1		2014-10-27 22:02:54.957036
1439	Localized Deviation Probability	Registry of DICOM Data Elements	36	36	115	115	LocalizedDeviationProbability	FL	1		2014-10-27 22:02:54.9602
1440	Short Term Fluctuation Calculated	Registry of DICOM Data Elements	36	36	116	116	ShortTermFluctuationCalculated	CS	1		2014-10-27 22:02:54.963398
1441	Short Term Fluctuation	Registry of DICOM Data Elements	36	36	117	117	ShortTermFluctuation	FL	1		2014-10-27 22:02:54.967771
1442	Short Term Fluctuation Probability Calculated	Registry of DICOM Data Elements	36	36	118	118	ShortTermFluctuationProbabilityCalculated	CS	1		2014-10-27 22:02:54.970937
1443	Short Term Fluctuation Probability	Registry of DICOM Data Elements	36	36	119	119	ShortTermFluctuationProbability	FL	1		2014-10-27 22:02:54.9741
1444	Corrected Localized Deviation From Normal Calculated	Registry of DICOM Data Elements	36	36	120	120	CorrectedLocalizedDeviationFromNormalCalculated	CS	1		2014-10-27 22:02:54.977276
1445	Corrected Localized Deviation From Normal	Registry of DICOM Data Elements	36	36	121	121	CorrectedLocalizedDeviationFromNormal	FL	1		2014-10-27 22:02:54.980453
1446	Corrected Localized Deviation From Normal Probability Calculated	Registry of DICOM Data Elements	36	36	128	128	CorrectedLocalizedDeviationFromNormalProbabilityCalculated	CS	1		2014-10-27 22:02:54.983669
1447	Corrected Localized Deviation From Normal Probability	Registry of DICOM Data Elements	36	36	129	129	CorrectedLocalizedDeviationFromNormalProbability	FL	1		2014-10-27 22:02:54.986826
1448	Global Deviation Probability Sequence	Registry of DICOM Data Elements	36	36	131	131	GlobalDeviationProbabilitySequence	SQ	1		2014-10-27 22:02:54.989979
1449	Localized Deviation Probability Sequence	Registry of DICOM Data Elements	36	36	133	133	LocalizedDeviationProbabilitySequence	SQ	1		2014-10-27 22:02:54.993131
1450	Foveal Sensitivity Measured	Registry of DICOM Data Elements	36	36	134	134	FovealSensitivityMeasured	CS	1		2014-10-27 22:02:54.996295
1451	Foveal Sensitivity	Registry of DICOM Data Elements	36	36	135	135	FovealSensitivity	FL	1		2014-10-27 22:02:54.999539
1452	Visual Field Test Duration	Registry of DICOM Data Elements	36	36	136	136	VisualFieldTestDuration	FL	1		2014-10-27 22:02:55.003087
1453	Visual Field Test Point Sequence	Registry of DICOM Data Elements	36	36	137	137	VisualFieldTestPointSequence	SQ	1		2014-10-27 22:02:55.006252
1454	Visual Field Test Point X-Coordinate	Registry of DICOM Data Elements	36	36	144	144	VisualFieldTestPointXCoordinate	FL	1		2014-10-27 22:02:55.009406
1455	Visual Field Test Point Y-Coordinate	Registry of DICOM Data Elements	36	36	145	145	VisualFieldTestPointYCoordinate	FL	1		2014-10-27 22:02:55.012577
1456	Age Corrected Sensitivity Deviation Value	Registry of DICOM Data Elements	36	36	146	146	AgeCorrectedSensitivityDeviationValue	FL	1		2014-10-27 22:02:55.015712
1457	Stimulus Results	Registry of DICOM Data Elements	36	36	147	147	StimulusResults	CS	1		2014-10-27 22:02:55.018876
1458	Sensitivity Value	Registry of DICOM Data Elements	36	36	148	148	SensitivityValue	FL	1		2014-10-27 22:02:55.022035
1459	Retest Stimulus Seen	Registry of DICOM Data Elements	36	36	149	149	RetestStimulusSeen	CS	1		2014-10-27 22:02:55.025201
1460	Retest Sensitivity Value	Registry of DICOM Data Elements	36	36	150	150	RetestSensitivityValue	FL	1		2014-10-27 22:02:55.02836
1461	Visual Field Test Point Normals Sequence	Registry of DICOM Data Elements	36	36	151	151	VisualFieldTestPointNormalsSequence	SQ	1		2014-10-27 22:02:55.031499
1462	Quantified Defect	Registry of DICOM Data Elements	36	36	152	152	QuantifiedDefect	FL	1		2014-10-27 22:02:55.034646
1463	Age Corrected Sensitivity Deviation Probability Value	Registry of DICOM Data Elements	36	36	256	256	AgeCorrectedSensitivityDeviationProbabilityValue	FL	1		2014-10-27 22:02:55.038289
1464	Generalized Defect Corrected Sensitivity Deviation Flag	Registry of DICOM Data Elements	36	36	258	258	GeneralizedDefectCorrectedSensitivityDeviationFlag	CS	1		2014-10-27 22:02:55.041786
1465	Generalized Defect Corrected Sensitivity Deviation Value	Registry of DICOM Data Elements	36	36	259	259	GeneralizedDefectCorrectedSensitivityDeviationValue	FL	1		2014-10-27 22:02:55.044984
1466	Generalized Defect Corrected Sensitivity Deviation Probability Value	Registry of DICOM Data Elements	36	36	260	260	GeneralizedDefectCorrectedSensitivityDeviationProbabilityValue	FL	1		2014-10-27 22:02:55.048147
1467	Minimum Sensitivity Value	Registry of DICOM Data Elements	36	36	261	261	MinimumSensitivityValue	FL	1		2014-10-27 22:02:55.051272
1468	Blind Spot Localized	Registry of DICOM Data Elements	36	36	262	262	BlindSpotLocalized	CS	1		2014-10-27 22:02:55.054428
1469	Blind Spot X-Coordinate	Registry of DICOM Data Elements	36	36	263	263	BlindSpotXCoordinate	FL	1		2014-10-27 22:02:55.057662
1470	Blind Spot Y-Coordinate	Registry of DICOM Data Elements	36	36	264	264	BlindSpotYCoordinate	FL	1		2014-10-27 22:02:55.060919
1471	Visual Acuity Measurement Sequence	Registry of DICOM Data Elements	36	36	272	272	VisualAcuityMeasurementSequence	SQ	1		2014-10-27 22:02:55.064079
1472	Refractive Parameters Used on Patient Sequence	Registry of DICOM Data Elements	36	36	274	274	RefractiveParametersUsedOnPatientSequence	SQ	1		2014-10-27 22:02:55.067287
1473	Measurement Laterality	Registry of DICOM Data Elements	36	36	275	275	MeasurementLaterality	CS	1		2014-10-27 22:02:55.070848
1474	Ophthalmic Patient Clinical Information Left Eye Sequence	Registry of DICOM Data Elements	36	36	276	276	OphthalmicPatientClinicalInformationLeftEyeSequence	SQ	1		2014-10-27 22:02:55.074467
1475	Ophthalmic Patient Clinical Information Right Eye Sequence	Registry of DICOM Data Elements	36	36	277	277	OphthalmicPatientClinicalInformationRightEyeSequence	SQ	1		2014-10-27 22:02:55.077678
1476	Foveal Point Normative Data Flag	Registry of DICOM Data Elements	36	36	279	279	FovealPointNormativeDataFlag	CS	1		2014-10-27 22:02:55.080827
1477	Foveal Point Probability Value	Registry of DICOM Data Elements	36	36	280	280	FovealPointProbabilityValue	FL	1		2014-10-27 22:02:55.084004
1478	Screening Baseline Measured	Registry of DICOM Data Elements	36	36	288	288	ScreeningBaselineMeasured	CS	1		2014-10-27 22:02:55.087151
1479	Screening Baseline Measured Sequence	Registry of DICOM Data Elements	36	36	290	290	ScreeningBaselineMeasuredSequence	SQ	1		2014-10-27 22:02:55.090292
1480	Screening Baseline Type	Registry of DICOM Data Elements	36	36	292	292	ScreeningBaselineType	CS	1		2014-10-27 22:02:55.09343
1481	Screening Baseline Value	Registry of DICOM Data Elements	36	36	294	294	ScreeningBaselineValue	FL	1		2014-10-27 22:02:55.096643
1482	Algorithm Source	Registry of DICOM Data Elements	36	36	514	514	AlgorithmSource	LO	1		2014-10-27 22:02:55.099808
1483	Data Set Name	Registry of DICOM Data Elements	36	36	774	774	DataSetName	LO	1		2014-10-27 22:02:55.102982
1484	Data Set Version	Registry of DICOM Data Elements	36	36	775	775	DataSetVersion	LO	1		2014-10-27 22:02:55.106155
1485	Data Set Source	Registry of DICOM Data Elements	36	36	776	776	DataSetSource	LO	1		2014-10-27 22:02:55.109827
1486	Data Set Description	Registry of DICOM Data Elements	36	36	777	777	DataSetDescription	LO	1		2014-10-27 22:02:55.112995
1487	Visual Field Test Reliability Global Index Sequence	Registry of DICOM Data Elements	36	36	791	791	VisualFieldTestReliabilityGlobalIndexSequence	SQ	1		2014-10-27 22:02:55.116135
1488	Visual Field Global Results Index Sequence	Registry of DICOM Data Elements	36	36	800	800	VisualFieldGlobalResultsIndexSequence	SQ	1		2014-10-27 22:02:55.119292
1489	Data Observation Sequence	Registry of DICOM Data Elements	36	36	805	805	DataObservationSequence	SQ	1		2014-10-27 22:02:55.122457
1490	Index Normals Flag	Registry of DICOM Data Elements	36	36	824	824	IndexNormalsFlag	CS	1		2014-10-27 22:02:55.125638
1491	Index Probability	Registry of DICOM Data Elements	36	36	833	833	IndexProbability	FL	1		2014-10-27 22:02:55.128788
1492	Index Probability Sequence	Registry of DICOM Data Elements	36	36	836	836	IndexProbabilitySequence	SQ	1		2014-10-27 22:02:55.131959
1493	Samples per Pixel	Registry of DICOM Data Elements	40	40	2	2	SamplesPerPixel	US	1		2014-10-27 22:02:55.135153
1494	Samples per Pixel Used	Registry of DICOM Data Elements	40	40	3	3	SamplesPerPixelUsed	US	1		2014-10-27 22:02:55.138353
1495	Photometric Interpretation	Registry of DICOM Data Elements	40	40	4	4	PhotometricInterpretation	CS	1		2014-10-27 22:02:55.141653
1496	Image Dimensions	Registry of DICOM Data Elements	40	40	5	5	ImageDimensions	US	1	RET	2014-10-27 22:02:55.145342
1497	Planar Configuration	Registry of DICOM Data Elements	40	40	6	6	PlanarConfiguration	US	1		2014-10-27 22:02:55.148531
1498	Number of Frames	Registry of DICOM Data Elements	40	40	8	8	NumberOfFrames	IS	1		2014-10-27 22:02:55.151709
1499	Frame Increment Pointer	Registry of DICOM Data Elements	40	40	9	9	FrameIncrementPointer	AT	1-n		2014-10-27 22:02:55.154868
1500	Frame Dimension Pointer	Registry of DICOM Data Elements	40	40	10	10	FrameDimensionPointer	AT	1-n		2014-10-27 22:02:55.158058
1501	Rows	Registry of DICOM Data Elements	40	40	16	16	Rows	US	1		2014-10-27 22:02:55.16124
1502	Columns	Registry of DICOM Data Elements	40	40	17	17	Columns	US	1		2014-10-27 22:02:55.164409
1503	Planes	Registry of DICOM Data Elements	40	40	18	18	Planes	US	1	RET	2014-10-27 22:02:55.167593
1504	Ultrasound Color Data Present	Registry of DICOM Data Elements	40	40	20	20	UltrasoundColorDataPresent	US	1		2014-10-27 22:02:55.170744
1505	Pixel Spacing	Registry of DICOM Data Elements	40	40	48	48	PixelSpacing	DS	2		2014-10-27 22:02:55.176054
1506	Zoom Factor	Registry of DICOM Data Elements	40	40	49	49	ZoomFactor	DS	2		2014-10-27 22:02:55.180975
1507	Zoom Center	Registry of DICOM Data Elements	40	40	50	50	ZoomCenter	DS	2		2014-10-27 22:02:55.184423
1508	Pixel Aspect Ratio	Registry of DICOM Data Elements	40	40	52	52	PixelAspectRatio	IS	2		2014-10-27 22:02:55.187624
1509	Image Format	Registry of DICOM Data Elements	40	40	64	64	ImageFormat	CS	1	RET	2014-10-27 22:02:55.19078
1510	Manipulated Image	Registry of DICOM Data Elements	40	40	80	80	ManipulatedImage	LO	1-n	RET	2014-10-27 22:02:55.193925
1511	Corrected Image	Registry of DICOM Data Elements	40	40	81	81	CorrectedImage	CS	1-n		2014-10-27 22:02:55.197098
1512	Compression Recognition Code	Registry of DICOM Data Elements	40	40	95	95	CompressionRecognitionCode	LO	1	RET	2014-10-27 22:02:55.200275
1513	Compression Code	Registry of DICOM Data Elements	40	40	96	96	CompressionCode	CS	1	RET	2014-10-27 22:02:55.203471
1514	Compression Originator	Registry of DICOM Data Elements	40	40	97	97	CompressionOriginator	SH	1	RET	2014-10-27 22:02:55.206617
1515	Compression Label	Registry of DICOM Data Elements	40	40	98	98	CompressionLabel	LO	1	RET	2014-10-27 22:02:55.209839
1516	Compression Description	Registry of DICOM Data Elements	40	40	99	99	CompressionDescription	SH	1	RET	2014-10-27 22:02:55.213586
1517	Compression Sequence	Registry of DICOM Data Elements	40	40	101	101	CompressionSequence	CS	1-n	RET	2014-10-27 22:02:55.217285
1518	Compression Step Pointers	Registry of DICOM Data Elements	40	40	102	102	CompressionStepPointers	AT	1-n	RET	2014-10-27 22:02:55.22078
1519	Repeat Interval	Registry of DICOM Data Elements	40	40	104	104	RepeatInterval	US	1	RET	2014-10-27 22:02:55.224044
1520	Bits Grouped	Registry of DICOM Data Elements	40	40	105	105	BitsGrouped	US	1	RET	2014-10-27 22:02:55.227245
1521	Perimeter Table	Registry of DICOM Data Elements	40	40	112	112	PerimeterTable	US	1-n	RET	2014-10-27 22:02:55.230751
1522	Perimeter Value	Registry of DICOM Data Elements	40	40	113	113	PerimeterValue	US or SS	1	RET	2014-10-27 22:02:55.233939
1523	Predictor Rows	Registry of DICOM Data Elements	40	40	128	128	PredictorRows	US	1	RET	2014-10-27 22:02:55.237354
1524	Predictor Columns	Registry of DICOM Data Elements	40	40	129	129	PredictorColumns	US	1	RET	2014-10-27 22:02:55.240702
1525	Predictor Constants	Registry of DICOM Data Elements	40	40	130	130	PredictorConstants	US	1-n	RET	2014-10-27 22:02:55.243921
1526	Blocked Pixels	Registry of DICOM Data Elements	40	40	144	144	BlockedPixels	CS	1	RET	2014-10-27 22:02:55.247193
1527	Block Rows	Registry of DICOM Data Elements	40	40	145	145	BlockRows	US	1	RET	2014-10-27 22:02:55.250531
1528	Block Columns	Registry of DICOM Data Elements	40	40	146	146	BlockColumns	US	1	RET	2014-10-27 22:02:55.254283
1529	Row Overlap	Registry of DICOM Data Elements	40	40	147	147	RowOverlap	US	1	RET	2014-10-27 22:02:55.257454
1530	Column Overlap	Registry of DICOM Data Elements	40	40	148	148	ColumnOverlap	US	1	RET	2014-10-27 22:02:55.260828
1531	Bits Allocated	Registry of DICOM Data Elements	40	40	256	256	BitsAllocated	US	1		2014-10-27 22:02:55.264392
1532	Bits Stored	Registry of DICOM Data Elements	40	40	257	257	BitsStored	US	1		2014-10-27 22:02:55.267675
1533	High Bit	Registry of DICOM Data Elements	40	40	258	258	HighBit	US	1		2014-10-27 22:02:55.27092
1534	Pixel Representation	Registry of DICOM Data Elements	40	40	259	259	PixelRepresentation	US	1		2014-10-27 22:02:55.274096
1535	Smallest Valid Pixel Value	Registry of DICOM Data Elements	40	40	260	260	SmallestValidPixelValue	US or SS	1	RET	2014-10-27 22:02:55.277616
1536	Largest Valid Pixel Value	Registry of DICOM Data Elements	40	40	261	261	LargestValidPixelValue	US or SS	1	RET	2014-10-27 22:02:55.280886
1537	Smallest Image Pixel Value	Registry of DICOM Data Elements	40	40	262	262	SmallestImagePixelValue	US or SS	1		2014-10-27 22:02:55.284319
1538	Largest Image Pixel Value	Registry of DICOM Data Elements	40	40	263	263	LargestImagePixelValue	US or SS	1		2014-10-27 22:02:55.287682
1539	Smallest Pixel Value in Series	Registry of DICOM Data Elements	40	40	264	264	SmallestPixelValueInSeries	US or SS	1		2014-10-27 22:02:55.291479
1540	Largest Pixel Value in Series	Registry of DICOM Data Elements	40	40	265	265	LargestPixelValueInSeries	US or SS	1		2014-10-27 22:02:55.29462
1541	Smallest Image Pixel Value in Plane	Registry of DICOM Data Elements	40	40	272	272	SmallestImagePixelValueInPlane	US or SS	1	RET	2014-10-27 22:02:55.297809
1542	Largest Image Pixel Value in Plane	Registry of DICOM Data Elements	40	40	273	273	LargestImagePixelValueInPlane	US or SS	1	RET	2014-10-27 22:02:55.301045
1543	Pixel Padding Value	Registry of DICOM Data Elements	40	40	288	288	PixelPaddingValue	US or SS	1		2014-10-27 22:02:55.304275
1544	Pixel Padding Range Limit	Registry of DICOM Data Elements	40	40	289	289	PixelPaddingRangeLimit	US or SS	1		2014-10-27 22:02:55.307616
1545	Image Location	Registry of DICOM Data Elements	40	40	512	512	ImageLocation	US	1	RET	2014-10-27 22:02:55.310761
1546	Quality Control Image	Registry of DICOM Data Elements	40	40	768	768	QualityControlImage	CS	1		2014-10-27 22:02:55.314059
1547	Burned In Annotation	Registry of DICOM Data Elements	40	40	769	769	BurnedInAnnotation	CS	1		2014-10-27 22:02:55.317283
1548	Recognizable Visual Features	Registry of DICOM Data Elements	40	40	770	770	RecognizableVisualFeatures	CS	1		2014-10-27 22:02:55.320668
1549	Longitudinal Temporal Information Modified	Registry of DICOM Data Elements	40	40	771	771	LongitudinalTemporalInformationModified	CS	1		2014-10-27 22:02:55.32397
1550	Referenced Color Palette Instance UID	Registry of DICOM Data Elements	40	40	772	772	ReferencedColorPaletteInstanceUID	UI	1		2014-10-27 22:02:55.327687
1551	Transform Label	Registry of DICOM Data Elements	40	40	1024	1024	TransformLabel	LO	1	RET	2014-10-27 22:02:55.330917
1552	Transform Version Number	Registry of DICOM Data Elements	40	40	1025	1025	TransformVersionNumber	LO	1	RET	2014-10-27 22:02:55.334105
1553	Number of Transform Steps	Registry of DICOM Data Elements	40	40	1026	1026	NumberOfTransformSteps	US	1	RET	2014-10-27 22:02:55.33737
1554	Sequence of Compressed Data	Registry of DICOM Data Elements	40	40	1027	1027	SequenceOfCompressedData	LO	1-n	RET	2014-10-27 22:02:55.340634
1555	Details of Coefficients	Registry of DICOM Data Elements	40	40	1028	1028	DetailsOfCoefficients	AT	1-n	RET	2014-10-27 22:02:55.3439
1556	Rows For Nth Order Coefficients	Registry of DICOM Data Elements	40	40	1024	1264	RowsForNthOrderCoefficients	US	1	RET	2014-10-27 22:02:55.347139
1557	Columns For Nth Order Coefficients	Registry of DICOM Data Elements	40	40	1025	1265	ColumnsForNthOrderCoefficients	US	1	RET	2014-10-27 22:02:55.350389
1558	Coefficient Coding	Registry of DICOM Data Elements	40	40	1026	1266	CoefficientCoding	LO	1-n	RET	2014-10-27 22:02:55.353703
1559	Coefficient Coding Pointers	Registry of DICOM Data Elements	40	40	1027	1267	CoefficientCodingPointers	AT	1-n	RET	2014-10-27 22:02:55.357093
1560	DCT Label	Registry of DICOM Data Elements	40	40	1792	1792	DCTLabel	LO	1	RET	2014-10-27 22:02:55.360392
1561	Data Block Description	Registry of DICOM Data Elements	40	40	1793	1793	DataBlockDescription	CS	1-n	RET	2014-10-27 22:02:55.364124
1562	Data Block	Registry of DICOM Data Elements	40	40	1794	1794	DataBlock	AT	1-n	RET	2014-10-27 22:02:55.367274
1563	Normalization Factor Format	Registry of DICOM Data Elements	40	40	1808	1808	NormalizationFactorFormat	US	1	RET	2014-10-27 22:02:55.370442
1564	Zonal Map Number Format	Registry of DICOM Data Elements	40	40	1824	1824	ZonalMapNumberFormat	US	1	RET	2014-10-27 22:02:55.373629
1565	Zonal Map Location	Registry of DICOM Data Elements	40	40	1825	1825	ZonalMapLocation	AT	1-n	RET	2014-10-27 22:02:55.376826
1566	Zonal Map Format	Registry of DICOM Data Elements	40	40	1826	1826	ZonalMapFormat	US	1	RET	2014-10-27 22:02:55.380038
1567	Adaptive Map Format	Registry of DICOM Data Elements	40	40	1840	1840	AdaptiveMapFormat	US	1	RET	2014-10-27 22:02:55.383192
1568	Code Number Format	Registry of DICOM Data Elements	40	40	1856	1856	CodeNumberFormat	US	1	RET	2014-10-27 22:02:55.386397
1569	Code Label	Registry of DICOM Data Elements	40	40	2048	2288	CodeLabel	CS	1-n	RET	2014-10-27 22:02:55.389638
1570	Number of Tables	Registry of DICOM Data Elements	40	40	2050	2290	NumberOfTables	US	1	RET	2014-10-27 22:02:55.39289
1571	Code Table Location	Registry of DICOM Data Elements	40	40	2051	2291	CodeTableLocation	AT	1-n	RET	2014-10-27 22:02:55.397641
1572	Bits For Code Word	Registry of DICOM Data Elements	40	40	2052	2292	BitsForCodeWord	US	1	RET	2014-10-27 22:02:55.400928
1573	Image Data Location	Registry of DICOM Data Elements	40	40	2056	2296	ImageDataLocation	AT	1-n	RET	2014-10-27 22:02:55.404198
1574	Pixel Spacing Calibration Type	Registry of DICOM Data Elements	40	40	2562	2562	PixelSpacingCalibrationType	CS	1		2014-10-27 22:02:55.407519
1575	Pixel Spacing Calibration Description	Registry of DICOM Data Elements	40	40	2564	2564	PixelSpacingCalibrationDescription	LO	1		2014-10-27 22:02:55.410763
1576	Pixel Intensity Relationship	Registry of DICOM Data Elements	40	40	4160	4160	PixelIntensityRelationship	CS	1		2014-10-27 22:02:55.413946
1577	Pixel Intensity Relationship Sign	Registry of DICOM Data Elements	40	40	4161	4161	PixelIntensityRelationshipSign	SS	1		2014-10-27 22:02:55.4172
1578	Window Center	Registry of DICOM Data Elements	40	40	4176	4176	WindowCenter	DS	1-n		2014-10-27 22:02:55.420449
1579	Window Width	Registry of DICOM Data Elements	40	40	4177	4177	WindowWidth	DS	1-n		2014-10-27 22:02:55.423706
1580	Rescale Intercept	Registry of DICOM Data Elements	40	40	4178	4178	RescaleIntercept	DS	1		2014-10-27 22:02:55.426947
1581	Rescale Slope	Registry of DICOM Data Elements	40	40	4179	4179	RescaleSlope	DS	1		2014-10-27 22:02:55.430204
1582	Rescale Type	Registry of DICOM Data Elements	40	40	4180	4180	RescaleType	LO	1		2014-10-27 22:02:55.433795
1583	Window Center & Width Explanation	Registry of DICOM Data Elements	40	40	4181	4181	WindowCenterWidthExplanation	LO	1-n		2014-10-27 22:02:55.437074
1584	VOI LUT Function	Registry of DICOM Data Elements	40	40	4182	4182	VOILUTFunction	CS	1		2014-10-27 22:02:55.440283
1585	Gray Scale	Registry of DICOM Data Elements	40	40	4224	4224	GrayScale	CS	1	RET	2014-10-27 22:02:55.44363
1586	Recommended Viewing Mode	Registry of DICOM Data Elements	40	40	4240	4240	RecommendedViewingMode	CS	1		2014-10-27 22:02:55.446847
1587	Gray Lookup Table Descriptor	Registry of DICOM Data Elements	40	40	4352	4352	GrayLookupTableDescriptor	US or SS	3	RET	2014-10-27 22:02:55.450023
1588	Red Palette Color Lookup Table Descriptor	Registry of DICOM Data Elements	40	40	4353	4353	RedPaletteColorLookupTableDescriptor	US or SS	3		2014-10-27 22:02:55.453291
1589	Green Palette Color Lookup Table Descriptor	Registry of DICOM Data Elements	40	40	4354	4354	GreenPaletteColorLookupTableDescriptor	US or SS	3		2014-10-27 22:02:55.456564
1590	Blue Palette Color Lookup Table Descriptor	Registry of DICOM Data Elements	40	40	4355	4355	BluePaletteColorLookupTableDescriptor	US or SS	3		2014-10-27 22:02:55.45982
1591	Alpha Palette Color Lookup Table Descriptor	Registry of DICOM Data Elements	40	40	4356	4356	AlphaPaletteColorLookupTableDescriptor	US	3		2014-10-27 22:02:55.463043
1592	Large Red Palette Color Lookup Table Descriptor	Registry of DICOM Data Elements	40	40	4369	4369	LargeRedPaletteColorLookupTableDescriptor	US or SS	4	RET	2014-10-27 22:02:55.466226
1593	Large Green Palette Color Lookup Table Descriptor	Registry of DICOM Data Elements	40	40	4370	4370	LargeGreenPaletteColorLookupTableDescriptor	US or SS	4	RET	2014-10-27 22:02:55.46994
1594	Large Blue Palette Color Lookup Table Descriptor	Registry of DICOM Data Elements	40	40	4371	4371	LargeBluePaletteColorLookupTableDescriptor	US or SS	4	RET	2014-10-27 22:02:55.473206
1595	Palette Color Lookup Table UID	Registry of DICOM Data Elements	40	40	4505	4505	PaletteColorLookupTableUID	UI	1		2014-10-27 22:02:55.476475
1596	Gray Lookup Table Data	Registry of DICOM Data Elements	40	40	4608	4608	GrayLookupTableData	US or SS or OW	1-n or 1	RET	2014-10-27 22:02:55.479752
1597	Red Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4609	4609	RedPaletteColorLookupTableData	OW	1		2014-10-27 22:02:55.482911
1598	Green Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4610	4610	GreenPaletteColorLookupTableData	OW	1		2014-10-27 22:02:55.486308
1599	Blue Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4611	4611	BluePaletteColorLookupTableData	OW	1		2014-10-27 22:02:55.489674
1600	Alpha Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4612	4612	AlphaPaletteColorLookupTableData	OW	1		2014-10-27 22:02:55.492869
1601	Large Red Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4625	4625	LargeRedPaletteColorLookupTableData	OW	1	RET	2014-10-27 22:02:55.496144
1602	Large Green Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4626	4626	LargeGreenPaletteColorLookupTableData	OW	1	RET	2014-10-27 22:02:55.499355
1603	Large Blue Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4627	4627	LargeBluePaletteColorLookupTableData	OW	1	RET	2014-10-27 22:02:55.502613
1604	Large Palette Color Lookup Table UID	Registry of DICOM Data Elements	40	40	4628	4628	LargePaletteColorLookupTableUID	UI	1	RET	2014-10-27 22:02:55.506238
1605	Segmented Red Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4641	4641	SegmentedRedPaletteColorLookupTableData	OW	1		2014-10-27 22:02:55.509483
1606	Segmented Green Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4642	4642	SegmentedGreenPaletteColorLookupTableData	OW	1		2014-10-27 22:02:55.512726
1607	Segmented Blue Palette Color Lookup Table Data	Registry of DICOM Data Elements	40	40	4643	4643	SegmentedBluePaletteColorLookupTableData	OW	1		2014-10-27 22:02:55.515926
1608	Breast Implant Present	Registry of DICOM Data Elements	40	40	4864	4864	BreastImplantPresent	CS	1		2014-10-27 22:02:55.519225
1609	Partial View	Registry of DICOM Data Elements	40	40	4944	4944	PartialView	CS	1		2014-10-27 22:02:55.522447
1610	Partial View Description	Registry of DICOM Data Elements	40	40	4945	4945	PartialViewDescription	ST	1		2014-10-27 22:02:55.525659
1611	Partial View Code Sequence	Registry of DICOM Data Elements	40	40	4946	4946	PartialViewCodeSequence	SQ	1		2014-10-27 22:02:55.528923
1612	Spatial Locations Preserved	Registry of DICOM Data Elements	40	40	4954	4954	SpatialLocationsPreserved	CS	1		2014-10-27 22:02:55.532169
1613	Data Frame Assignment Sequence	Registry of DICOM Data Elements	40	40	5121	5121	DataFrameAssignmentSequence	SQ	1		2014-10-27 22:02:55.535384
1614	Data Path Assignment	Registry of DICOM Data Elements	40	40	5122	5122	DataPathAssignment	CS	1		2014-10-27 22:02:55.538585
1615	Bits Mapped to Color Lookup Table	Registry of DICOM Data Elements	40	40	5123	5123	BitsMappedToColorLookupTable	US	1		2014-10-27 22:02:55.542329
1616	Blending LUT 1 Sequence	Registry of DICOM Data Elements	40	40	5124	5124	BlendingLUT1Sequence	SQ	1		2014-10-27 22:02:55.545536
1617	Blending LUT 1 Transfer Function	Registry of DICOM Data Elements	40	40	5125	5125	BlendingLUT1TransferFunction	CS	1		2014-10-27 22:02:55.548787
1618	Blending Weight Constant	Registry of DICOM Data Elements	40	40	5126	5126	BlendingWeightConstant	FD	1		2014-10-27 22:02:55.552022
1619	Blending Lookup Table Descriptor	Registry of DICOM Data Elements	40	40	5127	5127	BlendingLookupTableDescriptor	US	3		2014-10-27 22:02:55.555246
1620	Blending Lookup Table Data	Registry of DICOM Data Elements	40	40	5128	5128	BlendingLookupTableData	OW	1		2014-10-27 22:02:55.558443
1621	Enhanced Palette Color Lookup Table Sequence	Registry of DICOM Data Elements	40	40	5131	5131	EnhancedPaletteColorLookupTableSequence	SQ	1		2014-10-27 22:02:55.561643
1622	Blending LUT 2 Sequence	Registry of DICOM Data Elements	40	40	5132	5132	BlendingLUT2Sequence	SQ	1		2014-10-27 22:02:55.565035
1623	Blending LUT 2 Transfer Function	Registry of DICOM Data Elements	40	40	5133	5133	BlendingLUT2TransferFunction	CS	1		2014-10-27 22:02:55.568308
1624	Data Path ID	Registry of DICOM Data Elements	40	40	5134	5134	DataPathID	CS	1		2014-10-27 22:02:55.571684
1625	RGB LUT Transfer Function	Registry of DICOM Data Elements	40	40	5135	5135	RGBLUTTransferFunction	CS	1		2014-10-27 22:02:55.574967
1626	Alpha LUT Transfer Function	Registry of DICOM Data Elements	40	40	5136	5136	AlphaLUTTransferFunction	CS	1		2014-10-27 22:02:55.578719
1627	ICC Profile	Registry of DICOM Data Elements	40	40	8192	8192	ICCProfile	OB	1		2014-10-27 22:02:55.581942
1628	Lossy Image Compression	Registry of DICOM Data Elements	40	40	8464	8464	LossyImageCompression	CS	1		2014-10-27 22:02:55.585123
1629	Lossy Image Compression Ratio	Registry of DICOM Data Elements	40	40	8466	8466	LossyImageCompressionRatio	DS	1-n		2014-10-27 22:02:55.588356
1630	Lossy Image Compression Method	Registry of DICOM Data Elements	40	40	8468	8468	LossyImageCompressionMethod	CS	1-n		2014-10-27 22:02:55.591577
1631	Modality LUT Sequence	Registry of DICOM Data Elements	40	40	12288	12288	ModalityLUTSequence	SQ	1		2014-10-27 22:02:55.594768
1632	LUT Descriptor	Registry of DICOM Data Elements	40	40	12290	12290	LUTDescriptor	US or SS	3		2014-10-27 22:02:55.597961
1633	LUT Explanation	Registry of DICOM Data Elements	40	40	12291	12291	LUTExplanation	LO	1		2014-10-27 22:02:55.601203
1634	Modality LUT Type	Registry of DICOM Data Elements	40	40	12292	12292	ModalityLUTType	LO	1		2014-10-27 22:02:55.604442
1635	LUT Data	Registry of DICOM Data Elements	40	40	12294	12294	LUTData	US or OW	1-n or 1		2014-10-27 22:02:55.60772
1636	VOI LUT Sequence	Registry of DICOM Data Elements	40	40	12304	12304	VOILUTSequence	SQ	1		2014-10-27 22:02:55.611004
1637	Softcopy VOI LUT Sequence	Registry of DICOM Data Elements	40	40	12560	12560	SoftcopyVOILUTSequence	SQ	1		2014-10-27 22:02:55.614856
1638	Image Presentation Comments	Registry of DICOM Data Elements	40	40	16384	16384	ImagePresentationComments	LT	1	RET	2014-10-27 22:02:55.61806
1639	Bi-Plane Acquisition Sequence	Registry of DICOM Data Elements	40	40	20480	20480	BiPlaneAcquisitionSequence	SQ	1	RET	2014-10-27 22:02:55.621298
1640	Representative Frame Number	Registry of DICOM Data Elements	40	40	24592	24592	RepresentativeFrameNumber	US	1		2014-10-27 22:02:55.624984
1641	Frame Numbers of Interest (FOI)	Registry of DICOM Data Elements	40	40	24608	24608	FrameNumbersOfInterest	US	1-n		2014-10-27 22:02:55.62885
1642	Frame of Interest Description	Registry of DICOM Data Elements	40	40	24610	24610	FrameOfInterestDescription	LO	1-n		2014-10-27 22:02:55.632134
1643	Frame of Interest Type	Registry of DICOM Data Elements	40	40	24611	24611	FrameOfInterestType	CS	1-n		2014-10-27 22:02:55.635416
1644	Mask Pointer(s)	Registry of DICOM Data Elements	40	40	24624	24624	MaskPointers	US	1-n	RET	2014-10-27 22:02:55.638641
1645	R Wave Pointer	Registry of DICOM Data Elements	40	40	24640	24640	RWavePointer	US	1-n		2014-10-27 22:02:55.641903
1646	Mask Subtraction Sequence	Registry of DICOM Data Elements	40	40	24832	24832	MaskSubtractionSequence	SQ	1		2014-10-27 22:02:55.645156
1647	Mask Operation	Registry of DICOM Data Elements	40	40	24833	24833	MaskOperation	CS	1		2014-10-27 22:02:55.648574
1648	Applicable Frame Range	Registry of DICOM Data Elements	40	40	24834	24834	ApplicableFrameRange	US	2-2n		2014-10-27 22:02:55.652329
1649	Mask Frame Numbers	Registry of DICOM Data Elements	40	40	24848	24848	MaskFrameNumbers	US	1-n		2014-10-27 22:02:55.655574
1650	Contrast Frame Averaging	Registry of DICOM Data Elements	40	40	24850	24850	ContrastFrameAveraging	US	1		2014-10-27 22:02:55.658776
1651	Mask Sub-pixel Shift	Registry of DICOM Data Elements	40	40	24852	24852	MaskSubPixelShift	FL	2		2014-10-27 22:02:55.662031
1652	TID Offset	Registry of DICOM Data Elements	40	40	24864	24864	TIDOffset	SS	1		2014-10-27 22:02:55.665274
1653	Mask Operation Explanation	Registry of DICOM Data Elements	40	40	24976	24976	MaskOperationExplanation	ST	1		2014-10-27 22:02:55.668548
1654	Equipment Administrator Sequence	Registry of DICOM Data Elements	40	40	28672	28672	EquipmentAdministratorSequence	SQ	1		2014-10-27 22:02:55.671809
1655	Number of Display Subsystems	Registry of DICOM Data Elements	40	40	28673	28673	NumberOfDisplaySubsystems	US	1		2014-10-27 22:02:55.675015
1656	Current Configuration ID	Registry of DICOM Data Elements	40	40	28674	28674	CurrentConfigurationID	US	1		2014-10-27 22:02:55.678383
1657	Display Subsystem ID	Registry of DICOM Data Elements	40	40	28675	28675	DisplaySubsystemID	US	1		2014-10-27 22:02:55.681664
1658	Display Subsystem Name	Registry of DICOM Data Elements	40	40	28676	28676	DisplaySubsystemName	SH	1		2014-10-27 22:02:55.685185
1659	Display Subsystem Description	Registry of DICOM Data Elements	40	40	28677	28677	DisplaySubsystemDescription	LO	1		2014-10-27 22:02:55.689095
1660	System Status	Registry of DICOM Data Elements	40	40	28678	28678	SystemStatus	CS	1		2014-10-27 22:02:55.69252
1661	System Status Comment	Registry of DICOM Data Elements	40	40	28679	28679	SystemStatusComment	LO	1		2014-10-27 22:02:55.695846
1662	Target Luminance Characteristics Sequence	Registry of DICOM Data Elements	40	40	28680	28680	TargetLuminanceCharacteristicsSequence	SQ	1		2014-10-27 22:02:55.699127
1663	Luminance Characteristics ID	Registry of DICOM Data Elements	40	40	28681	28681	LuminanceCharacteristicsID	US	1		2014-10-27 22:02:55.70245
1664	Display Subsystem Configuration Sequence	Registry of DICOM Data Elements	40	40	28682	28682	DisplaySubsystemConfigurationSequence	SQ	1		2014-10-27 22:02:55.705694
1665	Configuration ID	Registry of DICOM Data Elements	40	40	28683	28683	ConfigurationID	US	1		2014-10-27 22:02:55.708954
1666	Configuration Name	Registry of DICOM Data Elements	40	40	28684	28684	ConfigurationName	SH	1		2014-10-27 22:02:55.712207
1667	Configuration Description	Registry of DICOM Data Elements	40	40	28685	28685	ConfigurationDescription	LO	1		2014-10-27 22:02:55.715463
1668	Referenced Target Luminance Characteristics ID	Registry of DICOM Data Elements	40	40	28686	28686	ReferencedTargetLuminanceCharacteristicsID	US	1		2014-10-27 22:02:55.718799
1669	QA Results Sequence	Registry of DICOM Data Elements	40	40	28687	28687	QAResultsSequence	SQ	1		2014-10-27 22:02:55.722112
1670	Display Subsystem QA Results Sequence	Registry of DICOM Data Elements	40	40	28688	28688	DisplaySubsystemQAResultsSequence	SQ	1		2014-10-27 22:02:55.725844
1671	Configuration QA Results Sequence	Registry of DICOM Data Elements	40	40	28689	28689	ConfigurationQAResultsSequence	SQ	1		2014-10-27 22:02:55.729104
1672	Measurement Equipment Sequence	Registry of DICOM Data Elements	40	40	28690	28690	MeasurementEquipmentSequence	SQ	1		2014-10-27 22:02:55.732385
1673	Measurement Functions	Registry of DICOM Data Elements	40	40	28691	28691	MeasurementFunctions	CS	1-n		2014-10-27 22:02:55.735828
1674	Measurement Equipment Type	Registry of DICOM Data Elements	40	40	28692	28692	MeasurementEquipmentType	CS	1		2014-10-27 22:02:55.739297
1675	Visual Evaluation Result Sequence	Registry of DICOM Data Elements	40	40	28693	28693	VisualEvaluationResultSequence	SQ	1		2014-10-27 22:02:55.742525
1676	Display Calibration Result Sequence	Registry of DICOM Data Elements	40	40	28694	28694	DisplayCalibrationResultSequence	SQ	1		2014-10-27 22:02:55.746097
1677	DDL Value	Registry of DICOM Data Elements	40	40	28695	28695	DDLValue	US	1		2014-10-27 22:02:55.749445
1678	CIExy White Point	Registry of DICOM Data Elements	40	40	28696	28696	CIExyWhitePoint	FL	2		2014-10-27 22:02:55.752862
1679	Display Function Type	Registry of DICOM Data Elements	40	40	28697	28697	DisplayFunctionType	CS	1		2014-10-27 22:02:55.7562
1680	Gamma Value	Registry of DICOM Data Elements	40	40	28698	28698	GammaValue	FL	1		2014-10-27 22:02:55.759522
1681	Number of Luminance Points	Registry of DICOM Data Elements	40	40	28699	28699	NumberOfLuminancePoints	US	1		2014-10-27 22:02:55.763214
1682	Luminance Response Sequence	Registry of DICOM Data Elements	40	40	28700	28700	LuminanceResponseSequence	SQ	1		2014-10-27 22:02:55.766403
1683	Target Minimum Luminance	Registry of DICOM Data Elements	40	40	28701	28701	TargetMinimumLuminance	FL	1		2014-10-27 22:02:55.76963
1684	Target Maximum Luminance	Registry of DICOM Data Elements	40	40	28702	28702	TargetMaximumLuminance	FL	1		2014-10-27 22:02:55.77287
1685	Luminance Value	Registry of DICOM Data Elements	40	40	28703	28703	LuminanceValue	FL	1		2014-10-27 22:02:55.776054
1686	Luminance Response Description	Registry of DICOM Data Elements	40	40	28704	28704	LuminanceResponseDescription	LO	1		2014-10-27 22:02:55.779256
1687	White Point Flag	Registry of DICOM Data Elements	40	40	28705	28705	WhitePointFlag	CS	1		2014-10-27 22:02:55.782488
1688	Display Device Type Code Sequence	Registry of DICOM Data Elements	40	40	28706	28706	DisplayDeviceTypeCodeSequence	SQ	1		2014-10-27 22:02:55.785702
1689	Display Subsystem Sequence	Registry of DICOM Data Elements	40	40	28707	28707	DisplaySubsystemSequence	SQ	1		2014-10-27 22:02:55.788927
1690	Luminance Result Sequence	Registry of DICOM Data Elements	40	40	28708	28708	LuminanceResultSequence	SQ	1		2014-10-27 22:02:55.792192
1691	Ambient Light Value Source	Registry of DICOM Data Elements	40	40	28709	28709	AmbientLightValueSource	CS	1		2014-10-27 22:02:55.795448
1692	Measured Characteristics	Registry of DICOM Data Elements	40	40	28710	28710	MeasuredCharacteristics	CS	1-n		2014-10-27 22:02:55.79913
1693	Luminance Uniformity Result Sequence	Registry of DICOM Data Elements	40	40	28711	28711	LuminanceUniformityResultSequence	SQ	1		2014-10-27 22:02:55.802333
1694	Visual Evaluation Test Sequence	Registry of DICOM Data Elements	40	40	28712	28712	VisualEvaluationTestSequence	SQ	1		2014-10-27 22:02:55.805555
1695	Test Result	Registry of DICOM Data Elements	40	40	28713	28713	TestResult	CS	1		2014-10-27 22:02:55.808784
1696	Test Result Comment	Registry of DICOM Data Elements	40	40	28714	28714	TestResultComment	LO	1		2014-10-27 22:02:55.811986
1697	Test Image Validation	Registry of DICOM Data Elements	40	40	28715	28715	TestImageValidation	CS	1		2014-10-27 22:02:55.815208
1698	Test Pattern Code Sequence	Registry of DICOM Data Elements	40	40	28716	28716	TestPatternCodeSequence	SQ	1		2014-10-27 22:02:55.81843
1699	Measurement Pattern Code Sequence	Registry of DICOM Data Elements	40	40	28717	28717	MeasurementPatternCodeSequence	SQ	1		2014-10-27 22:02:55.821678
1700	Visual Evaluation Method Code Sequence	Registry of DICOM Data Elements	40	40	28718	28718	VisualEvaluationMethodCodeSequence	SQ	1		2014-10-27 22:02:55.824917
1701	Pixel Data Provider URL	Registry of DICOM Data Elements	40	40	32736	32736	PixelDataProviderURL	UR	1		2014-10-27 22:02:55.828159
1702	Data Point Rows	Registry of DICOM Data Elements	40	40	36865	36865	DataPointRows	UL	1		2014-10-27 22:02:55.832623
1703	Data Point Columns	Registry of DICOM Data Elements	40	40	36866	36866	DataPointColumns	UL	1		2014-10-27 22:02:55.836058
1704	Signal Domain Columns	Registry of DICOM Data Elements	40	40	36867	36867	SignalDomainColumns	CS	1		2014-10-27 22:02:55.839303
1705	Largest Monochrome Pixel Value	Registry of DICOM Data Elements	40	40	37017	37017	LargestMonochromePixelValue	US	1	RET	2014-10-27 22:02:55.842564
1706	Data Representation	Registry of DICOM Data Elements	40	40	37128	37128	DataRepresentation	CS	1		2014-10-27 22:02:55.845772
1707	Pixel Measures Sequence	Registry of DICOM Data Elements	40	40	37136	37136	PixelMeasuresSequence	SQ	1		2014-10-27 22:02:55.849066
1708	Frame VOI LUT Sequence	Registry of DICOM Data Elements	40	40	37170	37170	FrameVOILUTSequence	SQ	1		2014-10-27 22:02:55.852338
1709	Pixel Value Transformation Sequence	Registry of DICOM Data Elements	40	40	37189	37189	PixelValueTransformationSequence	SQ	1		2014-10-27 22:02:55.855546
1710	Signal Domain Rows	Registry of DICOM Data Elements	40	40	37429	37429	SignalDomainRows	CS	1		2014-10-27 22:02:55.858763
1711	Display Filter Percentage	Registry of DICOM Data Elements	40	40	37905	37905	DisplayFilterPercentage	FL	1		2014-10-27 22:02:55.861999
1712	Frame Pixel Shift Sequence	Registry of DICOM Data Elements	40	40	37909	37909	FramePixelShiftSequence	SQ	1		2014-10-27 22:02:55.865229
1713	Subtraction Item ID	Registry of DICOM Data Elements	40	40	37910	37910	SubtractionItemID	US	1		2014-10-27 22:02:55.89222
1714	Pixel Intensity Relationship LUT Sequence	Registry of DICOM Data Elements	40	40	37922	37922	PixelIntensityRelationshipLUTSequence	SQ	1		2014-10-27 22:02:55.896399
1715	Frame Pixel Data Properties Sequence	Registry of DICOM Data Elements	40	40	37955	37955	FramePixelDataPropertiesSequence	SQ	1		2014-10-27 22:02:55.899665
1716	Geometrical Properties	Registry of DICOM Data Elements	40	40	37956	37956	GeometricalProperties	CS	1		2014-10-27 22:02:55.902861
1717	Geometric Maximum Distortion	Registry of DICOM Data Elements	40	40	37957	37957	GeometricMaximumDistortion	FL	1		2014-10-27 22:02:55.906086
1718	Image Processing Applied	Registry of DICOM Data Elements	40	40	37958	37958	ImageProcessingApplied	CS	1-n		2014-10-27 22:02:55.90958
1719	Mask Selection Mode	Registry of DICOM Data Elements	40	40	37972	37972	MaskSelectionMode	CS	1		2014-10-27 22:02:55.912801
1720	LUT Function	Registry of DICOM Data Elements	40	40	38004	38004	LUTFunction	CS	1		2014-10-27 22:02:55.916018
1721	Mask Visibility Percentage	Registry of DICOM Data Elements	40	40	38008	38008	MaskVisibilityPercentage	FL	1		2014-10-27 22:02:55.919205
1722	Pixel Shift Sequence	Registry of DICOM Data Elements	40	40	38145	38145	PixelShiftSequence	SQ	1		2014-10-27 22:02:55.922447
1723	Region Pixel Shift Sequence	Registry of DICOM Data Elements	40	40	38146	38146	RegionPixelShiftSequence	SQ	1		2014-10-27 22:02:55.92564
1724	Vertices of the Region	Registry of DICOM Data Elements	40	40	38147	38147	VerticesOfTheRegion	SS	2-2n		2014-10-27 22:02:55.92887
1725	Multi-frame Presentation Sequence	Registry of DICOM Data Elements	40	40	38149	38149	MultiFramePresentationSequence	SQ	1		2014-10-27 22:02:55.932067
1726	Pixel Shift Frame Range	Registry of DICOM Data Elements	40	40	38150	38150	PixelShiftFrameRange	US	2-2n		2014-10-27 22:02:55.935626
1727	LUT Frame Range	Registry of DICOM Data Elements	40	40	38151	38151	LUTFrameRange	US	2-2n		2014-10-27 22:02:55.938788
1728	Image to Equipment Mapping Matrix	Registry of DICOM Data Elements	40	40	38176	38176	ImageToEquipmentMappingMatrix	DS	16		2014-10-27 22:02:55.941994
1729	Equipment Coordinate System Identification	Registry of DICOM Data Elements	40	40	38199	38199	EquipmentCoordinateSystemIdentification	CS	1		2014-10-27 22:02:55.945194
1730	Study Status ID	Registry of DICOM Data Elements	50	50	10	10	StudyStatusID	CS	1	RET	2014-10-27 22:02:55.948426
1731	Study Priority ID	Registry of DICOM Data Elements	50	50	12	12	StudyPriorityID	CS	1	RET	2014-10-27 22:02:55.951599
1732	Study ID Issuer	Registry of DICOM Data Elements	50	50	18	18	StudyIDIssuer	LO	1	RET	2014-10-27 22:02:55.954786
1733	Study Verified Date	Registry of DICOM Data Elements	50	50	50	50	StudyVerifiedDate	DA	1	RET	2014-10-27 22:02:55.957983
1734	Study Verified Time	Registry of DICOM Data Elements	50	50	51	51	StudyVerifiedTime	TM	1	RET	2014-10-27 22:02:55.961277
1735	Study Read Date	Registry of DICOM Data Elements	50	50	52	52	StudyReadDate	DA	1	RET	2014-10-27 22:02:55.964823
1736	Study Read Time	Registry of DICOM Data Elements	50	50	53	53	StudyReadTime	TM	1	RET	2014-10-27 22:02:55.968023
1737	Scheduled Study Start Date	Registry of DICOM Data Elements	50	50	4096	4096	ScheduledStudyStartDate	DA	1	RET	2014-10-27 22:02:55.971187
1738	Scheduled Study Start Time	Registry of DICOM Data Elements	50	50	4097	4097	ScheduledStudyStartTime	TM	1	RET	2014-10-27 22:02:55.974395
1739	Scheduled Study Stop Date	Registry of DICOM Data Elements	50	50	4112	4112	ScheduledStudyStopDate	DA	1	RET	2014-10-27 22:02:55.977591
1740	Scheduled Study Stop Time	Registry of DICOM Data Elements	50	50	4113	4113	ScheduledStudyStopTime	TM	1	RET	2014-10-27 22:02:55.980801
1741	Scheduled Study Location	Registry of DICOM Data Elements	50	50	4128	4128	ScheduledStudyLocation	LO	1	RET	2014-10-27 22:02:55.984006
1742	Scheduled Study Location AE Title	Registry of DICOM Data Elements	50	50	4129	4129	ScheduledStudyLocationAETitle	AE	1-n	RET	2014-10-27 22:02:55.987184
1743	Reason for Study	Registry of DICOM Data Elements	50	50	4144	4144	ReasonForStudy	LO	1	RET	2014-10-27 22:02:55.990392
1744	Requesting Physician Identification Sequence	Registry of DICOM Data Elements	50	50	4145	4145	RequestingPhysicianIdentificationSequence	SQ	1		2014-10-27 22:02:55.993584
1745	Requesting Physician	Registry of DICOM Data Elements	50	50	4146	4146	RequestingPhysician	PN	1		2014-10-27 22:02:55.997233
1746	Requesting Service	Registry of DICOM Data Elements	50	50	4147	4147	RequestingService	LO	1		2014-10-27 22:02:56.000444
1747	Requesting Service Code Sequence	Registry of DICOM Data Elements	50	50	4148	4148	RequestingServiceCodeSequence	SQ	1		2014-10-27 22:02:56.003675
1748	Study Arrival Date	Registry of DICOM Data Elements	50	50	4160	4160	StudyArrivalDate	DA	1	RET	2014-10-27 22:02:56.006892
1749	Study Arrival Time	Registry of DICOM Data Elements	50	50	4161	4161	StudyArrivalTime	TM	1	RET	2014-10-27 22:02:56.010096
1750	Study Completion Date	Registry of DICOM Data Elements	50	50	4176	4176	StudyCompletionDate	DA	1	RET	2014-10-27 22:02:56.01333
1751	Study Completion Time	Registry of DICOM Data Elements	50	50	4177	4177	StudyCompletionTime	TM	1	RET	2014-10-27 22:02:56.016547
1752	Study Component Status ID	Registry of DICOM Data Elements	50	50	4181	4181	StudyComponentStatusID	CS	1	RET	2014-10-27 22:02:56.019769
1753	Requested Procedure Description	Registry of DICOM Data Elements	50	50	4192	4192	RequestedProcedureDescription	LO	1		2014-10-27 22:02:56.02297
1754	Requested Procedure Code Sequence	Registry of DICOM Data Elements	50	50	4196	4196	RequestedProcedureCodeSequence	SQ	1		2014-10-27 22:02:56.026161
1755	Requested Contrast Agent	Registry of DICOM Data Elements	50	50	4208	4208	RequestedContrastAgent	LO	1		2014-10-27 22:02:56.029774
1756	Study Comments	Registry of DICOM Data Elements	50	50	16384	16384	StudyComments	LT	1	RET	2014-10-27 22:02:56.033005
1757	Referenced Patient Alias Sequence	Registry of DICOM Data Elements	56	56	4	4	ReferencedPatientAliasSequence	SQ	1		2014-10-27 22:02:56.036236
1758	Visit Status ID	Registry of DICOM Data Elements	56	56	8	8	VisitStatusID	CS	1		2014-10-27 22:02:56.039462
1759	Admission ID	Registry of DICOM Data Elements	56	56	16	16	AdmissionID	LO	1		2014-10-27 22:02:56.042659
1760	Issuer of Admission ID	Registry of DICOM Data Elements	56	56	17	17	IssuerOfAdmissionID	LO	1	RET	2014-10-27 22:02:56.045846
1761	Issuer of Admission ID Sequence	Registry of DICOM Data Elements	56	56	20	20	IssuerOfAdmissionIDSequence	SQ	1		2014-10-27 22:02:56.049074
1762	Route of Admissions	Registry of DICOM Data Elements	56	56	22	22	RouteOfAdmissions	LO	1		2014-10-27 22:02:56.05226
1763	Scheduled Admission Date	Registry of DICOM Data Elements	56	56	26	26	ScheduledAdmissionDate	DA	1	RET	2014-10-27 22:02:56.055493
1764	Scheduled Admission Time	Registry of DICOM Data Elements	56	56	27	27	ScheduledAdmissionTime	TM	1	RET	2014-10-27 22:02:56.058712
1765	Scheduled Discharge Date	Registry of DICOM Data Elements	56	56	28	28	ScheduledDischargeDate	DA	1	RET	2014-10-27 22:02:56.062384
1766	Scheduled Discharge Time	Registry of DICOM Data Elements	56	56	29	29	ScheduledDischargeTime	TM	1	RET	2014-10-27 22:02:56.065646
1767	Scheduled Patient Institution Residence	Registry of DICOM Data Elements	56	56	30	30	ScheduledPatientInstitutionResidence	LO	1	RET	2014-10-27 22:02:56.069135
1768	Admitting Date	Registry of DICOM Data Elements	56	56	32	32	AdmittingDate	DA	1		2014-10-27 22:02:56.07237
1769	Admitting Time	Registry of DICOM Data Elements	56	56	33	33	AdmittingTime	TM	1		2014-10-27 22:02:56.075569
1770	Discharge Date	Registry of DICOM Data Elements	56	56	48	48	DischargeDate	DA	1	RET	2014-10-27 22:02:56.078894
1771	Discharge Time	Registry of DICOM Data Elements	56	56	50	50	DischargeTime	TM	1	RET	2014-10-27 22:02:56.082118
1772	Discharge Diagnosis Description	Registry of DICOM Data Elements	56	56	64	64	DischargeDiagnosisDescription	LO	1	RET	2014-10-27 22:02:56.085348
1773	Discharge Diagnosis Code Sequence	Registry of DICOM Data Elements	56	56	68	68	DischargeDiagnosisCodeSequence	SQ	1	RET	2014-10-27 22:02:56.088586
1774	Special Needs	Registry of DICOM Data Elements	56	56	80	80	SpecialNeeds	LO	1		2014-10-27 22:02:56.091836
1775	Service Episode ID	Registry of DICOM Data Elements	56	56	96	96	ServiceEpisodeID	LO	1		2014-10-27 22:02:56.09549
1776	Issuer of Service Episode ID	Registry of DICOM Data Elements	56	56	97	97	IssuerOfServiceEpisodeID	LO	1	RET	2014-10-27 22:02:56.098706
1777	Service Episode Description	Registry of DICOM Data Elements	56	56	98	98	ServiceEpisodeDescription	LO	1		2014-10-27 22:02:56.102196
1778	Issuer of Service Episode ID Sequence	Registry of DICOM Data Elements	56	56	100	100	IssuerOfServiceEpisodeIDSequence	SQ	1		2014-10-27 22:02:56.105491
1779	Pertinent Documents Sequence	Registry of DICOM Data Elements	56	56	256	256	PertinentDocumentsSequence	SQ	1		2014-10-27 22:02:56.108717
1780	Current Patient Location	Registry of DICOM Data Elements	56	56	768	768	CurrentPatientLocation	LO	1		2014-10-27 22:02:56.111926
1781	Patient's Institution Residence	Registry of DICOM Data Elements	56	56	1024	1024	PatientInstitutionResidence	LO	1		2014-10-27 22:02:56.115168
1782	Patient State	Registry of DICOM Data Elements	56	56	1280	1280	PatientState	LO	1		2014-10-27 22:02:56.118405
1783	Patient Clinical Trial Participation Sequence	Registry of DICOM Data Elements	56	56	1282	1282	PatientClinicalTrialParticipationSequence	SQ	1		2014-10-27 22:02:56.121633
1784	Visit Comments	Registry of DICOM Data Elements	56	56	16384	16384	VisitComments	LT	1		2014-10-27 22:02:56.124872
1785	Waveform Originality	Registry of DICOM Data Elements	58	58	4	4	WaveformOriginality	CS	1		2014-10-27 22:02:56.128489
1786	Number of Waveform Channels	Registry of DICOM Data Elements	58	58	5	5	NumberOfWaveformChannels	US	1		2014-10-27 22:02:56.131708
1787	Number of Waveform Samples	Registry of DICOM Data Elements	58	58	16	16	NumberOfWaveformSamples	UL	1		2014-10-27 22:02:56.134914
1788	Sampling Frequency	Registry of DICOM Data Elements	58	58	26	26	SamplingFrequency	DS	1		2014-10-27 22:02:56.138244
1789	Multiplex Group Label	Registry of DICOM Data Elements	58	58	32	32	MultiplexGroupLabel	SH	1		2014-10-27 22:02:56.141579
1790	Channel Definition Sequence	Registry of DICOM Data Elements	58	58	512	512	ChannelDefinitionSequence	SQ	1		2014-10-27 22:02:56.144864
1791	Waveform Channel Number	Registry of DICOM Data Elements	58	58	514	514	WaveformChannelNumber	IS	1		2014-10-27 22:02:56.148089
1792	Channel Label	Registry of DICOM Data Elements	58	58	515	515	ChannelLabel	SH	1		2014-10-27 22:02:56.151361
1793	Channel Status	Registry of DICOM Data Elements	58	58	517	517	ChannelStatus	CS	1-n		2014-10-27 22:02:56.154578
1794	Channel Source Sequence	Registry of DICOM Data Elements	58	58	520	520	ChannelSourceSequence	SQ	1		2014-10-27 22:02:56.157902
1795	Channel Source Modifiers Sequence	Registry of DICOM Data Elements	58	58	521	521	ChannelSourceModifiersSequence	SQ	1		2014-10-27 22:02:56.161583
1796	Source Waveform Sequence	Registry of DICOM Data Elements	58	58	522	522	SourceWaveformSequence	SQ	1		2014-10-27 22:02:56.164809
1797	Channel Derivation Description	Registry of DICOM Data Elements	58	58	524	524	ChannelDerivationDescription	LO	1		2014-10-27 22:02:56.16802
1798	Channel Sensitivity	Registry of DICOM Data Elements	58	58	528	528	ChannelSensitivity	DS	1		2014-10-27 22:02:56.17123
1799	Channel Sensitivity Units Sequence	Registry of DICOM Data Elements	58	58	529	529	ChannelSensitivityUnitsSequence	SQ	1		2014-10-27 22:02:56.17447
1800	Channel Sensitivity Correction Factor	Registry of DICOM Data Elements	58	58	530	530	ChannelSensitivityCorrectionFactor	DS	1		2014-10-27 22:02:56.177672
1801	Channel Baseline	Registry of DICOM Data Elements	58	58	531	531	ChannelBaseline	DS	1		2014-10-27 22:02:56.180916
1802	Channel Time Skew	Registry of DICOM Data Elements	58	58	532	532	ChannelTimeSkew	DS	1		2014-10-27 22:02:56.184118
1803	Channel Sample Skew	Registry of DICOM Data Elements	58	58	533	533	ChannelSampleSkew	DS	1		2014-10-27 22:02:56.187381
1804	Channel Offset	Registry of DICOM Data Elements	58	58	536	536	ChannelOffset	DS	1		2014-10-27 22:02:56.190683
1805	Waveform Bits Stored	Registry of DICOM Data Elements	58	58	538	538	WaveformBitsStored	US	1		2014-10-27 22:02:56.194349
1806	Filter Low Frequency	Registry of DICOM Data Elements	58	58	544	544	FilterLowFrequency	DS	1		2014-10-27 22:02:56.197555
1807	Filter High Frequency	Registry of DICOM Data Elements	58	58	545	545	FilterHighFrequency	DS	1		2014-10-27 22:02:56.200805
1808	Notch Filter Frequency	Registry of DICOM Data Elements	58	58	546	546	NotchFilterFrequency	DS	1		2014-10-27 22:02:56.204055
1809	Notch Filter Bandwidth	Registry of DICOM Data Elements	58	58	547	547	NotchFilterBandwidth	DS	1		2014-10-27 22:02:56.207266
1810	Waveform Data Display Scale	Registry of DICOM Data Elements	58	58	560	560	WaveformDataDisplayScale	FL	1		2014-10-27 22:02:56.210496
1811	Waveform Display Background CIELab Value	Registry of DICOM Data Elements	58	58	561	561	WaveformDisplayBackgroundCIELabValue	US	3		2014-10-27 22:02:56.213702
1812	Waveform Presentation Group Sequence	Registry of DICOM Data Elements	58	58	576	576	WaveformPresentationGroupSequence	SQ	1		2014-10-27 22:02:56.216931
1813	Presentation Group Number	Registry of DICOM Data Elements	58	58	577	577	PresentationGroupNumber	US	1		2014-10-27 22:02:56.220218
1814	Channel Display Sequence	Registry of DICOM Data Elements	58	58	578	578	ChannelDisplaySequence	SQ	1		2014-10-27 22:02:56.223541
1815	Channel Recommended Display CIELab Value	Registry of DICOM Data Elements	58	58	580	580	ChannelRecommendedDisplayCIELabValue	US	3		2014-10-27 22:02:56.227172
1816	Channel Position	Registry of DICOM Data Elements	58	58	581	581	ChannelPosition	FL	1		2014-10-27 22:02:56.230416
1817	Display Shading Flag	Registry of DICOM Data Elements	58	58	582	582	DisplayShadingFlag	CS	1		2014-10-27 22:02:56.233663
1818	Fractional Channel Display Scale	Registry of DICOM Data Elements	58	58	583	583	FractionalChannelDisplayScale	FL	1		2014-10-27 22:02:56.236886
1819	Absolute Channel Display Scale	Registry of DICOM Data Elements	58	58	584	584	AbsoluteChannelDisplayScale	FL	1		2014-10-27 22:02:56.240199
1820	Multiplexed Audio Channels Description Code Sequence	Registry of DICOM Data Elements	58	58	768	768	MultiplexedAudioChannelsDescriptionCodeSequence	SQ	1		2014-10-27 22:02:56.243421
1821	Channel Identification Code	Registry of DICOM Data Elements	58	58	769	769	ChannelIdentificationCode	IS	1		2014-10-27 22:02:56.246696
1822	Channel Mode	Registry of DICOM Data Elements	58	58	770	770	ChannelMode	CS	1		2014-10-27 22:02:56.249952
1823	Scheduled Station AE Title	Registry of DICOM Data Elements	64	64	1	1	ScheduledStationAETitle	AE	1-n		2014-10-27 22:02:56.253229
1824	Scheduled Procedure Step Start Date	Registry of DICOM Data Elements	64	64	2	2	ScheduledProcedureStepStartDate	DA	1		2014-10-27 22:02:56.256515
1825	Scheduled Procedure Step Start Time	Registry of DICOM Data Elements	64	64	3	3	ScheduledProcedureStepStartTime	TM	1		2014-10-27 22:02:56.260916
1826	Scheduled Procedure Step End Date	Registry of DICOM Data Elements	64	64	4	4	ScheduledProcedureStepEndDate	DA	1		2014-10-27 22:02:56.264173
1827	Scheduled Procedure Step End Time	Registry of DICOM Data Elements	64	64	5	5	ScheduledProcedureStepEndTime	TM	1		2014-10-27 22:02:56.267356
1828	Scheduled Performing Physician's Name	Registry of DICOM Data Elements	64	64	6	6	ScheduledPerformingPhysicianName	PN	1		2014-10-27 22:02:56.270573
1829	Scheduled Procedure Step Description	Registry of DICOM Data Elements	64	64	7	7	ScheduledProcedureStepDescription	LO	1		2014-10-27 22:02:56.273797
1830	Scheduled Protocol Code Sequence	Registry of DICOM Data Elements	64	64	8	8	ScheduledProtocolCodeSequence	SQ	1		2014-10-27 22:02:56.277004
1831	Scheduled Procedure Step ID	Registry of DICOM Data Elements	64	64	9	9	ScheduledProcedureStepID	SH	1		2014-10-27 22:02:56.28032
1832	Stage Code Sequence	Registry of DICOM Data Elements	64	64	10	10	StageCodeSequence	SQ	1		2014-10-27 22:02:56.283527
1833	Scheduled Performing Physician Identification Sequence	Registry of DICOM Data Elements	64	64	11	11	ScheduledPerformingPhysicianIdentificationSequence	SQ	1		2014-10-27 22:02:56.286729
1834	Scheduled Station Name	Registry of DICOM Data Elements	64	64	16	16	ScheduledStationName	SH	1-n		2014-10-27 22:02:56.289943
1835	Scheduled Procedure Step Location	Registry of DICOM Data Elements	64	64	17	17	ScheduledProcedureStepLocation	SH	1		2014-10-27 22:02:56.293162
1836	Pre-Medication	Registry of DICOM Data Elements	64	64	18	18	PreMedication	LO	1		2014-10-27 22:02:56.296794
1837	Scheduled Procedure Step Status	Registry of DICOM Data Elements	64	64	32	32	ScheduledProcedureStepStatus	CS	1		2014-10-27 22:02:56.300092
1838	Order Placer Identifier Sequence	Registry of DICOM Data Elements	64	64	38	38	OrderPlacerIdentifierSequence	SQ	1		2014-10-27 22:02:56.303452
1839	Order Filler Identifier Sequence	Registry of DICOM Data Elements	64	64	39	39	OrderFillerIdentifierSequence	SQ	1		2014-10-27 22:02:56.307001
1840	Local Namespace Entity ID	Registry of DICOM Data Elements	64	64	49	49	LocalNamespaceEntityID	UT	1		2014-10-27 22:02:56.31023
1841	Universal Entity ID	Registry of DICOM Data Elements	64	64	50	50	UniversalEntityID	UT	1		2014-10-27 22:02:56.313693
1842	Universal Entity ID Type	Registry of DICOM Data Elements	64	64	51	51	UniversalEntityIDType	CS	1		2014-10-27 22:02:56.31693
1843	Identifier Type Code	Registry of DICOM Data Elements	64	64	53	53	IdentifierTypeCode	CS	1		2014-10-27 22:02:56.320247
1844	Assigning Facility Sequence	Registry of DICOM Data Elements	64	64	54	54	AssigningFacilitySequence	SQ	1		2014-10-27 22:02:56.323513
1845	Assigning Jurisdiction Code Sequence	Registry of DICOM Data Elements	64	64	57	57	AssigningJurisdictionCodeSequence	SQ	1		2014-10-27 22:02:56.32674
1846	Assigning Agency or Department Code Sequence	Registry of DICOM Data Elements	64	64	58	58	AssigningAgencyOrDepartmentCodeSequence	SQ	1		2014-10-27 22:02:56.329954
1847	Scheduled Procedure Step Sequence	Registry of DICOM Data Elements	64	64	256	256	ScheduledProcedureStepSequence	SQ	1		2014-10-27 22:02:56.333608
1848	Referenced Non-Image Composite SOP Instance Sequence	Registry of DICOM Data Elements	64	64	544	544	ReferencedNonImageCompositeSOPInstanceSequence	SQ	1		2014-10-27 22:02:56.336894
1849	Performed Station AE Title	Registry of DICOM Data Elements	64	64	577	577	PerformedStationAETitle	AE	1		2014-10-27 22:02:56.340147
1850	Performed Station Name	Registry of DICOM Data Elements	64	64	578	578	PerformedStationName	SH	1		2014-10-27 22:02:56.343375
1851	Performed Location	Registry of DICOM Data Elements	64	64	579	579	PerformedLocation	SH	1		2014-10-27 22:02:56.346603
1852	Performed Procedure Step Start Date	Registry of DICOM Data Elements	64	64	580	580	PerformedProcedureStepStartDate	DA	1		2014-10-27 22:02:56.349843
1853	Performed Procedure Step Start Time	Registry of DICOM Data Elements	64	64	581	581	PerformedProcedureStepStartTime	TM	1		2014-10-27 22:02:56.353089
1854	Performed Procedure Step End Date	Registry of DICOM Data Elements	64	64	592	592	PerformedProcedureStepEndDate	DA	1		2014-10-27 22:02:56.356294
1855	Performed Procedure Step End Time	Registry of DICOM Data Elements	64	64	593	593	PerformedProcedureStepEndTime	TM	1		2014-10-27 22:02:56.359529
1856	Performed Procedure Step Status	Registry of DICOM Data Elements	64	64	594	594	PerformedProcedureStepStatus	CS	1		2014-10-27 22:02:56.362742
1857	Performed Procedure Step ID	Registry of DICOM Data Elements	64	64	595	595	PerformedProcedureStepID	SH	1		2014-10-27 22:02:56.365971
1858	Performed Procedure Step Description	Registry of DICOM Data Elements	64	64	596	596	PerformedProcedureStepDescription	LO	1		2014-10-27 22:02:56.369634
1859	Performed Procedure Type Description	Registry of DICOM Data Elements	64	64	597	597	PerformedProcedureTypeDescription	LO	1		2014-10-27 22:02:56.372881
1860	Performed Protocol Code Sequence	Registry of DICOM Data Elements	64	64	608	608	PerformedProtocolCodeSequence	SQ	1		2014-10-27 22:02:56.376083
1861	Performed Protocol Type	Registry of DICOM Data Elements	64	64	609	609	PerformedProtocolType	CS	1		2014-10-27 22:02:56.379344
1862	Scheduled Step Attributes Sequence	Registry of DICOM Data Elements	64	64	624	624	ScheduledStepAttributesSequence	SQ	1		2014-10-27 22:02:56.382611
1863	Request Attributes Sequence	Registry of DICOM Data Elements	64	64	629	629	RequestAttributesSequence	SQ	1		2014-10-27 22:02:56.38587
1864	Comments on the Performed Procedure Step	Registry of DICOM Data Elements	64	64	640	640	CommentsOnThePerformedProcedureStep	ST	1		2014-10-27 22:02:56.389112
1865	Performed Procedure Step Discontinuation Reason Code Sequence	Registry of DICOM Data Elements	64	64	641	641	PerformedProcedureStepDiscontinuationReasonCodeSequence	SQ	1		2014-10-27 22:02:56.392321
1866	Quantity Sequence	Registry of DICOM Data Elements	64	64	659	659	QuantitySequence	SQ	1		2014-10-27 22:02:56.395566
1867	Quantity	Registry of DICOM Data Elements	64	64	660	660	Quantity	DS	1		2014-10-27 22:02:56.398772
1868	Measuring Units Sequence	Registry of DICOM Data Elements	64	64	661	661	MeasuringUnitsSequence	SQ	1		2014-10-27 22:02:56.402057
1869	Billing Item Sequence	Registry of DICOM Data Elements	64	64	662	662	BillingItemSequence	SQ	1		2014-10-27 22:02:56.40577
1870	Total Time of Fluoroscopy	Registry of DICOM Data Elements	64	64	768	768	TotalTimeOfFluoroscopy	US	1		2014-10-27 22:02:56.409023
1871	Total Number of Exposures	Registry of DICOM Data Elements	64	64	769	769	TotalNumberOfExposures	US	1		2014-10-27 22:02:56.412289
1872	Entrance Dose	Registry of DICOM Data Elements	64	64	770	770	EntranceDose	US	1		2014-10-27 22:02:56.41555
1873	Exposed Area	Registry of DICOM Data Elements	64	64	771	771	ExposedArea	US	1-2		2014-10-27 22:02:56.418908
1874	Distance Source to Entrance	Registry of DICOM Data Elements	64	64	774	774	DistanceSourceToEntrance	DS	1		2014-10-27 22:02:56.422149
1875	Distance Source to Support	Registry of DICOM Data Elements	64	64	775	775	DistanceSourceToSupport	DS	1	RET	2014-10-27 22:02:56.425397
1876	Exposure Dose Sequence	Registry of DICOM Data Elements	64	64	782	782	ExposureDoseSequence	SQ	1		2014-10-27 22:02:56.428646
1877	Comments on Radiation Dose	Registry of DICOM Data Elements	64	64	784	784	CommentsOnRadiationDose	ST	1		2014-10-27 22:02:56.431864
1878	X-Ray Output	Registry of DICOM Data Elements	64	64	786	786	XRayOutput	DS	1		2014-10-27 22:02:56.435116
1879	Half Value Layer	Registry of DICOM Data Elements	64	64	788	788	HalfValueLayer	DS	1		2014-10-27 22:02:56.438433
1880	Organ Dose	Registry of DICOM Data Elements	64	64	790	790	OrganDose	DS	1		2014-10-27 22:02:56.442151
1881	Organ Exposed	Registry of DICOM Data Elements	64	64	792	792	OrganExposed	CS	1		2014-10-27 22:02:56.44539
1882	Billing Procedure Step Sequence	Registry of DICOM Data Elements	64	64	800	800	BillingProcedureStepSequence	SQ	1		2014-10-27 22:02:56.448601
1883	Film Consumption Sequence	Registry of DICOM Data Elements	64	64	801	801	FilmConsumptionSequence	SQ	1		2014-10-27 22:02:56.451833
1884	Billing Supplies and Devices Sequence	Registry of DICOM Data Elements	64	64	804	804	BillingSuppliesAndDevicesSequence	SQ	1		2014-10-27 22:02:56.455065
1885	Referenced Procedure Step Sequence	Registry of DICOM Data Elements	64	64	816	816	ReferencedProcedureStepSequence	SQ	1	RET	2014-10-27 22:02:56.458331
1886	Performed Series Sequence	Registry of DICOM Data Elements	64	64	832	832	PerformedSeriesSequence	SQ	1		2014-10-27 22:02:56.461576
1887	Comments on the Scheduled Procedure Step	Registry of DICOM Data Elements	64	64	1024	1024	CommentsOnTheScheduledProcedureStep	LT	1		2014-10-27 22:02:56.464807
1888	Protocol Context Sequence	Registry of DICOM Data Elements	64	64	1088	1088	ProtocolContextSequence	SQ	1		2014-10-27 22:02:56.468038
1889	Content Item Modifier Sequence	Registry of DICOM Data Elements	64	64	1089	1089	ContentItemModifierSequence	SQ	1		2014-10-27 22:02:56.471283
1890	Scheduled Specimen Sequence	Registry of DICOM Data Elements	64	64	1280	1280	ScheduledSpecimenSequence	SQ	1		2014-10-27 22:02:56.474591
1891	Specimen Accession Number	Registry of DICOM Data Elements	64	64	1290	1290	SpecimenAccessionNumber	LO	1	RET	2014-10-27 22:02:56.478278
1892	Container Identifier	Registry of DICOM Data Elements	64	64	1298	1298	ContainerIdentifier	LO	1		2014-10-27 22:02:56.481609
1893	Issuer of the Container Identifier Sequence	Registry of DICOM Data Elements	64	64	1299	1299	IssuerOfTheContainerIdentifierSequence	SQ	1		2014-10-27 22:02:56.484852
1894	Alternate Container Identifier Sequence	Registry of DICOM Data Elements	64	64	1301	1301	AlternateContainerIdentifierSequence	SQ	1		2014-10-27 22:02:56.488105
1895	Container Type Code Sequence	Registry of DICOM Data Elements	64	64	1304	1304	ContainerTypeCodeSequence	SQ	1		2014-10-27 22:02:56.491342
1896	Container Description	Registry of DICOM Data Elements	64	64	1306	1306	ContainerDescription	LO	1		2014-10-27 22:02:56.494646
1897	Container Component Sequence	Registry of DICOM Data Elements	64	64	1312	1312	ContainerComponentSequence	SQ	1		2014-10-27 22:02:56.497864
1898	Specimen Sequence	Registry of DICOM Data Elements	64	64	1360	1360	SpecimenSequence	SQ	1	RET	2014-10-27 22:02:56.501105
1899	Specimen Identifier	Registry of DICOM Data Elements	64	64	1361	1361	SpecimenIdentifier	LO	1		2014-10-27 22:02:56.504349
1900	Specimen Description Sequence (Trial)	Registry of DICOM Data Elements	64	64	1362	1362	SpecimenDescriptionSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.507659
1901	Specimen Description (Trial)	Registry of DICOM Data Elements	64	64	1363	1363	SpecimenDescriptionTrial	ST	1	RET	2014-10-27 22:02:56.510994
1902	Specimen UID	Registry of DICOM Data Elements	64	64	1364	1364	SpecimenUID	UI	1		2014-10-27 22:02:56.514696
1903	Acquisition Context Sequence	Registry of DICOM Data Elements	64	64	1365	1365	AcquisitionContextSequence	SQ	1		2014-10-27 22:02:56.517915
1904	Acquisition Context Description	Registry of DICOM Data Elements	64	64	1366	1366	AcquisitionContextDescription	ST	1		2014-10-27 22:02:56.521169
1905	Specimen Type Code Sequence	Registry of DICOM Data Elements	64	64	1434	1434	SpecimenTypeCodeSequence	SQ	1		2014-10-27 22:02:56.524385
1906	Specimen Description Sequence	Registry of DICOM Data Elements	64	64	1376	1376	SpecimenDescriptionSequence	SQ	1		2014-10-27 22:02:56.527656
1907	Issuer of the Specimen Identifier Sequence	Registry of DICOM Data Elements	64	64	1378	1378	IssuerOfTheSpecimenIdentifierSequence	SQ	1		2014-10-27 22:02:56.530879
1908	Specimen Short Description	Registry of DICOM Data Elements	64	64	1536	1536	SpecimenShortDescription	LO	1		2014-10-27 22:02:56.534129
1909	Specimen Detailed Description	Registry of DICOM Data Elements	64	64	1538	1538	SpecimenDetailedDescription	UT	1		2014-10-27 22:02:56.537369
1910	Specimen Preparation Sequence	Registry of DICOM Data Elements	64	64	1552	1552	SpecimenPreparationSequence	SQ	1		2014-10-27 22:02:56.540655
1911	Specimen Preparation Step Content Item Sequence	Registry of DICOM Data Elements	64	64	1554	1554	SpecimenPreparationStepContentItemSequence	SQ	1		2014-10-27 22:02:56.543954
1912	Specimen Localization Content Item Sequence	Registry of DICOM Data Elements	64	64	1568	1568	SpecimenLocalizationContentItemSequence	SQ	1		2014-10-27 22:02:56.547271
1913	Slide Identifier	Registry of DICOM Data Elements	64	64	1786	1786	SlideIdentifier	LO	1	RET	2014-10-27 22:02:56.550971
1914	Image Center Point Coordinates Sequence	Registry of DICOM Data Elements	64	64	1818	1818	ImageCenterPointCoordinatesSequence	SQ	1		2014-10-27 22:02:56.554245
1915	X Offset in Slide Coordinate System	Registry of DICOM Data Elements	64	64	1834	1834	XOffsetInSlideCoordinateSystem	DS	1		2014-10-27 22:02:56.557588
1916	Y Offset in Slide Coordinate System	Registry of DICOM Data Elements	64	64	1850	1850	YOffsetInSlideCoordinateSystem	DS	1		2014-10-27 22:02:56.561071
1917	Z Offset in Slide Coordinate System	Registry of DICOM Data Elements	64	64	1866	1866	ZOffsetInSlideCoordinateSystem	DS	1		2014-10-27 22:02:56.564307
1918	Pixel Spacing Sequence	Registry of DICOM Data Elements	64	64	2264	2264	PixelSpacingSequence	SQ	1	RET	2014-10-27 22:02:56.567517
1919	Coordinate System Axis Code Sequence	Registry of DICOM Data Elements	64	64	2266	2266	CoordinateSystemAxisCodeSequence	SQ	1	RET	2014-10-27 22:02:56.570732
1920	Measurement Units Code Sequence	Registry of DICOM Data Elements	64	64	2282	2282	MeasurementUnitsCodeSequence	SQ	1		2014-10-27 22:02:56.57396
1921	Vital Stain Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	2552	2552	VitalStainCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.577293
1922	Requested Procedure ID	Registry of DICOM Data Elements	64	64	4097	4097	RequestedProcedureID	SH	1		2014-10-27 22:02:56.580594
1923	Reason for the Requested Procedure	Registry of DICOM Data Elements	64	64	4098	4098	ReasonForTheRequestedProcedure	LO	1		2014-10-27 22:02:56.583939
1924	Requested Procedure Priority	Registry of DICOM Data Elements	64	64	4099	4099	RequestedProcedurePriority	SH	1		2014-10-27 22:02:56.587619
1925	Patient Transport Arrangements	Registry of DICOM Data Elements	64	64	4100	4100	PatientTransportArrangements	LO	1		2014-10-27 22:02:56.590825
1926	Requested Procedure Location	Registry of DICOM Data Elements	64	64	4101	4101	RequestedProcedureLocation	LO	1		2014-10-27 22:02:56.594068
1927	Placer Order Number / Procedure	Registry of DICOM Data Elements	64	64	4102	4102	PlacerOrderNumberProcedure	SH	1	RET	2014-10-27 22:02:56.5973
1928	Filler Order Number / Procedure	Registry of DICOM Data Elements	64	64	4103	4103	FillerOrderNumberProcedure	SH	1	RET	2014-10-27 22:02:56.600518
1929	Confidentiality Code	Registry of DICOM Data Elements	64	64	4104	4104	ConfidentialityCode	LO	1		2014-10-27 22:02:56.60508
1930	Reporting Priority	Registry of DICOM Data Elements	64	64	4105	4105	ReportingPriority	SH	1		2014-10-27 22:02:56.608342
1931	Reason for Requested Procedure Code Sequence	Registry of DICOM Data Elements	64	64	4106	4106	ReasonForRequestedProcedureCodeSequence	SQ	1		2014-10-27 22:02:56.611729
1932	Names of Intended Recipients of Results	Registry of DICOM Data Elements	64	64	4112	4112	NamesOfIntendedRecipientsOfResults	PN	1-n		2014-10-27 22:02:56.614955
1933	Intended Recipients of Results Identification Sequence	Registry of DICOM Data Elements	64	64	4113	4113	IntendedRecipientsOfResultsIdentificationSequence	SQ	1		2014-10-27 22:02:56.618242
1934	Reason For Performed Procedure Code Sequence	Registry of DICOM Data Elements	64	64	4114	4114	ReasonForPerformedProcedureCodeSequence	SQ	1		2014-10-27 22:02:56.621536
1935	Requested Procedure Description (Trial)	Registry of DICOM Data Elements	64	64	4192	4192	RequestedProcedureDescriptionTrial	LO	1	RET	2014-10-27 22:02:56.625354
1936	Person Identification Code Sequence	Registry of DICOM Data Elements	64	64	4353	4353	PersonIdentificationCodeSequence	SQ	1		2014-10-27 22:02:56.628614
1937	Person's Address	Registry of DICOM Data Elements	64	64	4354	4354	PersonAddress	ST	1		2014-10-27 22:02:56.631873
1938	Person's Telephone Numbers	Registry of DICOM Data Elements	64	64	4355	4355	PersonTelephoneNumbers	LO	1-n		2014-10-27 22:02:56.635117
1939	Requested Procedure Comments	Registry of DICOM Data Elements	64	64	5120	5120	RequestedProcedureComments	LT	1		2014-10-27 22:02:56.638357
1940	Reason for the Imaging Service Request	Registry of DICOM Data Elements	64	64	8193	8193	ReasonForTheImagingServiceRequest	LO	1	RET	2014-10-27 22:02:56.641578
1941	Issue Date of Imaging Service Request	Registry of DICOM Data Elements	64	64	8196	8196	IssueDateOfImagingServiceRequest	DA	1		2014-10-27 22:02:56.644843
1942	Issue Time of Imaging Service Request	Registry of DICOM Data Elements	64	64	8197	8197	IssueTimeOfImagingServiceRequest	TM	1		2014-10-27 22:02:56.648065
1943	Placer Order Number / Imaging Service Request (Retired)	Registry of DICOM Data Elements	64	64	8198	8198	PlacerOrderNumberImagingServiceRequestRetired	SH	1	RET	2014-10-27 22:02:56.651344
1944	Filler Order Number / Imaging Service Request (Retired)	Registry of DICOM Data Elements	64	64	8199	8199	FillerOrderNumberImagingServiceRequestRetired	SH	1	RET	2014-10-27 22:02:56.654656
1945	Order Entered By	Registry of DICOM Data Elements	64	64	8200	8200	OrderEnteredBy	PN	1		2014-10-27 22:02:56.65801
1946	Order Enterer's Location	Registry of DICOM Data Elements	64	64	8201	8201	OrderEntererLocation	SH	1		2014-10-27 22:02:56.661816
1947	Order Callback Phone Number	Registry of DICOM Data Elements	64	64	8208	8208	OrderCallbackPhoneNumber	SH	1		2014-10-27 22:02:56.665049
1948	Placer Order Number / Imaging Service Request	Registry of DICOM Data Elements	64	64	8214	8214	PlacerOrderNumberImagingServiceRequest	LO	1		2014-10-27 22:02:56.66827
1949	Filler Order Number / Imaging Service Request	Registry of DICOM Data Elements	64	64	8215	8215	FillerOrderNumberImagingServiceRequest	LO	1		2014-10-27 22:02:56.671556
1950	Imaging Service Request Comments	Registry of DICOM Data Elements	64	64	9216	9216	ImagingServiceRequestComments	LT	1		2014-10-27 22:02:56.674802
1951	Confidentiality Constraint on Patient Data Description	Registry of DICOM Data Elements	64	64	12289	12289	ConfidentialityConstraintOnPatientDataDescription	LO	1		2014-10-27 22:02:56.678037
1952	General Purpose Scheduled Procedure Step Status	Registry of DICOM Data Elements	64	64	16385	16385	GeneralPurposeScheduledProcedureStepStatus	CS	1	RET	2014-10-27 22:02:56.681394
1953	General Purpose Performed Procedure Step Status	Registry of DICOM Data Elements	64	64	16386	16386	GeneralPurposePerformedProcedureStepStatus	CS	1	RET	2014-10-27 22:02:56.684662
1954	General Purpose Scheduled Procedure Step Priority	Registry of DICOM Data Elements	64	64	16387	16387	GeneralPurposeScheduledProcedureStepPriority	CS	1	RET	2014-10-27 22:02:56.687935
1955	Scheduled Processing Applications Code Sequence	Registry of DICOM Data Elements	64	64	16388	16388	ScheduledProcessingApplicationsCodeSequence	SQ	1	RET	2014-10-27 22:02:56.691265
1956	Scheduled Procedure Step Start DateTime	Registry of DICOM Data Elements	64	64	16389	16389	ScheduledProcedureStepStartDateTime	DT	1	RET	2014-10-27 22:02:56.695786
1957	Multiple Copies Flag	Registry of DICOM Data Elements	64	64	16390	16390	MultipleCopiesFlag	CS	1	RET	2014-10-27 22:02:56.699045
1958	Performed Processing Applications Code Sequence	Registry of DICOM Data Elements	64	64	16391	16391	PerformedProcessingApplicationsCodeSequence	SQ	1		2014-10-27 22:02:56.702324
1959	Human Performer Code Sequence	Registry of DICOM Data Elements	64	64	16393	16393	HumanPerformerCodeSequence	SQ	1		2014-10-27 22:02:56.705567
1960	Scheduled Procedure Step Modification DateTime	Registry of DICOM Data Elements	64	64	16400	16400	ScheduledProcedureStepModificationDateTime	DT	1		2014-10-27 22:02:56.708863
1961	Expected Completion DateTime	Registry of DICOM Data Elements	64	64	16401	16401	ExpectedCompletionDateTime	DT	1		2014-10-27 22:02:56.712083
1962	Resulting General Purpose Performed Procedure Steps Sequence	Registry of DICOM Data Elements	64	64	16405	16405	ResultingGeneralPurposePerformedProcedureStepsSequence	SQ	1	RET	2014-10-27 22:02:56.7153
1963	Referenced General Purpose Scheduled Procedure Step Sequence	Registry of DICOM Data Elements	64	64	16406	16406	ReferencedGeneralPurposeScheduledProcedureStepSequence	SQ	1	RET	2014-10-27 22:02:56.718547
1964	Scheduled Workitem Code Sequence	Registry of DICOM Data Elements	64	64	16408	16408	ScheduledWorkitemCodeSequence	SQ	1		2014-10-27 22:02:56.721816
1965	Performed Workitem Code Sequence	Registry of DICOM Data Elements	64	64	16409	16409	PerformedWorkitemCodeSequence	SQ	1		2014-10-27 22:02:56.725131
1966	Input Availability Flag	Registry of DICOM Data Elements	64	64	16416	16416	InputAvailabilityFlag	CS	1		2014-10-27 22:02:56.728457
1967	Input Information Sequence	Registry of DICOM Data Elements	64	64	16417	16417	InputInformationSequence	SQ	1		2014-10-27 22:02:56.732107
1968	Relevant Information Sequence	Registry of DICOM Data Elements	64	64	16418	16418	RelevantInformationSequence	SQ	1	RET	2014-10-27 22:02:56.735402
1969	Referenced General Purpose Scheduled Procedure Step Transaction UID	Registry of DICOM Data Elements	64	64	16419	16419	ReferencedGeneralPurposeScheduledProcedureStepTransactionUID	UI	1	RET	2014-10-27 22:02:56.738645
1970	Scheduled Station Name Code Sequence	Registry of DICOM Data Elements	64	64	16421	16421	ScheduledStationNameCodeSequence	SQ	1		2014-10-27 22:02:56.742019
1971	Scheduled Station Class Code Sequence	Registry of DICOM Data Elements	64	64	16422	16422	ScheduledStationClassCodeSequence	SQ	1		2014-10-27 22:02:56.745279
1972	Scheduled Station Geographic Location Code Sequence	Registry of DICOM Data Elements	64	64	16423	16423	ScheduledStationGeographicLocationCodeSequence	SQ	1		2014-10-27 22:02:56.748532
1973	Performed Station Name Code Sequence	Registry of DICOM Data Elements	64	64	16424	16424	PerformedStationNameCodeSequence	SQ	1		2014-10-27 22:02:56.751768
1974	Performed Station Class Code Sequence	Registry of DICOM Data Elements	64	64	16425	16425	PerformedStationClassCodeSequence	SQ	1		2014-10-27 22:02:56.755019
1975	Performed Station Geographic Location Code Sequence	Registry of DICOM Data Elements	64	64	16432	16432	PerformedStationGeographicLocationCodeSequence	SQ	1		2014-10-27 22:02:56.75829
1976	Requested Subsequent Workitem Code Sequence	Registry of DICOM Data Elements	64	64	16433	16433	RequestedSubsequentWorkitemCodeSequence	SQ	1	RET	2014-10-27 22:02:56.761554
1977	Non-DICOM Output Code Sequence	Registry of DICOM Data Elements	64	64	16434	16434	NonDICOMOutputCodeSequence	SQ	1	RET	2014-10-27 22:02:56.764861
1978	Output Information Sequence	Registry of DICOM Data Elements	64	64	16435	16435	OutputInformationSequence	SQ	1		2014-10-27 22:02:56.768533
1979	Scheduled Human Performers Sequence	Registry of DICOM Data Elements	64	64	16436	16436	ScheduledHumanPerformersSequence	SQ	1		2014-10-27 22:02:56.77181
1980	Actual Human Performers Sequence	Registry of DICOM Data Elements	64	64	16437	16437	ActualHumanPerformersSequence	SQ	1		2014-10-27 22:02:56.775109
1981	Human Performer's Organization	Registry of DICOM Data Elements	64	64	16438	16438	HumanPerformerOrganization	LO	1		2014-10-27 22:02:56.778365
1982	Human Performer's Name	Registry of DICOM Data Elements	64	64	16439	16439	HumanPerformerName	PN	1		2014-10-27 22:02:56.781745
1983	Raw Data Handling	Registry of DICOM Data Elements	64	64	16448	16448	RawDataHandling	CS	1		2014-10-27 22:02:56.785083
1984	Input Readiness State	Registry of DICOM Data Elements	64	64	16449	16449	InputReadinessState	CS	1		2014-10-27 22:02:56.788348
1985	Performed Procedure Step Start DateTime	Registry of DICOM Data Elements	64	64	16464	16464	PerformedProcedureStepStartDateTime	DT	1		2014-10-27 22:02:56.791626
1986	Performed Procedure Step End DateTime	Registry of DICOM Data Elements	64	64	16465	16465	PerformedProcedureStepEndDateTime	DT	1		2014-10-27 22:02:56.794878
1987	Procedure Step Cancellation DateTime	Registry of DICOM Data Elements	64	64	16466	16466	ProcedureStepCancellationDateTime	DT	1		2014-10-27 22:02:56.798117
1988	Entrance Dose in mGy	Registry of DICOM Data Elements	64	64	33538	33538	EntranceDoseInmGy	DS	1		2014-10-27 22:02:56.801401
1989	Referenced Image Real World Value Mapping Sequence	Registry of DICOM Data Elements	64	64	37012	37012	ReferencedImageRealWorldValueMappingSequence	SQ	1		2014-10-27 22:02:56.805098
1990	Real World Value Mapping Sequence	Registry of DICOM Data Elements	64	64	37014	37014	RealWorldValueMappingSequence	SQ	1		2014-10-27 22:02:56.808361
1991	Pixel Value Mapping Code Sequence	Registry of DICOM Data Elements	64	64	37016	37016	PixelValueMappingCodeSequence	SQ	1		2014-10-27 22:02:56.811603
1992	LUT Label	Registry of DICOM Data Elements	64	64	37392	37392	LUTLabel	SH	1		2014-10-27 22:02:56.814851
1993	Real World Value Last Value Mapped	Registry of DICOM Data Elements	64	64	37393	37393	RealWorldValueLastValueMapped	US or SS	1		2014-10-27 22:02:56.818097
1994	Real World Value LUT Data	Registry of DICOM Data Elements	64	64	37394	37394	RealWorldValueLUTData	FD	1-n		2014-10-27 22:02:56.82144
1995	Real World Value First Value Mapped	Registry of DICOM Data Elements	64	64	37398	37398	RealWorldValueFirstValueMapped	US or SS	1		2014-10-27 22:02:56.82472
1996	Real World Value Intercept	Registry of DICOM Data Elements	64	64	37412	37412	RealWorldValueIntercept	FD	1		2014-10-27 22:02:56.827989
1997	Real World Value Slope	Registry of DICOM Data Elements	64	64	37413	37413	RealWorldValueSlope	FD	1		2014-10-27 22:02:56.831251
1998	Findings Flag (Trial)	Registry of DICOM Data Elements	64	64	40967	40967	FindingsFlagTrial	CS	1	RET	2014-10-27 22:02:56.834488
1999	Relationship Type	Registry of DICOM Data Elements	64	64	40976	40976	RelationshipType	CS	1		2014-10-27 22:02:56.837791
2000	Findings Sequence (Trial)	Registry of DICOM Data Elements	64	64	40992	40992	FindingsSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.841558
2001	Findings Group UID (Trial)	Registry of DICOM Data Elements	64	64	40993	40993	FindingsGroupUIDTrial	UI	1	RET	2014-10-27 22:02:56.844838
2002	Referenced Findings Group UID (Trial)	Registry of DICOM Data Elements	64	64	40994	40994	ReferencedFindingsGroupUIDTrial	UI	1	RET	2014-10-27 22:02:56.848086
2003	Findings Group Recording Date (Trial)	Registry of DICOM Data Elements	64	64	40995	40995	FindingsGroupRecordingDateTrial	DA	1	RET	2014-10-27 22:02:56.851347
2004	Findings Group Recording Time (Trial)	Registry of DICOM Data Elements	64	64	40996	40996	FindingsGroupRecordingTimeTrial	TM	1	RET	2014-10-27 22:02:56.854587
2005	Findings Source Category Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	40998	40998	FindingsSourceCategoryCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.857865
2006	Verifying Organization	Registry of DICOM Data Elements	64	64	40999	40999	VerifyingOrganization	LO	1		2014-10-27 22:02:56.861127
2007	Documenting Organization Identifier Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41000	41000	DocumentingOrganizationIdentifierCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.864401
2008	Verification DateTime	Registry of DICOM Data Elements	64	64	41008	41008	VerificationDateTime	DT	1		2014-10-27 22:02:56.867635
2009	Observation DateTime	Registry of DICOM Data Elements	64	64	41010	41010	ObservationDateTime	DT	1		2014-10-27 22:02:56.870873
2010	Value Type	Registry of DICOM Data Elements	64	64	41024	41024	ValueType	CS	1		2014-10-27 22:02:56.874196
2011	Concept Name Code Sequence	Registry of DICOM Data Elements	64	64	41027	41027	ConceptNameCodeSequence	SQ	1		2014-10-27 22:02:56.877903
2012	Measurement Precision Description (Trial)	Registry of DICOM Data Elements	64	64	41031	41031	MeasurementPrecisionDescriptionTrial	LO	1	RET	2014-10-27 22:02:56.881224
2013	Continuity Of Content	Registry of DICOM Data Elements	64	64	41040	41040	ContinuityOfContent	CS	1		2014-10-27 22:02:56.884484
2014	Urgency or Priority Alerts (Trial)	Registry of DICOM Data Elements	64	64	41047	41047	UrgencyOrPriorityAlertsTrial	CS	1-n	RET	2014-10-27 22:02:56.887723
2015	Sequencing Indicator (Trial)	Registry of DICOM Data Elements	64	64	41056	41056	SequencingIndicatorTrial	LO	1	RET	2014-10-27 22:02:56.890963
2016	Document Identifier Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41062	41062	DocumentIdentifierCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.894202
2017	Document Author (Trial)	Registry of DICOM Data Elements	64	64	41063	41063	DocumentAuthorTrial	PN	1	RET	2014-10-27 22:02:56.897466
2018	Document Author Identifier Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41064	41064	DocumentAuthorIdentifierCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.900741
2019	Identifier Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41072	41072	IdentifierCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.903996
2020	Verifying Observer Sequence	Registry of DICOM Data Elements	64	64	41075	41075	VerifyingObserverSequence	SQ	1		2014-10-27 22:02:56.907302
2021	Object Binary Identifier (Trial)	Registry of DICOM Data Elements	64	64	41076	41076	ObjectBinaryIdentifierTrial	OB	1	RET	2014-10-27 22:02:56.910604
2022	Verifying Observer Name	Registry of DICOM Data Elements	64	64	41077	41077	VerifyingObserverName	PN	1		2014-10-27 22:02:56.914386
2023	Documenting Observer Identifier Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41078	41078	DocumentingObserverIdentifierCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.917687
2024	Author Observer Sequence	Registry of DICOM Data Elements	64	64	41080	41080	AuthorObserverSequence	SQ	1		2014-10-27 22:02:56.920974
2025	Participant Sequence	Registry of DICOM Data Elements	64	64	41082	41082	ParticipantSequence	SQ	1		2014-10-27 22:02:56.924224
2026	Custodial Organization Sequence	Registry of DICOM Data Elements	64	64	41084	41084	CustodialOrganizationSequence	SQ	1		2014-10-27 22:02:56.92747
2027	Participation Type	Registry of DICOM Data Elements	64	64	41088	41088	ParticipationType	CS	1		2014-10-27 22:02:56.930728
2028	Participation DateTime	Registry of DICOM Data Elements	64	64	41090	41090	ParticipationDateTime	DT	1		2014-10-27 22:02:56.934019
2029	Observer Type	Registry of DICOM Data Elements	64	64	41092	41092	ObserverType	CS	1		2014-10-27 22:02:56.937275
2030	Procedure Identifier Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41093	41093	ProcedureIdentifierCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:56.940519
2031	Verifying Observer Identification Code Sequence	Registry of DICOM Data Elements	64	64	41096	41096	VerifyingObserverIdentificationCodeSequence	SQ	1		2014-10-27 22:02:56.943839
2032	Object Directory Binary Identifier (Trial)	Registry of DICOM Data Elements	64	64	41097	41097	ObjectDirectoryBinaryIdentifierTrial	OB	1	RET	2014-10-27 22:02:56.94718
2033	Equivalent CDA Document Sequence	Registry of DICOM Data Elements	64	64	41104	41104	EquivalentCDADocumentSequence	SQ	1	RET	2014-10-27 22:02:56.950918
2034	Referenced Waveform Channels	Registry of DICOM Data Elements	64	64	41136	41136	ReferencedWaveformChannels	US	2-2n		2014-10-27 22:02:56.954189
2035	Date of Document or Verbal Transaction (Trial)	Registry of DICOM Data Elements	64	64	41232	41232	DateOfDocumentOrVerbalTransactionTrial	DA	1	RET	2014-10-27 22:02:56.957458
2036	Time of Document Creation or Verbal Transaction (Trial)	Registry of DICOM Data Elements	64	64	41234	41234	TimeOfDocumentCreationOrVerbalTransactionTrial	TM	1	RET	2014-10-27 22:02:56.96074
2037	DateTime	Registry of DICOM Data Elements	64	64	41248	41248	DateTime	DT	1		2014-10-27 22:02:56.963984
2038	Date	Registry of DICOM Data Elements	64	64	41249	41249	Date	DA	1		2014-10-27 22:02:56.967237
2039	Time	Registry of DICOM Data Elements	64	64	41250	41250	Time	TM	1		2014-10-27 22:02:56.9705
2040	Person Name	Registry of DICOM Data Elements	64	64	41251	41251	PersonName	PN	1		2014-10-27 22:02:56.973759
2041	UID	Registry of DICOM Data Elements	64	64	41252	41252	UID	UI	1		2014-10-27 22:02:56.977059
2042	Report Status ID (Trial)	Registry of DICOM Data Elements	64	64	41253	41253	ReportStatusIDTrial	CS	2	RET	2014-10-27 22:02:56.980381
2043	Temporal Range Type	Registry of DICOM Data Elements	64	64	41264	41264	TemporalRangeType	CS	1		2014-10-27 22:02:56.983733
2044	Referenced Sample Positions	Registry of DICOM Data Elements	64	64	41266	41266	ReferencedSamplePositions	UL	1-n		2014-10-27 22:02:56.987605
2151	Prism Sequence	Registry of DICOM Data Elements	70	70	40	40	PrismSequence	SQ	1		2014-10-27 22:02:57.344923
2045	Referenced Frame Numbers	Registry of DICOM Data Elements	64	64	41270	41270	ReferencedFrameNumbers	US	1-n		2014-10-27 22:02:56.99091
2046	Referenced Time Offsets	Registry of DICOM Data Elements	64	64	41272	41272	ReferencedTimeOffsets	DS	1-n		2014-10-27 22:02:56.994253
2047	Referenced DateTime	Registry of DICOM Data Elements	64	64	41274	41274	ReferencedDateTime	DT	1-n		2014-10-27 22:02:56.997497
2048	Text Value	Registry of DICOM Data Elements	64	64	41312	41312	TextValue	UT	1		2014-10-27 22:02:57.000781
2049	Floating Point Value	Registry of DICOM Data Elements	64	64	41313	41313	FloatingPointValue	FD	1-n		2014-10-27 22:02:57.004095
2050	Rational Numerator Value	Registry of DICOM Data Elements	64	64	41314	41314	RationalNumeratorValue	SL	1-n		2014-10-27 22:02:57.007364
2051	Rational Denominator Value	Registry of DICOM Data Elements	64	64	41315	41315	RationalDenominatorValue	UL	1-n		2014-10-27 22:02:57.010625
2052	Observation Category Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41319	41319	ObservationCategoryCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.013931
2053	Concept Code Sequence	Registry of DICOM Data Elements	64	64	41320	41320	ConceptCodeSequence	SQ	1		2014-10-27 22:02:57.017264
2054	Bibliographic Citation (Trial)	Registry of DICOM Data Elements	64	64	41322	41322	BibliographicCitationTrial	ST	1	RET	2014-10-27 22:02:57.020602
2055	Purpose of Reference Code Sequence	Registry of DICOM Data Elements	64	64	41328	41328	PurposeOfReferenceCodeSequence	SQ	1	See Note 1	2014-10-27 22:02:57.024341
2056	Observation UID	Registry of DICOM Data Elements	64	64	41329	41329	ObservationUID	UI	1		2014-10-27 22:02:57.027629
2057	Referenced Observation UID (Trial)	Registry of DICOM Data Elements	64	64	41330	41330	ReferencedObservationUIDTrial	UI	1	RET	2014-10-27 22:02:57.030864
2058	Referenced Observation Class (Trial)	Registry of DICOM Data Elements	64	64	41331	41331	ReferencedObservationClassTrial	CS	1	RET	2014-10-27 22:02:57.034163
2059	Referenced Object Observation Class (Trial)	Registry of DICOM Data Elements	64	64	41332	41332	ReferencedObjectObservationClassTrial	CS	1	RET	2014-10-27 22:02:57.03744
2060	Annotation Group Number	Registry of DICOM Data Elements	64	64	41344	41344	AnnotationGroupNumber	US	1		2014-10-27 22:02:57.040722
2061	Observation Date (Trial)	Registry of DICOM Data Elements	64	64	41362	41362	ObservationDateTrial	DA	1	RET	2014-10-27 22:02:57.043957
2062	Observation Time (Trial)	Registry of DICOM Data Elements	64	64	41363	41363	ObservationTimeTrial	TM	1	RET	2014-10-27 22:02:57.04721
2063	Measurement Automation (Trial)	Registry of DICOM Data Elements	64	64	41364	41364	MeasurementAutomationTrial	CS	1	RET	2014-10-27 22:02:57.050518
2064	Modifier Code Sequence	Registry of DICOM Data Elements	64	64	41365	41365	ModifierCodeSequence	SQ	1		2014-10-27 22:02:57.053858
2065	Identification Description (Trial)	Registry of DICOM Data Elements	64	64	41508	41508	IdentificationDescriptionTrial	ST	1	RET	2014-10-27 22:02:57.057193
2066	Coordinates Set Geometric Type (Trial)	Registry of DICOM Data Elements	64	64	41616	41616	CoordinatesSetGeometricTypeTrial	CS	1	RET	2014-10-27 22:02:57.060958
2067	Algorithm Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41622	41622	AlgorithmCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.064223
2068	Algorithm Description (Trial)	Registry of DICOM Data Elements	64	64	41623	41623	AlgorithmDescriptionTrial	ST	1	RET	2014-10-27 22:02:57.067482
2069	Pixel Coordinates Set (Trial)	Registry of DICOM Data Elements	64	64	41626	41626	PixelCoordinatesSetTrial	SL	2-2n	RET	2014-10-27 22:02:57.071022
2070	Measured Value Sequence	Registry of DICOM Data Elements	64	64	41728	41728	MeasuredValueSequence	SQ	1		2014-10-27 22:02:57.074311
2071	Numeric Value Qualifier Code Sequence	Registry of DICOM Data Elements	64	64	41729	41729	NumericValueQualifierCodeSequence	SQ	1		2014-10-27 22:02:57.077572
2072	Current Observer (Trial)	Registry of DICOM Data Elements	64	64	41735	41735	CurrentObserverTrial	PN	1	RET	2014-10-27 22:02:57.080944
2073	Numeric Value	Registry of DICOM Data Elements	64	64	41738	41738	NumericValue	DS	1-n		2014-10-27 22:02:57.084226
2074	Referenced Accession Sequence (Trial)	Registry of DICOM Data Elements	64	64	41747	41747	ReferencedAccessionSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.087661
2075	Report Status Comment (Trial)	Registry of DICOM Data Elements	64	64	41786	41786	ReportStatusCommentTrial	ST	1	RET	2014-10-27 22:02:57.090997
2076	Procedure Context Sequence (Trial)	Registry of DICOM Data Elements	64	64	41792	41792	ProcedureContextSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.094367
2077	Verbal Source (Trial)	Registry of DICOM Data Elements	64	64	41810	41810	VerbalSourceTrial	PN	1	RET	2014-10-27 22:02:57.0981
2078	Address (Trial)	Registry of DICOM Data Elements	64	64	41811	41811	AddressTrial	ST	1	RET	2014-10-27 22:02:57.101363
2079	Telephone Number (Trial)	Registry of DICOM Data Elements	64	64	41812	41812	TelephoneNumberTrial	LO	1	RET	2014-10-27 22:02:57.104652
2080	Verbal Source Identifier Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41816	41816	VerbalSourceIdentifierCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.107966
2081	Predecessor Documents Sequence	Registry of DICOM Data Elements	64	64	41824	41824	PredecessorDocumentsSequence	SQ	1		2014-10-27 22:02:57.111226
2082	Referenced Request Sequence	Registry of DICOM Data Elements	64	64	41840	41840	ReferencedRequestSequence	SQ	1		2014-10-27 22:02:57.114512
2083	Performed Procedure Code Sequence	Registry of DICOM Data Elements	64	64	41842	41842	PerformedProcedureCodeSequence	SQ	1		2014-10-27 22:02:57.117744
2084	Current Requested Procedure Evidence Sequence	Registry of DICOM Data Elements	64	64	41845	41845	CurrentRequestedProcedureEvidenceSequence	SQ	1		2014-10-27 22:02:57.121065
2085	Report Detail Sequence (Trial)	Registry of DICOM Data Elements	64	64	41856	41856	ReportDetailSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.124379
2086	Pertinent Other Evidence Sequence	Registry of DICOM Data Elements	64	64	41861	41861	PertinentOtherEvidenceSequence	SQ	1		2014-10-27 22:02:57.127743
2087	HL7 Structured Document Reference Sequence	Registry of DICOM Data Elements	64	64	41872	41872	HL7StructuredDocumentReferenceSequence	SQ	1		2014-10-27 22:02:57.132194
2088	Observation Subject UID (Trial)	Registry of DICOM Data Elements	64	64	41986	41986	ObservationSubjectUIDTrial	UI	1	RET	2014-10-27 22:02:57.135484
2089	Observation Subject Class (Trial)	Registry of DICOM Data Elements	64	64	41987	41987	ObservationSubjectClassTrial	CS	1	RET	2014-10-27 22:02:57.13872
2090	Observation Subject Type Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	41988	41988	ObservationSubjectTypeCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.141977
2091	Completion Flag	Registry of DICOM Data Elements	64	64	42129	42129	CompletionFlag	CS	1		2014-10-27 22:02:57.145255
2092	Completion Flag Description	Registry of DICOM Data Elements	64	64	42130	42130	CompletionFlagDescription	LO	1		2014-10-27 22:02:57.148554
2093	Verification Flag	Registry of DICOM Data Elements	64	64	42131	42131	VerificationFlag	CS	1		2014-10-27 22:02:57.151795
2094	Archive Requested	Registry of DICOM Data Elements	64	64	42132	42132	ArchiveRequested	CS	1		2014-10-27 22:02:57.155058
2095	Preliminary Flag	Registry of DICOM Data Elements	64	64	42134	42134	PreliminaryFlag	CS	1		2014-10-27 22:02:57.158345
2096	Content Template Sequence	Registry of DICOM Data Elements	64	64	42244	42244	ContentTemplateSequence	SQ	1		2014-10-27 22:02:57.161606
2317	Rotation Vector	Registry of DICOM Data Elements	84	84	80	80	RotationVector	US	1-n		2014-10-27 22:02:57.902726
2097	Identical Documents Sequence	Registry of DICOM Data Elements	64	64	42277	42277	IdenticalDocumentsSequence	SQ	1		2014-10-27 22:02:57.164897
2098	Observation Subject Context Flag (Trial)	Registry of DICOM Data Elements	64	64	42496	42496	ObservationSubjectContextFlagTrial	CS	1	RET	2014-10-27 22:02:57.16862
2099	Observer Context Flag (Trial)	Registry of DICOM Data Elements	64	64	42497	42497	ObserverContextFlagTrial	CS	1	RET	2014-10-27 22:02:57.17189
2100	Procedure Context Flag (Trial)	Registry of DICOM Data Elements	64	64	42499	42499	ProcedureContextFlagTrial	CS	1	RET	2014-10-27 22:02:57.17512
2101	Content Sequence	Registry of DICOM Data Elements	64	64	42800	42800	ContentSequence	SQ	1		2014-10-27 22:02:57.178372
2102	Relationship Sequence (Trial)	Registry of DICOM Data Elements	64	64	42801	42801	RelationshipSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.181613
2103	Relationship Type Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	42802	42802	RelationshipTypeCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.1849
2104	Language Code Sequence (Trial)	Registry of DICOM Data Elements	64	64	42820	42820	LanguageCodeSequenceTrial	SQ	1	RET	2014-10-27 22:02:57.188144
2105	Uniform Resource Locator (Trial)	Registry of DICOM Data Elements	64	64	43410	43410	UniformResourceLocatorTrial	ST	1	RET	2014-10-27 22:02:57.191504
2106	Waveform Annotation Sequence	Registry of DICOM Data Elements	64	64	45088	45088	WaveformAnnotationSequence	SQ	1		2014-10-27 22:02:57.194739
2107	Template Identifier	Registry of DICOM Data Elements	64	64	56064	56064	TemplateIdentifier	CS	1		2014-10-27 22:02:57.197994
2108	Template Version	Registry of DICOM Data Elements	64	64	56070	56070	TemplateVersion	DT	1	RET	2014-10-27 22:02:57.201317
2109	Template Local Version	Registry of DICOM Data Elements	64	64	56071	56071	TemplateLocalVersion	DT	1	RET	2014-10-27 22:02:57.205034
2110	Template Extension Flag	Registry of DICOM Data Elements	64	64	56075	56075	TemplateExtensionFlag	CS	1	RET	2014-10-27 22:02:57.208293
2111	Template Extension Organization UID	Registry of DICOM Data Elements	64	64	56076	56076	TemplateExtensionOrganizationUID	UI	1	RET	2014-10-27 22:02:57.21161
2112	Template Extension Creator UID	Registry of DICOM Data Elements	64	64	56077	56077	TemplateExtensionCreatorUID	UI	1	RET	2014-10-27 22:02:57.214874
2113	Referenced Content Item Identifier	Registry of DICOM Data Elements	64	64	56179	56179	ReferencedContentItemIdentifier	UL	1-n		2014-10-27 22:02:57.218134
2114	HL7 Instance Identifier	Registry of DICOM Data Elements	64	64	57345	57345	HL7InstanceIdentifier	ST	1		2014-10-27 22:02:57.221407
2115	HL7 Document Effective Time	Registry of DICOM Data Elements	64	64	57348	57348	HL7DocumentEffectiveTime	DT	1		2014-10-27 22:02:57.224665
2116	HL7 Document Type Code Sequence	Registry of DICOM Data Elements	64	64	57350	57350	HL7DocumentTypeCodeSequence	SQ	1		2014-10-27 22:02:57.227916
2117	Document Class Code Sequence	Registry of DICOM Data Elements	64	64	57352	57352	DocumentClassCodeSequence	SQ	1		2014-10-27 22:02:57.231181
2118	Retrieve URI	Registry of DICOM Data Elements	64	64	57360	57360	RetrieveURI	UR	1		2014-10-27 22:02:57.234436
2119	Retrieve Location UID	Registry of DICOM Data Elements	64	64	57361	57361	RetrieveLocationUID	UI	1		2014-10-27 22:02:57.237674
2120	Type of Instances	Registry of DICOM Data Elements	64	64	57376	57376	TypeOfInstances	CS	1		2014-10-27 22:02:57.241487
2121	DICOM Retrieval Sequence	Registry of DICOM Data Elements	64	64	57377	57377	DICOMRetrievalSequence	SQ	1		2014-10-27 22:02:57.244796
2122	DICOM Media Retrieval Sequence	Registry of DICOM Data Elements	64	64	57378	57378	DICOMMediaRetrievalSequence	SQ	1		2014-10-27 22:02:57.248078
2123	WADO Retrieval Sequence	Registry of DICOM Data Elements	64	64	57379	57379	WADORetrievalSequence	SQ	1		2014-10-27 22:02:57.251336
2124	XDS Retrieval Sequence	Registry of DICOM Data Elements	64	64	57380	57380	XDSRetrievalSequence	SQ	1		2014-10-27 22:02:57.254624
2125	Repository Unique ID	Registry of DICOM Data Elements	64	64	57392	57392	RepositoryUniqueID	UI	1		2014-10-27 22:02:57.257886
2126	Home Community ID	Registry of DICOM Data Elements	64	64	57393	57393	HomeCommunityID	UI	1		2014-10-27 22:02:57.26119
2127	Document Title	Registry of DICOM Data Elements	66	66	16	16	DocumentTitle	ST	1		2014-10-27 22:02:57.264475
2128	Encapsulated Document	Registry of DICOM Data Elements	66	66	17	17	EncapsulatedDocument	OB	1		2014-10-27 22:02:57.267718
2129	MIME Type of Encapsulated Document	Registry of DICOM Data Elements	66	66	18	18	MIMETypeOfEncapsulatedDocument	LO	1		2014-10-27 22:02:57.270976
2130	Source Instance Sequence	Registry of DICOM Data Elements	66	66	19	19	SourceInstanceSequence	SQ	1		2014-10-27 22:02:57.274289
2131	List of MIME Types	Registry of DICOM Data Elements	66	66	20	20	ListOfMIMETypes	LO	1-n		2014-10-27 22:02:57.278049
2132	Product Package Identifier	Registry of DICOM Data Elements	68	68	1	1	ProductPackageIdentifier	ST	1		2014-10-27 22:02:57.28142
2133	Substance Administration Approval	Registry of DICOM Data Elements	68	68	2	2	SubstanceAdministrationApproval	CS	1		2014-10-27 22:02:57.28471
2134	Approval Status Further Description	Registry of DICOM Data Elements	68	68	3	3	ApprovalStatusFurtherDescription	LT	1		2014-10-27 22:02:57.287994
2135	Approval Status DateTime	Registry of DICOM Data Elements	68	68	4	4	ApprovalStatusDateTime	DT	1		2014-10-27 22:02:57.291268
2136	Product Type Code Sequence	Registry of DICOM Data Elements	68	68	7	7	ProductTypeCodeSequence	SQ	1		2014-10-27 22:02:57.294565
2137	Product Name	Registry of DICOM Data Elements	68	68	8	8	ProductName	LO	1-n		2014-10-27 22:02:57.297816
2138	Product Description	Registry of DICOM Data Elements	68	68	9	9	ProductDescription	LT	1		2014-10-27 22:02:57.301122
2139	Product Lot Identifier	Registry of DICOM Data Elements	68	68	10	10	ProductLotIdentifier	LO	1		2014-10-27 22:02:57.304401
2140	Product Expiration DateTime	Registry of DICOM Data Elements	68	68	11	11	ProductExpirationDateTime	DT	1		2014-10-27 22:02:57.307693
2141	Substance Administration DateTime	Registry of DICOM Data Elements	68	68	16	16	SubstanceAdministrationDateTime	DT	1		2014-10-27 22:02:57.311021
2142	Substance Administration Notes	Registry of DICOM Data Elements	68	68	17	17	SubstanceAdministrationNotes	LO	1		2014-10-27 22:02:57.314846
2143	Substance Administration Device ID	Registry of DICOM Data Elements	68	68	18	18	SubstanceAdministrationDeviceID	LO	1		2014-10-27 22:02:57.318143
2144	Product Parameter Sequence	Registry of DICOM Data Elements	68	68	19	19	ProductParameterSequence	SQ	1		2014-10-27 22:02:57.321432
2145	Substance Administration Parameter Sequence	Registry of DICOM Data Elements	68	68	25	25	SubstanceAdministrationParameterSequence	SQ	1		2014-10-27 22:02:57.324689
2146	Lens Description	Registry of DICOM Data Elements	70	70	18	18	LensDescription	LO	1		2014-10-27 22:02:57.328257
2147	Right Lens Sequence	Registry of DICOM Data Elements	70	70	20	20	RightLensSequence	SQ	1		2014-10-27 22:02:57.331552
2148	Left Lens Sequence	Registry of DICOM Data Elements	70	70	21	21	LeftLensSequence	SQ	1		2014-10-27 22:02:57.334812
2149	Unspecified Laterality Lens Sequence	Registry of DICOM Data Elements	70	70	22	22	UnspecifiedLateralityLensSequence	SQ	1		2014-10-27 22:02:57.338116
2150	Cylinder Sequence	Registry of DICOM Data Elements	70	70	24	24	CylinderSequence	SQ	1		2014-10-27 22:02:57.341374
2152	Horizontal Prism Power	Registry of DICOM Data Elements	70	70	48	48	HorizontalPrismPower	FD	1		2014-10-27 22:02:57.348298
2153	Horizontal Prism Base	Registry of DICOM Data Elements	70	70	50	50	HorizontalPrismBase	CS	1		2014-10-27 22:02:57.352146
2154	Vertical Prism Power	Registry of DICOM Data Elements	70	70	52	52	VerticalPrismPower	FD	1		2014-10-27 22:02:57.355396
2155	Vertical Prism Base	Registry of DICOM Data Elements	70	70	54	54	VerticalPrismBase	CS	1		2014-10-27 22:02:57.358681
2156	Lens Segment Type	Registry of DICOM Data Elements	70	70	56	56	LensSegmentType	CS	1		2014-10-27 22:02:57.362044
2157	Optical Transmittance	Registry of DICOM Data Elements	70	70	64	64	OpticalTransmittance	FD	1		2014-10-27 22:02:57.365339
2158	Channel Width	Registry of DICOM Data Elements	70	70	66	66	ChannelWidth	FD	1		2014-10-27 22:02:57.368635
2159	Pupil Size	Registry of DICOM Data Elements	70	70	68	68	PupilSize	FD	1		2014-10-27 22:02:57.371891
2160	Corneal Size	Registry of DICOM Data Elements	70	70	70	70	CornealSize	FD	1		2014-10-27 22:02:57.375165
2161	Autorefraction Right Eye Sequence	Registry of DICOM Data Elements	70	70	80	80	AutorefractionRightEyeSequence	SQ	1		2014-10-27 22:02:57.378454
2162	Autorefraction Left Eye Sequence	Registry of DICOM Data Elements	70	70	82	82	AutorefractionLeftEyeSequence	SQ	1		2014-10-27 22:02:57.381721
2163	Distance Pupillary Distance	Registry of DICOM Data Elements	70	70	96	96	DistancePupillaryDistance	FD	1		2014-10-27 22:02:57.385116
2164	Near Pupillary Distance	Registry of DICOM Data Elements	70	70	98	98	NearPupillaryDistance	FD	1		2014-10-27 22:02:57.388875
2165	Intermediate Pupillary Distance	Registry of DICOM Data Elements	70	70	99	99	IntermediatePupillaryDistance	FD	1		2014-10-27 22:02:57.392172
2166	Other Pupillary Distance	Registry of DICOM Data Elements	70	70	100	100	OtherPupillaryDistance	FD	1		2014-10-27 22:02:57.395452
2167	Keratometry Right Eye Sequence	Registry of DICOM Data Elements	70	70	112	112	KeratometryRightEyeSequence	SQ	1		2014-10-27 22:02:57.398712
2168	Keratometry Left Eye Sequence	Registry of DICOM Data Elements	70	70	113	113	KeratometryLeftEyeSequence	SQ	1		2014-10-27 22:02:57.401959
2169	Steep Keratometric Axis Sequence	Registry of DICOM Data Elements	70	70	116	116	SteepKeratometricAxisSequence	SQ	1		2014-10-27 22:02:57.405289
2170	Radius of Curvature	Registry of DICOM Data Elements	70	70	117	117	RadiusOfCurvature	FD	1		2014-10-27 22:02:57.408593
2171	Keratometric Power	Registry of DICOM Data Elements	70	70	118	118	KeratometricPower	FD	1		2014-10-27 22:02:57.411855
2172	Keratometric Axis	Registry of DICOM Data Elements	70	70	119	119	KeratometricAxis	FD	1		2014-10-27 22:02:57.415168
2173	Flat Keratometric Axis Sequence	Registry of DICOM Data Elements	70	70	128	128	FlatKeratometricAxisSequence	SQ	1		2014-10-27 22:02:57.418506
2174	Background Color	Registry of DICOM Data Elements	70	70	146	146	BackgroundColor	CS	1		2014-10-27 22:02:57.421934
2175	Optotype	Registry of DICOM Data Elements	70	70	148	148	Optotype	CS	1		2014-10-27 22:02:57.425683
2176	Optotype Presentation	Registry of DICOM Data Elements	70	70	149	149	OptotypePresentation	CS	1		2014-10-27 22:02:57.428953
2177	Subjective Refraction Right Eye Sequence	Registry of DICOM Data Elements	70	70	151	151	SubjectiveRefractionRightEyeSequence	SQ	1		2014-10-27 22:02:57.432247
2178	Subjective Refraction Left Eye Sequence	Registry of DICOM Data Elements	70	70	152	152	SubjectiveRefractionLeftEyeSequence	SQ	1		2014-10-27 22:02:57.435547
2179	Add Near Sequence	Registry of DICOM Data Elements	70	70	256	256	AddNearSequence	SQ	1		2014-10-27 22:02:57.438816
2180	Add Intermediate Sequence	Registry of DICOM Data Elements	70	70	257	257	AddIntermediateSequence	SQ	1		2014-10-27 22:02:57.442076
2181	Add Other Sequence	Registry of DICOM Data Elements	70	70	258	258	AddOtherSequence	SQ	1		2014-10-27 22:02:57.445407
2182	Add Power	Registry of DICOM Data Elements	70	70	260	260	AddPower	FD	1		2014-10-27 22:02:57.44869
2183	Viewing Distance	Registry of DICOM Data Elements	70	70	262	262	ViewingDistance	FD	1		2014-10-27 22:02:57.451985
2184	Visual Acuity Type Code Sequence	Registry of DICOM Data Elements	70	70	289	289	VisualAcuityTypeCodeSequence	SQ	1		2014-10-27 22:02:57.455313
2185	Visual Acuity Right Eye Sequence	Registry of DICOM Data Elements	70	70	290	290	VisualAcuityRightEyeSequence	SQ	1		2014-10-27 22:02:57.458681
2186	Visual Acuity Left Eye Sequence	Registry of DICOM Data Elements	70	70	291	291	VisualAcuityLeftEyeSequence	SQ	1		2014-10-27 22:02:57.462458
2187	Visual Acuity Both Eyes Open Sequence	Registry of DICOM Data Elements	70	70	292	292	VisualAcuityBothEyesOpenSequence	SQ	1		2014-10-27 22:02:57.465719
2188	Viewing Distance Type	Registry of DICOM Data Elements	70	70	293	293	ViewingDistanceType	CS	1		2014-10-27 22:02:57.469015
2189	Visual Acuity Modifiers	Registry of DICOM Data Elements	70	70	309	309	VisualAcuityModifiers	SS	2		2014-10-27 22:02:57.472292
2190	Decimal Visual Acuity	Registry of DICOM Data Elements	70	70	311	311	DecimalVisualAcuity	FD	1		2014-10-27 22:02:57.475569
2191	Optotype Detailed Definition	Registry of DICOM Data Elements	70	70	313	313	OptotypeDetailedDefinition	LO	1		2014-10-27 22:02:57.478812
2192	Referenced Refractive Measurements Sequence	Registry of DICOM Data Elements	70	70	325	325	ReferencedRefractiveMeasurementsSequence	SQ	1		2014-10-27 22:02:57.482176
2193	Sphere Power	Registry of DICOM Data Elements	70	70	326	326	SpherePower	FD	1		2014-10-27 22:02:57.485445
2194	Cylinder Power	Registry of DICOM Data Elements	70	70	327	327	CylinderPower	FD	1		2014-10-27 22:02:57.488726
2195	Corneal Topography Surface	Registry of DICOM Data Elements	70	70	513	513	CornealTopographySurface	CS	1		2014-10-27 22:02:57.49207
2196	Corneal Vertex Location	Registry of DICOM Data Elements	70	70	514	514	CornealVertexLocation	FL	2		2014-10-27 22:02:57.49547
2197	Pupil Centroid X-Coordinate	Registry of DICOM Data Elements	70	70	515	515	PupilCentroidXCoordinate	FL	1		2014-10-27 22:02:57.499236
2198	Pupil Centroid Y-Coordinate	Registry of DICOM Data Elements	70	70	516	516	PupilCentroidYCoordinate	FL	1		2014-10-27 22:02:57.502497
2199	Equivalent Pupil Radius	Registry of DICOM Data Elements	70	70	517	517	EquivalentPupilRadius	FL	1		2014-10-27 22:02:57.505842
2200	Corneal Topography Map Type Code Sequence	Registry of DICOM Data Elements	70	70	519	519	CornealTopographyMapTypeCodeSequence	SQ	1		2014-10-27 22:02:57.509147
2201	Vertices of the Outline of Pupil	Registry of DICOM Data Elements	70	70	520	520	VerticesOfTheOutlineOfPupil	IS	2-2n		2014-10-27 22:02:57.512443
2202	Corneal Topography Mapping Normals Sequence	Registry of DICOM Data Elements	70	70	528	528	CornealTopographyMappingNormalsSequence	SQ	1		2014-10-27 22:02:57.515744
2203	Maximum Corneal Curvature Sequence	Registry of DICOM Data Elements	70	70	529	529	MaximumCornealCurvatureSequence	SQ	1		2014-10-27 22:02:57.519011
2204	Maximum Corneal Curvature	Registry of DICOM Data Elements	70	70	530	530	MaximumCornealCurvature	FL	1		2014-10-27 22:02:57.522282
2205	Maximum Corneal Curvature Location	Registry of DICOM Data Elements	70	70	531	531	MaximumCornealCurvatureLocation	FL	2		2014-10-27 22:02:57.525599
2206	Minimum Keratometric Sequence	Registry of DICOM Data Elements	70	70	533	533	MinimumKeratometricSequence	SQ	1		2014-10-27 22:02:57.528947
2207	Simulated Keratometric Cylinder Sequence	Registry of DICOM Data Elements	70	70	536	536	SimulatedKeratometricCylinderSequence	SQ	1		2014-10-27 22:02:57.532321
2208	Average Corneal Power	Registry of DICOM Data Elements	70	70	544	544	AverageCornealPower	FL	1		2014-10-27 22:02:57.536128
2209	Corneal I-S Value	Registry of DICOM Data Elements	70	70	548	548	CornealISValue	FL	1		2014-10-27 22:02:57.539385
2210	Analyzed Area	Registry of DICOM Data Elements	70	70	551	551	AnalyzedArea	FL	1		2014-10-27 22:02:57.542675
2211	Surface Regularity Index	Registry of DICOM Data Elements	70	70	560	560	SurfaceRegularityIndex	FL	1		2014-10-27 22:02:57.54595
2212	Surface Asymmetry Index	Registry of DICOM Data Elements	70	70	562	562	SurfaceAsymmetryIndex	FL	1		2014-10-27 22:02:57.549228
2213	Corneal Eccentricity Index	Registry of DICOM Data Elements	70	70	564	564	CornealEccentricityIndex	FL	1		2014-10-27 22:02:57.552533
2214	Keratoconus Prediction Index	Registry of DICOM Data Elements	70	70	566	566	KeratoconusPredictionIndex	FL	1		2014-10-27 22:02:57.555828
2215	Decimal Potential Visual Acuity	Registry of DICOM Data Elements	70	70	568	568	DecimalPotentialVisualAcuity	FL	1		2014-10-27 22:02:57.559124
2216	Corneal Topography Map Quality Evaluation	Registry of DICOM Data Elements	70	70	578	578	CornealTopographyMapQualityEvaluation	CS	1		2014-10-27 22:02:57.562586
2217	Source Image Corneal Processed Data Sequence	Registry of DICOM Data Elements	70	70	580	580	SourceImageCornealProcessedDataSequence	SQ	1		2014-10-27 22:02:57.565945
2218	Corneal Point Location	Registry of DICOM Data Elements	70	70	583	583	CornealPointLocation	FL	3		2014-10-27 22:02:57.570461
2219	Corneal Point Estimated	Registry of DICOM Data Elements	70	70	584	584	CornealPointEstimated	CS	1		2014-10-27 22:02:57.573771
2220	Axial Power	Registry of DICOM Data Elements	70	70	585	585	AxialPower	FL	1		2014-10-27 22:02:57.57708
2221	Tangential Power	Registry of DICOM Data Elements	70	70	592	592	TangentialPower	FL	1		2014-10-27 22:02:57.580353
2222	Refractive Power	Registry of DICOM Data Elements	70	70	593	593	RefractivePower	FL	1		2014-10-27 22:02:57.583656
2223	Relative Elevation	Registry of DICOM Data Elements	70	70	594	594	RelativeElevation	FL	1		2014-10-27 22:02:57.586943
2224	Corneal Wavefront	Registry of DICOM Data Elements	70	70	595	595	CornealWavefront	FL	1		2014-10-27 22:02:57.590307
2225	Imaged Volume Width	Registry of DICOM Data Elements	72	72	1	1	ImagedVolumeWidth	FL	1		2014-10-27 22:02:57.593639
2226	Imaged Volume Height	Registry of DICOM Data Elements	72	72	2	2	ImagedVolumeHeight	FL	1		2014-10-27 22:02:57.596939
2227	Imaged Volume Depth	Registry of DICOM Data Elements	72	72	3	3	ImagedVolumeDepth	FL	1		2014-10-27 22:02:57.600239
2228	Total Pixel Matrix Columns	Registry of DICOM Data Elements	72	72	6	6	TotalPixelMatrixColumns	UL	1		2014-10-27 22:02:57.603549
2229	Total Pixel Matrix Rows	Registry of DICOM Data Elements	72	72	7	7	TotalPixelMatrixRows	UL	1		2014-10-27 22:02:57.607468
2230	Total Pixel Matrix Origin Sequence	Registry of DICOM Data Elements	72	72	8	8	TotalPixelMatrixOriginSequence	SQ	1		2014-10-27 22:02:57.610883
2231	Specimen Label in Image	Registry of DICOM Data Elements	72	72	16	16	SpecimenLabelInImage	CS	1		2014-10-27 22:02:57.614149
2232	Focus Method	Registry of DICOM Data Elements	72	72	17	17	FocusMethod	CS	1		2014-10-27 22:02:57.617439
2233	Extended Depth of Field	Registry of DICOM Data Elements	72	72	18	18	ExtendedDepthOfField	CS	1		2014-10-27 22:02:57.620708
2234	Number of Focal Planes	Registry of DICOM Data Elements	72	72	19	19	NumberOfFocalPlanes	US	1		2014-10-27 22:02:57.623984
2235	Distance Between Focal Planes	Registry of DICOM Data Elements	72	72	20	20	DistanceBetweenFocalPlanes	FL	1		2014-10-27 22:02:57.627243
2236	Recommended Absent Pixel CIELab Value	Registry of DICOM Data Elements	72	72	21	21	RecommendedAbsentPixelCIELabValue	US	3		2014-10-27 22:02:57.63063
2237	Illuminator Type Code Sequence	Registry of DICOM Data Elements	72	72	256	256	IlluminatorTypeCodeSequence	SQ	1		2014-10-27 22:02:57.633932
2238	Image Orientation (Slide)	Registry of DICOM Data Elements	72	72	258	258	ImageOrientationSlide	DS	6		2014-10-27 22:02:57.637201
2239	Optical Path Sequence	Registry of DICOM Data Elements	72	72	261	261	OpticalPathSequence	SQ	1		2014-10-27 22:02:57.640625
2240	Optical Path Identifier	Registry of DICOM Data Elements	72	72	262	262	OpticalPathIdentifier	SH	1		2014-10-27 22:02:57.644338
2241	Optical Path Description	Registry of DICOM Data Elements	72	72	263	263	OpticalPathDescription	ST	1		2014-10-27 22:02:57.647678
2242	Illumination Color Code Sequence	Registry of DICOM Data Elements	72	72	264	264	IlluminationColorCodeSequence	SQ	1		2014-10-27 22:02:57.650983
2243	Specimen Reference Sequence	Registry of DICOM Data Elements	72	72	272	272	SpecimenReferenceSequence	SQ	1		2014-10-27 22:02:57.654265
2244	Condenser Lens Power	Registry of DICOM Data Elements	72	72	273	273	CondenserLensPower	DS	1		2014-10-27 22:02:57.657566
2245	Objective Lens Power	Registry of DICOM Data Elements	72	72	274	274	ObjectiveLensPower	DS	1		2014-10-27 22:02:57.66083
2246	Objective Lens Numerical Aperture	Registry of DICOM Data Elements	72	72	275	275	ObjectiveLensNumericalAperture	DS	1		2014-10-27 22:02:57.664127
2247	Palette Color Lookup Table Sequence	Registry of DICOM Data Elements	72	72	288	288	PaletteColorLookupTableSequence	SQ	1		2014-10-27 22:02:57.667382
2248	Referenced Image Navigation Sequence	Registry of DICOM Data Elements	72	72	512	512	ReferencedImageNavigationSequence	SQ	1		2014-10-27 22:02:57.670692
2249	Top Left Hand Corner of Localizer Area	Registry of DICOM Data Elements	72	72	513	513	TopLeftHandCornerOfLocalizerArea	US	2		2014-10-27 22:02:57.674135
2250	Bottom Right Hand Corner of Localizer Area	Registry of DICOM Data Elements	72	72	514	514	BottomRightHandCornerOfLocalizerArea	US	2		2014-10-27 22:02:57.677434
2251	Optical Path Identification Sequence	Registry of DICOM Data Elements	72	72	519	519	OpticalPathIdentificationSequence	SQ	1		2014-10-27 22:02:57.681264
2252	Plane Position (Slide) Sequence	Registry of DICOM Data Elements	72	72	538	538	PlanePositionSlideSequence	SQ	1		2014-10-27 22:02:57.684678
2253	Column Position In Total Image Pixel Matrix	Registry of DICOM Data Elements	72	72	542	542	ColumnPositionInTotalImagePixelMatrix	SL	1		2014-10-27 22:02:57.688059
2254	Row Position In Total Image Pixel Matrix	Registry of DICOM Data Elements	72	72	543	543	RowPositionInTotalImagePixelMatrix	SL	1		2014-10-27 22:02:57.691324
2255	Pixel Origin Interpretation	Registry of DICOM Data Elements	72	72	769	769	PixelOriginInterpretation	CS	1		2014-10-27 22:02:57.69462
2256	Calibration Image	Registry of DICOM Data Elements	80	80	4	4	CalibrationImage	CS	1		2014-10-27 22:02:57.697929
2257	Device Sequence	Registry of DICOM Data Elements	80	80	16	16	DeviceSequence	SQ	1		2014-10-27 22:02:57.701214
2258	Container Component Type Code Sequence	Registry of DICOM Data Elements	80	80	18	18	ContainerComponentTypeCodeSequence	SQ	1		2014-10-27 22:02:57.70451
2259	Container Component Thickness	Registry of DICOM Data Elements	80	80	19	19	ContainerComponentThickness	FD	1		2014-10-27 22:02:57.707787
2260	Device Length	Registry of DICOM Data Elements	80	80	20	20	DeviceLength	DS	1		2014-10-27 22:02:57.711064
2261	Container Component Width	Registry of DICOM Data Elements	80	80	21	21	ContainerComponentWidth	FD	1		2014-10-27 22:02:57.71439
2262	Device Diameter	Registry of DICOM Data Elements	80	80	22	22	DeviceDiameter	DS	1		2014-10-27 22:02:57.71827
2263	Device Diameter Units	Registry of DICOM Data Elements	80	80	23	23	DeviceDiameterUnits	CS	1		2014-10-27 22:02:57.721563
2264	Device Volume	Registry of DICOM Data Elements	80	80	24	24	DeviceVolume	DS	1		2014-10-27 22:02:57.724847
2265	Inter-Marker Distance	Registry of DICOM Data Elements	80	80	25	25	InterMarkerDistance	DS	1		2014-10-27 22:02:57.728105
2266	Container Component Material	Registry of DICOM Data Elements	80	80	26	26	ContainerComponentMaterial	CS	1		2014-10-27 22:02:57.731394
2267	Container Component ID	Registry of DICOM Data Elements	80	80	27	27	ContainerComponentID	LO	1		2014-10-27 22:02:57.734665
2268	Container Component Length	Registry of DICOM Data Elements	80	80	28	28	ContainerComponentLength	FD	1		2014-10-27 22:02:57.737976
2269	Container Component Diameter	Registry of DICOM Data Elements	80	80	29	29	ContainerComponentDiameter	FD	1		2014-10-27 22:02:57.741279
2270	Container Component Description	Registry of DICOM Data Elements	80	80	30	30	ContainerComponentDescription	LO	1		2014-10-27 22:02:57.744625
2271	Device Description	Registry of DICOM Data Elements	80	80	32	32	DeviceDescription	LO	1		2014-10-27 22:02:57.747958
2272	Contrast/Bolus Ingredient Percent by Volume	Registry of DICOM Data Elements	82	82	1	1	ContrastBolusIngredientPercentByVolume	FL	1		2014-10-27 22:02:57.751285
2273	OCT Focal Distance	Registry of DICOM Data Elements	82	82	2	2	OCTFocalDistance	FD	1		2014-10-27 22:02:57.755114
2274	Beam Spot Size	Registry of DICOM Data Elements	82	82	3	3	BeamSpotSize	FD	1		2014-10-27 22:02:57.758445
2275	Effective Refractive Index	Registry of DICOM Data Elements	82	82	4	4	EffectiveRefractiveIndex	FD	1		2014-10-27 22:02:57.761712
2276	OCT Acquisition Domain	Registry of DICOM Data Elements	82	82	6	6	OCTAcquisitionDomain	CS	1		2014-10-27 22:02:57.765024
2277	OCT Optical Center Wavelength	Registry of DICOM Data Elements	82	82	7	7	OCTOpticalCenterWavelength	FD	1		2014-10-27 22:02:57.7683
2278	Axial Resolution	Registry of DICOM Data Elements	82	82	8	8	AxialResolution	FD	1		2014-10-27 22:02:57.771746
2279	Ranging Depth	Registry of DICOM Data Elements	82	82	9	9	RangingDepth	FD	1		2014-10-27 22:02:57.775053
2280	A-line Rate	Registry of DICOM Data Elements	82	82	17	17	ALineRate	FD	1		2014-10-27 22:02:57.77833
2281	A-lines Per Frame	Registry of DICOM Data Elements	82	82	18	18	ALinesPerFrame	US	1		2014-10-27 22:02:57.781624
2282	Catheter Rotational Rate	Registry of DICOM Data Elements	82	82	19	19	CatheterRotationalRate	FD	1		2014-10-27 22:02:57.784928
2283	A-line Pixel Spacing	Registry of DICOM Data Elements	82	82	20	20	ALinePixelSpacing	FD	1		2014-10-27 22:02:57.788271
2284	Mode of Percutaneous Access Sequence	Registry of DICOM Data Elements	82	82	22	22	ModeOfPercutaneousAccessSequence	SQ	1		2014-10-27 22:02:57.792091
2285	Intravascular OCT Frame Type Sequence	Registry of DICOM Data Elements	82	82	37	37	IntravascularOCTFrameTypeSequence	SQ	1		2014-10-27 22:02:57.795378
2286	OCT Z Offset Applied	Registry of DICOM Data Elements	82	82	38	38	OCTZOffsetApplied	CS	1		2014-10-27 22:02:57.798667
2287	Intravascular Frame Content Sequence	Registry of DICOM Data Elements	82	82	39	39	IntravascularFrameContentSequence	SQ	1		2014-10-27 22:02:57.801951
2288	Intravascular Longitudinal Distance	Registry of DICOM Data Elements	82	82	40	40	IntravascularLongitudinalDistance	FD	1		2014-10-27 22:02:57.805241
2289	Intravascular OCT Frame Content Sequence	Registry of DICOM Data Elements	82	82	41	41	IntravascularOCTFrameContentSequence	SQ	1		2014-10-27 22:02:57.80852
2290	OCT Z Offset Correction	Registry of DICOM Data Elements	82	82	48	48	OCTZOffsetCorrection	SS	1		2014-10-27 22:02:57.811777
2291	Catheter Direction of Rotation	Registry of DICOM Data Elements	82	82	49	49	CatheterDirectionOfRotation	CS	1		2014-10-27 22:02:57.815031
2292	Seam Line Location	Registry of DICOM Data Elements	82	82	51	51	SeamLineLocation	FD	1		2014-10-27 22:02:57.818368
2293	First A-line Location	Registry of DICOM Data Elements	82	82	52	52	FirstALineLocation	FD	1		2014-10-27 22:02:57.821658
2294	Seam Line Index	Registry of DICOM Data Elements	82	82	54	54	SeamLineIndex	US	1		2014-10-27 22:02:57.825006
2295	Number of Padded A-lines	Registry of DICOM Data Elements	82	82	56	56	NumberOfPaddedALines	US	1		2014-10-27 22:02:57.82876
2296	Interpolation Type	Registry of DICOM Data Elements	82	82	57	57	InterpolationType	CS	1		2014-10-27 22:02:57.832033
2297	Refractive Index Applied	Registry of DICOM Data Elements	82	82	58	58	RefractiveIndexApplied	CS	1		2014-10-27 22:02:57.835314
2298	Energy Window Vector	Registry of DICOM Data Elements	84	84	16	16	EnergyWindowVector	US	1-n		2014-10-27 22:02:57.838592
2299	Number of Energy Windows	Registry of DICOM Data Elements	84	84	17	17	NumberOfEnergyWindows	US	1		2014-10-27 22:02:57.841896
2300	Energy Window Information Sequence	Registry of DICOM Data Elements	84	84	18	18	EnergyWindowInformationSequence	SQ	1		2014-10-27 22:02:57.845181
2301	Energy Window Range Sequence	Registry of DICOM Data Elements	84	84	19	19	EnergyWindowRangeSequence	SQ	1		2014-10-27 22:02:57.848485
2302	Energy Window Lower Limit	Registry of DICOM Data Elements	84	84	20	20	EnergyWindowLowerLimit	DS	1		2014-10-27 22:02:57.851773
2303	Energy Window Upper Limit	Registry of DICOM Data Elements	84	84	21	21	EnergyWindowUpperLimit	DS	1		2014-10-27 22:02:57.855051
2304	Radiopharmaceutical Information Sequence	Registry of DICOM Data Elements	84	84	22	22	RadiopharmaceuticalInformationSequence	SQ	1		2014-10-27 22:02:57.858513
2305	Residual Syringe Counts	Registry of DICOM Data Elements	84	84	23	23	ResidualSyringeCounts	IS	1		2014-10-27 22:02:57.86187
2306	Energy Window Name	Registry of DICOM Data Elements	84	84	24	24	EnergyWindowName	SH	1		2014-10-27 22:02:57.86565
2307	Detector Vector	Registry of DICOM Data Elements	84	84	32	32	DetectorVector	US	1-n		2014-10-27 22:02:57.868949
2308	Number of Detectors	Registry of DICOM Data Elements	84	84	33	33	NumberOfDetectors	US	1		2014-10-27 22:02:57.87228
2309	Detector Information Sequence	Registry of DICOM Data Elements	84	84	34	34	DetectorInformationSequence	SQ	1		2014-10-27 22:02:57.87556
2310	Phase Vector	Registry of DICOM Data Elements	84	84	48	48	PhaseVector	US	1-n		2014-10-27 22:02:57.878817
2311	Number of Phases	Registry of DICOM Data Elements	84	84	49	49	NumberOfPhases	US	1		2014-10-27 22:02:57.882229
2312	Phase Information Sequence	Registry of DICOM Data Elements	84	84	50	50	PhaseInformationSequence	SQ	1		2014-10-27 22:02:57.885564
2313	Number of Frames in Phase	Registry of DICOM Data Elements	84	84	51	51	NumberOfFramesInPhase	US	1		2014-10-27 22:02:57.888864
2314	Phase Delay	Registry of DICOM Data Elements	84	84	54	54	PhaseDelay	IS	1		2014-10-27 22:02:57.892193
2315	Pause Between Frames	Registry of DICOM Data Elements	84	84	56	56	PauseBetweenFrames	IS	1		2014-10-27 22:02:57.895566
2316	Phase Description	Registry of DICOM Data Elements	84	84	57	57	PhaseDescription	CS	1		2014-10-27 22:02:57.898945
2318	Number of Rotations	Registry of DICOM Data Elements	84	84	81	81	NumberOfRotations	US	1		2014-10-27 22:02:57.906011
2319	Rotation Information Sequence	Registry of DICOM Data Elements	84	84	82	82	RotationInformationSequence	SQ	1		2014-10-27 22:02:57.909421
2320	Number of Frames in Rotation	Registry of DICOM Data Elements	84	84	83	83	NumberOfFramesInRotation	US	1		2014-10-27 22:02:57.912736
2321	R-R Interval Vector	Registry of DICOM Data Elements	84	84	96	96	RRIntervalVector	US	1-n		2014-10-27 22:02:57.916018
2322	Number of R-R Intervals	Registry of DICOM Data Elements	84	84	97	97	NumberOfRRIntervals	US	1		2014-10-27 22:02:57.919322
2323	Gated Information Sequence	Registry of DICOM Data Elements	84	84	98	98	GatedInformationSequence	SQ	1		2014-10-27 22:02:57.922612
2324	Data Information Sequence	Registry of DICOM Data Elements	84	84	99	99	DataInformationSequence	SQ	1		2014-10-27 22:02:57.925917
2325	Time Slot Vector	Registry of DICOM Data Elements	84	84	112	112	TimeSlotVector	US	1-n		2014-10-27 22:02:57.929196
2326	Number of Time Slots	Registry of DICOM Data Elements	84	84	113	113	NumberOfTimeSlots	US	1		2014-10-27 22:02:57.932564
2327	Time Slot Information Sequence	Registry of DICOM Data Elements	84	84	114	114	TimeSlotInformationSequence	SQ	1		2014-10-27 22:02:57.93601
2328	Time Slot Time	Registry of DICOM Data Elements	84	84	115	115	TimeSlotTime	DS	1		2014-10-27 22:02:57.939817
2329	Slice Vector	Registry of DICOM Data Elements	84	84	128	128	SliceVector	US	1-n		2014-10-27 22:02:57.943096
2330	Number of Slices	Registry of DICOM Data Elements	84	84	129	129	NumberOfSlices	US	1		2014-10-27 22:02:57.94637
2331	Angular View Vector	Registry of DICOM Data Elements	84	84	144	144	AngularViewVector	US	1-n		2014-10-27 22:02:57.949685
2332	Time Slice Vector	Registry of DICOM Data Elements	84	84	256	256	TimeSliceVector	US	1-n		2014-10-27 22:02:57.953017
2333	Number of Time Slices	Registry of DICOM Data Elements	84	84	257	257	NumberOfTimeSlices	US	1		2014-10-27 22:02:57.956298
2334	Start Angle	Registry of DICOM Data Elements	84	84	512	512	StartAngle	DS	1		2014-10-27 22:02:57.959596
2335	Type of Detector Motion	Registry of DICOM Data Elements	84	84	514	514	TypeOfDetectorMotion	CS	1		2014-10-27 22:02:57.962906
2336	Trigger Vector	Registry of DICOM Data Elements	84	84	528	528	TriggerVector	IS	1-n		2014-10-27 22:02:57.966189
2337	Number of Triggers in Phase	Registry of DICOM Data Elements	84	84	529	529	NumberOfTriggersInPhase	US	1		2014-10-27 22:02:57.969544
2338	View Code Sequence	Registry of DICOM Data Elements	84	84	544	544	ViewCodeSequence	SQ	1		2014-10-27 22:02:57.972936
2339	View Modifier Code Sequence	Registry of DICOM Data Elements	84	84	546	546	ViewModifierCodeSequence	SQ	1		2014-10-27 22:02:57.978316
2340	Radionuclide Code Sequence	Registry of DICOM Data Elements	84	84	768	768	RadionuclideCodeSequence	SQ	1		2014-10-27 22:02:57.98168
2341	Administration Route Code Sequence	Registry of DICOM Data Elements	84	84	770	770	AdministrationRouteCodeSequence	SQ	1		2014-10-27 22:02:57.985011
2342	Radiopharmaceutical Code Sequence	Registry of DICOM Data Elements	84	84	772	772	RadiopharmaceuticalCodeSequence	SQ	1		2014-10-27 22:02:57.98843
2343	Calibration Data Sequence	Registry of DICOM Data Elements	84	84	774	774	CalibrationDataSequence	SQ	1		2014-10-27 22:02:57.991877
2344	Energy Window Number	Registry of DICOM Data Elements	84	84	776	776	EnergyWindowNumber	US	1		2014-10-27 22:02:57.995173
2345	Image ID	Registry of DICOM Data Elements	84	84	1024	1024	ImageID	SH	1		2014-10-27 22:02:57.998469
2346	Patient Orientation Code Sequence	Registry of DICOM Data Elements	84	84	1040	1040	PatientOrientationCodeSequence	SQ	1		2014-10-27 22:02:58.001761
2347	Patient Orientation Modifier Code Sequence	Registry of DICOM Data Elements	84	84	1042	1042	PatientOrientationModifierCodeSequence	SQ	1		2014-10-27 22:02:58.005111
2348	Patient Gantry Relationship Code Sequence	Registry of DICOM Data Elements	84	84	1044	1044	PatientGantryRelationshipCodeSequence	SQ	1		2014-10-27 22:02:58.008491
2349	Slice Progression Direction	Registry of DICOM Data Elements	84	84	1280	1280	SliceProgressionDirection	CS	1		2014-10-27 22:02:58.013036
2350	Scan Progression Direction	Registry of DICOM Data Elements	84	84	1281	1281	ScanProgressionDirection	CS	1		2014-10-27 22:02:58.016361
2351	Series Type	Registry of DICOM Data Elements	84	84	4096	4096	SeriesType	CS	2		2014-10-27 22:02:58.019661
2352	Units	Registry of DICOM Data Elements	84	84	4097	4097	Units	CS	1		2014-10-27 22:02:58.022952
2353	Counts Source	Registry of DICOM Data Elements	84	84	4098	4098	CountsSource	CS	1		2014-10-27 22:02:58.02625
2354	Reprojection Method	Registry of DICOM Data Elements	84	84	4100	4100	ReprojectionMethod	CS	1		2014-10-27 22:02:58.029555
2355	SUV Type	Registry of DICOM Data Elements	84	84	4102	4102	SUVType	CS	1		2014-10-27 22:02:58.032863
2356	Randoms Correction Method	Registry of DICOM Data Elements	84	84	4352	4352	RandomsCorrectionMethod	CS	1		2014-10-27 22:02:58.036169
2357	Attenuation Correction Method	Registry of DICOM Data Elements	84	84	4353	4353	AttenuationCorrectionMethod	LO	1		2014-10-27 22:02:58.039459
2358	Decay Correction	Registry of DICOM Data Elements	84	84	4354	4354	DecayCorrection	CS	1		2014-10-27 22:02:58.042763
2359	Reconstruction Method	Registry of DICOM Data Elements	84	84	4355	4355	ReconstructionMethod	LO	1		2014-10-27 22:02:58.046069
2360	Detector Lines of Response Used	Registry of DICOM Data Elements	84	84	4356	4356	DetectorLinesOfResponseUsed	LO	1		2014-10-27 22:02:58.049824
2361	Scatter Correction Method	Registry of DICOM Data Elements	84	84	4357	4357	ScatterCorrectionMethod	LO	1		2014-10-27 22:02:58.05317
2362	Axial Acceptance	Registry of DICOM Data Elements	84	84	4608	4608	AxialAcceptance	DS	1		2014-10-27 22:02:58.05648
2363	Axial Mash	Registry of DICOM Data Elements	84	84	4609	4609	AxialMash	IS	2		2014-10-27 22:02:58.059785
2364	Transverse Mash	Registry of DICOM Data Elements	84	84	4610	4610	TransverseMash	IS	1		2014-10-27 22:02:58.063081
2365	Detector Element Size	Registry of DICOM Data Elements	84	84	4611	4611	DetectorElementSize	DS	2		2014-10-27 22:02:58.066395
2366	Coincidence Window Width	Registry of DICOM Data Elements	84	84	4624	4624	CoincidenceWindowWidth	DS	1		2014-10-27 22:02:58.069711
2367	Secondary Counts Type	Registry of DICOM Data Elements	84	84	4640	4640	SecondaryCountsType	CS	1-n		2014-10-27 22:02:58.073283
2368	Frame Reference Time	Registry of DICOM Data Elements	84	84	4864	4864	FrameReferenceTime	DS	1		2014-10-27 22:02:58.076591
2369	Primary (Prompts) Counts Accumulated	Registry of DICOM Data Elements	84	84	4880	4880	PrimaryPromptsCountsAccumulated	IS	1		2014-10-27 22:02:58.07988
2370	Secondary Counts Accumulated	Registry of DICOM Data Elements	84	84	4881	4881	SecondaryCountsAccumulated	IS	1-n		2014-10-27 22:02:58.083227
2371	Slice Sensitivity Factor	Registry of DICOM Data Elements	84	84	4896	4896	SliceSensitivityFactor	DS	1		2014-10-27 22:02:58.086964
2372	Decay Factor	Registry of DICOM Data Elements	84	84	4897	4897	DecayFactor	DS	1		2014-10-27 22:02:58.090717
2373	Dose Calibration Factor	Registry of DICOM Data Elements	84	84	4898	4898	DoseCalibrationFactor	DS	1		2014-10-27 22:02:58.094058
2374	Scatter Fraction Factor	Registry of DICOM Data Elements	84	84	4899	4899	ScatterFractionFactor	DS	1		2014-10-27 22:02:58.097401
2375	Dead Time Factor	Registry of DICOM Data Elements	84	84	4900	4900	DeadTimeFactor	DS	1		2014-10-27 22:02:58.10083
2376	Image Index	Registry of DICOM Data Elements	84	84	4912	4912	ImageIndex	US	1		2014-10-27 22:02:58.10436
2377	Counts Included	Registry of DICOM Data Elements	84	84	5120	5120	CountsIncluded	CS	1-n	RET	2014-10-27 22:02:58.107736
2378	Dead Time Correction Flag	Registry of DICOM Data Elements	84	84	5121	5121	DeadTimeCorrectionFlag	CS	1	RET	2014-10-27 22:02:58.111083
2379	Histogram Sequence	Registry of DICOM Data Elements	96	96	12288	12288	HistogramSequence	SQ	1		2014-10-27 22:02:58.11442
2380	Histogram Number of Bins	Registry of DICOM Data Elements	96	96	12290	12290	HistogramNumberOfBins	US	1		2014-10-27 22:02:58.117744
2381	Histogram First Bin Value	Registry of DICOM Data Elements	96	96	12292	12292	HistogramFirstBinValue	US or SS	1		2014-10-27 22:02:58.121115
2382	Histogram Last Bin Value	Registry of DICOM Data Elements	96	96	12294	12294	HistogramLastBinValue	US or SS	1		2014-10-27 22:02:58.125035
2383	Histogram Bin Width	Registry of DICOM Data Elements	96	96	12296	12296	HistogramBinWidth	US	1		2014-10-27 22:02:58.128427
2384	Histogram Explanation	Registry of DICOM Data Elements	96	96	12304	12304	HistogramExplanation	LO	1		2014-10-27 22:02:58.131755
2385	Histogram Data	Registry of DICOM Data Elements	96	96	12320	12320	HistogramData	UL	1-n		2014-10-27 22:02:58.135094
2386	Segmentation Type	Registry of DICOM Data Elements	98	98	1	1	SegmentationType	CS	1		2014-10-27 22:02:58.138466
2387	Segment Sequence	Registry of DICOM Data Elements	98	98	2	2	SegmentSequence	SQ	1		2014-10-27 22:02:58.141776
2388	Segmented Property Category Code Sequence	Registry of DICOM Data Elements	98	98	3	3	SegmentedPropertyCategoryCodeSequence	SQ	1		2014-10-27 22:02:58.145202
2389	Segment Number	Registry of DICOM Data Elements	98	98	4	4	SegmentNumber	US	1		2014-10-27 22:02:58.148621
2390	Segment Label	Registry of DICOM Data Elements	98	98	5	5	SegmentLabel	LO	1		2014-10-27 22:02:58.152003
2391	Segment Description	Registry of DICOM Data Elements	98	98	6	6	SegmentDescription	ST	1		2014-10-27 22:02:58.155357
2392	Segment Algorithm Type	Registry of DICOM Data Elements	98	98	8	8	SegmentAlgorithmType	CS	1		2014-10-27 22:02:58.15892
2393	Segment Algorithm Name	Registry of DICOM Data Elements	98	98	9	9	SegmentAlgorithmName	LO	1		2014-10-27 22:02:58.162934
2394	Segment Identification Sequence	Registry of DICOM Data Elements	98	98	10	10	SegmentIdentificationSequence	SQ	1		2014-10-27 22:02:58.166294
2395	Referenced Segment Number	Registry of DICOM Data Elements	98	98	11	11	ReferencedSegmentNumber	US	1-n		2014-10-27 22:02:58.169683
2396	Recommended Display Grayscale Value	Registry of DICOM Data Elements	98	98	12	12	RecommendedDisplayGrayscaleValue	US	1		2014-10-27 22:02:58.173024
2397	Recommended Display CIELab Value	Registry of DICOM Data Elements	98	98	13	13	RecommendedDisplayCIELabValue	US	3		2014-10-27 22:02:58.176415
2398	Maximum Fractional Value	Registry of DICOM Data Elements	98	98	14	14	MaximumFractionalValue	US	1		2014-10-27 22:02:58.179772
2399	Segmented Property Type Code Sequence	Registry of DICOM Data Elements	98	98	15	15	SegmentedPropertyTypeCodeSequence	SQ	1		2014-10-27 22:02:58.183271
2400	Segmentation Fractional Type	Registry of DICOM Data Elements	98	98	16	16	SegmentationFractionalType	CS	1		2014-10-27 22:02:58.186598
2401	Segmented Property Type Modifier Code Sequence	Registry of DICOM Data Elements	98	98	17	17	SegmentedPropertyTypeModifierCodeSequence	SQ	1		2014-10-27 22:02:58.189953
2402	Used Segments Sequence	Registry of DICOM Data Elements	98	98	18	18	UsedSegmentsSequence	SQ	1		2014-10-27 22:02:58.193394
2403	Deformable Registration Sequence	Registry of DICOM Data Elements	100	100	2	2	DeformableRegistrationSequence	SQ	1		2014-10-27 22:02:58.196815
2404	Source Frame of Reference UID	Registry of DICOM Data Elements	100	100	3	3	SourceFrameOfReferenceUID	UI	1		2014-10-27 22:02:58.200705
2405	Deformable Registration Grid Sequence	Registry of DICOM Data Elements	100	100	5	5	DeformableRegistrationGridSequence	SQ	1		2014-10-27 22:02:58.204038
2406	Grid Dimensions	Registry of DICOM Data Elements	100	100	7	7	GridDimensions	UL	3		2014-10-27 22:02:58.207393
2407	Grid Resolution	Registry of DICOM Data Elements	100	100	8	8	GridResolution	FD	3		2014-10-27 22:02:58.210757
2408	Vector Grid Data	Registry of DICOM Data Elements	100	100	9	9	VectorGridData	OF	1		2014-10-27 22:02:58.214108
2409	Pre Deformation Matrix Registration Sequence	Registry of DICOM Data Elements	100	100	15	15	PreDeformationMatrixRegistrationSequence	SQ	1		2014-10-27 22:02:58.217477
2410	Post Deformation Matrix Registration Sequence	Registry of DICOM Data Elements	100	100	16	16	PostDeformationMatrixRegistrationSequence	SQ	1		2014-10-27 22:02:58.220841
2411	Number of Surfaces	Registry of DICOM Data Elements	102	102	1	1	NumberOfSurfaces	UL	1		2014-10-27 22:02:58.224189
2412	Surface Sequence	Registry of DICOM Data Elements	102	102	2	2	SurfaceSequence	SQ	1		2014-10-27 22:02:58.227527
2413	Surface Number	Registry of DICOM Data Elements	102	102	3	3	SurfaceNumber	UL	1		2014-10-27 22:02:58.230893
2414	Surface Comments	Registry of DICOM Data Elements	102	102	4	4	SurfaceComments	LT	1		2014-10-27 22:02:58.23436
2415	Surface Processing	Registry of DICOM Data Elements	102	102	9	9	SurfaceProcessing	CS	1		2014-10-27 22:02:58.238266
2416	Surface Processing Ratio	Registry of DICOM Data Elements	102	102	10	10	SurfaceProcessingRatio	FL	1		2014-10-27 22:02:58.241619
2417	Surface Processing Description	Registry of DICOM Data Elements	102	102	11	11	SurfaceProcessingDescription	LO	1		2014-10-27 22:02:58.245102
2418	Recommended Presentation Opacity	Registry of DICOM Data Elements	102	102	12	12	RecommendedPresentationOpacity	FL	1		2014-10-27 22:02:58.248465
2419	Recommended Presentation Type	Registry of DICOM Data Elements	102	102	13	13	RecommendedPresentationType	CS	1		2014-10-27 22:02:58.251795
2420	Finite Volume	Registry of DICOM Data Elements	102	102	14	14	FiniteVolume	CS	1		2014-10-27 22:02:58.255138
2421	Manifold	Registry of DICOM Data Elements	102	102	16	16	Manifold	CS	1		2014-10-27 22:02:58.258508
2422	Surface Points Sequence	Registry of DICOM Data Elements	102	102	17	17	SurfacePointsSequence	SQ	1		2014-10-27 22:02:58.261887
2423	Surface Points Normals Sequence	Registry of DICOM Data Elements	102	102	18	18	SurfacePointsNormalsSequence	SQ	1		2014-10-27 22:02:58.265238
2424	Surface Mesh Primitives Sequence	Registry of DICOM Data Elements	102	102	19	19	SurfaceMeshPrimitivesSequence	SQ	1		2014-10-27 22:02:58.26861
2425	Number of Surface Points	Registry of DICOM Data Elements	102	102	21	21	NumberOfSurfacePoints	UL	1		2014-10-27 22:02:58.272061
2426	Point Coordinates Data	Registry of DICOM Data Elements	102	102	22	22	PointCoordinatesData	OF	1		2014-10-27 22:02:58.27591
2427	Point Position Accuracy	Registry of DICOM Data Elements	102	102	23	23	PointPositionAccuracy	FL	3		2014-10-27 22:02:58.279265
2428	Mean Point Distance	Registry of DICOM Data Elements	102	102	24	24	MeanPointDistance	FL	1		2014-10-27 22:02:58.282725
2429	Maximum Point Distance	Registry of DICOM Data Elements	102	102	25	25	MaximumPointDistance	FL	1		2014-10-27 22:02:58.286043
2485	HPGL Pen Number	Registry of DICOM Data Elements	104	104	25392	25392	HPGLPenNumber	US	1		2014-10-27 22:02:58.478592
2430	Points Bounding Box Coordinates	Registry of DICOM Data Elements	102	102	26	26	PointsBoundingBoxCoordinates	FL	6		2014-10-27 22:02:58.289532
2431	Axis of Rotation	Registry of DICOM Data Elements	102	102	27	27	AxisOfRotation	FL	3		2014-10-27 22:02:58.292992
2432	Center of Rotation	Registry of DICOM Data Elements	102	102	28	28	CenterOfRotation	FL	3		2014-10-27 22:02:58.296374
2433	Number of Vectors	Registry of DICOM Data Elements	102	102	30	30	NumberOfVectors	UL	1		2014-10-27 22:02:58.299744
2434	Vector Dimensionality	Registry of DICOM Data Elements	102	102	31	31	VectorDimensionality	US	1		2014-10-27 22:02:58.303131
2435	Vector Accuracy	Registry of DICOM Data Elements	102	102	32	32	VectorAccuracy	FL	1-n		2014-10-27 22:02:58.306515
2436	Vector Coordinate Data	Registry of DICOM Data Elements	102	102	33	33	VectorCoordinateData	OF	1		2014-10-27 22:02:58.309953
2437	Triangle Point Index List	Registry of DICOM Data Elements	102	102	35	35	TrianglePointIndexList	OW	1		2014-10-27 22:02:58.313845
2438	Edge Point Index List	Registry of DICOM Data Elements	102	102	36	36	EdgePointIndexList	OW	1		2014-10-27 22:02:58.317241
2439	Vertex Point Index List	Registry of DICOM Data Elements	102	102	37	37	VertexPointIndexList	OW	1		2014-10-27 22:02:58.320622
2440	Triangle Strip Sequence	Registry of DICOM Data Elements	102	102	38	38	TriangleStripSequence	SQ	1		2014-10-27 22:02:58.323948
2441	Triangle Fan Sequence	Registry of DICOM Data Elements	102	102	39	39	TriangleFanSequence	SQ	1		2014-10-27 22:02:58.327306
2442	Line Sequence	Registry of DICOM Data Elements	102	102	40	40	LineSequence	SQ	1		2014-10-27 22:02:58.330684
2443	Primitive Point Index List	Registry of DICOM Data Elements	102	102	41	41	PrimitivePointIndexList	OW	1		2014-10-27 22:02:58.334046
2444	Surface Count	Registry of DICOM Data Elements	102	102	42	42	SurfaceCount	UL	1		2014-10-27 22:02:58.337429
2445	Referenced Surface Sequence	Registry of DICOM Data Elements	102	102	43	43	ReferencedSurfaceSequence	SQ	1		2014-10-27 22:02:58.340815
2446	Referenced Surface Number	Registry of DICOM Data Elements	102	102	44	44	ReferencedSurfaceNumber	UL	1		2014-10-27 22:02:58.344245
2447	Segment Surface Generation Algorithm Identification Sequence	Registry of DICOM Data Elements	102	102	45	45	SegmentSurfaceGenerationAlgorithmIdentificationSequence	SQ	1		2014-10-27 22:02:58.347638
2448	Segment Surface Source Instance Sequence	Registry of DICOM Data Elements	102	102	46	46	SegmentSurfaceSourceInstanceSequence	SQ	1		2014-10-27 22:02:58.351512
2449	Algorithm Family Code Sequence	Registry of DICOM Data Elements	102	102	47	47	AlgorithmFamilyCodeSequence	SQ	1		2014-10-27 22:02:58.35483
2450	Algorithm Name Code Sequence	Registry of DICOM Data Elements	102	102	48	48	AlgorithmNameCodeSequence	SQ	1		2014-10-27 22:02:58.358187
2451	Algorithm Version	Registry of DICOM Data Elements	102	102	49	49	AlgorithmVersion	LO	1		2014-10-27 22:02:58.361566
2452	Algorithm Parameters	Registry of DICOM Data Elements	102	102	50	50	AlgorithmParameters	LT	1		2014-10-27 22:02:58.36492
2453	Facet Sequence	Registry of DICOM Data Elements	102	102	52	52	FacetSequence	SQ	1		2014-10-27 22:02:58.368275
2454	Surface Processing Algorithm Identification Sequence	Registry of DICOM Data Elements	102	102	53	53	SurfaceProcessingAlgorithmIdentificationSequence	SQ	1		2014-10-27 22:02:58.371678
2455	Algorithm Name	Registry of DICOM Data Elements	102	102	54	54	AlgorithmName	LO	1		2014-10-27 22:02:58.375025
2456	Recommended Point Radius	Registry of DICOM Data Elements	102	102	55	55	RecommendedPointRadius	FL	1		2014-10-27 22:02:58.378365
2457	Recommended Line Thickness	Registry of DICOM Data Elements	102	102	56	56	RecommendedLineThickness	FL	1		2014-10-27 22:02:58.381769
2458	Long Primitive Point Index List	Registry of DICOM Data Elements	102	102	64	64	LongPrimitivePointIndexList	UL	1-n		2014-10-27 22:02:58.3852
2459	Long Triangle Point Index List	Registry of DICOM Data Elements	102	102	65	65	LongTrianglePointIndexList	UL	3-3n		2014-10-27 22:02:58.389052
2460	Long Edge Point Index List	Registry of DICOM Data Elements	102	102	66	66	LongEdgePointIndexList	UL	2-2n		2014-10-27 22:02:58.392398
2461	Long Vertex Point Index List	Registry of DICOM Data Elements	102	102	67	67	LongVertexPointIndexList	UL	1-n		2014-10-27 22:02:58.395719
2462	Implant Size	Registry of DICOM Data Elements	104	104	25104	25104	ImplantSize	LO	1		2014-10-27 22:02:58.399095
2463	Implant Template Version	Registry of DICOM Data Elements	104	104	25121	25121	ImplantTemplateVersion	LO	1		2014-10-27 22:02:58.402437
2464	Replaced Implant Template Sequence	Registry of DICOM Data Elements	104	104	25122	25122	ReplacedImplantTemplateSequence	SQ	1		2014-10-27 22:02:58.405791
2465	Implant Type	Registry of DICOM Data Elements	104	104	25123	25123	ImplantType	CS	1		2014-10-27 22:02:58.409164
2466	Derivation Implant Template Sequence	Registry of DICOM Data Elements	104	104	25124	25124	DerivationImplantTemplateSequence	SQ	1		2014-10-27 22:02:58.41249
2467	Original Implant Template Sequence	Registry of DICOM Data Elements	104	104	25125	25125	OriginalImplantTemplateSequence	SQ	1		2014-10-27 22:02:58.415853
2468	Effective DateTime	Registry of DICOM Data Elements	104	104	25126	25126	EffectiveDateTime	DT	1		2014-10-27 22:02:58.41925
2469	Implant Target Anatomy Sequence	Registry of DICOM Data Elements	104	104	25136	25136	ImplantTargetAnatomySequence	SQ	1		2014-10-27 22:02:58.422681
2470	Information From Manufacturer Sequence	Registry of DICOM Data Elements	104	104	25184	25184	InformationFromManufacturerSequence	SQ	1		2014-10-27 22:02:58.426545
2471	Notification From Manufacturer Sequence	Registry of DICOM Data Elements	104	104	25189	25189	NotificationFromManufacturerSequence	SQ	1		2014-10-27 22:02:58.4299
2472	Information Issue DateTime	Registry of DICOM Data Elements	104	104	25200	25200	InformationIssueDateTime	DT	1		2014-10-27 22:02:58.433281
2473	Information Summary	Registry of DICOM Data Elements	104	104	25216	25216	InformationSummary	ST	1		2014-10-27 22:02:58.436767
2474	Implant Regulatory Disapproval Code Sequence	Registry of DICOM Data Elements	104	104	25248	25248	ImplantRegulatoryDisapprovalCodeSequence	SQ	1		2014-10-27 22:02:58.440217
2475	Overall Template Spatial Tolerance	Registry of DICOM Data Elements	104	104	25253	25253	OverallTemplateSpatialTolerance	FD	1		2014-10-27 22:02:58.443586
2476	HPGL Document Sequence	Registry of DICOM Data Elements	104	104	25280	25280	HPGLDocumentSequence	SQ	1		2014-10-27 22:02:58.446921
2477	HPGL Document ID	Registry of DICOM Data Elements	104	104	25296	25296	HPGLDocumentID	US	1		2014-10-27 22:02:58.450304
2478	HPGL Document Label	Registry of DICOM Data Elements	104	104	25301	25301	HPGLDocumentLabel	LO	1		2014-10-27 22:02:58.453663
2479	View Orientation Code Sequence	Registry of DICOM Data Elements	104	104	25312	25312	ViewOrientationCodeSequence	SQ	1		2014-10-27 22:02:58.457102
2480	View Orientation Modifier	Registry of DICOM Data Elements	104	104	25328	25328	ViewOrientationModifier	FD	9		2014-10-27 22:02:58.461782
2481	HPGL Document Scaling	Registry of DICOM Data Elements	104	104	25330	25330	HPGLDocumentScaling	FD	1		2014-10-27 22:02:58.465151
2482	HPGL Document	Registry of DICOM Data Elements	104	104	25344	25344	HPGLDocument	OB	1		2014-10-27 22:02:58.468508
2483	HPGL Contour Pen Number	Registry of DICOM Data Elements	104	104	25360	25360	HPGLContourPenNumber	US	1		2014-10-27 22:02:58.471882
2484	HPGL Pen Sequence	Registry of DICOM Data Elements	104	104	25376	25376	HPGLPenSequence	SQ	1		2014-10-27 22:02:58.47526
2486	HPGL Pen Label	Registry of DICOM Data Elements	104	104	25408	25408	HPGLPenLabel	LO	1		2014-10-27 22:02:58.482056
2487	HPGL Pen Description	Registry of DICOM Data Elements	104	104	25413	25413	HPGLPenDescription	ST	1		2014-10-27 22:02:58.485508
2488	Recommended Rotation Point	Registry of DICOM Data Elements	104	104	25414	25414	RecommendedRotationPoint	FD	2		2014-10-27 22:02:58.488906
2489	Bounding Rectangle	Registry of DICOM Data Elements	104	104	25415	25415	BoundingRectangle	FD	4		2014-10-27 22:02:58.492276
2490	Implant Template 3D Model Surface Number	Registry of DICOM Data Elements	104	104	25424	25424	ImplantTemplate3DModelSurfaceNumber	US	1-n		2014-10-27 22:02:58.49564
2491	Surface Model Description Sequence	Registry of DICOM Data Elements	104	104	25440	25440	SurfaceModelDescriptionSequence	SQ	1		2014-10-27 22:02:58.499421
2492	Surface Model Label	Registry of DICOM Data Elements	104	104	25472	25472	SurfaceModelLabel	LO	1		2014-10-27 22:02:58.502779
2493	Surface Model Scaling Factor	Registry of DICOM Data Elements	104	104	25488	25488	SurfaceModelScalingFactor	FD	1		2014-10-27 22:02:58.506141
2494	Materials Code Sequence	Registry of DICOM Data Elements	104	104	25504	25504	MaterialsCodeSequence	SQ	1		2014-10-27 22:02:58.509485
2495	Coating Materials Code Sequence	Registry of DICOM Data Elements	104	104	25508	25508	CoatingMaterialsCodeSequence	SQ	1		2014-10-27 22:02:58.512842
2496	Implant Type Code Sequence	Registry of DICOM Data Elements	104	104	25512	25512	ImplantTypeCodeSequence	SQ	1		2014-10-27 22:02:58.516226
2497	Fixation Method Code Sequence	Registry of DICOM Data Elements	104	104	25516	25516	FixationMethodCodeSequence	SQ	1		2014-10-27 22:02:58.519593
2498	Mating Feature Sets Sequence	Registry of DICOM Data Elements	104	104	25520	25520	MatingFeatureSetsSequence	SQ	1		2014-10-27 22:02:58.522935
2499	Mating Feature Set ID	Registry of DICOM Data Elements	104	104	25536	25536	MatingFeatureSetID	US	1		2014-10-27 22:02:58.526335
2500	Mating Feature Set Label	Registry of DICOM Data Elements	104	104	25552	25552	MatingFeatureSetLabel	LO	1		2014-10-27 22:02:58.529726
2501	Mating Feature Sequence	Registry of DICOM Data Elements	104	104	25568	25568	MatingFeatureSequence	SQ	1		2014-10-27 22:02:58.533106
2502	Mating Feature ID	Registry of DICOM Data Elements	104	104	25584	25584	MatingFeatureID	US	1		2014-10-27 22:02:58.536936
2503	Mating Feature Degree of Freedom Sequence	Registry of DICOM Data Elements	104	104	25600	25600	MatingFeatureDegreeOfFreedomSequence	SQ	1		2014-10-27 22:02:58.540318
2504	Degree of Freedom ID	Registry of DICOM Data Elements	104	104	25616	25616	DegreeOfFreedomID	US	1		2014-10-27 22:02:58.5437
2505	Degree of Freedom Type	Registry of DICOM Data Elements	104	104	25632	25632	DegreeOfFreedomType	CS	1		2014-10-27 22:02:58.547038
2506	2D Mating Feature Coordinates Sequence	Registry of DICOM Data Elements	104	104	25648	25648	TwoDMatingFeatureCoordinatesSequence	SQ	1		2014-10-27 22:02:58.550408
2507	Referenced HPGL Document ID	Registry of DICOM Data Elements	104	104	25664	25664	ReferencedHPGLDocumentID	US	1		2014-10-27 22:02:58.553802
2508	2D Mating Point	Registry of DICOM Data Elements	104	104	25680	25680	TwoDMatingPoint	FD	2		2014-10-27 22:02:58.557135
2509	2D Mating Axes	Registry of DICOM Data Elements	104	104	25696	25696	TwoDMatingAxes	FD	4		2014-10-27 22:02:58.560531
2510	2D Degree of Freedom Sequence	Registry of DICOM Data Elements	104	104	25712	25712	TwoDDegreeOfFreedomSequence	SQ	1		2014-10-27 22:02:58.563906
2511	3D Degree of Freedom Axis	Registry of DICOM Data Elements	104	104	25744	25744	ThreeDDegreeOfFreedomAxis	FD	3		2014-10-27 22:02:58.567238
2512	Range of Freedom	Registry of DICOM Data Elements	104	104	25760	25760	RangeOfFreedom	FD	2		2014-10-27 22:02:58.57062
2513	3D Mating Point	Registry of DICOM Data Elements	104	104	25792	25792	ThreeDMatingPoint	FD	3		2014-10-27 22:02:58.574418
2514	3D Mating Axes	Registry of DICOM Data Elements	104	104	25808	25808	ThreeDMatingAxes	FD	9		2014-10-27 22:02:58.57778
2515	2D Degree of Freedom Axis	Registry of DICOM Data Elements	104	104	25840	25840	TwoDDegreeOfFreedomAxis	FD	3		2014-10-27 22:02:58.581154
2516	Planning Landmark Point Sequence	Registry of DICOM Data Elements	104	104	25856	25856	PlanningLandmarkPointSequence	SQ	1		2014-10-27 22:02:58.584604
2517	Planning Landmark Line Sequence	Registry of DICOM Data Elements	104	104	25872	25872	PlanningLandmarkLineSequence	SQ	1		2014-10-27 22:02:58.587967
2518	Planning Landmark Plane Sequence	Registry of DICOM Data Elements	104	104	25888	25888	PlanningLandmarkPlaneSequence	SQ	1		2014-10-27 22:02:58.591315
2519	Planning Landmark ID	Registry of DICOM Data Elements	104	104	25904	25904	PlanningLandmarkID	US	1		2014-10-27 22:02:58.594699
2520	Planning Landmark Description	Registry of DICOM Data Elements	104	104	25920	25920	PlanningLandmarkDescription	LO	1		2014-10-27 22:02:58.598056
2521	Planning Landmark Identification Code Sequence	Registry of DICOM Data Elements	104	104	25925	25925	PlanningLandmarkIdentificationCodeSequence	SQ	1		2014-10-27 22:02:58.601462
2522	2D Point Coordinates Sequence	Registry of DICOM Data Elements	104	104	25936	25936	TwoDPointCoordinatesSequence	SQ	1		2014-10-27 22:02:58.604849
2523	2D Point Coordinates	Registry of DICOM Data Elements	104	104	25952	25952	TwoDPointCoordinates	FD	2		2014-10-27 22:02:58.608269
2524	3D Point Coordinates	Registry of DICOM Data Elements	104	104	26000	26000	ThreeDPointCoordinates	FD	3		2014-10-27 22:02:58.612142
2525	2D Line Coordinates Sequence	Registry of DICOM Data Elements	104	104	26016	26016	TwoDLineCoordinatesSequence	SQ	1		2014-10-27 22:02:58.615545
2526	2D Line Coordinates	Registry of DICOM Data Elements	104	104	26032	26032	TwoDLineCoordinates	FD	4		2014-10-27 22:02:58.618887
2527	3D Line Coordinates	Registry of DICOM Data Elements	104	104	26064	26064	ThreeDLineCoordinates	FD	6		2014-10-27 22:02:58.622231
2528	2D Plane Coordinates Sequence	Registry of DICOM Data Elements	104	104	26080	26080	TwoDPlaneCoordinatesSequence	SQ	1		2014-10-27 22:02:58.625619
2529	2D Plane Intersection	Registry of DICOM Data Elements	104	104	26096	26096	TwoDPlaneIntersection	FD	4		2014-10-27 22:02:58.629006
2530	3D Plane Origin	Registry of DICOM Data Elements	104	104	26128	26128	ThreeDPlaneOrigin	FD	3		2014-10-27 22:02:58.632385
2531	3D Plane Normal	Registry of DICOM Data Elements	104	104	26144	26144	ThreeDPlaneNormal	FD	3		2014-10-27 22:02:58.635749
2532	Graphic Annotation Sequence	Registry of DICOM Data Elements	112	112	1	1	GraphicAnnotationSequence	SQ	1		2014-10-27 22:02:58.639274
2533	Graphic Layer	Registry of DICOM Data Elements	112	112	2	2	GraphicLayer	CS	1		2014-10-27 22:02:58.642668
2534	Bounding Box Annotation Units	Registry of DICOM Data Elements	112	112	3	3	BoundingBoxAnnotationUnits	CS	1		2014-10-27 22:02:58.646127
2535	Anchor Point Annotation Units	Registry of DICOM Data Elements	112	112	4	4	AnchorPointAnnotationUnits	CS	1		2014-10-27 22:02:58.649996
2536	Graphic Annotation Units	Registry of DICOM Data Elements	112	112	5	5	GraphicAnnotationUnits	CS	1		2014-10-27 22:02:58.653374
2537	Unformatted Text Value	Registry of DICOM Data Elements	112	112	6	6	UnformattedTextValue	ST	1		2014-10-27 22:02:58.656731
2538	Text Object Sequence	Registry of DICOM Data Elements	112	112	8	8	TextObjectSequence	SQ	1		2014-10-27 22:02:58.660108
2539	Graphic Object Sequence	Registry of DICOM Data Elements	112	112	9	9	GraphicObjectSequence	SQ	1		2014-10-27 22:02:58.6635
2540	Bounding Box Top Left Hand Corner	Registry of DICOM Data Elements	112	112	16	16	BoundingBoxTopLeftHandCorner	FL	2		2014-10-27 22:02:58.666833
2541	Bounding Box Bottom Right Hand Corner	Registry of DICOM Data Elements	112	112	17	17	BoundingBoxBottomRightHandCorner	FL	2		2014-10-27 22:02:58.67021
2542	Bounding Box Text Horizontal Justification	Registry of DICOM Data Elements	112	112	18	18	BoundingBoxTextHorizontalJustification	CS	1		2014-10-27 22:02:58.673699
2543	Anchor Point	Registry of DICOM Data Elements	112	112	20	20	AnchorPoint	FL	2		2014-10-27 22:02:58.677061
2544	Anchor Point Visibility	Registry of DICOM Data Elements	112	112	21	21	AnchorPointVisibility	CS	1		2014-10-27 22:02:58.68046
2545	Graphic Dimensions	Registry of DICOM Data Elements	112	112	32	32	GraphicDimensions	US	1		2014-10-27 22:02:58.683977
2546	Number of Graphic Points	Registry of DICOM Data Elements	112	112	33	33	NumberOfGraphicPoints	US	1		2014-10-27 22:02:58.687831
2547	Graphic Data	Registry of DICOM Data Elements	112	112	34	34	GraphicData	FL	2-n		2014-10-27 22:02:58.691203
2548	Graphic Type	Registry of DICOM Data Elements	112	112	35	35	GraphicType	CS	1		2014-10-27 22:02:58.694541
2549	Graphic Filled	Registry of DICOM Data Elements	112	112	36	36	GraphicFilled	CS	1		2014-10-27 22:02:58.69791
2550	Image Rotation (Retired)	Registry of DICOM Data Elements	112	112	64	64	ImageRotationRetired	IS	1	RET	2014-10-27 22:02:58.701314
2551	Image Horizontal Flip	Registry of DICOM Data Elements	112	112	65	65	ImageHorizontalFlip	CS	1		2014-10-27 22:02:58.704702
2552	Image Rotation	Registry of DICOM Data Elements	112	112	66	66	ImageRotation	US	1		2014-10-27 22:02:58.708086
2553	Displayed Area Top Left Hand Corner (Trial)	Registry of DICOM Data Elements	112	112	80	80	DisplayedAreaTopLeftHandCornerTrial	US	2	RET	2014-10-27 22:02:58.711474
2554	Displayed Area Bottom Right Hand Corner (Trial)	Registry of DICOM Data Elements	112	112	81	81	DisplayedAreaBottomRightHandCornerTrial	US	2	RET	2014-10-27 22:02:58.714823
2555	Displayed Area Top Left Hand Corner	Registry of DICOM Data Elements	112	112	82	82	DisplayedAreaTopLeftHandCorner	SL	2		2014-10-27 22:02:58.718202
2556	Displayed Area Bottom Right Hand Corner	Registry of DICOM Data Elements	112	112	83	83	DisplayedAreaBottomRightHandCorner	SL	2		2014-10-27 22:02:58.721693
2557	Displayed Area Selection Sequence	Registry of DICOM Data Elements	112	112	90	90	DisplayedAreaSelectionSequence	SQ	1		2014-10-27 22:02:58.72555
2558	Graphic Layer Sequence	Registry of DICOM Data Elements	112	112	96	96	GraphicLayerSequence	SQ	1		2014-10-27 22:02:58.728938
2559	Graphic Layer Order	Registry of DICOM Data Elements	112	112	98	98	GraphicLayerOrder	IS	1		2014-10-27 22:02:58.732284
2560	Graphic Layer Recommended Display Grayscale Value	Registry of DICOM Data Elements	112	112	102	102	GraphicLayerRecommendedDisplayGrayscaleValue	US	1		2014-10-27 22:02:58.735686
2561	Graphic Layer Recommended Display RGB Value	Registry of DICOM Data Elements	112	112	103	103	GraphicLayerRecommendedDisplayRGBValue	US	3	RET	2014-10-27 22:02:58.739053
2562	Graphic Layer Description	Registry of DICOM Data Elements	112	112	104	104	GraphicLayerDescription	LO	1		2014-10-27 22:02:58.742414
2563	Content Label	Registry of DICOM Data Elements	112	112	128	128	ContentLabel	CS	1		2014-10-27 22:02:58.74588
2564	Content Description	Registry of DICOM Data Elements	112	112	129	129	ContentDescription	LO	1		2014-10-27 22:02:58.749271
2565	Presentation Creation Date	Registry of DICOM Data Elements	112	112	130	130	PresentationCreationDate	DA	1		2014-10-27 22:02:58.75263
2566	Presentation Creation Time	Registry of DICOM Data Elements	112	112	131	131	PresentationCreationTime	TM	1		2014-10-27 22:02:58.75604
2567	Content Creator's Name	Registry of DICOM Data Elements	112	112	132	132	ContentCreatorName	PN	1		2014-10-27 22:02:58.759553
2568	Content Creator's Identification Code Sequence	Registry of DICOM Data Elements	112	112	134	134	ContentCreatorIdentificationCodeSequence	SQ	1		2014-10-27 22:02:58.763409
2569	Alternate Content Description Sequence	Registry of DICOM Data Elements	112	112	135	135	AlternateContentDescriptionSequence	SQ	1		2014-10-27 22:02:58.766752
2570	Presentation Size Mode	Registry of DICOM Data Elements	112	112	256	256	PresentationSizeMode	CS	1		2014-10-27 22:02:58.770149
2571	Presentation Pixel Spacing	Registry of DICOM Data Elements	112	112	257	257	PresentationPixelSpacing	DS	2		2014-10-27 22:02:58.773529
2572	Presentation Pixel Aspect Ratio	Registry of DICOM Data Elements	112	112	258	258	PresentationPixelAspectRatio	IS	2		2014-10-27 22:02:58.77697
2573	Presentation Pixel Magnification Ratio	Registry of DICOM Data Elements	112	112	259	259	PresentationPixelMagnificationRatio	FL	1		2014-10-27 22:02:58.780355
2574	Graphic Group Label	Registry of DICOM Data Elements	112	112	519	519	GraphicGroupLabel	LO	1		2014-10-27 22:02:58.783726
2575	Graphic Group Description	Registry of DICOM Data Elements	112	112	520	520	GraphicGroupDescription	ST	1		2014-10-27 22:02:58.787039
2576	Compound Graphic Sequence	Registry of DICOM Data Elements	112	112	521	521	CompoundGraphicSequence	SQ	1		2014-10-27 22:02:58.790408
2577	Compound Graphic Instance ID	Registry of DICOM Data Elements	112	112	550	550	CompoundGraphicInstanceID	UL	1		2014-10-27 22:02:58.793845
2578	Font Name	Registry of DICOM Data Elements	112	112	551	551	FontName	LO	1		2014-10-27 22:02:58.797281
2579	Font Name Type	Registry of DICOM Data Elements	112	112	552	552	FontNameType	CS	1		2014-10-27 22:02:58.801115
2580	CSS Font Name	Registry of DICOM Data Elements	112	112	553	553	CSSFontName	LO	1		2014-10-27 22:02:58.804489
2581	Rotation Angle	Registry of DICOM Data Elements	112	112	560	560	RotationAngle	FD	1		2014-10-27 22:02:58.807805
2582	Text Style Sequence	Registry of DICOM Data Elements	112	112	561	561	TextStyleSequence	SQ	1		2014-10-27 22:02:58.81116
2583	Line Style Sequence	Registry of DICOM Data Elements	112	112	562	562	LineStyleSequence	SQ	1		2014-10-27 22:02:58.814495
2584	Fill Style Sequence	Registry of DICOM Data Elements	112	112	563	563	FillStyleSequence	SQ	1		2014-10-27 22:02:58.817846
2585	Graphic Group Sequence	Registry of DICOM Data Elements	112	112	564	564	GraphicGroupSequence	SQ	1		2014-10-27 22:02:58.821202
2586	Text Color CIELab Value	Registry of DICOM Data Elements	112	112	577	577	TextColorCIELabValue	US	3		2014-10-27 22:02:58.824559
2587	Horizontal Alignment	Registry of DICOM Data Elements	112	112	578	578	HorizontalAlignment	CS	1		2014-10-27 22:02:58.827937
2588	Vertical Alignment	Registry of DICOM Data Elements	112	112	579	579	VerticalAlignment	CS	1		2014-10-27 22:02:58.831346
2589	Shadow Style	Registry of DICOM Data Elements	112	112	580	580	ShadowStyle	CS	1		2014-10-27 22:02:58.834812
2590	Shadow Offset X	Registry of DICOM Data Elements	112	112	581	581	ShadowOffsetX	FL	1		2014-10-27 22:02:58.838684
2591	Shadow Offset Y	Registry of DICOM Data Elements	112	112	582	582	ShadowOffsetY	FL	1		2014-10-27 22:02:58.842026
2592	Shadow Color CIELab Value	Registry of DICOM Data Elements	112	112	583	583	ShadowColorCIELabValue	US	3		2014-10-27 22:02:58.845401
2593	Underlined	Registry of DICOM Data Elements	112	112	584	584	Underlined	CS	1		2014-10-27 22:02:58.848913
2594	Bold	Registry of DICOM Data Elements	112	112	585	585	Bold	CS	1		2014-10-27 22:02:58.852241
2595	Italic	Registry of DICOM Data Elements	112	112	592	592	Italic	CS	1		2014-10-27 22:02:58.855645
2596	Pattern On Color CIELab Value	Registry of DICOM Data Elements	112	112	593	593	PatternOnColorCIELabValue	US	3		2014-10-27 22:02:58.858995
2597	Pattern Off Color CIELab Value	Registry of DICOM Data Elements	112	112	594	594	PatternOffColorCIELabValue	US	3		2014-10-27 22:02:58.862343
2598	Line Thickness	Registry of DICOM Data Elements	112	112	595	595	LineThickness	FL	1		2014-10-27 22:02:58.865754
2599	Line Dashing Style	Registry of DICOM Data Elements	112	112	596	596	LineDashingStyle	CS	1		2014-10-27 22:02:58.869193
2600	Line Pattern	Registry of DICOM Data Elements	112	112	597	597	LinePattern	UL	1		2014-10-27 22:02:58.872603
2601	Fill Pattern	Registry of DICOM Data Elements	112	112	598	598	FillPattern	OB	1		2014-10-27 22:02:58.876437
2602	Fill Mode	Registry of DICOM Data Elements	112	112	599	599	FillMode	CS	1		2014-10-27 22:02:58.879776
2603	Shadow Opacity	Registry of DICOM Data Elements	112	112	600	600	ShadowOpacity	FL	1		2014-10-27 22:02:58.883184
2604	Gap Length	Registry of DICOM Data Elements	112	112	609	609	GapLength	FL	1		2014-10-27 22:02:58.88651
2605	Diameter of Visibility	Registry of DICOM Data Elements	112	112	610	610	DiameterOfVisibility	FL	1		2014-10-27 22:02:58.889973
2606	Rotation Point	Registry of DICOM Data Elements	112	112	627	627	RotationPoint	FL	2		2014-10-27 22:02:58.893335
2607	Tick Alignment	Registry of DICOM Data Elements	112	112	628	628	TickAlignment	CS	1		2014-10-27 22:02:58.896676
2608	Show Tick Label	Registry of DICOM Data Elements	112	112	632	632	ShowTickLabel	CS	1		2014-10-27 22:02:58.900038
2609	Tick Label Alignment	Registry of DICOM Data Elements	112	112	633	633	TickLabelAlignment	CS	1		2014-10-27 22:02:58.903414
2610	Compound Graphic Units	Registry of DICOM Data Elements	112	112	642	642	CompoundGraphicUnits	CS	1		2014-10-27 22:02:58.906858
2611	Pattern On Opacity	Registry of DICOM Data Elements	112	112	644	644	PatternOnOpacity	FL	1		2014-10-27 22:02:58.911495
2612	Pattern Off Opacity	Registry of DICOM Data Elements	112	112	645	645	PatternOffOpacity	FL	1		2014-10-27 22:02:58.914837
2613	Major Ticks Sequence	Registry of DICOM Data Elements	112	112	647	647	MajorTicksSequence	SQ	1		2014-10-27 22:02:58.918222
2614	Tick Position	Registry of DICOM Data Elements	112	112	648	648	TickPosition	FL	1		2014-10-27 22:02:58.921671
2615	Tick Label	Registry of DICOM Data Elements	112	112	649	649	TickLabel	SH	1		2014-10-27 22:02:58.925049
2616	Compound Graphic Type	Registry of DICOM Data Elements	112	112	660	660	CompoundGraphicType	CS	1		2014-10-27 22:02:58.928393
2617	Graphic Group ID	Registry of DICOM Data Elements	112	112	661	661	GraphicGroupID	UL	1		2014-10-27 22:02:58.931759
2618	Shape Type	Registry of DICOM Data Elements	112	112	774	774	ShapeType	CS	1		2014-10-27 22:02:58.935101
2619	Registration Sequence	Registry of DICOM Data Elements	112	112	776	776	RegistrationSequence	SQ	1		2014-10-27 22:02:58.938468
2620	Matrix Registration Sequence	Registry of DICOM Data Elements	112	112	777	777	MatrixRegistrationSequence	SQ	1		2014-10-27 22:02:58.94182
2621	Matrix Sequence	Registry of DICOM Data Elements	112	112	778	778	MatrixSequence	SQ	1		2014-10-27 22:02:58.945192
2622	Frame of Reference Transformation Matrix Type	Registry of DICOM Data Elements	112	112	780	780	FrameOfReferenceTransformationMatrixType	CS	1		2014-10-27 22:02:58.948978
2623	Registration Type Code Sequence	Registry of DICOM Data Elements	112	112	781	781	RegistrationTypeCodeSequence	SQ	1		2014-10-27 22:02:58.952328
2624	Fiducial Description	Registry of DICOM Data Elements	112	112	783	783	FiducialDescription	ST	1		2014-10-27 22:02:58.955709
2625	Fiducial Identifier	Registry of DICOM Data Elements	112	112	784	784	FiducialIdentifier	SH	1		2014-10-27 22:02:58.959033
2626	Fiducial Identifier Code Sequence	Registry of DICOM Data Elements	112	112	785	785	FiducialIdentifierCodeSequence	SQ	1		2014-10-27 22:02:58.962373
2627	Contour Uncertainty Radius	Registry of DICOM Data Elements	112	112	786	786	ContourUncertaintyRadius	FD	1		2014-10-27 22:02:58.965747
2628	Used Fiducials Sequence	Registry of DICOM Data Elements	112	112	788	788	UsedFiducialsSequence	SQ	1		2014-10-27 22:02:58.969121
2629	Graphic Coordinates Data Sequence	Registry of DICOM Data Elements	112	112	792	792	GraphicCoordinatesDataSequence	SQ	1		2014-10-27 22:02:58.972464
2630	Fiducial UID	Registry of DICOM Data Elements	112	112	794	794	FiducialUID	UI	1		2014-10-27 22:02:58.975796
2631	Fiducial Set Sequence	Registry of DICOM Data Elements	112	112	796	796	FiducialSetSequence	SQ	1		2014-10-27 22:02:58.979135
2632	Fiducial Sequence	Registry of DICOM Data Elements	112	112	798	798	FiducialSequence	SQ	1		2014-10-27 22:02:58.982467
2633	Graphic Layer Recommended Display CIELab Value	Registry of DICOM Data Elements	112	112	1025	1025	GraphicLayerRecommendedDisplayCIELabValue	US	3		2014-10-27 22:02:58.986223
2634	Blending Sequence	Registry of DICOM Data Elements	112	112	1026	1026	BlendingSequence	SQ	1		2014-10-27 22:02:58.989562
2635	Relative Opacity	Registry of DICOM Data Elements	112	112	1027	1027	RelativeOpacity	FL	1		2014-10-27 22:02:58.992918
2636	Referenced Spatial Registration Sequence	Registry of DICOM Data Elements	112	112	1028	1028	ReferencedSpatialRegistrationSequence	SQ	1		2014-10-27 22:02:58.996255
2637	Blending Position	Registry of DICOM Data Elements	112	112	1029	1029	BlendingPosition	CS	1		2014-10-27 22:02:58.999593
2638	Hanging Protocol Name	Registry of DICOM Data Elements	114	114	2	2	HangingProtocolName	SH	1		2014-10-27 22:02:59.002909
2639	Hanging Protocol Description	Registry of DICOM Data Elements	114	114	4	4	HangingProtocolDescription	LO	1		2014-10-27 22:02:59.006323
2640	Hanging Protocol Level	Registry of DICOM Data Elements	114	114	6	6	HangingProtocolLevel	CS	1		2014-10-27 22:02:59.009734
2641	Hanging Protocol Creator	Registry of DICOM Data Elements	114	114	8	8	HangingProtocolCreator	LO	1		2014-10-27 22:02:59.013119
2642	Hanging Protocol Creation DateTime	Registry of DICOM Data Elements	114	114	10	10	HangingProtocolCreationDateTime	DT	1		2014-10-27 22:02:59.016457
2643	Hanging Protocol Definition Sequence	Registry of DICOM Data Elements	114	114	12	12	HangingProtocolDefinitionSequence	SQ	1		2014-10-27 22:02:59.019813
2644	Hanging Protocol User Identification Code Sequence	Registry of DICOM Data Elements	114	114	14	14	HangingProtocolUserIdentificationCodeSequence	SQ	1		2014-10-27 22:02:59.023595
2645	Hanging Protocol User Group Name	Registry of DICOM Data Elements	114	114	16	16	HangingProtocolUserGroupName	LO	1		2014-10-27 22:02:59.026915
2646	Source Hanging Protocol Sequence	Registry of DICOM Data Elements	114	114	18	18	SourceHangingProtocolSequence	SQ	1		2014-10-27 22:02:59.030288
2647	Number of Priors Referenced	Registry of DICOM Data Elements	114	114	20	20	NumberOfPriorsReferenced	US	1		2014-10-27 22:02:59.033659
2648	Image Sets Sequence	Registry of DICOM Data Elements	114	114	32	32	ImageSetsSequence	SQ	1		2014-10-27 22:02:59.037011
2649	Image Set Selector Sequence	Registry of DICOM Data Elements	114	114	34	34	ImageSetSelectorSequence	SQ	1		2014-10-27 22:02:59.040374
2650	Image Set Selector Usage Flag	Registry of DICOM Data Elements	114	114	36	36	ImageSetSelectorUsageFlag	CS	1		2014-10-27 22:02:59.043748
2651	Selector Attribute	Registry of DICOM Data Elements	114	114	38	38	SelectorAttribute	AT	1		2014-10-27 22:02:59.047075
2652	Selector Value Number	Registry of DICOM Data Elements	114	114	40	40	SelectorValueNumber	US	1		2014-10-27 22:02:59.050441
2653	Time Based Image Sets Sequence	Registry of DICOM Data Elements	114	114	48	48	TimeBasedImageSetsSequence	SQ	1		2014-10-27 22:02:59.053918
2654	Image Set Number	Registry of DICOM Data Elements	114	114	50	50	ImageSetNumber	US	1		2014-10-27 22:02:59.057299
2655	Image Set Selector Category	Registry of DICOM Data Elements	114	114	52	52	ImageSetSelectorCategory	CS	1		2014-10-27 22:02:59.06122
2656	Relative Time	Registry of DICOM Data Elements	114	114	56	56	RelativeTime	US	2		2014-10-27 22:02:59.064601
2657	Relative Time Units	Registry of DICOM Data Elements	114	114	58	58	RelativeTimeUnits	CS	1		2014-10-27 22:02:59.067961
2658	Abstract Prior Value	Registry of DICOM Data Elements	114	114	60	60	AbstractPriorValue	SS	2		2014-10-27 22:02:59.071334
2659	Abstract Prior Code Sequence	Registry of DICOM Data Elements	114	114	62	62	AbstractPriorCodeSequence	SQ	1		2014-10-27 22:02:59.074975
2660	Image Set Label	Registry of DICOM Data Elements	114	114	64	64	ImageSetLabel	LO	1		2014-10-27 22:02:59.078323
2661	Selector Attribute VR	Registry of DICOM Data Elements	114	114	80	80	SelectorAttributeVR	CS	1		2014-10-27 22:02:59.081663
2662	Selector Sequence Pointer	Registry of DICOM Data Elements	114	114	82	82	SelectorSequencePointer	AT	1-n		2014-10-27 22:02:59.085115
2663	Selector Sequence Pointer Private Creator	Registry of DICOM Data Elements	114	114	84	84	SelectorSequencePointerPrivateCreator	LO	1-n		2014-10-27 22:02:59.088611
2664	Selector Attribute Private Creator	Registry of DICOM Data Elements	114	114	86	86	SelectorAttributePrivateCreator	LO	1		2014-10-27 22:02:59.091979
2665	Selector AT Value	Registry of DICOM Data Elements	114	114	96	96	SelectorATValue	AT	1-n		2014-10-27 22:02:59.095382
2666	Selector CS Value	Registry of DICOM Data Elements	114	114	98	98	SelectorCSValue	CS	1-n		2014-10-27 22:02:59.099231
2667	Selector IS Value	Registry of DICOM Data Elements	114	114	100	100	SelectorISValue	IS	1-n		2014-10-27 22:02:59.102566
2668	Selector LO Value	Registry of DICOM Data Elements	114	114	102	102	SelectorLOValue	LO	1-n		2014-10-27 22:02:59.105971
2669	Selector LT Value	Registry of DICOM Data Elements	114	114	104	104	SelectorLTValue	LT	1		2014-10-27 22:02:59.109328
2670	Selector PN Value	Registry of DICOM Data Elements	114	114	106	106	SelectorPNValue	PN	1-n		2014-10-27 22:02:59.112697
2671	Selector SH Value	Registry of DICOM Data Elements	114	114	108	108	SelectorSHValue	SH	1-n		2014-10-27 22:02:59.116029
2672	Selector ST Value	Registry of DICOM Data Elements	114	114	110	110	SelectorSTValue	ST	1		2014-10-27 22:02:59.119402
2673	Selector UT Value	Registry of DICOM Data Elements	114	114	112	112	SelectorUTValue	UT	1		2014-10-27 22:02:59.12274
2674	Selector DS Value	Registry of DICOM Data Elements	114	114	114	114	SelectorDSValue	DS	1-n		2014-10-27 22:02:59.12611
2675	Selector FD Value	Registry of DICOM Data Elements	114	114	116	116	SelectorFDValue	FD	1-n		2014-10-27 22:02:59.129572
2676	Selector FL Value	Registry of DICOM Data Elements	114	114	118	118	SelectorFLValue	FL	1-n		2014-10-27 22:02:59.132988
2677	Selector UL Value	Registry of DICOM Data Elements	114	114	120	120	SelectorULValue	UL	1-n		2014-10-27 22:02:59.136974
2678	Selector US Value	Registry of DICOM Data Elements	114	114	122	122	SelectorUSValue	US	1-n		2014-10-27 22:02:59.140325
2679	Selector SL Value	Registry of DICOM Data Elements	114	114	124	124	SelectorSLValue	SL	1-n		2014-10-27 22:02:59.14373
2680	Selector SS Value	Registry of DICOM Data Elements	114	114	126	126	SelectorSSValue	SS	1-n		2014-10-27 22:02:59.147069
2681	Selector Code Sequence Value	Registry of DICOM Data Elements	114	114	128	128	SelectorCodeSequenceValue	SQ	1		2014-10-27 22:02:59.150422
2682	Number of Screens	Registry of DICOM Data Elements	114	114	256	256	NumberOfScreens	US	1		2014-10-27 22:02:59.153829
2683	Nominal Screen Definition Sequence	Registry of DICOM Data Elements	114	114	258	258	NominalScreenDefinitionSequence	SQ	1		2014-10-27 22:02:59.157166
2684	Number of Vertical Pixels	Registry of DICOM Data Elements	114	114	260	260	NumberOfVerticalPixels	US	1		2014-10-27 22:02:59.16056
2685	Number of Horizontal Pixels	Registry of DICOM Data Elements	114	114	262	262	NumberOfHorizontalPixels	US	1		2014-10-27 22:02:59.16394
2686	Display Environment Spatial Position	Registry of DICOM Data Elements	114	114	264	264	DisplayEnvironmentSpatialPosition	FD	4		2014-10-27 22:02:59.167309
2687	Screen Minimum Grayscale Bit Depth	Registry of DICOM Data Elements	114	114	266	266	ScreenMinimumGrayscaleBitDepth	US	1		2014-10-27 22:02:59.170739
2688	Screen Minimum Color Bit Depth	Registry of DICOM Data Elements	114	114	268	268	ScreenMinimumColorBitDepth	US	1		2014-10-27 22:02:59.174586
2689	Application Maximum Repaint Time	Registry of DICOM Data Elements	114	114	270	270	ApplicationMaximumRepaintTime	US	1		2014-10-27 22:02:59.17797
2690	Display Sets Sequence	Registry of DICOM Data Elements	114	114	512	512	DisplaySetsSequence	SQ	1		2014-10-27 22:02:59.181313
2691	Display Set Number	Registry of DICOM Data Elements	114	114	514	514	DisplaySetNumber	US	1		2014-10-27 22:02:59.18472
2692	Display Set Label	Registry of DICOM Data Elements	114	114	515	515	DisplaySetLabel	LO	1		2014-10-27 22:02:59.188107
2693	Display Set Presentation Group	Registry of DICOM Data Elements	114	114	516	516	DisplaySetPresentationGroup	US	1		2014-10-27 22:02:59.191492
2694	Display Set Presentation Group Description	Registry of DICOM Data Elements	114	114	518	518	DisplaySetPresentationGroupDescription	LO	1		2014-10-27 22:02:59.194835
2695	Partial Data Display Handling	Registry of DICOM Data Elements	114	114	520	520	PartialDataDisplayHandling	CS	1		2014-10-27 22:02:59.198183
2696	Synchronized Scrolling Sequence	Registry of DICOM Data Elements	114	114	528	528	SynchronizedScrollingSequence	SQ	1		2014-10-27 22:02:59.201597
2697	Display Set Scrolling Group	Registry of DICOM Data Elements	114	114	530	530	DisplaySetScrollingGroup	US	2-n		2014-10-27 22:02:59.205033
2698	Navigation Indicator Sequence	Registry of DICOM Data Elements	114	114	532	532	NavigationIndicatorSequence	SQ	1		2014-10-27 22:02:59.208517
2699	Navigation Display Set	Registry of DICOM Data Elements	114	114	534	534	NavigationDisplaySet	US	1		2014-10-27 22:02:59.212341
2700	Reference Display Sets	Registry of DICOM Data Elements	114	114	536	536	ReferenceDisplaySets	US	1-n		2014-10-27 22:02:59.215752
2701	Image Boxes Sequence	Registry of DICOM Data Elements	114	114	768	768	ImageBoxesSequence	SQ	1		2014-10-27 22:02:59.219116
2702	Image Box Number	Registry of DICOM Data Elements	114	114	770	770	ImageBoxNumber	US	1		2014-10-27 22:02:59.2225
2703	Image Box Layout Type	Registry of DICOM Data Elements	114	114	772	772	ImageBoxLayoutType	CS	1		2014-10-27 22:02:59.225866
2704	Image Box Tile Horizontal Dimension	Registry of DICOM Data Elements	114	114	774	774	ImageBoxTileHorizontalDimension	US	1		2014-10-27 22:02:59.229258
2705	Image Box Tile Vertical Dimension	Registry of DICOM Data Elements	114	114	776	776	ImageBoxTileVerticalDimension	US	1		2014-10-27 22:02:59.232686
2706	Image Box Scroll Direction	Registry of DICOM Data Elements	114	114	784	784	ImageBoxScrollDirection	CS	1		2014-10-27 22:02:59.236062
2707	Image Box Small Scroll Type	Registry of DICOM Data Elements	114	114	786	786	ImageBoxSmallScrollType	CS	1		2014-10-27 22:02:59.239424
2708	Image Box Small Scroll Amount	Registry of DICOM Data Elements	114	114	788	788	ImageBoxSmallScrollAmount	US	1		2014-10-27 22:02:59.242843
2709	Image Box Large Scroll Type	Registry of DICOM Data Elements	114	114	790	790	ImageBoxLargeScrollType	CS	1		2014-10-27 22:02:59.246403
2710	Image Box Large Scroll Amount	Registry of DICOM Data Elements	114	114	792	792	ImageBoxLargeScrollAmount	US	1		2014-10-27 22:02:59.250302
2711	Image Box Overlap Priority	Registry of DICOM Data Elements	114	114	800	800	ImageBoxOverlapPriority	US	1		2014-10-27 22:02:59.253735
2712	Cine Relative to Real-Time	Registry of DICOM Data Elements	114	114	816	816	CineRelativeToRealTime	FD	1		2014-10-27 22:02:59.257112
2713	Filter Operations Sequence	Registry of DICOM Data Elements	114	114	1024	1024	FilterOperationsSequence	SQ	1		2014-10-27 22:02:59.26048
2714	Filter-by Category	Registry of DICOM Data Elements	114	114	1026	1026	FilterByCategory	CS	1		2014-10-27 22:02:59.263864
2715	Filter-by Attribute Presence	Registry of DICOM Data Elements	114	114	1028	1028	FilterByAttributePresence	CS	1		2014-10-27 22:02:59.267195
2716	Filter-by Operator	Registry of DICOM Data Elements	114	114	1030	1030	FilterByOperator	CS	1		2014-10-27 22:02:59.270553
2717	Structured Display Background CIELab Value	Registry of DICOM Data Elements	114	114	1056	1056	StructuredDisplayBackgroundCIELabValue	US	3		2014-10-27 22:02:59.273932
2718	Empty Image Box CIELab Value	Registry of DICOM Data Elements	114	114	1057	1057	EmptyImageBoxCIELabValue	US	3		2014-10-27 22:02:59.277301
2719	Structured Display Image Box Sequence	Registry of DICOM Data Elements	114	114	1058	1058	StructuredDisplayImageBoxSequence	SQ	1		2014-10-27 22:02:59.280763
2720	Structured Display Text Box Sequence	Registry of DICOM Data Elements	114	114	1060	1060	StructuredDisplayTextBoxSequence	SQ	1		2014-10-27 22:02:59.284247
2721	Referenced First Frame Sequence	Registry of DICOM Data Elements	114	114	1063	1063	ReferencedFirstFrameSequence	SQ	1		2014-10-27 22:02:59.288073
2722	Image Box Synchronization Sequence	Registry of DICOM Data Elements	114	114	1072	1072	ImageBoxSynchronizationSequence	SQ	1		2014-10-27 22:02:59.291393
2723	Synchronized Image Box List	Registry of DICOM Data Elements	114	114	1074	1074	SynchronizedImageBoxList	US	2-n		2014-10-27 22:02:59.294743
2724	Type of Synchronization	Registry of DICOM Data Elements	114	114	1076	1076	TypeOfSynchronization	CS	1		2014-10-27 22:02:59.298117
2725	Blending Operation Type	Registry of DICOM Data Elements	114	114	1280	1280	BlendingOperationType	CS	1		2014-10-27 22:02:59.301504
2726	Reformatting Operation Type	Registry of DICOM Data Elements	114	114	1296	1296	ReformattingOperationType	CS	1		2014-10-27 22:02:59.304959
2727	Reformatting Thickness	Registry of DICOM Data Elements	114	114	1298	1298	ReformattingThickness	FD	1		2014-10-27 22:02:59.308325
2728	Reformatting Interval	Registry of DICOM Data Elements	114	114	1300	1300	ReformattingInterval	FD	1		2014-10-27 22:02:59.311713
2729	Reformatting Operation Initial View Direction	Registry of DICOM Data Elements	114	114	1302	1302	ReformattingOperationInitialViewDirection	CS	1		2014-10-27 22:02:59.315053
2730	3D Rendering Type	Registry of DICOM Data Elements	114	114	1312	1312	ThreeDRenderingType	CS	1-n		2014-10-27 22:02:59.318547
2731	Sorting Operations Sequence	Registry of DICOM Data Elements	114	114	1536	1536	SortingOperationsSequence	SQ	1		2014-10-27 22:02:59.322049
2732	Sort-by Category	Registry of DICOM Data Elements	114	114	1538	1538	SortByCategory	CS	1		2014-10-27 22:02:59.325902
2733	Sorting Direction	Registry of DICOM Data Elements	114	114	1540	1540	SortingDirection	CS	1		2014-10-27 22:02:59.329422
2734	Display Set Patient Orientation	Registry of DICOM Data Elements	114	114	1792	1792	DisplaySetPatientOrientation	CS	2		2014-10-27 22:02:59.33281
2735	VOI Type	Registry of DICOM Data Elements	114	114	1794	1794	VOIType	CS	1		2014-10-27 22:02:59.336242
2736	Pseudo-Color Type	Registry of DICOM Data Elements	114	114	1796	1796	PseudoColorType	CS	1		2014-10-27 22:02:59.339625
2737	Pseudo-Color Palette Instance Reference Sequence	Registry of DICOM Data Elements	114	114	1797	1797	PseudoColorPaletteInstanceReferenceSequence	SQ	1		2014-10-27 22:02:59.342988
2738	Show Grayscale Inverted	Registry of DICOM Data Elements	114	114	1798	1798	ShowGrayscaleInverted	CS	1		2014-10-27 22:02:59.34636
2739	Show Image True Size Flag	Registry of DICOM Data Elements	114	114	1808	1808	ShowImageTrueSizeFlag	CS	1		2014-10-27 22:02:59.349744
2740	Show Graphic Annotation Flag	Registry of DICOM Data Elements	114	114	1810	1810	ShowGraphicAnnotationFlag	CS	1		2014-10-27 22:02:59.353127
2741	Show Patient Demographics Flag	Registry of DICOM Data Elements	114	114	1812	1812	ShowPatientDemographicsFlag	CS	1		2014-10-27 22:02:59.356578
2742	Show Acquisition Techniques Flag	Registry of DICOM Data Elements	114	114	1814	1814	ShowAcquisitionTechniquesFlag	CS	1		2014-10-27 22:02:59.361146
2743	Display Set Horizontal Justification	Registry of DICOM Data Elements	114	114	1815	1815	DisplaySetHorizontalJustification	CS	1		2014-10-27 22:02:59.364529
2744	Display Set Vertical Justification	Registry of DICOM Data Elements	114	114	1816	1816	DisplaySetVerticalJustification	CS	1		2014-10-27 22:02:59.367869
2745	Continuation Start Meterset	Registry of DICOM Data Elements	116	116	288	288	ContinuationStartMeterset	FD	1		2014-10-27 22:02:59.371221
2746	Continuation End Meterset	Registry of DICOM Data Elements	116	116	289	289	ContinuationEndMeterset	FD	1		2014-10-27 22:02:59.374608
2747	Procedure Step State	Registry of DICOM Data Elements	116	116	4096	4096	ProcedureStepState	CS	1		2014-10-27 22:02:59.378026
2748	Procedure Step Progress Information Sequence	Registry of DICOM Data Elements	116	116	4098	4098	ProcedureStepProgressInformationSequence	SQ	1		2014-10-27 22:02:59.381448
2749	Procedure Step Progress	Registry of DICOM Data Elements	116	116	4100	4100	ProcedureStepProgress	DS	1		2014-10-27 22:02:59.38498
2750	Procedure Step Progress Description	Registry of DICOM Data Elements	116	116	4102	4102	ProcedureStepProgressDescription	ST	1		2014-10-27 22:02:59.388349
2751	Procedure Step Communications URI Sequence	Registry of DICOM Data Elements	116	116	4104	4104	ProcedureStepCommunicationsURISequence	SQ	1		2014-10-27 22:02:59.391716
2752	Contact URI	Registry of DICOM Data Elements	116	116	4106	4106	ContactURI	UR	1		2014-10-27 22:02:59.39508
2753	Contact Display Name	Registry of DICOM Data Elements	116	116	4108	4108	ContactDisplayName	LO	1		2014-10-27 22:02:59.398883
2754	Procedure Step Discontinuation Reason Code Sequence	Registry of DICOM Data Elements	116	116	4110	4110	ProcedureStepDiscontinuationReasonCodeSequence	SQ	1		2014-10-27 22:02:59.402279
2755	Beam Task Sequence	Registry of DICOM Data Elements	116	116	4128	4128	BeamTaskSequence	SQ	1		2014-10-27 22:02:59.405661
2756	Beam Task Type	Registry of DICOM Data Elements	116	116	4130	4130	BeamTaskType	CS	1		2014-10-27 22:02:59.409072
2757	Beam Order Index (Trial)	Registry of DICOM Data Elements	116	116	4132	4132	BeamOrderIndexTrial	IS	1	RET	2014-10-27 22:02:59.412469
2758	Autosequence Flag	Registry of DICOM Data Elements	116	116	4133	4133	AutosequenceFlag	CS	1		2014-10-27 22:02:59.415845
2759	Table Top Vertical Adjusted Position	Registry of DICOM Data Elements	116	116	4134	4134	TableTopVerticalAdjustedPosition	FD	1		2014-10-27 22:02:59.419188
2760	Table Top Longitudinal Adjusted Position	Registry of DICOM Data Elements	116	116	4135	4135	TableTopLongitudinalAdjustedPosition	FD	1		2014-10-27 22:02:59.422537
2761	Table Top Lateral Adjusted Position	Registry of DICOM Data Elements	116	116	4136	4136	TableTopLateralAdjustedPosition	FD	1		2014-10-27 22:02:59.425944
2762	Patient Support Adjusted Angle	Registry of DICOM Data Elements	116	116	4138	4138	PatientSupportAdjustedAngle	FD	1		2014-10-27 22:02:59.429333
2763	Table Top Eccentric Adjusted Angle	Registry of DICOM Data Elements	116	116	4139	4139	TableTopEccentricAdjustedAngle	FD	1		2014-10-27 22:02:59.432733
2764	Table Top Pitch Adjusted Angle	Registry of DICOM Data Elements	116	116	4140	4140	TableTopPitchAdjustedAngle	FD	1		2014-10-27 22:02:59.436595
2765	Table Top Roll Adjusted Angle	Registry of DICOM Data Elements	116	116	4141	4141	TableTopRollAdjustedAngle	FD	1		2014-10-27 22:02:59.44003
2766	Delivery Verification Image Sequence	Registry of DICOM Data Elements	116	116	4144	4144	DeliveryVerificationImageSequence	SQ	1		2014-10-27 22:02:59.443372
2767	Verification Image Timing	Registry of DICOM Data Elements	116	116	4146	4146	VerificationImageTiming	CS	1		2014-10-27 22:02:59.446735
2768	Double Exposure Flag	Registry of DICOM Data Elements	116	116	4148	4148	DoubleExposureFlag	CS	1		2014-10-27 22:02:59.450169
2769	Double Exposure Ordering	Registry of DICOM Data Elements	116	116	4150	4150	DoubleExposureOrdering	CS	1		2014-10-27 22:02:59.453561
2770	Double Exposure Meterset (Trial)	Registry of DICOM Data Elements	116	116	4152	4152	DoubleExposureMetersetTrial	DS	1	RET	2014-10-27 22:02:59.45696
2771	Double Exposure Field Delta (Trial)	Registry of DICOM Data Elements	116	116	4154	4154	DoubleExposureFieldDeltaTrial	DS	4	RET	2014-10-27 22:02:59.460327
2772	Related Reference RT Image Sequence	Registry of DICOM Data Elements	116	116	4160	4160	RelatedReferenceRTImageSequence	SQ	1		2014-10-27 22:02:59.463705
2773	General Machine Verification Sequence	Registry of DICOM Data Elements	116	116	4162	4162	GeneralMachineVerificationSequence	SQ	1		2014-10-27 22:02:59.467029
2774	Conventional Machine Verification Sequence	Registry of DICOM Data Elements	116	116	4164	4164	ConventionalMachineVerificationSequence	SQ	1		2014-10-27 22:02:59.470389
2775	Ion Machine Verification Sequence	Registry of DICOM Data Elements	116	116	4166	4166	IonMachineVerificationSequence	SQ	1		2014-10-27 22:02:59.474259
2776	Failed Attributes Sequence	Registry of DICOM Data Elements	116	116	4168	4168	FailedAttributesSequence	SQ	1		2014-10-27 22:02:59.477641
2777	Overridden Attributes Sequence	Registry of DICOM Data Elements	116	116	4170	4170	OverriddenAttributesSequence	SQ	1		2014-10-27 22:02:59.48101
2778	Conventional Control Point Verification Sequence	Registry of DICOM Data Elements	116	116	4172	4172	ConventionalControlPointVerificationSequence	SQ	1		2014-10-27 22:02:59.484466
2779	Ion Control Point Verification Sequence	Registry of DICOM Data Elements	116	116	4174	4174	IonControlPointVerificationSequence	SQ	1		2014-10-27 22:02:59.487872
2780	Attribute Occurrence Sequence	Registry of DICOM Data Elements	116	116	4176	4176	AttributeOccurrenceSequence	SQ	1		2014-10-27 22:02:59.491235
2781	Attribute Occurrence Pointer	Registry of DICOM Data Elements	116	116	4178	4178	AttributeOccurrencePointer	AT	1		2014-10-27 22:02:59.494618
2782	Attribute Item Selector	Registry of DICOM Data Elements	116	116	4180	4180	AttributeItemSelector	UL	1		2014-10-27 22:02:59.498042
2783	Attribute Occurrence Private Creator	Registry of DICOM Data Elements	116	116	4182	4182	AttributeOccurrencePrivateCreator	LO	1		2014-10-27 22:02:59.501418
2784	Selector Sequence Pointer Items	Registry of DICOM Data Elements	116	116	4183	4183	SelectorSequencePointerItems	IS	1-n		2014-10-27 22:02:59.504945
2785	Scheduled Procedure Step Priority	Registry of DICOM Data Elements	116	116	4608	4608	ScheduledProcedureStepPriority	CS	1		2014-10-27 22:02:59.508549
2786	Worklist Label	Registry of DICOM Data Elements	116	116	4610	4610	WorklistLabel	LO	1		2014-10-27 22:02:59.512454
2787	Procedure Step Label	Registry of DICOM Data Elements	116	116	4612	4612	ProcedureStepLabel	LO	1		2014-10-27 22:02:59.515866
2788	Scheduled Processing Parameters Sequence	Registry of DICOM Data Elements	116	116	4624	4624	ScheduledProcessingParametersSequence	SQ	1		2014-10-27 22:02:59.51926
2789	Performed Processing Parameters Sequence	Registry of DICOM Data Elements	116	116	4626	4626	PerformedProcessingParametersSequence	SQ	1		2014-10-27 22:02:59.522625
2790	Unified Procedure Step Performed Procedure Sequence	Registry of DICOM Data Elements	116	116	4630	4630	UnifiedProcedureStepPerformedProcedureSequence	SQ	1		2014-10-27 22:02:59.525997
2791	Related Procedure Step Sequence	Registry of DICOM Data Elements	116	116	4640	4640	RelatedProcedureStepSequence	SQ	1	RET	2014-10-27 22:02:59.529401
2792	Procedure Step Relationship Type	Registry of DICOM Data Elements	116	116	4642	4642	ProcedureStepRelationshipType	LO	1	RET	2014-10-27 22:02:59.532801
2793	Replaced Procedure Step Sequence	Registry of DICOM Data Elements	116	116	4644	4644	ReplacedProcedureStepSequence	SQ	1		2014-10-27 22:02:59.537724
2794	Deletion Lock	Registry of DICOM Data Elements	116	116	4656	4656	DeletionLock	LO	1		2014-10-27 22:02:59.541257
2795	Receiving AE	Registry of DICOM Data Elements	116	116	4660	4660	ReceivingAE	AE	1		2014-10-27 22:02:59.544722
2796	Requesting AE	Registry of DICOM Data Elements	116	116	4662	4662	RequestingAE	AE	1		2014-10-27 22:02:59.548164
2797	Reason for Cancellation	Registry of DICOM Data Elements	116	116	4664	4664	ReasonForCancellation	LT	1		2014-10-27 22:02:59.55205
2798	SCP Status	Registry of DICOM Data Elements	116	116	4674	4674	SCPStatus	CS	1		2014-10-27 22:02:59.555425
2799	Subscription List Status	Registry of DICOM Data Elements	116	116	4676	4676	SubscriptionListStatus	CS	1		2014-10-27 22:02:59.558803
2800	Unified Procedure Step List Status	Registry of DICOM Data Elements	116	116	4678	4678	UnifiedProcedureStepListStatus	CS	1		2014-10-27 22:02:59.562201
2801	Beam Order Index	Registry of DICOM Data Elements	116	116	4900	4900	BeamOrderIndex	UL	1		2014-10-27 22:02:59.565608
2802	Double Exposure Meterset	Registry of DICOM Data Elements	116	116	4920	4920	DoubleExposureMeterset	FD	1		2014-10-27 22:02:59.569023
2803	Double Exposure Field Delta	Registry of DICOM Data Elements	116	116	4922	4922	DoubleExposureFieldDelta	FD	4		2014-10-27 22:02:59.572382
2804	Implant Assembly Template Name	Registry of DICOM Data Elements	118	118	1	1	ImplantAssemblyTemplateName	LO	1		2014-10-27 22:02:59.575802
2805	Implant Assembly Template Issuer	Registry of DICOM Data Elements	118	118	3	3	ImplantAssemblyTemplateIssuer	LO	1		2014-10-27 22:02:59.579147
2806	Implant Assembly Template Version	Registry of DICOM Data Elements	118	118	6	6	ImplantAssemblyTemplateVersion	LO	1		2014-10-27 22:02:59.582713
2807	Replaced Implant Assembly Template Sequence	Registry of DICOM Data Elements	118	118	8	8	ReplacedImplantAssemblyTemplateSequence	SQ	1		2014-10-27 22:02:59.586184
2808	Implant Assembly Template Type	Registry of DICOM Data Elements	118	118	10	10	ImplantAssemblyTemplateType	CS	1		2014-10-27 22:02:59.590071
2809	Original Implant Assembly Template Sequence	Registry of DICOM Data Elements	118	118	12	12	OriginalImplantAssemblyTemplateSequence	SQ	1		2014-10-27 22:02:59.593465
2810	Derivation Implant Assembly Template Sequence	Registry of DICOM Data Elements	118	118	14	14	DerivationImplantAssemblyTemplateSequence	SQ	1		2014-10-27 22:02:59.596853
2811	Implant Assembly Template Target Anatomy Sequence	Registry of DICOM Data Elements	118	118	16	16	ImplantAssemblyTemplateTargetAnatomySequence	SQ	1		2014-10-27 22:02:59.600246
2812	Procedure Type Code Sequence	Registry of DICOM Data Elements	118	118	32	32	ProcedureTypeCodeSequence	SQ	1		2014-10-27 22:02:59.603672
2813	Surgical Technique	Registry of DICOM Data Elements	118	118	48	48	SurgicalTechnique	LO	1		2014-10-27 22:02:59.60703
2814	Component Types Sequence	Registry of DICOM Data Elements	118	118	50	50	ComponentTypesSequence	SQ	1		2014-10-27 22:02:59.610423
2815	Component Type Code Sequence	Registry of DICOM Data Elements	118	118	52	52	ComponentTypeCodeSequence	CS	1		2014-10-27 22:02:59.613882
2816	Exclusive Component Type	Registry of DICOM Data Elements	118	118	54	54	ExclusiveComponentType	CS	1		2014-10-27 22:02:59.617277
2817	Mandatory Component Type	Registry of DICOM Data Elements	118	118	56	56	MandatoryComponentType	CS	1		2014-10-27 22:02:59.620732
2818	Component Sequence	Registry of DICOM Data Elements	118	118	64	64	ComponentSequence	SQ	1		2014-10-27 22:02:59.624227
2819	Component ID	Registry of DICOM Data Elements	118	118	85	85	ComponentID	US	1		2014-10-27 22:02:59.628091
2820	Component Assembly Sequence	Registry of DICOM Data Elements	118	118	96	96	ComponentAssemblySequence	SQ	1		2014-10-27 22:02:59.63147
2821	Component 1 Referenced ID	Registry of DICOM Data Elements	118	118	112	112	Component1ReferencedID	US	1		2014-10-27 22:02:59.634848
2822	Component 1 Referenced Mating Feature Set ID	Registry of DICOM Data Elements	118	118	128	128	Component1ReferencedMatingFeatureSetID	US	1		2014-10-27 22:02:59.638257
2823	Component 1 Referenced Mating Feature ID	Registry of DICOM Data Elements	118	118	144	144	Component1ReferencedMatingFeatureID	US	1		2014-10-27 22:02:59.641658
2824	Component 2 Referenced ID	Registry of DICOM Data Elements	118	118	160	160	Component2ReferencedID	US	1		2014-10-27 22:02:59.645061
2825	Component 2 Referenced Mating Feature Set ID	Registry of DICOM Data Elements	118	118	176	176	Component2ReferencedMatingFeatureSetID	US	1		2014-10-27 22:02:59.648494
2826	Component 2 Referenced Mating Feature ID	Registry of DICOM Data Elements	118	118	192	192	Component2ReferencedMatingFeatureID	US	1		2014-10-27 22:02:59.651869
2827	Implant Template Group Name	Registry of DICOM Data Elements	120	120	1	1	ImplantTemplateGroupName	LO	1		2014-10-27 22:02:59.65527
2828	Implant Template Group Description	Registry of DICOM Data Elements	120	120	16	16	ImplantTemplateGroupDescription	ST	1		2014-10-27 22:02:59.65871
2829	Implant Template Group Issuer	Registry of DICOM Data Elements	120	120	32	32	ImplantTemplateGroupIssuer	LO	1		2014-10-27 22:02:59.662143
2830	Implant Template Group Version	Registry of DICOM Data Elements	120	120	36	36	ImplantTemplateGroupVersion	LO	1		2014-10-27 22:02:59.666041
2831	Replaced Implant Template Group Sequence	Registry of DICOM Data Elements	120	120	38	38	ReplacedImplantTemplateGroupSequence	SQ	1		2014-10-27 22:02:59.669429
2832	Implant Template Group Target Anatomy Sequence	Registry of DICOM Data Elements	120	120	40	40	ImplantTemplateGroupTargetAnatomySequence	SQ	1		2014-10-27 22:02:59.672865
2833	Implant Template Group Members Sequence	Registry of DICOM Data Elements	120	120	42	42	ImplantTemplateGroupMembersSequence	SQ	1		2014-10-27 22:02:59.676239
2834	Implant Template Group Member ID	Registry of DICOM Data Elements	120	120	46	46	ImplantTemplateGroupMemberID	US	1		2014-10-27 22:02:59.679651
2835	3D Implant Template Group Member Matching Point	Registry of DICOM Data Elements	120	120	80	80	ThreeDImplantTemplateGroupMemberMatchingPoint	FD	3		2014-10-27 22:02:59.68303
2836	3D Implant Template Group Member Matching Axes	Registry of DICOM Data Elements	120	120	96	96	ThreeDImplantTemplateGroupMemberMatchingAxes	FD	9		2014-10-27 22:02:59.686501
2837	Implant Template Group Member Matching 2D Coordinates Sequence	Registry of DICOM Data Elements	120	120	112	112	ImplantTemplateGroupMemberMatching2DCoordinatesSequence	SQ	1		2014-10-27 22:02:59.689951
2838	2D Implant Template Group Member Matching Point	Registry of DICOM Data Elements	120	120	144	144	TwoDImplantTemplateGroupMemberMatchingPoint	FD	2		2014-10-27 22:02:59.693342
2839	2D Implant Template Group Member Matching Axes	Registry of DICOM Data Elements	120	120	160	160	TwoDImplantTemplateGroupMemberMatchingAxes	FD	4		2014-10-27 22:02:59.696807
2840	Implant Template Group Variation Dimension Sequence	Registry of DICOM Data Elements	120	120	176	176	ImplantTemplateGroupVariationDimensionSequence	SQ	1		2014-10-27 22:02:59.700306
2841	Implant Template Group Variation Dimension Name	Registry of DICOM Data Elements	120	120	178	178	ImplantTemplateGroupVariationDimensionName	LO	1		2014-10-27 22:02:59.7042
2842	Implant Template Group Variation Dimension Rank Sequence	Registry of DICOM Data Elements	120	120	180	180	ImplantTemplateGroupVariationDimensionRankSequence	SQ	1		2014-10-27 22:02:59.707564
2843	Referenced Implant Template Group Member ID	Registry of DICOM Data Elements	120	120	182	182	ReferencedImplantTemplateGroupMemberID	US	1		2014-10-27 22:02:59.710941
2844	Implant Template Group Variation Dimension Rank	Registry of DICOM Data Elements	120	120	184	184	ImplantTemplateGroupVariationDimensionRank	US	1		2014-10-27 22:02:59.71437
2845	Surface Scan Acquisition Type Code Sequence	Registry of DICOM Data Elements	128	128	1	1	SurfaceScanAcquisitionTypeCodeSequence	SQ	1		2014-10-27 22:02:59.717764
2846	Surface Scan Mode Code Sequence	Registry of DICOM Data Elements	128	128	2	2	SurfaceScanModeCodeSequence	SQ	1		2014-10-27 22:02:59.721143
2847	Registration Method Code Sequence	Registry of DICOM Data Elements	128	128	3	3	RegistrationMethodCodeSequence	SQ	1		2014-10-27 22:02:59.724543
2848	Shot Duration Time	Registry of DICOM Data Elements	128	128	4	4	ShotDurationTime	FD	1		2014-10-27 22:02:59.727925
2849	Shot Offset Time	Registry of DICOM Data Elements	128	128	5	5	ShotOffsetTime	FD	1		2014-10-27 22:02:59.73131
2850	Surface Point Presentation Value Data	Registry of DICOM Data Elements	128	128	6	6	SurfacePointPresentationValueData	US	1-n		2014-10-27 22:02:59.734839
2851	Surface Point Color CIELab Value Data	Registry of DICOM Data Elements	128	128	7	7	SurfacePointColorCIELabValueData	US	3-3n		2014-10-27 22:02:59.738326
2852	UV Mapping Sequence	Registry of DICOM Data Elements	128	128	8	8	UVMappingSequence	SQ	1		2014-10-27 22:02:59.742292
2853	Texture Label	Registry of DICOM Data Elements	128	128	9	9	TextureLabel	SH	1		2014-10-27 22:02:59.745769
2854	U Value Data	Registry of DICOM Data Elements	128	128	16	16	UValueData	OF	1-n		2014-10-27 22:02:59.749176
2855	V Value Data	Registry of DICOM Data Elements	128	128	17	17	VValueData	OF	1-n		2014-10-27 22:02:59.75263
2856	Referenced Texture Sequence	Registry of DICOM Data Elements	128	128	18	18	ReferencedTextureSequence	SQ	1		2014-10-27 22:02:59.756024
2857	Referenced Surface Data Sequence	Registry of DICOM Data Elements	128	128	19	19	ReferencedSurfaceDataSequence	SQ	1		2014-10-27 22:02:59.759426
2858	Storage Media File-set ID	Registry of DICOM Data Elements	136	136	304	304	StorageMediaFileSetID	SH	1		2014-10-27 22:02:59.762848
2859	Storage Media File-set UID	Registry of DICOM Data Elements	136	136	320	320	StorageMediaFileSetUID	UI	1		2014-10-27 22:02:59.766224
2860	Icon Image Sequence	Registry of DICOM Data Elements	136	136	512	512	IconImageSequence	SQ	1		2014-10-27 22:02:59.769628
2861	Topic Title	Registry of DICOM Data Elements	136	136	2308	2308	TopicTitle	LO	1	RET	2014-10-27 22:02:59.773091
2862	Topic Subject	Registry of DICOM Data Elements	136	136	2310	2310	TopicSubject	ST	1	RET	2014-10-27 22:02:59.77659
2863	Topic Author	Registry of DICOM Data Elements	136	136	2320	2320	TopicAuthor	LO	1	RET	2014-10-27 22:02:59.78049
2864	Topic Keywords	Registry of DICOM Data Elements	136	136	2322	2322	TopicKeywords	LO	1-32	RET	2014-10-27 22:02:59.783865
2865	SOP Instance Status	Registry of DICOM Data Elements	256	256	1040	1040	SOPInstanceStatus	CS	1		2014-10-27 22:02:59.787343
2866	SOP Authorization DateTime	Registry of DICOM Data Elements	256	256	1056	1056	SOPAuthorizationDateTime	DT	1		2014-10-27 22:02:59.790734
2867	SOP Authorization Comment	Registry of DICOM Data Elements	256	256	1060	1060	SOPAuthorizationComment	LT	1		2014-10-27 22:02:59.794192
2868	Authorization Equipment Certification Number	Registry of DICOM Data Elements	256	256	1062	1062	AuthorizationEquipmentCertificationNumber	LO	1		2014-10-27 22:02:59.79758
2869	MAC ID Number	Registry of DICOM Data Elements	1024	1024	5	5	MACIDNumber	US	1		2014-10-27 22:02:59.800988
2870	MAC Calculation Transfer Syntax UID	Registry of DICOM Data Elements	1024	1024	16	16	MACCalculationTransferSyntaxUID	UI	1		2014-10-27 22:02:59.80436
2871	MAC Algorithm	Registry of DICOM Data Elements	1024	1024	21	21	MACAlgorithm	CS	1		2014-10-27 22:02:59.807802
2872	Data Elements Signed	Registry of DICOM Data Elements	1024	1024	32	32	DataElementsSigned	AT	1-n		2014-10-27 22:02:59.811375
2873	Digital Signature UID	Registry of DICOM Data Elements	1024	1024	256	256	DigitalSignatureUID	UI	1		2014-10-27 22:02:59.816145
2874	Digital Signature DateTime	Registry of DICOM Data Elements	1024	1024	261	261	DigitalSignatureDateTime	DT	1		2014-10-27 22:02:59.819541
2875	Certificate Type	Registry of DICOM Data Elements	1024	1024	272	272	CertificateType	CS	1		2014-10-27 22:02:59.822906
2876	Certificate of Signer	Registry of DICOM Data Elements	1024	1024	277	277	CertificateOfSigner	OB	1		2014-10-27 22:02:59.826335
2877	Signature	Registry of DICOM Data Elements	1024	1024	288	288	Signature	OB	1		2014-10-27 22:02:59.829741
2878	Certified Timestamp Type	Registry of DICOM Data Elements	1024	1024	773	773	CertifiedTimestampType	CS	1		2014-10-27 22:02:59.833165
2879	Certified Timestamp	Registry of DICOM Data Elements	1024	1024	784	784	CertifiedTimestamp	OB	1		2014-10-27 22:02:59.836543
2880	Digital Signature Purpose Code Sequence	Registry of DICOM Data Elements	1024	1024	1025	1025	DigitalSignaturePurposeCodeSequence	SQ	1		2014-10-27 22:02:59.83994
2881	Referenced Digital Signature Sequence	Registry of DICOM Data Elements	1024	1024	1026	1026	ReferencedDigitalSignatureSequence	SQ	1		2014-10-27 22:02:59.843312
2882	Referenced SOP Instance MAC Sequence	Registry of DICOM Data Elements	1024	1024	1027	1027	ReferencedSOPInstanceMACSequence	SQ	1		2014-10-27 22:02:59.846709
2883	MAC	Registry of DICOM Data Elements	1024	1024	1028	1028	MAC	OB	1		2014-10-27 22:02:59.85013
2884	Encrypted Attributes Sequence	Registry of DICOM Data Elements	1024	1024	1280	1280	EncryptedAttributesSequence	SQ	1		2014-10-27 22:02:59.853924
2885	Encrypted Content Transfer Syntax UID	Registry of DICOM Data Elements	1024	1024	1296	1296	EncryptedContentTransferSyntaxUID	UI	1		2014-10-27 22:02:59.857378
2886	Encrypted Content	Registry of DICOM Data Elements	1024	1024	1312	1312	EncryptedContent	OB	1		2014-10-27 22:02:59.860783
2887	Modified Attributes Sequence	Registry of DICOM Data Elements	1024	1024	1360	1360	ModifiedAttributesSequence	SQ	1		2014-10-27 22:02:59.864165
2888	Original Attributes Sequence	Registry of DICOM Data Elements	1024	1024	1377	1377	OriginalAttributesSequence	SQ	1		2014-10-27 22:02:59.867579
2889	Attribute Modification DateTime	Registry of DICOM Data Elements	1024	1024	1378	1378	AttributeModificationDateTime	DT	1		2014-10-27 22:02:59.870997
2890	Modifying System	Registry of DICOM Data Elements	1024	1024	1379	1379	ModifyingSystem	LO	1		2014-10-27 22:02:59.874404
2891	Source of Previous Values	Registry of DICOM Data Elements	1024	1024	1380	1380	SourceOfPreviousValues	LO	1		2014-10-27 22:02:59.877777
2892	Reason for the Attribute Modification	Registry of DICOM Data Elements	1024	1024	1381	1381	ReasonForTheAttributeModification	CS	1		2014-10-27 22:02:59.881163
2893	Escape Triplet	Registry of DICOM Data Elements	4096	4096	0	65520	EscapeTriplet	US	3	RET	2014-10-27 22:02:59.884687
2894	Run Length Triplet	Registry of DICOM Data Elements	4096	4096	1	65521	RunLengthTriplet	US	3	RET	2014-10-27 22:02:59.888093
2895	Huffman Table Size	Registry of DICOM Data Elements	4096	4096	2	65522	HuffmanTableSize	US	1	RET	2014-10-27 22:02:59.89193
2896	Huffman Table Triplet	Registry of DICOM Data Elements	4096	4096	3	65523	HuffmanTableTriplet	US	3	RET	2014-10-27 22:02:59.895328
2897	Shift Table Size	Registry of DICOM Data Elements	4096	4096	4	65524	ShiftTableSize	US	1	RET	2014-10-27 22:02:59.898721
2898	Shift Table Triplet	Registry of DICOM Data Elements	4096	4096	5	65525	ShiftTableTriplet	US	3	RET	2014-10-27 22:02:59.902136
2899	Zonal Map	Registry of DICOM Data Elements	4112	4112	0	65535	ZonalMap	US	1-n	RET	2014-10-27 22:02:59.905606
2900	Number of Copies	Registry of DICOM Data Elements	8192	8192	16	16	NumberOfCopies	IS	1		2014-10-27 22:02:59.909055
2901	Printer Configuration Sequence	Registry of DICOM Data Elements	8192	8192	30	30	PrinterConfigurationSequence	SQ	1		2014-10-27 22:02:59.912449
2902	Print Priority	Registry of DICOM Data Elements	8192	8192	32	32	PrintPriority	CS	1		2014-10-27 22:02:59.915852
2903	Medium Type	Registry of DICOM Data Elements	8192	8192	48	48	MediumType	CS	1		2014-10-27 22:02:59.919274
2904	Film Destination	Registry of DICOM Data Elements	8192	8192	64	64	FilmDestination	CS	1		2014-10-27 22:02:59.922643
2905	Film Session Label	Registry of DICOM Data Elements	8192	8192	80	80	FilmSessionLabel	LO	1		2014-10-27 22:02:59.926032
2906	Memory Allocation	Registry of DICOM Data Elements	8192	8192	96	96	MemoryAllocation	IS	1		2014-10-27 22:02:59.929883
2907	Maximum Memory Allocation	Registry of DICOM Data Elements	8192	8192	97	97	MaximumMemoryAllocation	IS	1		2014-10-27 22:02:59.933311
2908	Color Image Printing Flag	Registry of DICOM Data Elements	8192	8192	98	98	ColorImagePrintingFlag	CS	1	RET	2014-10-27 22:02:59.936705
2909	Collation Flag	Registry of DICOM Data Elements	8192	8192	99	99	CollationFlag	CS	1	RET	2014-10-27 22:02:59.940092
2910	Annotation Flag	Registry of DICOM Data Elements	8192	8192	101	101	AnnotationFlag	CS	1	RET	2014-10-27 22:02:59.943508
2911	Image Overlay Flag	Registry of DICOM Data Elements	8192	8192	103	103	ImageOverlayFlag	CS	1	RET	2014-10-27 22:02:59.94687
2912	Presentation LUT Flag	Registry of DICOM Data Elements	8192	8192	105	105	PresentationLUTFlag	CS	1	RET	2014-10-27 22:02:59.950482
2913	Image Box Presentation LUT Flag	Registry of DICOM Data Elements	8192	8192	106	106	ImageBoxPresentationLUTFlag	CS	1	RET	2014-10-27 22:02:59.953952
2914	Memory Bit Depth	Registry of DICOM Data Elements	8192	8192	160	160	MemoryBitDepth	US	1		2014-10-27 22:02:59.957341
2915	Printing Bit Depth	Registry of DICOM Data Elements	8192	8192	161	161	PrintingBitDepth	US	1		2014-10-27 22:02:59.960781
2916	Media Installed Sequence	Registry of DICOM Data Elements	8192	8192	162	162	MediaInstalledSequence	SQ	1		2014-10-27 22:02:59.964259
2917	Other Media Available Sequence	Registry of DICOM Data Elements	8192	8192	164	164	OtherMediaAvailableSequence	SQ	1		2014-10-27 22:02:59.968175
2918	Supported Image Display Formats Sequence	Registry of DICOM Data Elements	8192	8192	168	168	SupportedImageDisplayFormatsSequence	SQ	1		2014-10-27 22:02:59.971619
2919	Referenced Film Box Sequence	Registry of DICOM Data Elements	8192	8192	1280	1280	ReferencedFilmBoxSequence	SQ	1		2014-10-27 22:02:59.975045
2920	Referenced Stored Print Sequence	Registry of DICOM Data Elements	8192	8192	1296	1296	ReferencedStoredPrintSequence	SQ	1	RET	2014-10-27 22:02:59.978456
2921	Image Display Format	Registry of DICOM Data Elements	8208	8208	16	16	ImageDisplayFormat	ST	1		2014-10-27 22:02:59.981938
2922	Annotation Display Format ID	Registry of DICOM Data Elements	8208	8208	48	48	AnnotationDisplayFormatID	CS	1		2014-10-27 22:02:59.985389
2923	Film Orientation	Registry of DICOM Data Elements	8208	8208	64	64	FilmOrientation	CS	1		2014-10-27 22:02:59.988826
2924	Film Size ID	Registry of DICOM Data Elements	8208	8208	80	80	FilmSizeID	CS	1		2014-10-27 22:02:59.992247
2925	Printer Resolution ID	Registry of DICOM Data Elements	8208	8208	82	82	PrinterResolutionID	CS	1		2014-10-27 22:02:59.995658
2926	Default Printer Resolution ID	Registry of DICOM Data Elements	8208	8208	84	84	DefaultPrinterResolutionID	CS	1		2014-10-27 22:02:59.999137
2927	Magnification Type	Registry of DICOM Data Elements	8208	8208	96	96	MagnificationType	CS	1		2014-10-27 22:03:00.002607
2928	Smoothing Type	Registry of DICOM Data Elements	8208	8208	128	128	SmoothingType	CS	1		2014-10-27 22:03:00.006484
2929	Default Magnification Type	Registry of DICOM Data Elements	8208	8208	166	166	DefaultMagnificationType	CS	1		2014-10-27 22:03:00.009879
2930	Other Magnification Types Available	Registry of DICOM Data Elements	8208	8208	167	167	OtherMagnificationTypesAvailable	CS	1-n		2014-10-27 22:03:00.013257
2931	Default Smoothing Type	Registry of DICOM Data Elements	8208	8208	168	168	DefaultSmoothingType	CS	1		2014-10-27 22:03:00.016661
2932	Other Smoothing Types Available	Registry of DICOM Data Elements	8208	8208	169	169	OtherSmoothingTypesAvailable	CS	1-n		2014-10-27 22:03:00.020045
2933	Border Density	Registry of DICOM Data Elements	8208	8208	256	256	BorderDensity	CS	1		2014-10-27 22:03:00.02343
2934	Empty Image Density	Registry of DICOM Data Elements	8208	8208	272	272	EmptyImageDensity	CS	1		2014-10-27 22:03:00.026811
2935	Min Density	Registry of DICOM Data Elements	8208	8208	288	288	MinDensity	US	1		2014-10-27 22:03:00.030186
2936	Max Density	Registry of DICOM Data Elements	8208	8208	304	304	MaxDensity	US	1		2014-10-27 22:03:00.03357
2937	Trim	Registry of DICOM Data Elements	8208	8208	320	320	Trim	CS	1		2014-10-27 22:03:00.037064
2938	Configuration Information	Registry of DICOM Data Elements	8208	8208	336	336	ConfigurationInformation	ST	1		2014-10-27 22:03:00.040546
2939	Configuration Information Description	Registry of DICOM Data Elements	8208	8208	338	338	ConfigurationInformationDescription	LT	1		2014-10-27 22:03:00.044421
2940	Maximum Collated Films	Registry of DICOM Data Elements	8208	8208	340	340	MaximumCollatedFilms	IS	1		2014-10-27 22:03:00.047843
2941	Illumination	Registry of DICOM Data Elements	8208	8208	350	350	Illumination	US	1		2014-10-27 22:03:00.051192
2942	Reflected Ambient Light	Registry of DICOM Data Elements	8208	8208	352	352	ReflectedAmbientLight	US	1		2014-10-27 22:03:00.054575
2943	Printer Pixel Spacing	Registry of DICOM Data Elements	8208	8208	886	886	PrinterPixelSpacing	DS	2		2014-10-27 22:03:00.058053
2944	Referenced Film Session Sequence	Registry of DICOM Data Elements	8208	8208	1280	1280	ReferencedFilmSessionSequence	SQ	1		2014-10-27 22:03:00.061477
2945	Referenced Image Box Sequence	Registry of DICOM Data Elements	8208	8208	1296	1296	ReferencedImageBoxSequence	SQ	1		2014-10-27 22:03:00.064905
2946	Referenced Basic Annotation Box Sequence	Registry of DICOM Data Elements	8208	8208	1312	1312	ReferencedBasicAnnotationBoxSequence	SQ	1		2014-10-27 22:03:00.068288
2947	Image Box Position	Registry of DICOM Data Elements	8224	8224	16	16	ImageBoxPosition	US	1		2014-10-27 22:03:00.071722
2948	Polarity	Registry of DICOM Data Elements	8224	8224	32	32	Polarity	CS	1		2014-10-27 22:03:00.075464
2949	Requested Image Size	Registry of DICOM Data Elements	8224	8224	48	48	RequestedImageSize	DS	1		2014-10-27 22:03:00.079017
2950	Requested Decimate/Crop Behavior	Registry of DICOM Data Elements	8224	8224	64	64	RequestedDecimateCropBehavior	CS	1		2014-10-27 22:03:00.082926
2951	Requested Resolution ID	Registry of DICOM Data Elements	8224	8224	80	80	RequestedResolutionID	CS	1		2014-10-27 22:03:00.086432
2952	Requested Image Size Flag	Registry of DICOM Data Elements	8224	8224	160	160	RequestedImageSizeFlag	CS	1		2014-10-27 22:03:00.089902
2953	Decimate/Crop Result	Registry of DICOM Data Elements	8224	8224	162	162	DecimateCropResult	CS	1		2014-10-27 22:03:00.093327
2954	Basic Grayscale Image Sequence	Registry of DICOM Data Elements	8224	8224	272	272	BasicGrayscaleImageSequence	SQ	1		2014-10-27 22:03:00.096748
2955	Basic Color Image Sequence	Registry of DICOM Data Elements	8224	8224	273	273	BasicColorImageSequence	SQ	1		2014-10-27 22:03:00.100169
2956	Referenced Image Overlay Box Sequence	Registry of DICOM Data Elements	8224	8224	304	304	ReferencedImageOverlayBoxSequence	SQ	1	RET	2014-10-27 22:03:00.103595
2957	Referenced VOI LUT Box Sequence	Registry of DICOM Data Elements	8224	8224	320	320	ReferencedVOILUTBoxSequence	SQ	1	RET	2014-10-27 22:03:00.106968
2958	Annotation Position	Registry of DICOM Data Elements	8240	8240	16	16	AnnotationPosition	US	1		2014-10-27 22:03:00.11039
2959	Text String	Registry of DICOM Data Elements	8240	8240	32	32	TextString	LO	1		2014-10-27 22:03:00.113876
2960	Referenced Overlay Plane Sequence	Registry of DICOM Data Elements	8256	8256	16	16	ReferencedOverlayPlaneSequence	SQ	1	RET	2014-10-27 22:03:00.117352
2961	Referenced Overlay Plane Groups	Registry of DICOM Data Elements	8256	8256	17	17	ReferencedOverlayPlaneGroups	US	1-99	RET	2014-10-27 22:03:00.121326
2962	Overlay Pixel Data Sequence	Registry of DICOM Data Elements	8256	8256	32	32	OverlayPixelDataSequence	SQ	1	RET	2014-10-27 22:03:00.124733
2963	Overlay Magnification Type	Registry of DICOM Data Elements	8256	8256	96	96	OverlayMagnificationType	CS	1	RET	2014-10-27 22:03:00.128125
2964	Overlay Smoothing Type	Registry of DICOM Data Elements	8256	8256	112	112	OverlaySmoothingType	CS	1	RET	2014-10-27 22:03:00.131574
2965	Overlay or Image Magnification	Registry of DICOM Data Elements	8256	8256	114	114	OverlayOrImageMagnification	CS	1	RET	2014-10-27 22:03:00.134988
2966	Magnify to Number of Columns	Registry of DICOM Data Elements	8256	8256	116	116	MagnifyToNumberOfColumns	US	1	RET	2014-10-27 22:03:00.138417
2967	Overlay Foreground Density	Registry of DICOM Data Elements	8256	8256	128	128	OverlayForegroundDensity	CS	1	RET	2014-10-27 22:03:00.141803
2968	Overlay Background Density	Registry of DICOM Data Elements	8256	8256	130	130	OverlayBackgroundDensity	CS	1	RET	2014-10-27 22:03:00.145228
2969	Overlay Mode	Registry of DICOM Data Elements	8256	8256	144	144	OverlayMode	CS	1	RET	2014-10-27 22:03:00.148626
2970	Threshold Density	Registry of DICOM Data Elements	8256	8256	256	256	ThresholdDensity	CS	1	RET	2014-10-27 22:03:00.152091
2971	Referenced Image Box Sequence (Retired)	Registry of DICOM Data Elements	8256	8256	1280	1280	ReferencedImageBoxSequenceRetired	SQ	1	RET	2014-10-27 22:03:00.155874
2972	Presentation LUT Sequence	Registry of DICOM Data Elements	8272	8272	16	16	PresentationLUTSequence	SQ	1		2014-10-27 22:03:00.159806
2973	Presentation LUT Shape	Registry of DICOM Data Elements	8272	8272	32	32	PresentationLUTShape	CS	1		2014-10-27 22:03:00.163197
2974	Referenced Presentation LUT Sequence	Registry of DICOM Data Elements	8272	8272	1280	1280	ReferencedPresentationLUTSequence	SQ	1		2014-10-27 22:03:00.166718
2975	Print Job ID	Registry of DICOM Data Elements	8448	8448	16	16	PrintJobID	SH	1	RET	2014-10-27 22:03:00.170183
2976	Execution Status	Registry of DICOM Data Elements	8448	8448	32	32	ExecutionStatus	CS	1		2014-10-27 22:03:00.173714
2977	Execution Status Info	Registry of DICOM Data Elements	8448	8448	48	48	ExecutionStatusInfo	CS	1		2014-10-27 22:03:00.177146
2978	Creation Date	Registry of DICOM Data Elements	8448	8448	64	64	CreationDate	DA	1		2014-10-27 22:03:00.180519
2979	Creation Time	Registry of DICOM Data Elements	8448	8448	80	80	CreationTime	TM	1		2014-10-27 22:03:00.183934
2980	Originator	Registry of DICOM Data Elements	8448	8448	112	112	Originator	AE	1		2014-10-27 22:03:00.187304
2981	Destination AE	Registry of DICOM Data Elements	8448	8448	320	320	DestinationAE	AE	1	RET	2014-10-27 22:03:00.190825
2982	Owner ID	Registry of DICOM Data Elements	8448	8448	352	352	OwnerID	SH	1		2014-10-27 22:03:00.194307
2983	Number of Films	Registry of DICOM Data Elements	8448	8448	368	368	NumberOfFilms	IS	1		2014-10-27 22:03:00.198171
2984	Referenced Print Job Sequence (Pull Stored Print)	Registry of DICOM Data Elements	8448	8448	1280	1280	ReferencedPrintJobSequencePullStoredPrint	SQ	1	RET	2014-10-27 22:03:00.201557
2985	Printer Status	Registry of DICOM Data Elements	8464	8464	16	16	PrinterStatus	CS	1		2014-10-27 22:03:00.205004
2986	Printer Status Info	Registry of DICOM Data Elements	8464	8464	32	32	PrinterStatusInfo	CS	1		2014-10-27 22:03:00.208442
2987	Printer Name	Registry of DICOM Data Elements	8464	8464	48	48	PrinterName	LO	1		2014-10-27 22:03:00.211829
2988	Print Queue ID	Registry of DICOM Data Elements	8464	8464	153	153	PrintQueueID	SH	1	RET	2014-10-27 22:03:00.215246
2989	Queue Status	Registry of DICOM Data Elements	8480	8480	16	16	QueueStatus	CS	1	RET	2014-10-27 22:03:00.218693
2990	Print Job Description Sequence	Registry of DICOM Data Elements	8480	8480	80	80	PrintJobDescriptionSequence	SQ	1	RET	2014-10-27 22:03:00.222073
2991	Referenced Print Job Sequence	Registry of DICOM Data Elements	8480	8480	112	112	ReferencedPrintJobSequence	SQ	1	RET	2014-10-27 22:03:00.225531
2992	Print Management Capabilities Sequence	Registry of DICOM Data Elements	8496	8496	16	16	PrintManagementCapabilitiesSequence	SQ	1	RET	2014-10-27 22:03:00.229021
2993	Printer Characteristics Sequence	Registry of DICOM Data Elements	8496	8496	21	21	PrinterCharacteristicsSequence	SQ	1	RET	2014-10-27 22:03:00.23253
2994	Film Box Content Sequence	Registry of DICOM Data Elements	8496	8496	48	48	FilmBoxContentSequence	SQ	1	RET	2014-10-27 22:03:00.23646
2995	Image Box Content Sequence	Registry of DICOM Data Elements	8496	8496	64	64	ImageBoxContentSequence	SQ	1	RET	2014-10-27 22:03:00.239889
2996	Annotation Content Sequence	Registry of DICOM Data Elements	8496	8496	80	80	AnnotationContentSequence	SQ	1	RET	2014-10-27 22:03:00.243293
2997	Image Overlay Box Content Sequence	Registry of DICOM Data Elements	8496	8496	96	96	ImageOverlayBoxContentSequence	SQ	1	RET	2014-10-27 22:03:00.246806
2998	Presentation LUT Content Sequence	Registry of DICOM Data Elements	8496	8496	128	128	PresentationLUTContentSequence	SQ	1	RET	2014-10-27 22:03:00.250236
2999	Proposed Study Sequence	Registry of DICOM Data Elements	8496	8496	160	160	ProposedStudySequence	SQ	1	RET	2014-10-27 22:03:00.253661
3000	Original Image Sequence	Registry of DICOM Data Elements	8496	8496	192	192	OriginalImageSequence	SQ	1	RET	2014-10-27 22:03:00.257079
3001	Label Using Information Extracted From Instances	Registry of DICOM Data Elements	8704	8704	1	1	LabelUsingInformationExtractedFromInstances	CS	1		2014-10-27 22:03:00.260493
3002	Label Text	Registry of DICOM Data Elements	8704	8704	2	2	LabelText	UT	1		2014-10-27 22:03:00.263959
3003	Label Style Selection	Registry of DICOM Data Elements	8704	8704	3	3	LabelStyleSelection	CS	1		2014-10-27 22:03:00.267397
3004	Media Disposition	Registry of DICOM Data Elements	8704	8704	4	4	MediaDisposition	LT	1		2014-10-27 22:03:00.272111
3005	Barcode Value	Registry of DICOM Data Elements	8704	8704	5	5	BarcodeValue	LT	1		2014-10-27 22:03:00.275581
3006	Barcode Symbology	Registry of DICOM Data Elements	8704	8704	6	6	BarcodeSymbology	CS	1		2014-10-27 22:03:00.279012
3007	Allow Media Splitting	Registry of DICOM Data Elements	8704	8704	7	7	AllowMediaSplitting	CS	1		2014-10-27 22:03:00.282464
3008	Include Non-DICOM Objects	Registry of DICOM Data Elements	8704	8704	8	8	IncludeNonDICOMObjects	CS	1		2014-10-27 22:03:00.285942
3009	Include Display Application	Registry of DICOM Data Elements	8704	8704	9	9	IncludeDisplayApplication	CS	1		2014-10-27 22:03:00.289372
3010	Preserve Composite Instances After Media Creation	Registry of DICOM Data Elements	8704	8704	10	10	PreserveCompositeInstancesAfterMediaCreation	CS	1		2014-10-27 22:03:00.292807
3011	Total Number of Pieces of Media Created	Registry of DICOM Data Elements	8704	8704	11	11	TotalNumberOfPiecesOfMediaCreated	US	1		2014-10-27 22:03:00.296252
3012	Requested Media Application Profile	Registry of DICOM Data Elements	8704	8704	12	12	RequestedMediaApplicationProfile	LO	1		2014-10-27 22:03:00.299676
3013	Referenced Storage Media Sequence	Registry of DICOM Data Elements	8704	8704	13	13	ReferencedStorageMediaSequence	SQ	1		2014-10-27 22:03:00.303087
3014	Failure Attributes	Registry of DICOM Data Elements	8704	8704	14	14	FailureAttributes	AT	1-n		2014-10-27 22:03:00.306496
3015	Allow Lossy Compression	Registry of DICOM Data Elements	8704	8704	15	15	AllowLossyCompression	CS	1		2014-10-27 22:03:00.310332
3016	Request Priority	Registry of DICOM Data Elements	8704	8704	32	32	RequestPriority	CS	1		2014-10-27 22:03:00.313787
3017	RT Image Label	Registry of DICOM Data Elements	12290	12290	2	2	RTImageLabel	SH	1		2014-10-27 22:03:00.317243
3018	RT Image Name	Registry of DICOM Data Elements	12290	12290	3	3	RTImageName	LO	1		2014-10-27 22:03:00.320694
3019	RT Image Description	Registry of DICOM Data Elements	12290	12290	4	4	RTImageDescription	ST	1		2014-10-27 22:03:00.324118
3020	Reported Values Origin	Registry of DICOM Data Elements	12290	12290	10	10	ReportedValuesOrigin	CS	1		2014-10-27 22:03:00.327542
3021	RT Image Plane	Registry of DICOM Data Elements	12290	12290	12	12	RTImagePlane	CS	1		2014-10-27 22:03:00.330941
3022	X-Ray Image Receptor Translation	Registry of DICOM Data Elements	12290	12290	13	13	XRayImageReceptorTranslation	DS	3		2014-10-27 22:03:00.33437
3023	X-Ray Image Receptor Angle	Registry of DICOM Data Elements	12290	12290	14	14	XRayImageReceptorAngle	DS	1		2014-10-27 22:03:00.337791
3024	RT Image Orientation	Registry of DICOM Data Elements	12290	12290	16	16	RTImageOrientation	DS	6		2014-10-27 22:03:00.341226
3025	Image Plane Pixel Spacing	Registry of DICOM Data Elements	12290	12290	17	17	ImagePlanePixelSpacing	DS	2		2014-10-27 22:03:00.34471
3026	RT Image Position	Registry of DICOM Data Elements	12290	12290	18	18	RTImagePosition	DS	2		2014-10-27 22:03:00.348564
3027	Radiation Machine Name	Registry of DICOM Data Elements	12290	12290	32	32	RadiationMachineName	SH	1		2014-10-27 22:03:00.351988
3028	Radiation Machine SAD	Registry of DICOM Data Elements	12290	12290	34	34	RadiationMachineSAD	DS	1		2014-10-27 22:03:00.355382
3029	Radiation Machine SSD	Registry of DICOM Data Elements	12290	12290	36	36	RadiationMachineSSD	DS	1		2014-10-27 22:03:00.358791
3030	RT Image SID	Registry of DICOM Data Elements	12290	12290	38	38	RTImageSID	DS	1		2014-10-27 22:03:00.362219
3031	Source to Reference Object Distance	Registry of DICOM Data Elements	12290	12290	40	40	SourceToReferenceObjectDistance	DS	1		2014-10-27 22:03:00.365652
3032	Fraction Number	Registry of DICOM Data Elements	12290	12290	41	41	FractionNumber	IS	1		2014-10-27 22:03:00.369211
3033	Exposure Sequence	Registry of DICOM Data Elements	12290	12290	48	48	ExposureSequence	SQ	1		2014-10-27 22:03:00.37276
3034	Meterset Exposure	Registry of DICOM Data Elements	12290	12290	50	50	MetersetExposure	DS	1		2014-10-27 22:03:00.376197
3035	Diaphragm Position	Registry of DICOM Data Elements	12290	12290	52	52	DiaphragmPosition	DS	4		2014-10-27 22:03:00.379619
3036	Fluence Map Sequence	Registry of DICOM Data Elements	12290	12290	64	64	FluenceMapSequence	SQ	1		2014-10-27 22:03:00.383042
3037	Fluence Data Source	Registry of DICOM Data Elements	12290	12290	65	65	FluenceDataSource	CS	1		2014-10-27 22:03:00.386879
3038	Fluence Data Scale	Registry of DICOM Data Elements	12290	12290	66	66	FluenceDataScale	DS	1		2014-10-27 22:03:00.390344
3039	Primary Fluence Mode Sequence	Registry of DICOM Data Elements	12290	12290	80	80	PrimaryFluenceModeSequence	SQ	1		2014-10-27 22:03:00.393786
3040	Fluence Mode	Registry of DICOM Data Elements	12290	12290	81	81	FluenceMode	CS	1		2014-10-27 22:03:00.397207
3041	Fluence Mode ID	Registry of DICOM Data Elements	12290	12290	82	82	FluenceModeID	SH	1		2014-10-27 22:03:00.400664
3042	DVH Type	Registry of DICOM Data Elements	12292	12292	1	1	DVHType	CS	1		2014-10-27 22:03:00.404091
3043	Dose Units	Registry of DICOM Data Elements	12292	12292	2	2	DoseUnits	CS	1		2014-10-27 22:03:00.407511
3044	Dose Type	Registry of DICOM Data Elements	12292	12292	4	4	DoseType	CS	1		2014-10-27 22:03:00.410922
3045	Spatial Transform of Dose	Registry of DICOM Data Elements	12292	12292	5	5	SpatialTransformOfDose	CS	1		2014-10-27 22:03:00.414356
3046	Dose Comment	Registry of DICOM Data Elements	12292	12292	6	6	DoseComment	LO	1		2014-10-27 22:03:00.417763
3047	Normalization Point	Registry of DICOM Data Elements	12292	12292	8	8	NormalizationPoint	DS	3		2014-10-27 22:03:00.421223
3048	Dose Summation Type	Registry of DICOM Data Elements	12292	12292	10	10	DoseSummationType	CS	1		2014-10-27 22:03:00.425144
3049	Grid Frame Offset Vector	Registry of DICOM Data Elements	12292	12292	12	12	GridFrameOffsetVector	DS	2-n		2014-10-27 22:03:00.428617
3050	Dose Grid Scaling	Registry of DICOM Data Elements	12292	12292	14	14	DoseGridScaling	DS	1		2014-10-27 22:03:00.43202
3051	RT Dose ROI Sequence	Registry of DICOM Data Elements	12292	12292	16	16	RTDoseROISequence	SQ	1		2014-10-27 22:03:00.435427
3052	Dose Value	Registry of DICOM Data Elements	12292	12292	18	18	DoseValue	DS	1		2014-10-27 22:03:00.438867
3053	Tissue Heterogeneity Correction	Registry of DICOM Data Elements	12292	12292	20	20	TissueHeterogeneityCorrection	CS	1-3		2014-10-27 22:03:00.442278
3054	DVH Normalization Point	Registry of DICOM Data Elements	12292	12292	64	64	DVHNormalizationPoint	DS	3		2014-10-27 22:03:00.445695
3055	DVH Normalization Dose Value	Registry of DICOM Data Elements	12292	12292	66	66	DVHNormalizationDoseValue	DS	1		2014-10-27 22:03:00.449149
3056	DVH Sequence	Registry of DICOM Data Elements	12292	12292	80	80	DVHSequence	SQ	1		2014-10-27 22:03:00.452563
3057	DVH Dose Scaling	Registry of DICOM Data Elements	12292	12292	82	82	DVHDoseScaling	DS	1		2014-10-27 22:03:00.456057
3058	DVH Volume Units	Registry of DICOM Data Elements	12292	12292	84	84	DVHVolumeUnits	CS	1		2014-10-27 22:03:00.459576
3059	DVH Number of Bins	Registry of DICOM Data Elements	12292	12292	86	86	DVHNumberOfBins	IS	1		2014-10-27 22:03:00.463517
3060	DVH Data	Registry of DICOM Data Elements	12292	12292	88	88	DVHData	DS	2-2n		2014-10-27 22:03:00.466901
3061	DVH Referenced ROI Sequence	Registry of DICOM Data Elements	12292	12292	96	96	DVHReferencedROISequence	SQ	1		2014-10-27 22:03:00.470345
3062	DVH ROI Contribution Type	Registry of DICOM Data Elements	12292	12292	98	98	DVHROIContributionType	CS	1		2014-10-27 22:03:00.4738
3063	DVH Minimum Dose	Registry of DICOM Data Elements	12292	12292	112	112	DVHMinimumDose	DS	1		2014-10-27 22:03:00.477224
3064	DVH Maximum Dose	Registry of DICOM Data Elements	12292	12292	114	114	DVHMaximumDose	DS	1		2014-10-27 22:03:00.480663
3065	DVH Mean Dose	Registry of DICOM Data Elements	12292	12292	116	116	DVHMeanDose	DS	1		2014-10-27 22:03:00.484072
3066	Structure Set Label	Registry of DICOM Data Elements	12294	12294	2	2	StructureSetLabel	SH	1		2014-10-27 22:03:00.487613
3067	Structure Set Name	Registry of DICOM Data Elements	12294	12294	4	4	StructureSetName	LO	1		2014-10-27 22:03:00.491017
3068	Structure Set Description	Registry of DICOM Data Elements	12294	12294	6	6	StructureSetDescription	ST	1		2014-10-27 22:03:00.49448
3069	Structure Set Date	Registry of DICOM Data Elements	12294	12294	8	8	StructureSetDate	DA	1		2014-10-27 22:03:00.497967
3070	Structure Set Time	Registry of DICOM Data Elements	12294	12294	9	9	StructureSetTime	TM	1		2014-10-27 22:03:00.501861
3071	Referenced Frame of Reference Sequence	Registry of DICOM Data Elements	12294	12294	16	16	ReferencedFrameOfReferenceSequence	SQ	1		2014-10-27 22:03:00.505299
3072	RT Referenced Study Sequence	Registry of DICOM Data Elements	12294	12294	18	18	RTReferencedStudySequence	SQ	1		2014-10-27 22:03:00.508704
3073	RT Referenced Series Sequence	Registry of DICOM Data Elements	12294	12294	20	20	RTReferencedSeriesSequence	SQ	1		2014-10-27 22:03:00.512126
3074	Contour Image Sequence	Registry of DICOM Data Elements	12294	12294	22	22	ContourImageSequence	SQ	1		2014-10-27 22:03:00.51561
3075	Predecessor Structure Set Sequence	Registry of DICOM Data Elements	12294	12294	24	24	PredecessorStructureSetSequence	SQ	1		2014-10-27 22:03:00.519057
3076	Structure Set ROI Sequence	Registry of DICOM Data Elements	12294	12294	32	32	StructureSetROISequence	SQ	1		2014-10-27 22:03:00.522487
3077	ROI Number	Registry of DICOM Data Elements	12294	12294	34	34	ROINumber	IS	1		2014-10-27 22:03:00.525915
3078	Referenced Frame of Reference UID	Registry of DICOM Data Elements	12294	12294	36	36	ReferencedFrameOfReferenceUID	UI	1		2014-10-27 22:03:00.52939
3079	ROI Name	Registry of DICOM Data Elements	12294	12294	38	38	ROIName	LO	1		2014-10-27 22:03:00.532817
3080	ROI Description	Registry of DICOM Data Elements	12294	12294	40	40	ROIDescription	ST	1		2014-10-27 22:03:00.536319
3081	ROI Display Color	Registry of DICOM Data Elements	12294	12294	42	42	ROIDisplayColor	IS	3		2014-10-27 22:03:00.540216
3082	ROI Volume	Registry of DICOM Data Elements	12294	12294	44	44	ROIVolume	DS	1		2014-10-27 22:03:00.543676
3083	RT Related ROI Sequence	Registry of DICOM Data Elements	12294	12294	48	48	RTRelatedROISequence	SQ	1		2014-10-27 22:03:00.547056
3084	RT ROI Relationship	Registry of DICOM Data Elements	12294	12294	51	51	RTROIRelationship	CS	1		2014-10-27 22:03:00.550511
3085	ROI Generation Algorithm	Registry of DICOM Data Elements	12294	12294	54	54	ROIGenerationAlgorithm	CS	1		2014-10-27 22:03:00.553962
3086	ROI Generation Description	Registry of DICOM Data Elements	12294	12294	56	56	ROIGenerationDescription	LO	1		2014-10-27 22:03:00.557372
3087	ROI Contour Sequence	Registry of DICOM Data Elements	12294	12294	57	57	ROIContourSequence	SQ	1		2014-10-27 22:03:00.560829
3088	Contour Sequence	Registry of DICOM Data Elements	12294	12294	64	64	ContourSequence	SQ	1		2014-10-27 22:03:00.564271
3089	Contour Geometric Type	Registry of DICOM Data Elements	12294	12294	66	66	ContourGeometricType	CS	1		2014-10-27 22:03:00.5677
3090	Contour Slab Thickness	Registry of DICOM Data Elements	12294	12294	68	68	ContourSlabThickness	DS	1		2014-10-27 22:03:00.571184
3091	Contour Offset Vector	Registry of DICOM Data Elements	12294	12294	69	69	ContourOffsetVector	DS	3		2014-10-27 22:03:00.574772
3092	Number of Contour Points	Registry of DICOM Data Elements	12294	12294	70	70	NumberOfContourPoints	IS	1		2014-10-27 22:03:00.578675
3093	Contour Number	Registry of DICOM Data Elements	12294	12294	72	72	ContourNumber	IS	1		2014-10-27 22:03:00.582118
3094	Attached Contours	Registry of DICOM Data Elements	12294	12294	73	73	AttachedContours	IS	1-n		2014-10-27 22:03:00.585562
3095	Contour Data	Registry of DICOM Data Elements	12294	12294	80	80	ContourData	DS	3-3n		2014-10-27 22:03:00.589016
3096	RT ROI Observations Sequence	Registry of DICOM Data Elements	12294	12294	128	128	RTROIObservationsSequence	SQ	1		2014-10-27 22:03:00.592481
3097	Observation Number	Registry of DICOM Data Elements	12294	12294	130	130	ObservationNumber	IS	1		2014-10-27 22:03:00.595945
3098	Referenced ROI Number	Registry of DICOM Data Elements	12294	12294	132	132	ReferencedROINumber	IS	1		2014-10-27 22:03:00.5994
3099	ROI Observation Label	Registry of DICOM Data Elements	12294	12294	133	133	ROIObservationLabel	SH	1		2014-10-27 22:03:00.602809
3100	RT ROI Identification Code Sequence	Registry of DICOM Data Elements	12294	12294	134	134	RTROIIdentificationCodeSequence	SQ	1		2014-10-27 22:03:00.606293
3101	ROI Observation Description	Registry of DICOM Data Elements	12294	12294	136	136	ROIObservationDescription	ST	1		2014-10-27 22:03:00.609809
3102	Related RT ROI Observations Sequence	Registry of DICOM Data Elements	12294	12294	160	160	RelatedRTROIObservationsSequence	SQ	1		2014-10-27 22:03:00.613346
3103	RT ROI Interpreted Type	Registry of DICOM Data Elements	12294	12294	164	164	RTROIInterpretedType	CS	1		2014-10-27 22:03:00.617284
3104	ROI Interpreter	Registry of DICOM Data Elements	12294	12294	166	166	ROIInterpreter	PN	1		2014-10-27 22:03:00.620692
3105	ROI Physical Properties Sequence	Registry of DICOM Data Elements	12294	12294	176	176	ROIPhysicalPropertiesSequence	SQ	1		2014-10-27 22:03:00.624146
3106	ROI Physical Property	Registry of DICOM Data Elements	12294	12294	178	178	ROIPhysicalProperty	CS	1		2014-10-27 22:03:00.62772
3107	ROI Physical Property Value	Registry of DICOM Data Elements	12294	12294	180	180	ROIPhysicalPropertyValue	DS	1		2014-10-27 22:03:00.631205
3108	ROI Elemental Composition Sequence	Registry of DICOM Data Elements	12294	12294	182	182	ROIElementalCompositionSequence	SQ	1		2014-10-27 22:03:00.63465
3109	ROI Elemental Composition Atomic Number	Registry of DICOM Data Elements	12294	12294	183	183	ROIElementalCompositionAtomicNumber	US	1		2014-10-27 22:03:00.6381
3110	ROI Elemental Composition Atomic Mass Fraction	Registry of DICOM Data Elements	12294	12294	184	184	ROIElementalCompositionAtomicMassFraction	FL	1		2014-10-27 22:03:00.641554
3111	Additional RT ROI Identification Code Sequence	Registry of DICOM Data Elements	12294	12294	185	185	AdditionalRTROIIdentificationCodeSequence	SQ	1		2014-10-27 22:03:00.644998
3112	Frame of Reference Relationship Sequence	Registry of DICOM Data Elements	12294	12294	192	192	FrameOfReferenceRelationshipSequence	SQ	1	RET	2014-10-27 22:03:00.648524
3113	Related Frame of Reference UID	Registry of DICOM Data Elements	12294	12294	194	194	RelatedFrameOfReferenceUID	UI	1	RET	2014-10-27 22:03:00.652008
3114	Frame of Reference Transformation Type	Registry of DICOM Data Elements	12294	12294	196	196	FrameOfReferenceTransformationType	CS	1	RET	2014-10-27 22:03:00.655945
3115	Frame of Reference Transformation Matrix	Registry of DICOM Data Elements	12294	12294	198	198	FrameOfReferenceTransformationMatrix	DS	16		2014-10-27 22:03:00.659378
3116	Frame of Reference Transformation Comment	Registry of DICOM Data Elements	12294	12294	200	200	FrameOfReferenceTransformationComment	LO	1		2014-10-27 22:03:00.662793
3117	Measured Dose Reference Sequence	Registry of DICOM Data Elements	12296	12296	16	16	MeasuredDoseReferenceSequence	SQ	1		2014-10-27 22:03:00.666301
3118	Measured Dose Description	Registry of DICOM Data Elements	12296	12296	18	18	MeasuredDoseDescription	ST	1		2014-10-27 22:03:00.669759
3119	Measured Dose Type	Registry of DICOM Data Elements	12296	12296	20	20	MeasuredDoseType	CS	1		2014-10-27 22:03:00.673227
3120	Measured Dose Value	Registry of DICOM Data Elements	12296	12296	22	22	MeasuredDoseValue	DS	1		2014-10-27 22:03:00.676661
3121	Treatment Session Beam Sequence	Registry of DICOM Data Elements	12296	12296	32	32	TreatmentSessionBeamSequence	SQ	1		2014-10-27 22:03:00.680105
3122	Treatment Session Ion Beam Sequence	Registry of DICOM Data Elements	12296	12296	33	33	TreatmentSessionIonBeamSequence	SQ	1		2014-10-27 22:03:00.683522
3123	Current Fraction Number	Registry of DICOM Data Elements	12296	12296	34	34	CurrentFractionNumber	IS	1		2014-10-27 22:03:00.687111
3124	Treatment Control Point Date	Registry of DICOM Data Elements	12296	12296	36	36	TreatmentControlPointDate	DA	1		2014-10-27 22:03:00.690658
3125	Treatment Control Point Time	Registry of DICOM Data Elements	12296	12296	37	37	TreatmentControlPointTime	TM	1		2014-10-27 22:03:00.694583
3126	Treatment Termination Status	Registry of DICOM Data Elements	12296	12296	42	42	TreatmentTerminationStatus	CS	1		2014-10-27 22:03:00.698069
3127	Treatment Termination Code	Registry of DICOM Data Elements	12296	12296	43	43	TreatmentTerminationCode	SH	1		2014-10-27 22:03:00.701503
3128	Treatment Verification Status	Registry of DICOM Data Elements	12296	12296	44	44	TreatmentVerificationStatus	CS	1		2014-10-27 22:03:00.704978
3129	Referenced Treatment Record Sequence	Registry of DICOM Data Elements	12296	12296	48	48	ReferencedTreatmentRecordSequence	SQ	1		2014-10-27 22:03:00.708491
3130	Specified Primary Meterset	Registry of DICOM Data Elements	12296	12296	50	50	SpecifiedPrimaryMeterset	DS	1		2014-10-27 22:03:00.711925
3131	Specified Secondary Meterset	Registry of DICOM Data Elements	12296	12296	51	51	SpecifiedSecondaryMeterset	DS	1		2014-10-27 22:03:00.715348
3132	Delivered Primary Meterset	Registry of DICOM Data Elements	12296	12296	54	54	DeliveredPrimaryMeterset	DS	1		2014-10-27 22:03:00.718803
3133	Delivered Secondary Meterset	Registry of DICOM Data Elements	12296	12296	55	55	DeliveredSecondaryMeterset	DS	1		2014-10-27 22:03:00.722269
3134	Specified Treatment Time	Registry of DICOM Data Elements	12296	12296	58	58	SpecifiedTreatmentTime	DS	1		2014-10-27 22:03:00.725777
3135	Delivered Treatment Time	Registry of DICOM Data Elements	12296	12296	59	59	DeliveredTreatmentTime	DS	1		2014-10-27 22:03:00.730379
3136	Control Point Delivery Sequence	Registry of DICOM Data Elements	12296	12296	64	64	ControlPointDeliverySequence	SQ	1		2014-10-27 22:03:00.733854
3137	Ion Control Point Delivery Sequence	Registry of DICOM Data Elements	12296	12296	65	65	IonControlPointDeliverySequence	SQ	1		2014-10-27 22:03:00.737304
3138	Specified Meterset	Registry of DICOM Data Elements	12296	12296	66	66	SpecifiedMeterset	DS	1		2014-10-27 22:03:00.740751
3139	Delivered Meterset	Registry of DICOM Data Elements	12296	12296	68	68	DeliveredMeterset	DS	1		2014-10-27 22:03:00.744199
3140	Meterset Rate Set	Registry of DICOM Data Elements	12296	12296	69	69	MetersetRateSet	FL	1		2014-10-27 22:03:00.747707
3141	Meterset Rate Delivered	Registry of DICOM Data Elements	12296	12296	70	70	MetersetRateDelivered	FL	1		2014-10-27 22:03:00.751158
3142	Scan Spot Metersets Delivered	Registry of DICOM Data Elements	12296	12296	71	71	ScanSpotMetersetsDelivered	FL	1-n		2014-10-27 22:03:00.75457
3143	Dose Rate Delivered	Registry of DICOM Data Elements	12296	12296	72	72	DoseRateDelivered	DS	1		2014-10-27 22:03:00.758056
3144	Treatment Summary Calculated Dose Reference Sequence	Registry of DICOM Data Elements	12296	12296	80	80	TreatmentSummaryCalculatedDoseReferenceSequence	SQ	1		2014-10-27 22:03:00.761549
3145	Cumulative Dose to Dose Reference	Registry of DICOM Data Elements	12296	12296	82	82	CumulativeDoseToDoseReference	DS	1		2014-10-27 22:03:00.764987
3146	First Treatment Date	Registry of DICOM Data Elements	12296	12296	84	84	FirstTreatmentDate	DA	1		2014-10-27 22:03:00.800939
3147	Most Recent Treatment Date	Registry of DICOM Data Elements	12296	12296	86	86	MostRecentTreatmentDate	DA	1		2014-10-27 22:03:00.805327
3148	Number of Fractions Delivered	Registry of DICOM Data Elements	12296	12296	90	90	NumberOfFractionsDelivered	IS	1		2014-10-27 22:03:00.808837
3149	Override Sequence	Registry of DICOM Data Elements	12296	12296	96	96	OverrideSequence	SQ	1		2014-10-27 22:03:00.812306
3150	Parameter Sequence Pointer	Registry of DICOM Data Elements	12296	12296	97	97	ParameterSequencePointer	AT	1		2014-10-27 22:03:00.815784
3151	Override Parameter Pointer	Registry of DICOM Data Elements	12296	12296	98	98	OverrideParameterPointer	AT	1		2014-10-27 22:03:00.819393
3152	Parameter Item Index	Registry of DICOM Data Elements	12296	12296	99	99	ParameterItemIndex	IS	1		2014-10-27 22:03:00.822824
3153	Measured Dose Reference Number	Registry of DICOM Data Elements	12296	12296	100	100	MeasuredDoseReferenceNumber	IS	1		2014-10-27 22:03:00.826296
3154	Parameter Pointer	Registry of DICOM Data Elements	12296	12296	101	101	ParameterPointer	AT	1		2014-10-27 22:03:00.82973
3155	Override Reason	Registry of DICOM Data Elements	12296	12296	102	102	OverrideReason	ST	1		2014-10-27 22:03:00.833334
3156	Corrected Parameter Sequence	Registry of DICOM Data Elements	12296	12296	104	104	CorrectedParameterSequence	SQ	1		2014-10-27 22:03:00.836852
3157	Correction Value	Registry of DICOM Data Elements	12296	12296	106	106	CorrectionValue	FL	1		2014-10-27 22:03:00.840348
3158	Calculated Dose Reference Sequence	Registry of DICOM Data Elements	12296	12296	112	112	CalculatedDoseReferenceSequence	SQ	1		2014-10-27 22:03:00.84379
3159	Calculated Dose Reference Number	Registry of DICOM Data Elements	12296	12296	114	114	CalculatedDoseReferenceNumber	IS	1		2014-10-27 22:03:00.84757
3160	Calculated Dose Reference Description	Registry of DICOM Data Elements	12296	12296	116	116	CalculatedDoseReferenceDescription	ST	1		2014-10-27 22:03:00.850996
3161	Calculated Dose Reference Dose Value	Registry of DICOM Data Elements	12296	12296	118	118	CalculatedDoseReferenceDoseValue	DS	1		2014-10-27 22:03:00.854418
3162	Start Meterset	Registry of DICOM Data Elements	12296	12296	120	120	StartMeterset	DS	1		2014-10-27 22:03:00.857891
3163	End Meterset	Registry of DICOM Data Elements	12296	12296	122	122	EndMeterset	DS	1		2014-10-27 22:03:00.861312
3164	Referenced Measured Dose Reference Sequence	Registry of DICOM Data Elements	12296	12296	128	128	ReferencedMeasuredDoseReferenceSequence	SQ	1		2014-10-27 22:03:00.864762
3165	Referenced Measured Dose Reference Number	Registry of DICOM Data Elements	12296	12296	130	130	ReferencedMeasuredDoseReferenceNumber	IS	1		2014-10-27 22:03:00.868187
3166	Referenced Calculated Dose Reference Sequence	Registry of DICOM Data Elements	12296	12296	144	144	ReferencedCalculatedDoseReferenceSequence	SQ	1		2014-10-27 22:03:00.871633
3167	Referenced Calculated Dose Reference Number	Registry of DICOM Data Elements	12296	12296	146	146	ReferencedCalculatedDoseReferenceNumber	IS	1		2014-10-27 22:03:00.875046
3168	Beam Limiting Device Leaf Pairs Sequence	Registry of DICOM Data Elements	12296	12296	160	160	BeamLimitingDeviceLeafPairsSequence	SQ	1		2014-10-27 22:03:00.878813
3169	Recorded Wedge Sequence	Registry of DICOM Data Elements	12296	12296	176	176	RecordedWedgeSequence	SQ	1		2014-10-27 22:03:00.882277
3170	Recorded Compensator Sequence	Registry of DICOM Data Elements	12296	12296	192	192	RecordedCompensatorSequence	SQ	1		2014-10-27 22:03:00.885692
3171	Recorded Block Sequence	Registry of DICOM Data Elements	12296	12296	208	208	RecordedBlockSequence	SQ	1		2014-10-27 22:03:00.889225
3172	Treatment Summary Measured Dose Reference Sequence	Registry of DICOM Data Elements	12296	12296	224	224	TreatmentSummaryMeasuredDoseReferenceSequence	SQ	1		2014-10-27 22:03:00.892685
3173	Recorded Snout Sequence	Registry of DICOM Data Elements	12296	12296	240	240	RecordedSnoutSequence	SQ	1		2014-10-27 22:03:00.896166
3174	Recorded Range Shifter Sequence	Registry of DICOM Data Elements	12296	12296	242	242	RecordedRangeShifterSequence	SQ	1		2014-10-27 22:03:00.899602
3175	Recorded Lateral Spreading Device Sequence	Registry of DICOM Data Elements	12296	12296	244	244	RecordedLateralSpreadingDeviceSequence	SQ	1		2014-10-27 22:03:00.903032
3176	Recorded Range Modulator Sequence	Registry of DICOM Data Elements	12296	12296	246	246	RecordedRangeModulatorSequence	SQ	1		2014-10-27 22:03:00.906464
3177	Recorded Source Sequence	Registry of DICOM Data Elements	12296	12296	256	256	RecordedSourceSequence	SQ	1		2014-10-27 22:03:00.909934
3178	Source Serial Number	Registry of DICOM Data Elements	12296	12296	261	261	SourceSerialNumber	LO	1		2014-10-27 22:03:00.913799
3179	Treatment Session Application Setup Sequence	Registry of DICOM Data Elements	12296	12296	272	272	TreatmentSessionApplicationSetupSequence	SQ	1		2014-10-27 22:03:00.917243
3180	Application Setup Check	Registry of DICOM Data Elements	12296	12296	278	278	ApplicationSetupCheck	CS	1		2014-10-27 22:03:00.920718
3181	Recorded Brachy Accessory Device Sequence	Registry of DICOM Data Elements	12296	12296	288	288	RecordedBrachyAccessoryDeviceSequence	SQ	1		2014-10-27 22:03:00.924179
3182	Referenced Brachy Accessory Device Number	Registry of DICOM Data Elements	12296	12296	290	290	ReferencedBrachyAccessoryDeviceNumber	IS	1		2014-10-27 22:03:00.927629
3183	Recorded Channel Sequence	Registry of DICOM Data Elements	12296	12296	304	304	RecordedChannelSequence	SQ	1		2014-10-27 22:03:00.931071
3184	Specified Channel Total Time	Registry of DICOM Data Elements	12296	12296	306	306	SpecifiedChannelTotalTime	DS	1		2014-10-27 22:03:00.934532
3185	Delivered Channel Total Time	Registry of DICOM Data Elements	12296	12296	308	308	DeliveredChannelTotalTime	DS	1		2014-10-27 22:03:00.937998
3186	Specified Number of Pulses	Registry of DICOM Data Elements	12296	12296	310	310	SpecifiedNumberOfPulses	IS	1		2014-10-27 22:03:00.941464
3187	Delivered Number of Pulses	Registry of DICOM Data Elements	12296	12296	312	312	DeliveredNumberOfPulses	IS	1		2014-10-27 22:03:00.944937
3188	Specified Pulse Repetition Interval	Registry of DICOM Data Elements	12296	12296	314	314	SpecifiedPulseRepetitionInterval	DS	1		2014-10-27 22:03:00.948793
3189	Delivered Pulse Repetition Interval	Registry of DICOM Data Elements	12296	12296	316	316	DeliveredPulseRepetitionInterval	DS	1		2014-10-27 22:03:00.952221
3190	Recorded Source Applicator Sequence	Registry of DICOM Data Elements	12296	12296	320	320	RecordedSourceApplicatorSequence	SQ	1		2014-10-27 22:03:00.955677
3191	Referenced Source Applicator Number	Registry of DICOM Data Elements	12296	12296	322	322	ReferencedSourceApplicatorNumber	IS	1		2014-10-27 22:03:00.959138
3192	Recorded Channel Shield Sequence	Registry of DICOM Data Elements	12296	12296	336	336	RecordedChannelShieldSequence	SQ	1		2014-10-27 22:03:00.962584
3193	Referenced Channel Shield Number	Registry of DICOM Data Elements	12296	12296	338	338	ReferencedChannelShieldNumber	IS	1		2014-10-27 22:03:00.966057
3305	Wedge Angle	Registry of DICOM Data Elements	12298	12298	213	213	WedgeAngle	IS	1		2014-10-27 22:03:04.220706
3194	Brachy Control Point Delivered Sequence	Registry of DICOM Data Elements	12296	12296	352	352	BrachyControlPointDeliveredSequence	SQ	1		2014-10-27 22:03:00.969521
3195	Safe Position Exit Date	Registry of DICOM Data Elements	12296	12296	354	354	SafePositionExitDate	DA	1		2014-10-27 22:03:00.973083
3196	Safe Position Exit Time	Registry of DICOM Data Elements	12296	12296	356	356	SafePositionExitTime	TM	1		2014-10-27 22:03:00.97655
3197	Safe Position Return Date	Registry of DICOM Data Elements	12296	12296	358	358	SafePositionReturnDate	DA	1		2014-10-27 22:03:00.980004
3198	Safe Position Return Time	Registry of DICOM Data Elements	12296	12296	360	360	SafePositionReturnTime	TM	1		2014-10-27 22:03:00.983867
3199	Pulse Specific Brachy Control Point Delivered Sequence	Registry of DICOM Data Elements	12296	12296	369	369	PulseSpecificBrachyControlPointDeliveredSequence	SQ	1		2014-10-27 22:03:00.987296
3200	Pulse Number	Registry of DICOM Data Elements	12296	12296	370	370	PulseNumber	US	1		2014-10-27 22:03:00.990747
3201	Brachy Pulse Control Point Delivered Sequence	Registry of DICOM Data Elements	12296	12296	371	371	BrachyPulseControlPointDeliveredSequence	SQ	1		2014-10-27 22:03:00.994207
3202	Current Treatment Status	Registry of DICOM Data Elements	12296	12296	512	512	CurrentTreatmentStatus	CS	1		2014-10-27 22:03:00.997742
3203	Treatment Status Comment	Registry of DICOM Data Elements	12296	12296	514	514	TreatmentStatusComment	ST	1		2014-10-27 22:03:01.001273
3204	Fraction Group Summary Sequence	Registry of DICOM Data Elements	12296	12296	544	544	FractionGroupSummarySequence	SQ	1		2014-10-27 22:03:01.004704
3205	Referenced Fraction Number	Registry of DICOM Data Elements	12296	12296	547	547	ReferencedFractionNumber	IS	1		2014-10-27 22:03:01.00818
3206	Fraction Group Type	Registry of DICOM Data Elements	12296	12296	548	548	FractionGroupType	CS	1		2014-10-27 22:03:01.011633
3207	Beam Stopper Position	Registry of DICOM Data Elements	12296	12296	560	560	BeamStopperPosition	CS	1		2014-10-27 22:03:01.015108
3208	Fraction Status Summary Sequence	Registry of DICOM Data Elements	12296	12296	576	576	FractionStatusSummarySequence	SQ	1		2014-10-27 22:03:01.018924
3209	Treatment Date	Registry of DICOM Data Elements	12296	12296	592	592	TreatmentDate	DA	1		2014-10-27 22:03:01.022393
3210	Treatment Time	Registry of DICOM Data Elements	12296	12296	593	593	TreatmentTime	TM	1		2014-10-27 22:03:01.025868
3211	RT Plan Label	Registry of DICOM Data Elements	12298	12298	2	2	RTPlanLabel	SH	1		2014-10-27 22:03:01.029292
3212	RT Plan Name	Registry of DICOM Data Elements	12298	12298	3	3	RTPlanName	LO	1		2014-10-27 22:03:01.032865
3213	RT Plan Description	Registry of DICOM Data Elements	12298	12298	4	4	RTPlanDescription	ST	1		2014-10-27 22:03:01.036445
3214	RT Plan Date	Registry of DICOM Data Elements	12298	12298	6	6	RTPlanDate	DA	1		2014-10-27 22:03:01.039931
3215	RT Plan Time	Registry of DICOM Data Elements	12298	12298	7	7	RTPlanTime	TM	1		2014-10-27 22:03:01.043356
3216	Treatment Protocols	Registry of DICOM Data Elements	12298	12298	9	9	TreatmentProtocols	LO	1-n		2014-10-27 22:03:01.046838
3217	Plan Intent	Registry of DICOM Data Elements	12298	12298	10	10	PlanIntent	CS	1		2014-10-27 22:03:01.0503
3218	Treatment Sites	Registry of DICOM Data Elements	12298	12298	11	11	TreatmentSites	LO	1-n		2014-10-27 22:03:01.054479
3219	RT Plan Geometry	Registry of DICOM Data Elements	12298	12298	12	12	RTPlanGeometry	CS	1		2014-10-27 22:03:01.057938
3220	Prescription Description	Registry of DICOM Data Elements	12298	12298	14	14	PrescriptionDescription	ST	1		2014-10-27 22:03:01.061388
3221	Dose Reference Sequence	Registry of DICOM Data Elements	12298	12298	16	16	DoseReferenceSequence	SQ	1		2014-10-27 22:03:01.064854
3222	Dose Reference Number	Registry of DICOM Data Elements	12298	12298	18	18	DoseReferenceNumber	IS	1		2014-10-27 22:03:01.10483
3223	Dose Reference UID	Registry of DICOM Data Elements	12298	12298	19	19	DoseReferenceUID	UI	1		2014-10-27 22:03:01.108295
3224	Dose Reference Structure Type	Registry of DICOM Data Elements	12298	12298	20	20	DoseReferenceStructureType	CS	1		2014-10-27 22:03:01.111763
3225	Nominal Beam Energy Unit	Registry of DICOM Data Elements	12298	12298	21	21	NominalBeamEnergyUnit	CS	1		2014-10-27 22:03:01.223408
3226	Dose Reference Description	Registry of DICOM Data Elements	12298	12298	22	22	DoseReferenceDescription	LO	1		2014-10-27 22:03:01.226902
3227	Dose Reference Point Coordinates	Registry of DICOM Data Elements	12298	12298	24	24	DoseReferencePointCoordinates	DS	3		2014-10-27 22:03:01.230404
3228	Nominal Prior Dose	Registry of DICOM Data Elements	12298	12298	26	26	NominalPriorDose	DS	1		2014-10-27 22:03:01.234332
3229	Dose Reference Type	Registry of DICOM Data Elements	12298	12298	32	32	DoseReferenceType	CS	1		2014-10-27 22:03:01.346674
3230	Constraint Weight	Registry of DICOM Data Elements	12298	12298	33	33	ConstraintWeight	DS	1		2014-10-27 22:03:01.350174
3231	Delivery Warning Dose	Registry of DICOM Data Elements	12298	12298	34	34	DeliveryWarningDose	DS	1		2014-10-27 22:03:01.353618
3232	Delivery Maximum Dose	Registry of DICOM Data Elements	12298	12298	35	35	DeliveryMaximumDose	DS	1		2014-10-27 22:03:01.465274
3233	Target Minimum Dose	Registry of DICOM Data Elements	12298	12298	37	37	TargetMinimumDose	DS	1		2014-10-27 22:03:01.468729
3234	Target Prescription Dose	Registry of DICOM Data Elements	12298	12298	38	38	TargetPrescriptionDose	DS	1		2014-10-27 22:03:01.47218
3235	Target Maximum Dose	Registry of DICOM Data Elements	12298	12298	39	39	TargetMaximumDose	DS	1		2014-10-27 22:03:01.58382
3236	Target Underdose Volume Fraction	Registry of DICOM Data Elements	12298	12298	40	40	TargetUnderdoseVolumeFraction	DS	1		2014-10-27 22:03:01.587359
3237	Organ at Risk Full-volume Dose	Registry of DICOM Data Elements	12298	12298	42	42	OrganAtRiskFullVolumeDose	DS	1		2014-10-27 22:03:01.590956
3238	Organ at Risk Limit Dose	Registry of DICOM Data Elements	12298	12298	43	43	OrganAtRiskLimitDose	DS	1		2014-10-27 22:03:01.704421
3239	Organ at Risk Maximum Dose	Registry of DICOM Data Elements	12298	12298	44	44	OrganAtRiskMaximumDose	DS	1		2014-10-27 22:03:01.708013
3240	Organ at Risk Overdose Volume Fraction	Registry of DICOM Data Elements	12298	12298	45	45	OrganAtRiskOverdoseVolumeFraction	DS	1		2014-10-27 22:03:01.711512
3241	Tolerance Table Sequence	Registry of DICOM Data Elements	12298	12298	64	64	ToleranceTableSequence	SQ	1		2014-10-27 22:03:01.823149
3242	Tolerance Table Number	Registry of DICOM Data Elements	12298	12298	66	66	ToleranceTableNumber	IS	1		2014-10-27 22:03:01.826621
3243	Tolerance Table Label	Registry of DICOM Data Elements	12298	12298	67	67	ToleranceTableLabel	SH	1		2014-10-27 22:03:01.830046
3244	Gantry Angle Tolerance	Registry of DICOM Data Elements	12298	12298	68	68	GantryAngleTolerance	DS	1		2014-10-27 22:03:01.833486
3245	Beam Limiting Device Angle Tolerance	Registry of DICOM Data Elements	12298	12298	70	70	BeamLimitingDeviceAngleTolerance	DS	1		2014-10-27 22:03:01.945227
3246	Beam Limiting Device Tolerance Sequence	Registry of DICOM Data Elements	12298	12298	72	72	BeamLimitingDeviceToleranceSequence	SQ	1		2014-10-27 22:03:01.948716
3247	Beam Limiting Device Position Tolerance	Registry of DICOM Data Elements	12298	12298	74	74	BeamLimitingDevicePositionTolerance	DS	1		2014-10-27 22:03:01.952249
3248	Snout Position Tolerance	Registry of DICOM Data Elements	12298	12298	75	75	SnoutPositionTolerance	FL	1		2014-10-27 22:03:02.064706
3249	Patient Support Angle Tolerance	Registry of DICOM Data Elements	12298	12298	76	76	PatientSupportAngleTolerance	DS	1		2014-10-27 22:03:02.068462
3250	Table Top Eccentric Angle Tolerance	Registry of DICOM Data Elements	12298	12298	78	78	TableTopEccentricAngleTolerance	DS	1		2014-10-27 22:03:02.07191
3251	Table Top Pitch Angle Tolerance	Registry of DICOM Data Elements	12298	12298	79	79	TableTopPitchAngleTolerance	FL	1		2014-10-27 22:03:02.183893
3252	Table Top Roll Angle Tolerance	Registry of DICOM Data Elements	12298	12298	80	80	TableTopRollAngleTolerance	FL	1		2014-10-27 22:03:02.187447
3253	Table Top Vertical Position Tolerance	Registry of DICOM Data Elements	12298	12298	81	81	TableTopVerticalPositionTolerance	DS	1		2014-10-27 22:03:02.190883
3254	Table Top Longitudinal Position Tolerance	Registry of DICOM Data Elements	12298	12298	82	82	TableTopLongitudinalPositionTolerance	DS	1		2014-10-27 22:03:02.194346
3255	Table Top Lateral Position Tolerance	Registry of DICOM Data Elements	12298	12298	83	83	TableTopLateralPositionTolerance	DS	1		2014-10-27 22:03:02.306015
3256	RT Plan Relationship	Registry of DICOM Data Elements	12298	12298	85	85	RTPlanRelationship	CS	1		2014-10-27 22:03:02.309505
3257	Fraction Group Sequence	Registry of DICOM Data Elements	12298	12298	112	112	FractionGroupSequence	SQ	1		2014-10-27 22:03:02.31305
3258	Fraction Group Number	Registry of DICOM Data Elements	12298	12298	113	113	FractionGroupNumber	IS	1		2014-10-27 22:03:02.42645
3259	Fraction Group Description	Registry of DICOM Data Elements	12298	12298	114	114	FractionGroupDescription	LO	1		2014-10-27 22:03:02.430104
3260	Number of Fractions Planned	Registry of DICOM Data Elements	12298	12298	120	120	NumberOfFractionsPlanned	IS	1		2014-10-27 22:03:02.433562
3261	Number of Fraction Pattern Digits Per Day	Registry of DICOM Data Elements	12298	12298	121	121	NumberOfFractionPatternDigitsPerDay	IS	1		2014-10-27 22:03:02.546046
3262	Repeat Fraction Cycle Length	Registry of DICOM Data Elements	12298	12298	122	122	RepeatFractionCycleLength	IS	1		2014-10-27 22:03:02.549897
3263	Fraction Pattern	Registry of DICOM Data Elements	12298	12298	123	123	FractionPattern	LT	1		2014-10-27 22:03:02.553381
3264	Number of Beams	Registry of DICOM Data Elements	12298	12298	128	128	NumberOfBeams	IS	1		2014-10-27 22:03:02.665354
3265	Beam Dose Specification Point	Registry of DICOM Data Elements	12298	12298	130	130	BeamDoseSpecificationPoint	DS	3		2014-10-27 22:03:02.669081
3266	Beam Dose	Registry of DICOM Data Elements	12298	12298	132	132	BeamDose	DS	1		2014-10-27 22:03:02.672602
3267	Beam Meterset	Registry of DICOM Data Elements	12298	12298	134	134	BeamMeterset	DS	1		2014-10-27 22:03:02.784502
3268	Beam Dose Point Depth	Registry of DICOM Data Elements	12298	12298	136	136	BeamDosePointDepth	FL	1	RET	2014-10-27 22:03:02.788474
3269	Beam Dose Point Equivalent Depth	Registry of DICOM Data Elements	12298	12298	137	137	BeamDosePointEquivalentDepth	FL	1	RET	2014-10-27 22:03:02.79256
3270	Beam Dose Point SSD	Registry of DICOM Data Elements	12298	12298	138	138	BeamDosePointSSD	FL	1	RET	2014-10-27 22:03:02.904283
3271	Beam Dose Meaning	Registry of DICOM Data Elements	12298	12298	139	139	BeamDoseMeaning	CS	1		2014-10-27 22:03:02.908002
3272	Beam Dose Verification Control Point Sequence	Registry of DICOM Data Elements	12298	12298	140	140	BeamDoseVerificationControlPointSequence	SQ	1		2014-10-27 22:03:02.911546
3273	Average Beam Dose Point Depth	Registry of DICOM Data Elements	12298	12298	141	141	AverageBeamDosePointDepth	FL	1		2014-10-27 22:03:02.915015
3274	Average Beam Dose Point Equivalent Depth	Registry of DICOM Data Elements	12298	12298	142	142	AverageBeamDosePointEquivalentDepth	FL	1		2014-10-27 22:03:03.028001
3275	Average Beam Dose Point SSD	Registry of DICOM Data Elements	12298	12298	143	143	AverageBeamDosePointSSD	FL	1		2014-10-27 22:03:03.031609
3276	Number of Brachy Application Setups	Registry of DICOM Data Elements	12298	12298	160	160	NumberOfBrachyApplicationSetups	IS	1		2014-10-27 22:03:03.035046
3277	Brachy Application Setup Dose Specification Point	Registry of DICOM Data Elements	12298	12298	162	162	BrachyApplicationSetupDoseSpecificationPoint	DS	3		2014-10-27 22:03:03.147982
3278	Brachy Application Setup Dose	Registry of DICOM Data Elements	12298	12298	164	164	BrachyApplicationSetupDose	DS	1		2014-10-27 22:03:03.151611
3279	Beam Sequence	Registry of DICOM Data Elements	12298	12298	176	176	BeamSequence	SQ	1		2014-10-27 22:03:03.15505
3280	Treatment Machine Name	Registry of DICOM Data Elements	12298	12298	178	178	TreatmentMachineName	SH	1		2014-10-27 22:03:03.268607
3281	Primary Dosimeter Unit	Registry of DICOM Data Elements	12298	12298	179	179	PrimaryDosimeterUnit	CS	1		2014-10-27 22:03:03.27219
3282	Source-Axis Distance	Registry of DICOM Data Elements	12298	12298	180	180	SourceAxisDistance	DS	1		2014-10-27 22:03:03.384053
3283	Beam Limiting Device Sequence	Registry of DICOM Data Elements	12298	12298	182	182	BeamLimitingDeviceSequence	SQ	1		2014-10-27 22:03:03.388497
3284	RT Beam Limiting Device Type	Registry of DICOM Data Elements	12298	12298	184	184	RTBeamLimitingDeviceType	CS	1		2014-10-27 22:03:03.392
3285	Source to Beam Limiting Device Distance	Registry of DICOM Data Elements	12298	12298	186	186	SourceToBeamLimitingDeviceDistance	DS	1		2014-10-27 22:03:03.491819
3286	Isocenter to Beam Limiting Device Distance	Registry of DICOM Data Elements	12298	12298	187	187	IsocenterToBeamLimitingDeviceDistance	FL	1		2014-10-27 22:03:03.496188
3287	Number of Leaf/Jaw Pairs	Registry of DICOM Data Elements	12298	12298	188	188	NumberOfLeafJawPairs	IS	1		2014-10-27 22:03:03.499677
3288	Leaf Position Boundaries	Registry of DICOM Data Elements	12298	12298	190	190	LeafPositionBoundaries	DS	3-n		2014-10-27 22:03:03.503179
3289	Beam Number	Registry of DICOM Data Elements	12298	12298	192	192	BeamNumber	IS	1		2014-10-27 22:03:03.615734
3290	Beam Name	Registry of DICOM Data Elements	12298	12298	194	194	BeamName	LO	1		2014-10-27 22:03:03.619288
3291	Beam Description	Registry of DICOM Data Elements	12298	12298	195	195	BeamDescription	ST	1		2014-10-27 22:03:03.623373
3292	Beam Type	Registry of DICOM Data Elements	12298	12298	196	196	BeamType	CS	1		2014-10-27 22:03:03.736567
3293	Beam Delivery Duration Limit	Registry of DICOM Data Elements	12298	12298	197	197	BeamDeliveryDurationLimit	FD	1		2014-10-27 22:03:03.740096
3294	Radiation Type	Registry of DICOM Data Elements	12298	12298	198	198	RadiationType	CS	1		2014-10-27 22:03:03.851926
3295	High-Dose Technique Type	Registry of DICOM Data Elements	12298	12298	199	199	HighDoseTechniqueType	CS	1		2014-10-27 22:03:03.856611
3296	Reference Image Number	Registry of DICOM Data Elements	12298	12298	200	200	ReferenceImageNumber	IS	1		2014-10-27 22:03:03.860099
3297	Planned Verification Image Sequence	Registry of DICOM Data Elements	12298	12298	202	202	PlannedVerificationImageSequence	SQ	1		2014-10-27 22:03:03.972086
3298	Imaging Device-Specific Acquisition Parameters	Registry of DICOM Data Elements	12298	12298	204	204	ImagingDeviceSpecificAcquisitionParameters	LO	1-n		2014-10-27 22:03:03.976713
3299	Treatment Delivery Type	Registry of DICOM Data Elements	12298	12298	206	206	TreatmentDeliveryType	CS	1		2014-10-27 22:03:03.980192
3300	Number of Wedges	Registry of DICOM Data Elements	12298	12298	208	208	NumberOfWedges	IS	1		2014-10-27 22:03:04.092055
3301	Wedge Sequence	Registry of DICOM Data Elements	12298	12298	209	209	WedgeSequence	SQ	1		2014-10-27 22:03:04.096701
3302	Wedge Number	Registry of DICOM Data Elements	12298	12298	210	210	WedgeNumber	IS	1		2014-10-27 22:03:04.100872
3303	Wedge Type	Registry of DICOM Data Elements	12298	12298	211	211	WedgeType	CS	1		2014-10-27 22:03:04.212964
3304	Wedge ID	Registry of DICOM Data Elements	12298	12298	212	212	WedgeID	SH	1		2014-10-27 22:03:04.217232
3306	Wedge Factor	Registry of DICOM Data Elements	12298	12298	214	214	WedgeFactor	DS	1		2014-10-27 22:03:04.332986
3307	Total Wedge Tray Water-Equivalent Thickness	Registry of DICOM Data Elements	12298	12298	215	215	TotalWedgeTrayWaterEquivalentThickness	FL	1		2014-10-27 22:03:04.337231
3308	Wedge Orientation	Registry of DICOM Data Elements	12298	12298	216	216	WedgeOrientation	DS	1		2014-10-27 22:03:04.340736
3309	Isocenter to Wedge Tray Distance	Registry of DICOM Data Elements	12298	12298	217	217	IsocenterToWedgeTrayDistance	FL	1		2014-10-27 22:03:04.452599
3310	Source to Wedge Tray Distance	Registry of DICOM Data Elements	12298	12298	218	218	SourceToWedgeTrayDistance	DS	1		2014-10-27 22:03:04.456476
3311	Wedge Thin Edge Position	Registry of DICOM Data Elements	12298	12298	219	219	WedgeThinEdgePosition	FL	1		2014-10-27 22:03:04.460028
3312	Bolus ID	Registry of DICOM Data Elements	12298	12298	220	220	BolusID	SH	1		2014-10-27 22:03:04.463585
3313	Bolus Description	Registry of DICOM Data Elements	12298	12298	221	221	BolusDescription	ST	1		2014-10-27 22:03:04.575851
3314	Number of Compensators	Registry of DICOM Data Elements	12298	12298	224	224	NumberOfCompensators	IS	1		2014-10-27 22:03:04.579286
3315	Material ID	Registry of DICOM Data Elements	12298	12298	225	225	MaterialID	SH	1		2014-10-27 22:03:04.582707
3316	Total Compensator Tray Factor	Registry of DICOM Data Elements	12298	12298	226	226	TotalCompensatorTrayFactor	DS	1		2014-10-27 22:03:04.694303
3317	Compensator Sequence	Registry of DICOM Data Elements	12298	12298	227	227	CompensatorSequence	SQ	1		2014-10-27 22:03:04.697733
3318	Compensator Number	Registry of DICOM Data Elements	12298	12298	228	228	CompensatorNumber	IS	1		2014-10-27 22:03:04.701191
3319	Compensator ID	Registry of DICOM Data Elements	12298	12298	229	229	CompensatorID	SH	1		2014-10-27 22:03:04.813002
3320	Source to Compensator Tray Distance	Registry of DICOM Data Elements	12298	12298	230	230	SourceToCompensatorTrayDistance	DS	1		2014-10-27 22:03:04.816867
3321	Compensator Rows	Registry of DICOM Data Elements	12298	12298	231	231	CompensatorRows	IS	1		2014-10-27 22:03:04.820362
3322	Compensator Columns	Registry of DICOM Data Elements	12298	12298	232	232	CompensatorColumns	IS	1		2014-10-27 22:03:04.932344
3323	Compensator Pixel Spacing	Registry of DICOM Data Elements	12298	12298	233	233	CompensatorPixelSpacing	DS	2		2014-10-27 22:03:04.936643
3324	Compensator Position	Registry of DICOM Data Elements	12298	12298	234	234	CompensatorPosition	DS	2		2014-10-27 22:03:04.940796
3325	Compensator Transmission Data	Registry of DICOM Data Elements	12298	12298	235	235	CompensatorTransmissionData	DS	1-n		2014-10-27 22:03:05.052821
3326	Compensator Thickness Data	Registry of DICOM Data Elements	12298	12298	236	236	CompensatorThicknessData	DS	1-n		2014-10-27 22:03:05.057083
3327	Number of Boli	Registry of DICOM Data Elements	12298	12298	237	237	NumberOfBoli	IS	1		2014-10-27 22:03:05.060577
3328	Compensator Type	Registry of DICOM Data Elements	12298	12298	238	238	CompensatorType	CS	1		2014-10-27 22:03:05.172361
3329	Compensator Tray ID	Registry of DICOM Data Elements	12298	12298	239	239	CompensatorTrayID	SH	1		2014-10-27 22:03:05.176372
3330	Number of Blocks	Registry of DICOM Data Elements	12298	12298	240	240	NumberOfBlocks	IS	1		2014-10-27 22:03:05.179836
3331	Total Block Tray Factor	Registry of DICOM Data Elements	12298	12298	242	242	TotalBlockTrayFactor	DS	1		2014-10-27 22:03:05.183307
3332	Total Block Tray Water-Equivalent Thickness	Registry of DICOM Data Elements	12298	12298	243	243	TotalBlockTrayWaterEquivalentThickness	FL	1		2014-10-27 22:03:05.29584
3333	Block Sequence	Registry of DICOM Data Elements	12298	12298	244	244	BlockSequence	SQ	1		2014-10-27 22:03:05.299547
3334	Block Tray ID	Registry of DICOM Data Elements	12298	12298	245	245	BlockTrayID	SH	1		2014-10-27 22:03:05.303085
3335	Source to Block Tray Distance	Registry of DICOM Data Elements	12298	12298	246	246	SourceToBlockTrayDistance	DS	1		2014-10-27 22:03:05.416449
3336	Isocenter to Block Tray Distance	Registry of DICOM Data Elements	12298	12298	247	247	IsocenterToBlockTrayDistance	FL	1		2014-10-27 22:03:05.420107
3337	Block Type	Registry of DICOM Data Elements	12298	12298	248	248	BlockType	CS	1		2014-10-27 22:03:05.423826
3338	Accessory Code	Registry of DICOM Data Elements	12298	12298	249	249	AccessoryCode	LO	1		2014-10-27 22:03:05.537296
3339	Block Divergence	Registry of DICOM Data Elements	12298	12298	250	250	BlockDivergence	CS	1		2014-10-27 22:03:05.541046
3340	Block Mounting Position	Registry of DICOM Data Elements	12298	12298	251	251	BlockMountingPosition	CS	1		2014-10-27 22:03:05.653376
3341	Block Number	Registry of DICOM Data Elements	12298	12298	252	252	BlockNumber	IS	1		2014-10-27 22:03:05.658995
3342	Block Name	Registry of DICOM Data Elements	12298	12298	254	254	BlockName	LO	1		2014-10-27 22:03:05.663782
3343	Block Thickness	Registry of DICOM Data Elements	12298	12298	256	256	BlockThickness	DS	1		2014-10-27 22:03:05.777299
3344	Block Transmission	Registry of DICOM Data Elements	12298	12298	258	258	BlockTransmission	DS	1		2014-10-27 22:03:05.781008
3345	Block Number of Points	Registry of DICOM Data Elements	12298	12298	260	260	BlockNumberOfPoints	IS	1		2014-10-27 22:03:05.89335
3346	Block Data	Registry of DICOM Data Elements	12298	12298	262	262	BlockData	DS	2-2n		2014-10-27 22:03:05.898198
3347	Applicator Sequence	Registry of DICOM Data Elements	12298	12298	263	263	ApplicatorSequence	SQ	1		2014-10-27 22:03:05.901703
3348	Applicator ID	Registry of DICOM Data Elements	12298	12298	264	264	ApplicatorID	SH	1		2014-10-27 22:03:06.013842
3349	Applicator Type	Registry of DICOM Data Elements	12298	12298	265	265	ApplicatorType	CS	1		2014-10-27 22:03:06.01796
3350	Applicator Description	Registry of DICOM Data Elements	12298	12298	266	266	ApplicatorDescription	LO	1		2014-10-27 22:03:06.021508
3351	Cumulative Dose Reference Coefficient	Registry of DICOM Data Elements	12298	12298	268	268	CumulativeDoseReferenceCoefficient	DS	1		2014-10-27 22:03:06.133807
3352	Final Cumulative Meterset Weight	Registry of DICOM Data Elements	12298	12298	270	270	FinalCumulativeMetersetWeight	DS	1		2014-10-27 22:03:06.138117
3353	Number of Control Points	Registry of DICOM Data Elements	12298	12298	272	272	NumberOfControlPoints	IS	1		2014-10-27 22:03:06.141632
3354	Control Point Sequence	Registry of DICOM Data Elements	12298	12298	273	273	ControlPointSequence	SQ	1		2014-10-27 22:03:06.253482
3355	Control Point Index	Registry of DICOM Data Elements	12298	12298	274	274	ControlPointIndex	IS	1		2014-10-27 22:03:06.257473
3356	Nominal Beam Energy	Registry of DICOM Data Elements	12298	12298	276	276	NominalBeamEnergy	DS	1		2014-10-27 22:03:06.261063
3357	Dose Rate Set	Registry of DICOM Data Elements	12298	12298	277	277	DoseRateSet	DS	1		2014-10-27 22:03:06.373717
3358	Wedge Position Sequence	Registry of DICOM Data Elements	12298	12298	278	278	WedgePositionSequence	SQ	1		2014-10-27 22:03:06.377658
3359	Wedge Position	Registry of DICOM Data Elements	12298	12298	280	280	WedgePosition	CS	1		2014-10-27 22:03:06.381176
3360	Beam Limiting Device Position Sequence	Registry of DICOM Data Elements	12298	12298	282	282	BeamLimitingDevicePositionSequence	SQ	1		2014-10-27 22:03:06.493218
3361	Leaf/Jaw Positions	Registry of DICOM Data Elements	12298	12298	284	284	LeafJawPositions	DS	2-2n		2014-10-27 22:03:06.497212
3362	Gantry Angle	Registry of DICOM Data Elements	12298	12298	286	286	GantryAngle	DS	1		2014-10-27 22:03:06.500764
3363	Gantry Rotation Direction	Registry of DICOM Data Elements	12298	12298	287	287	GantryRotationDirection	CS	1		2014-10-27 22:03:06.504309
3364	Beam Limiting Device Angle	Registry of DICOM Data Elements	12298	12298	288	288	BeamLimitingDeviceAngle	DS	1		2014-10-27 22:03:06.616135
3365	Beam Limiting Device Rotation Direction	Registry of DICOM Data Elements	12298	12298	289	289	BeamLimitingDeviceRotationDirection	CS	1		2014-10-27 22:03:06.619777
3366	Patient Support Angle	Registry of DICOM Data Elements	12298	12298	290	290	PatientSupportAngle	DS	1		2014-10-27 22:03:06.623331
3367	Patient Support Rotation Direction	Registry of DICOM Data Elements	12298	12298	291	291	PatientSupportRotationDirection	CS	1		2014-10-27 22:03:06.735165
3368	Table Top Eccentric Axis Distance	Registry of DICOM Data Elements	12298	12298	292	292	TableTopEccentricAxisDistance	DS	1		2014-10-27 22:03:06.739232
3369	Table Top Eccentric Angle	Registry of DICOM Data Elements	12298	12298	293	293	TableTopEccentricAngle	DS	1		2014-10-27 22:03:06.742706
3370	Table Top Eccentric Rotation Direction	Registry of DICOM Data Elements	12298	12298	294	294	TableTopEccentricRotationDirection	CS	1		2014-10-27 22:03:06.85447
3371	Table Top Vertical Position	Registry of DICOM Data Elements	12298	12298	296	296	TableTopVerticalPosition	DS	1		2014-10-27 22:03:06.858038
3372	Table Top Longitudinal Position	Registry of DICOM Data Elements	12298	12298	297	297	TableTopLongitudinalPosition	DS	1		2014-10-27 22:03:06.861574
3373	Table Top Lateral Position	Registry of DICOM Data Elements	12298	12298	298	298	TableTopLateralPosition	DS	1		2014-10-27 22:03:06.97346
3374	Isocenter Position	Registry of DICOM Data Elements	12298	12298	300	300	IsocenterPosition	DS	3		2014-10-27 22:03:06.977413
3375	Surface Entry Point	Registry of DICOM Data Elements	12298	12298	302	302	SurfaceEntryPoint	DS	3		2014-10-27 22:03:06.980933
3376	Source to Surface Distance	Registry of DICOM Data Elements	12298	12298	304	304	SourceToSurfaceDistance	DS	1		2014-10-27 22:03:07.092788
3377	Cumulative Meterset Weight	Registry of DICOM Data Elements	12298	12298	308	308	CumulativeMetersetWeight	DS	1		2014-10-27 22:03:07.097546
3378	Table Top Pitch Angle	Registry of DICOM Data Elements	12298	12298	320	320	TableTopPitchAngle	FL	1		2014-10-27 22:03:07.101245
3379	Table Top Pitch Rotation Direction	Registry of DICOM Data Elements	12298	12298	322	322	TableTopPitchRotationDirection	CS	1		2014-10-27 22:03:07.214432
3380	Table Top Roll Angle	Registry of DICOM Data Elements	12298	12298	324	324	TableTopRollAngle	FL	1		2014-10-27 22:03:07.218598
3381	Table Top Roll Rotation Direction	Registry of DICOM Data Elements	12298	12298	326	326	TableTopRollRotationDirection	CS	1		2014-10-27 22:03:07.222261
3382	Head Fixation Angle	Registry of DICOM Data Elements	12298	12298	328	328	HeadFixationAngle	FL	1		2014-10-27 22:03:07.33521
3383	Gantry Pitch Angle	Registry of DICOM Data Elements	12298	12298	330	330	GantryPitchAngle	FL	1		2014-10-27 22:03:07.339244
3384	Gantry Pitch Rotation Direction	Registry of DICOM Data Elements	12298	12298	332	332	GantryPitchRotationDirection	CS	1		2014-10-27 22:03:07.343121
3385	Gantry Pitch Angle Tolerance	Registry of DICOM Data Elements	12298	12298	334	334	GantryPitchAngleTolerance	FL	1		2014-10-27 22:03:07.456161
3386	Patient Setup Sequence	Registry of DICOM Data Elements	12298	12298	384	384	PatientSetupSequence	SQ	1		2014-10-27 22:03:07.459981
3387	Patient Setup Number	Registry of DICOM Data Elements	12298	12298	386	386	PatientSetupNumber	IS	1		2014-10-27 22:03:07.463516
3388	Patient Setup Label	Registry of DICOM Data Elements	12298	12298	387	387	PatientSetupLabel	LO	1		2014-10-27 22:03:07.576758
3389	Patient Additional Position	Registry of DICOM Data Elements	12298	12298	388	388	PatientAdditionalPosition	LO	1		2014-10-27 22:03:07.58243
3390	Fixation Device Sequence	Registry of DICOM Data Elements	12298	12298	400	400	FixationDeviceSequence	SQ	1		2014-10-27 22:03:07.695492
3391	Fixation Device Type	Registry of DICOM Data Elements	12298	12298	402	402	FixationDeviceType	CS	1		2014-10-27 22:03:07.699601
3392	Fixation Device Label	Registry of DICOM Data Elements	12298	12298	404	404	FixationDeviceLabel	SH	1		2014-10-27 22:03:07.703226
3393	Fixation Device Description	Registry of DICOM Data Elements	12298	12298	406	406	FixationDeviceDescription	ST	1		2014-10-27 22:03:07.816333
3394	Fixation Device Position	Registry of DICOM Data Elements	12298	12298	408	408	FixationDevicePosition	SH	1		2014-10-27 22:03:07.820161
3395	Fixation Device Pitch Angle	Registry of DICOM Data Elements	12298	12298	409	409	FixationDevicePitchAngle	FL	1		2014-10-27 22:03:07.823677
3396	Fixation Device Roll Angle	Registry of DICOM Data Elements	12298	12298	410	410	FixationDeviceRollAngle	FL	1		2014-10-27 22:03:07.935399
3397	Shielding Device Sequence	Registry of DICOM Data Elements	12298	12298	416	416	ShieldingDeviceSequence	SQ	1		2014-10-27 22:03:07.938862
3398	Shielding Device Type	Registry of DICOM Data Elements	12298	12298	418	418	ShieldingDeviceType	CS	1		2014-10-27 22:03:07.942368
3399	Shielding Device Label	Registry of DICOM Data Elements	12298	12298	420	420	ShieldingDeviceLabel	SH	1		2014-10-27 22:03:08.054013
3400	Shielding Device Description	Registry of DICOM Data Elements	12298	12298	422	422	ShieldingDeviceDescription	ST	1		2014-10-27 22:03:08.058093
3401	Shielding Device Position	Registry of DICOM Data Elements	12298	12298	424	424	ShieldingDevicePosition	SH	1		2014-10-27 22:03:08.061607
3402	Setup Technique	Registry of DICOM Data Elements	12298	12298	432	432	SetupTechnique	CS	1		2014-10-27 22:03:08.173336
3403	Setup Technique Description	Registry of DICOM Data Elements	12298	12298	434	434	SetupTechniqueDescription	ST	1		2014-10-27 22:03:08.177169
3404	Setup Device Sequence	Registry of DICOM Data Elements	12298	12298	436	436	SetupDeviceSequence	SQ	1		2014-10-27 22:03:08.180697
3405	Setup Device Type	Registry of DICOM Data Elements	12298	12298	438	438	SetupDeviceType	CS	1		2014-10-27 22:03:08.184204
3406	Setup Device Label	Registry of DICOM Data Elements	12298	12298	440	440	SetupDeviceLabel	SH	1		2014-10-27 22:03:08.295998
3407	Setup Device Description	Registry of DICOM Data Elements	12298	12298	442	442	SetupDeviceDescription	ST	1		2014-10-27 22:03:08.29951
3408	Setup Device Parameter	Registry of DICOM Data Elements	12298	12298	444	444	SetupDeviceParameter	DS	1		2014-10-27 22:03:08.302988
3409	Setup Reference Description	Registry of DICOM Data Elements	12298	12298	464	464	SetupReferenceDescription	ST	1		2014-10-27 22:03:08.414667
3410	Table Top Vertical Setup Displacement	Registry of DICOM Data Elements	12298	12298	466	466	TableTopVerticalSetupDisplacement	DS	1		2014-10-27 22:03:08.418163
3411	Table Top Longitudinal Setup Displacement	Registry of DICOM Data Elements	12298	12298	468	468	TableTopLongitudinalSetupDisplacement	DS	1		2014-10-27 22:03:08.42212
3412	Table Top Lateral Setup Displacement	Registry of DICOM Data Elements	12298	12298	470	470	TableTopLateralSetupDisplacement	DS	1		2014-10-27 22:03:08.53387
3413	Brachy Treatment Technique	Registry of DICOM Data Elements	12298	12298	512	512	BrachyTreatmentTechnique	CS	1		2014-10-27 22:03:08.537367
3414	Brachy Treatment Type	Registry of DICOM Data Elements	12298	12298	514	514	BrachyTreatmentType	CS	1		2014-10-27 22:03:08.540849
3415	Treatment Machine Sequence	Registry of DICOM Data Elements	12298	12298	518	518	TreatmentMachineSequence	SQ	1		2014-10-27 22:03:08.544344
3416	Source Sequence	Registry of DICOM Data Elements	12298	12298	528	528	SourceSequence	SQ	1		2014-10-27 22:03:08.656353
3417	Source Number	Registry of DICOM Data Elements	12298	12298	530	530	SourceNumber	IS	1		2014-10-27 22:03:08.659824
3418	Source Type	Registry of DICOM Data Elements	12298	12298	532	532	SourceType	CS	1		2014-10-27 22:03:08.663313
3419	Source Manufacturer	Registry of DICOM Data Elements	12298	12298	534	534	SourceManufacturer	LO	1		2014-10-27 22:03:08.775162
3420	Active Source Diameter	Registry of DICOM Data Elements	12298	12298	536	536	ActiveSourceDiameter	DS	1		2014-10-27 22:03:08.778812
3421	Active Source Length	Registry of DICOM Data Elements	12298	12298	538	538	ActiveSourceLength	DS	1		2014-10-27 22:03:08.782392
3422	Source Model ID	Registry of DICOM Data Elements	12298	12298	539	539	SourceModelID	SH	1		2014-10-27 22:03:08.89514
3423	Source Description	Registry of DICOM Data Elements	12298	12298	540	540	SourceDescription	LO	1		2014-10-27 22:03:08.899123
3424	Source Encapsulation Nominal Thickness	Registry of DICOM Data Elements	12298	12298	546	546	SourceEncapsulationNominalThickness	DS	1		2014-10-27 22:03:08.902603
3425	Source Encapsulation Nominal Transmission	Registry of DICOM Data Elements	12298	12298	548	548	SourceEncapsulationNominalTransmission	DS	1		2014-10-27 22:03:09.014439
3426	Source Isotope Name	Registry of DICOM Data Elements	12298	12298	550	550	SourceIsotopeName	LO	1		2014-10-27 22:03:09.018058
3427	Source Isotope Half Life	Registry of DICOM Data Elements	12298	12298	552	552	SourceIsotopeHalfLife	DS	1		2014-10-27 22:03:09.021553
3428	Source Strength Units	Registry of DICOM Data Elements	12298	12298	553	553	SourceStrengthUnits	CS	1		2014-10-27 22:03:09.133955
3429	Reference Air Kerma Rate	Registry of DICOM Data Elements	12298	12298	554	554	ReferenceAirKermaRate	DS	1		2014-10-27 22:03:09.137842
3430	Source Strength	Registry of DICOM Data Elements	12298	12298	555	555	SourceStrength	DS	1		2014-10-27 22:03:09.141438
3431	Source Strength Reference Date	Registry of DICOM Data Elements	12298	12298	556	556	SourceStrengthReferenceDate	DA	1		2014-10-27 22:03:09.254878
3432	Source Strength Reference Time	Registry of DICOM Data Elements	12298	12298	558	558	SourceStrengthReferenceTime	TM	1		2014-10-27 22:03:09.25848
3433	Application Setup Sequence	Registry of DICOM Data Elements	12298	12298	560	560	ApplicationSetupSequence	SQ	1		2014-10-27 22:03:09.262564
3434	Application Setup Type	Registry of DICOM Data Elements	12298	12298	562	562	ApplicationSetupType	CS	1		2014-10-27 22:03:09.380637
3435	Application Setup Number	Registry of DICOM Data Elements	12298	12298	564	564	ApplicationSetupNumber	IS	1		2014-10-27 22:03:09.384312
3436	Application Setup Name	Registry of DICOM Data Elements	12298	12298	566	566	ApplicationSetupName	LO	1		2014-10-27 22:03:09.500427
3437	Application Setup Manufacturer	Registry of DICOM Data Elements	12298	12298	568	568	ApplicationSetupManufacturer	LO	1		2014-10-27 22:03:09.504085
3438	Template Number	Registry of DICOM Data Elements	12298	12298	576	576	TemplateNumber	IS	1		2014-10-27 22:03:09.615723
3439	Template Type	Registry of DICOM Data Elements	12298	12298	578	578	TemplateType	SH	1		2014-10-27 22:03:09.619199
3440	Template Name	Registry of DICOM Data Elements	12298	12298	580	580	TemplateName	LO	1		2014-10-27 22:03:09.62271
3441	Total Reference Air Kerma	Registry of DICOM Data Elements	12298	12298	592	592	TotalReferenceAirKerma	DS	1		2014-10-27 22:03:09.734654
3442	Brachy Accessory Device Sequence	Registry of DICOM Data Elements	12298	12298	608	608	BrachyAccessoryDeviceSequence	SQ	1		2014-10-27 22:03:09.738172
3443	Brachy Accessory Device Number	Registry of DICOM Data Elements	12298	12298	610	610	BrachyAccessoryDeviceNumber	IS	1		2014-10-27 22:03:09.741756
3444	Brachy Accessory Device ID	Registry of DICOM Data Elements	12298	12298	611	611	BrachyAccessoryDeviceID	SH	1		2014-10-27 22:03:09.854394
3445	Brachy Accessory Device Type	Registry of DICOM Data Elements	12298	12298	612	612	BrachyAccessoryDeviceType	CS	1		2014-10-27 22:03:09.858381
3446	Brachy Accessory Device Name	Registry of DICOM Data Elements	12298	12298	614	614	BrachyAccessoryDeviceName	LO	1		2014-10-27 22:03:09.861878
3447	Brachy Accessory Device Nominal Thickness	Registry of DICOM Data Elements	12298	12298	618	618	BrachyAccessoryDeviceNominalThickness	DS	1		2014-10-27 22:03:09.973609
3448	Brachy Accessory Device Nominal Transmission	Registry of DICOM Data Elements	12298	12298	620	620	BrachyAccessoryDeviceNominalTransmission	DS	1		2014-10-27 22:03:09.977208
3449	Channel Sequence	Registry of DICOM Data Elements	12298	12298	640	640	ChannelSequence	SQ	1		2014-10-27 22:03:09.98095
3450	Channel Number	Registry of DICOM Data Elements	12298	12298	642	642	ChannelNumber	IS	1		2014-10-27 22:03:09.984465
3451	Channel Length	Registry of DICOM Data Elements	12298	12298	644	644	ChannelLength	DS	1		2014-10-27 22:03:10.096229
3452	Channel Total Time	Registry of DICOM Data Elements	12298	12298	646	646	ChannelTotalTime	DS	1		2014-10-27 22:03:10.099779
3453	Source Movement Type	Registry of DICOM Data Elements	12298	12298	648	648	SourceMovementType	CS	1		2014-10-27 22:03:10.103312
3454	Number of Pulses	Registry of DICOM Data Elements	12298	12298	650	650	NumberOfPulses	IS	1		2014-10-27 22:03:10.215108
3455	Pulse Repetition Interval	Registry of DICOM Data Elements	12298	12298	652	652	PulseRepetitionInterval	DS	1		2014-10-27 22:03:10.219224
3456	Source Applicator Number	Registry of DICOM Data Elements	12298	12298	656	656	SourceApplicatorNumber	IS	1		2014-10-27 22:03:10.222742
3457	Source Applicator ID	Registry of DICOM Data Elements	12298	12298	657	657	SourceApplicatorID	SH	1		2014-10-27 22:03:10.335077
3458	Source Applicator Type	Registry of DICOM Data Elements	12298	12298	658	658	SourceApplicatorType	CS	1		2014-10-27 22:03:10.338572
3459	Source Applicator Name	Registry of DICOM Data Elements	12298	12298	660	660	SourceApplicatorName	LO	1		2014-10-27 22:03:10.342076
3460	Source Applicator Length	Registry of DICOM Data Elements	12298	12298	662	662	SourceApplicatorLength	DS	1		2014-10-27 22:03:10.453754
3461	Source Applicator Manufacturer	Registry of DICOM Data Elements	12298	12298	664	664	SourceApplicatorManufacturer	LO	1		2014-10-27 22:03:10.457324
3462	Source Applicator Wall Nominal Thickness	Registry of DICOM Data Elements	12298	12298	668	668	SourceApplicatorWallNominalThickness	DS	1		2014-10-27 22:03:10.460826
3463	Source Applicator Wall Nominal Transmission	Registry of DICOM Data Elements	12298	12298	670	670	SourceApplicatorWallNominalTransmission	DS	1		2014-10-27 22:03:10.464328
3464	Source Applicator Step Size	Registry of DICOM Data Elements	12298	12298	672	672	SourceApplicatorStepSize	DS	1		2014-10-27 22:03:10.576067
3465	Transfer Tube Number	Registry of DICOM Data Elements	12298	12298	674	674	TransferTubeNumber	IS	1		2014-10-27 22:03:10.579649
3466	Transfer Tube Length	Registry of DICOM Data Elements	12298	12298	676	676	TransferTubeLength	DS	1		2014-10-27 22:03:10.583658
3467	Channel Shield Sequence	Registry of DICOM Data Elements	12298	12298	688	688	ChannelShieldSequence	SQ	1		2014-10-27 22:03:10.695481
3468	Channel Shield Number	Registry of DICOM Data Elements	12298	12298	690	690	ChannelShieldNumber	IS	1		2014-10-27 22:03:10.699071
3469	Channel Shield ID	Registry of DICOM Data Elements	12298	12298	691	691	ChannelShieldID	SH	1		2014-10-27 22:03:10.702575
3470	Channel Shield Name	Registry of DICOM Data Elements	12298	12298	692	692	ChannelShieldName	LO	1		2014-10-27 22:03:10.815212
3471	Channel Shield Nominal Thickness	Registry of DICOM Data Elements	12298	12298	696	696	ChannelShieldNominalThickness	DS	1		2014-10-27 22:03:10.818714
3472	Channel Shield Nominal Transmission	Registry of DICOM Data Elements	12298	12298	698	698	ChannelShieldNominalTransmission	DS	1		2014-10-27 22:03:10.82226
3473	Final Cumulative Time Weight	Registry of DICOM Data Elements	12298	12298	712	712	FinalCumulativeTimeWeight	DS	1		2014-10-27 22:03:10.934104
3474	Brachy Control Point Sequence	Registry of DICOM Data Elements	12298	12298	720	720	BrachyControlPointSequence	SQ	1		2014-10-27 22:03:10.937751
3475	Control Point Relative Position	Registry of DICOM Data Elements	12298	12298	722	722	ControlPointRelativePosition	DS	1		2014-10-27 22:03:10.941404
3476	Control Point 3D Position	Registry of DICOM Data Elements	12298	12298	724	724	ControlPoint3DPosition	DS	3		2014-10-27 22:03:10.945004
3477	Cumulative Time Weight	Registry of DICOM Data Elements	12298	12298	726	726	CumulativeTimeWeight	DS	1		2014-10-27 22:03:11.057333
3478	Compensator Divergence	Registry of DICOM Data Elements	12298	12298	736	736	CompensatorDivergence	CS	1		2014-10-27 22:03:11.060871
3479	Compensator Mounting Position	Registry of DICOM Data Elements	12298	12298	737	737	CompensatorMountingPosition	CS	1		2014-10-27 22:03:11.064371
3480	Source to Compensator Distance	Registry of DICOM Data Elements	12298	12298	738	738	SourceToCompensatorDistance	DS	1-n		2014-10-27 22:03:11.176372
3481	Total Compensator Tray Water-Equivalent Thickness	Registry of DICOM Data Elements	12298	12298	739	739	TotalCompensatorTrayWaterEquivalentThickness	FL	1		2014-10-27 22:03:11.179954
3482	Isocenter to Compensator Tray Distance	Registry of DICOM Data Elements	12298	12298	740	740	IsocenterToCompensatorTrayDistance	FL	1		2014-10-27 22:03:11.183457
3483	Compensator Column Offset	Registry of DICOM Data Elements	12298	12298	741	741	CompensatorColumnOffset	FL	1		2014-10-27 22:03:11.295146
3484	Isocenter to Compensator Distances	Registry of DICOM Data Elements	12298	12298	742	742	IsocenterToCompensatorDistances	FL	1-n		2014-10-27 22:03:11.298662
3485	Compensator Relative Stopping Power Ratio	Registry of DICOM Data Elements	12298	12298	743	743	CompensatorRelativeStoppingPowerRatio	FL	1		2014-10-27 22:03:11.302194
3486	Compensator Milling Tool Diameter	Registry of DICOM Data Elements	12298	12298	744	744	CompensatorMillingToolDiameter	FL	1		2014-10-27 22:03:11.414441
3487	Ion Range Compensator Sequence	Registry of DICOM Data Elements	12298	12298	746	746	IonRangeCompensatorSequence	SQ	1		2014-10-27 22:03:11.418349
3488	Compensator Description	Registry of DICOM Data Elements	12298	12298	747	747	CompensatorDescription	LT	1		2014-10-27 22:03:11.422525
3489	Radiation Mass Number	Registry of DICOM Data Elements	12298	12298	770	770	RadiationMassNumber	IS	1		2014-10-27 22:03:11.534356
3490	Radiation Atomic Number	Registry of DICOM Data Elements	12298	12298	772	772	RadiationAtomicNumber	IS	1		2014-10-27 22:03:11.538171
3491	Radiation Charge State	Registry of DICOM Data Elements	12298	12298	774	774	RadiationChargeState	SS	1		2014-10-27 22:03:11.541664
3492	Scan Mode	Registry of DICOM Data Elements	12298	12298	776	776	ScanMode	CS	1		2014-10-27 22:03:11.545184
3493	Virtual Source-Axis Distances	Registry of DICOM Data Elements	12298	12298	778	778	VirtualSourceAxisDistances	FL	2		2014-10-27 22:03:11.657082
3494	Snout Sequence	Registry of DICOM Data Elements	12298	12298	780	780	SnoutSequence	SQ	1		2014-10-27 22:03:11.660603
3495	Snout Position	Registry of DICOM Data Elements	12298	12298	781	781	SnoutPosition	FL	1		2014-10-27 22:03:11.664103
3496	Snout ID	Registry of DICOM Data Elements	12298	12298	783	783	SnoutID	SH	1		2014-10-27 22:03:11.77593
3497	Number of Range Shifters	Registry of DICOM Data Elements	12298	12298	786	786	NumberOfRangeShifters	IS	1		2014-10-27 22:03:11.779581
3498	Range Shifter Sequence	Registry of DICOM Data Elements	12298	12298	788	788	RangeShifterSequence	SQ	1		2014-10-27 22:03:11.783156
3499	Range Shifter Number	Registry of DICOM Data Elements	12298	12298	790	790	RangeShifterNumber	IS	1		2014-10-27 22:03:11.895663
3500	Range Shifter ID	Registry of DICOM Data Elements	12298	12298	792	792	RangeShifterID	SH	1		2014-10-27 22:03:11.89916
3501	Range Shifter Type	Registry of DICOM Data Elements	12298	12298	800	800	RangeShifterType	CS	1		2014-10-27 22:03:11.902658
3502	Range Shifter Description	Registry of DICOM Data Elements	12298	12298	802	802	RangeShifterDescription	LO	1		2014-10-27 22:03:12.014475
3503	Number of Lateral Spreading Devices	Registry of DICOM Data Elements	12298	12298	816	816	NumberOfLateralSpreadingDevices	IS	1		2014-10-27 22:03:12.017994
3504	Lateral Spreading Device Sequence	Registry of DICOM Data Elements	12298	12298	818	818	LateralSpreadingDeviceSequence	SQ	1		2014-10-27 22:03:12.021549
3505	Lateral Spreading Device Number	Registry of DICOM Data Elements	12298	12298	820	820	LateralSpreadingDeviceNumber	IS	1		2014-10-27 22:03:12.025073
3506	Lateral Spreading Device ID	Registry of DICOM Data Elements	12298	12298	822	822	LateralSpreadingDeviceID	SH	1		2014-10-27 22:03:12.136909
3507	Lateral Spreading Device Type	Registry of DICOM Data Elements	12298	12298	824	824	LateralSpreadingDeviceType	CS	1		2014-10-27 22:03:12.140439
3508	Lateral Spreading Device Description	Registry of DICOM Data Elements	12298	12298	826	826	LateralSpreadingDeviceDescription	LO	1		2014-10-27 22:03:12.143986
3509	Lateral Spreading Device Water Equivalent Thickness	Registry of DICOM Data Elements	12298	12298	828	828	LateralSpreadingDeviceWaterEquivalentThickness	FL	1		2014-10-27 22:03:12.255988
3510	Number of Range Modulators	Registry of DICOM Data Elements	12298	12298	832	832	NumberOfRangeModulators	IS	1		2014-10-27 22:03:12.260293
3511	Range Modulator Sequence	Registry of DICOM Data Elements	12298	12298	834	834	RangeModulatorSequence	SQ	1		2014-10-27 22:03:12.26379
3512	Range Modulator Number	Registry of DICOM Data Elements	12298	12298	836	836	RangeModulatorNumber	IS	1		2014-10-27 22:03:12.375961
3513	Range Modulator ID	Registry of DICOM Data Elements	12298	12298	838	838	RangeModulatorID	SH	1		2014-10-27 22:03:12.379507
3514	Range Modulator Type	Registry of DICOM Data Elements	12298	12298	840	840	RangeModulatorType	CS	1		2014-10-27 22:03:12.382993
3515	Range Modulator Description	Registry of DICOM Data Elements	12298	12298	842	842	RangeModulatorDescription	LO	1		2014-10-27 22:03:12.49464
3516	Beam Current Modulation ID	Registry of DICOM Data Elements	12298	12298	844	844	BeamCurrentModulationID	SH	1		2014-10-27 22:03:12.498148
3517	Patient Support Type	Registry of DICOM Data Elements	12298	12298	848	848	PatientSupportType	CS	1		2014-10-27 22:03:12.501698
3518	Patient Support ID	Registry of DICOM Data Elements	12298	12298	850	850	PatientSupportID	SH	1		2014-10-27 22:03:12.505204
3519	Patient Support Accessory Code	Registry of DICOM Data Elements	12298	12298	852	852	PatientSupportAccessoryCode	LO	1		2014-10-27 22:03:12.616902
3520	Fixation Light Azimuthal Angle	Registry of DICOM Data Elements	12298	12298	854	854	FixationLightAzimuthalAngle	FL	1		2014-10-27 22:03:12.621901
3521	Fixation Light Polar Angle	Registry of DICOM Data Elements	12298	12298	856	856	FixationLightPolarAngle	FL	1		2014-10-27 22:03:12.625411
3522	Meterset Rate	Registry of DICOM Data Elements	12298	12298	858	858	MetersetRate	FL	1		2014-10-27 22:03:12.73727
3523	Range Shifter Settings Sequence	Registry of DICOM Data Elements	12298	12298	864	864	RangeShifterSettingsSequence	SQ	1		2014-10-27 22:03:12.740786
3524	Range Shifter Setting	Registry of DICOM Data Elements	12298	12298	866	866	RangeShifterSetting	LO	1		2014-10-27 22:03:12.744278
3525	Isocenter to Range Shifter Distance	Registry of DICOM Data Elements	12298	12298	868	868	IsocenterToRangeShifterDistance	FL	1		2014-10-27 22:03:12.855961
3526	Range Shifter Water Equivalent Thickness	Registry of DICOM Data Elements	12298	12298	870	870	RangeShifterWaterEquivalentThickness	FL	1		2014-10-27 22:03:12.859464
3527	Lateral Spreading Device Settings Sequence	Registry of DICOM Data Elements	12298	12298	880	880	LateralSpreadingDeviceSettingsSequence	SQ	1		2014-10-27 22:03:12.862945
3528	Lateral Spreading Device Setting	Registry of DICOM Data Elements	12298	12298	882	882	LateralSpreadingDeviceSetting	LO	1		2014-10-27 22:03:12.974813
3529	Isocenter to Lateral Spreading Device Distance	Registry of DICOM Data Elements	12298	12298	884	884	IsocenterToLateralSpreadingDeviceDistance	FL	1		2014-10-27 22:03:12.978532
3530	Range Modulator Settings Sequence	Registry of DICOM Data Elements	12298	12298	896	896	RangeModulatorSettingsSequence	SQ	1		2014-10-27 22:03:12.982042
3531	Range Modulator Gating Start Value	Registry of DICOM Data Elements	12298	12298	898	898	RangeModulatorGatingStartValue	FL	1		2014-10-27 22:03:12.986031
3532	Range Modulator Gating Stop Value	Registry of DICOM Data Elements	12298	12298	900	900	RangeModulatorGatingStopValue	FL	1		2014-10-27 22:03:13.097691
3533	Range Modulator Gating Start Water Equivalent Thickness	Registry of DICOM Data Elements	12298	12298	902	902	RangeModulatorGatingStartWaterEquivalentThickness	FL	1		2014-10-27 22:03:13.101161
3534	Range Modulator Gating Stop Water Equivalent Thickness	Registry of DICOM Data Elements	12298	12298	904	904	RangeModulatorGatingStopWaterEquivalentThickness	FL	1		2014-10-27 22:03:13.104579
3535	Isocenter to Range Modulator Distance	Registry of DICOM Data Elements	12298	12298	906	906	IsocenterToRangeModulatorDistance	FL	1		2014-10-27 22:03:13.216456
3536	Scan Spot Tune ID	Registry of DICOM Data Elements	12298	12298	912	912	ScanSpotTuneID	SH	1		2014-10-27 22:03:13.220009
3537	Number of Scan Spot Positions	Registry of DICOM Data Elements	12298	12298	914	914	NumberOfScanSpotPositions	IS	1		2014-10-27 22:03:13.22351
3538	Scan Spot Position Map	Registry of DICOM Data Elements	12298	12298	916	916	ScanSpotPositionMap	FL	1-n		2014-10-27 22:03:13.335198
3539	Scan Spot Meterset Weights	Registry of DICOM Data Elements	12298	12298	918	918	ScanSpotMetersetWeights	FL	1-n		2014-10-27 22:03:13.338702
3540	Scanning Spot Size	Registry of DICOM Data Elements	12298	12298	920	920	ScanningSpotSize	FL	2		2014-10-27 22:03:13.34223
3541	Number of Paintings	Registry of DICOM Data Elements	12298	12298	922	922	NumberOfPaintings	IS	1		2014-10-27 22:03:13.345763
3542	Ion Tolerance Table Sequence	Registry of DICOM Data Elements	12298	12298	928	928	IonToleranceTableSequence	SQ	1		2014-10-27 22:03:13.458089
3543	Ion Beam Sequence	Registry of DICOM Data Elements	12298	12298	930	930	IonBeamSequence	SQ	1		2014-10-27 22:03:13.461609
3544	Ion Beam Limiting Device Sequence	Registry of DICOM Data Elements	12298	12298	932	932	IonBeamLimitingDeviceSequence	SQ	1		2014-10-27 22:03:13.465126
3545	Ion Block Sequence	Registry of DICOM Data Elements	12298	12298	934	934	IonBlockSequence	SQ	1		2014-10-27 22:03:13.576755
3546	Ion Control Point Sequence	Registry of DICOM Data Elements	12298	12298	936	936	IonControlPointSequence	SQ	1		2014-10-27 22:03:13.580258
3547	Ion Wedge Sequence	Registry of DICOM Data Elements	12298	12298	938	938	IonWedgeSequence	SQ	1		2014-10-27 22:03:13.583764
3548	Ion Wedge Position Sequence	Registry of DICOM Data Elements	12298	12298	940	940	IonWedgePositionSequence	SQ	1		2014-10-27 22:03:13.695392
3549	Referenced Setup Image Sequence	Registry of DICOM Data Elements	12298	12298	1025	1025	ReferencedSetupImageSequence	SQ	1		2014-10-27 22:03:13.698891
3550	Setup Image Comment	Registry of DICOM Data Elements	12298	12298	1026	1026	SetupImageComment	ST	1		2014-10-27 22:03:13.702434
3551	Motion Synchronization Sequence	Registry of DICOM Data Elements	12298	12298	1040	1040	MotionSynchronizationSequence	SQ	1		2014-10-27 22:03:13.70594
3552	Control Point Orientation	Registry of DICOM Data Elements	12298	12298	1042	1042	ControlPointOrientation	FL	3		2014-10-27 22:03:13.817649
3553	General Accessory Sequence	Registry of DICOM Data Elements	12298	12298	1056	1056	GeneralAccessorySequence	SQ	1		2014-10-27 22:03:13.821667
3554	General Accessory ID	Registry of DICOM Data Elements	12298	12298	1057	1057	GeneralAccessoryID	SH	1		2014-10-27 22:03:13.825198
3555	General Accessory Description	Registry of DICOM Data Elements	12298	12298	1058	1058	GeneralAccessoryDescription	ST	1		2014-10-27 22:03:13.936905
3556	General Accessory Type	Registry of DICOM Data Elements	12298	12298	1059	1059	GeneralAccessoryType	CS	1		2014-10-27 22:03:13.94038
3557	General Accessory Number	Registry of DICOM Data Elements	12298	12298	1060	1060	GeneralAccessoryNumber	IS	1		2014-10-27 22:03:13.943896
3558	Source to General Accessory Distance	Registry of DICOM Data Elements	12298	12298	1061	1061	SourceToGeneralAccessoryDistance	FL	1		2014-10-27 22:03:14.055749
3559	Applicator Geometry Sequence	Registry of DICOM Data Elements	12298	12298	1073	1073	ApplicatorGeometrySequence	SQ	1		2014-10-27 22:03:14.059271
3560	Applicator Aperture Shape	Registry of DICOM Data Elements	12298	12298	1074	1074	ApplicatorApertureShape	CS	1		2014-10-27 22:03:14.062797
3561	Applicator Opening	Registry of DICOM Data Elements	12298	12298	1075	1075	ApplicatorOpening	FL	1		2014-10-27 22:03:14.066317
3562	Applicator Opening X	Registry of DICOM Data Elements	12298	12298	1076	1076	ApplicatorOpeningX	FL	1		2014-10-27 22:03:14.177958
3563	Applicator Opening Y	Registry of DICOM Data Elements	12298	12298	1077	1077	ApplicatorOpeningY	FL	1		2014-10-27 22:03:14.181456
3564	Source to Applicator Mounting Position Distance	Registry of DICOM Data Elements	12298	12298	1078	1078	SourceToApplicatorMountingPositionDistance	FL	1		2014-10-27 22:03:14.185418
3565	Referenced RT Plan Sequence	Registry of DICOM Data Elements	12300	12300	2	2	ReferencedRTPlanSequence	SQ	1		2014-10-27 22:03:14.297096
3566	Referenced Beam Sequence	Registry of DICOM Data Elements	12300	12300	4	4	ReferencedBeamSequence	SQ	1		2014-10-27 22:03:14.300606
3567	Referenced Beam Number	Registry of DICOM Data Elements	12300	12300	6	6	ReferencedBeamNumber	IS	1		2014-10-27 22:03:14.30413
3568	Referenced Reference Image Number	Registry of DICOM Data Elements	12300	12300	7	7	ReferencedReferenceImageNumber	IS	1		2014-10-27 22:03:14.415753
3569	Start Cumulative Meterset Weight	Registry of DICOM Data Elements	12300	12300	8	8	StartCumulativeMetersetWeight	DS	1		2014-10-27 22:03:14.419272
3570	End Cumulative Meterset Weight	Registry of DICOM Data Elements	12300	12300	9	9	EndCumulativeMetersetWeight	DS	1		2014-10-27 22:03:14.422792
3571	Referenced Brachy Application Setup Sequence	Registry of DICOM Data Elements	12300	12300	10	10	ReferencedBrachyApplicationSetupSequence	SQ	1		2014-10-27 22:03:14.426324
3572	Referenced Brachy Application Setup Number	Registry of DICOM Data Elements	12300	12300	12	12	ReferencedBrachyApplicationSetupNumber	IS	1		2014-10-27 22:03:14.538049
3573	Referenced Source Number	Registry of DICOM Data Elements	12300	12300	14	14	ReferencedSourceNumber	IS	1		2014-10-27 22:03:14.541642
3574	Referenced Fraction Group Sequence	Registry of DICOM Data Elements	12300	12300	32	32	ReferencedFractionGroupSequence	SQ	1		2014-10-27 22:03:14.54522
3575	Referenced Fraction Group Number	Registry of DICOM Data Elements	12300	12300	34	34	ReferencedFractionGroupNumber	IS	1		2014-10-27 22:03:14.657671
3576	Referenced Verification Image Sequence	Registry of DICOM Data Elements	12300	12300	64	64	ReferencedVerificationImageSequence	SQ	1		2014-10-27 22:03:14.661193
3577	Referenced Reference Image Sequence	Registry of DICOM Data Elements	12300	12300	66	66	ReferencedReferenceImageSequence	SQ	1		2014-10-27 22:03:14.664685
3578	Referenced Dose Reference Sequence	Registry of DICOM Data Elements	12300	12300	80	80	ReferencedDoseReferenceSequence	SQ	1		2014-10-27 22:03:14.776933
3579	Referenced Dose Reference Number	Registry of DICOM Data Elements	12300	12300	81	81	ReferencedDoseReferenceNumber	IS	1		2014-10-27 22:03:14.780816
3580	Brachy Referenced Dose Reference Sequence	Registry of DICOM Data Elements	12300	12300	85	85	BrachyReferencedDoseReferenceSequence	SQ	1		2014-10-27 22:03:14.784378
3581	Referenced Structure Set Sequence	Registry of DICOM Data Elements	12300	12300	96	96	ReferencedStructureSetSequence	SQ	1		2014-10-27 22:03:14.896919
3582	Referenced Patient Setup Number	Registry of DICOM Data Elements	12300	12300	106	106	ReferencedPatientSetupNumber	IS	1		2014-10-27 22:03:14.900964
3583	Referenced Dose Sequence	Registry of DICOM Data Elements	12300	12300	128	128	ReferencedDoseSequence	SQ	1		2014-10-27 22:03:14.90453
3584	Referenced Tolerance Table Number	Registry of DICOM Data Elements	12300	12300	160	160	ReferencedToleranceTableNumber	IS	1		2014-10-27 22:03:15.016841
3585	Referenced Bolus Sequence	Registry of DICOM Data Elements	12300	12300	176	176	ReferencedBolusSequence	SQ	1		2014-10-27 22:03:15.020852
3586	Referenced Wedge Number	Registry of DICOM Data Elements	12300	12300	192	192	ReferencedWedgeNumber	IS	1		2014-10-27 22:03:15.02509
3587	Referenced Compensator Number	Registry of DICOM Data Elements	12300	12300	208	208	ReferencedCompensatorNumber	IS	1		2014-10-27 22:03:15.13751
3588	Referenced Block Number	Registry of DICOM Data Elements	12300	12300	224	224	ReferencedBlockNumber	IS	1		2014-10-27 22:03:15.141259
3589	Referenced Control Point Index	Registry of DICOM Data Elements	12300	12300	240	240	ReferencedControlPointIndex	IS	1		2014-10-27 22:03:15.144804
3590	Referenced Control Point Sequence	Registry of DICOM Data Elements	12300	12300	242	242	ReferencedControlPointSequence	SQ	1		2014-10-27 22:03:15.256652
3591	Referenced Start Control Point Index	Registry of DICOM Data Elements	12300	12300	244	244	ReferencedStartControlPointIndex	IS	1		2014-10-27 22:03:15.260247
3592	Referenced Stop Control Point Index	Registry of DICOM Data Elements	12300	12300	246	246	ReferencedStopControlPointIndex	IS	1		2014-10-27 22:03:15.263799
3593	Referenced Range Shifter Number	Registry of DICOM Data Elements	12300	12300	256	256	ReferencedRangeShifterNumber	IS	1		2014-10-27 22:03:15.376176
3594	Referenced Lateral Spreading Device Number	Registry of DICOM Data Elements	12300	12300	258	258	ReferencedLateralSpreadingDeviceNumber	IS	1		2014-10-27 22:03:15.380885
3595	Referenced Range Modulator Number	Registry of DICOM Data Elements	12300	12300	260	260	ReferencedRangeModulatorNumber	IS	1		2014-10-27 22:03:15.385038
3596	Approval Status	Registry of DICOM Data Elements	12302	12302	2	2	ApprovalStatus	CS	1		2014-10-27 22:03:15.496953
3597	Review Date	Registry of DICOM Data Elements	12302	12302	4	4	ReviewDate	DA	1		2014-10-27 22:03:15.501127
3598	Review Time	Registry of DICOM Data Elements	12302	12302	5	5	ReviewTime	TM	1		2014-10-27 22:03:15.504664
3599	Reviewer Name	Registry of DICOM Data Elements	12302	12302	8	8	ReviewerName	PN	1		2014-10-27 22:03:15.616482
3600	Arbitrary	Registry of DICOM Data Elements	16384	16384	16	16	Arbitrary	LT	1	RET	2014-10-27 22:03:15.620036
3601	Text Comments	Registry of DICOM Data Elements	16384	16384	16384	16384	TextComments	LT	1	RET	2014-10-27 22:03:15.623528
3602	Results ID	Registry of DICOM Data Elements	16392	16392	64	64	ResultsID	SH	1	RET	2014-10-27 22:03:15.735286
3603	Results ID Issuer	Registry of DICOM Data Elements	16392	16392	66	66	ResultsIDIssuer	LO	1	RET	2014-10-27 22:03:15.739053
3604	Referenced Interpretation Sequence	Registry of DICOM Data Elements	16392	16392	80	80	ReferencedInterpretationSequence	SQ	1	RET	2014-10-27 22:03:15.742554
3605	Report Production Status (Trial)	Registry of DICOM Data Elements	16392	16392	255	255	ReportProductionStatusTrial	CS	1	RET	2014-10-27 22:03:15.746052
3606	Interpretation Recorded Date	Registry of DICOM Data Elements	16392	16392	256	256	InterpretationRecordedDate	DA	1	RET	2014-10-27 22:03:15.858091
3607	Interpretation Recorded Time	Registry of DICOM Data Elements	16392	16392	257	257	InterpretationRecordedTime	TM	1	RET	2014-10-27 22:03:15.861774
3608	Interpretation Recorder	Registry of DICOM Data Elements	16392	16392	258	258	InterpretationRecorder	PN	1	RET	2014-10-27 22:03:15.865883
3609	Reference to Recorded Sound	Registry of DICOM Data Elements	16392	16392	259	259	ReferenceToRecordedSound	LO	1	RET	2014-10-27 22:03:15.977656
3610	Interpretation Transcription Date	Registry of DICOM Data Elements	16392	16392	264	264	InterpretationTranscriptionDate	DA	1	RET	2014-10-27 22:03:15.981185
3611	Interpretation Transcription Time	Registry of DICOM Data Elements	16392	16392	265	265	InterpretationTranscriptionTime	TM	1	RET	2014-10-27 22:03:15.984697
3612	Interpretation Transcriber	Registry of DICOM Data Elements	16392	16392	266	266	InterpretationTranscriber	PN	1	RET	2014-10-27 22:03:16.096922
3613	Interpretation Text	Registry of DICOM Data Elements	16392	16392	267	267	InterpretationText	ST	1	RET	2014-10-27 22:03:16.100577
3614	Interpretation Author	Registry of DICOM Data Elements	16392	16392	268	268	InterpretationAuthor	PN	1	RET	2014-10-27 22:03:16.104191
3615	Interpretation Approver Sequence	Registry of DICOM Data Elements	16392	16392	273	273	InterpretationApproverSequence	SQ	1	RET	2014-10-27 22:03:16.216198
3616	Interpretation Approval Date	Registry of DICOM Data Elements	16392	16392	274	274	InterpretationApprovalDate	DA	1	RET	2014-10-27 22:03:16.219972
3617	Interpretation Approval Time	Registry of DICOM Data Elements	16392	16392	275	275	InterpretationApprovalTime	TM	1	RET	2014-10-27 22:03:16.223622
3618	Physician Approving Interpretation	Registry of DICOM Data Elements	16392	16392	276	276	PhysicianApprovingInterpretation	PN	1	RET	2014-10-27 22:03:16.335583
3619	Interpretation Diagnosis Description	Registry of DICOM Data Elements	16392	16392	277	277	InterpretationDiagnosisDescription	LT	1	RET	2014-10-27 22:03:16.339948
3620	Interpretation Diagnosis Code Sequence	Registry of DICOM Data Elements	16392	16392	279	279	InterpretationDiagnosisCodeSequence	SQ	1	RET	2014-10-27 22:03:16.34347
3621	Results Distribution List Sequence	Registry of DICOM Data Elements	16392	16392	280	280	ResultsDistributionListSequence	SQ	1	RET	2014-10-27 22:03:16.347002
3622	Distribution Name	Registry of DICOM Data Elements	16392	16392	281	281	DistributionName	PN	1	RET	2014-10-27 22:03:16.458616
3623	Distribution Address	Registry of DICOM Data Elements	16392	16392	282	282	DistributionAddress	LO	1	RET	2014-10-27 22:03:16.462053
3624	Interpretation ID	Registry of DICOM Data Elements	16392	16392	512	512	InterpretationID	SH	1	RET	2014-10-27 22:03:16.46549
3625	Interpretation ID Issuer	Registry of DICOM Data Elements	16392	16392	514	514	InterpretationIDIssuer	LO	1	RET	2014-10-27 22:03:16.577233
3626	Interpretation Type ID	Registry of DICOM Data Elements	16392	16392	528	528	InterpretationTypeID	CS	1	RET	2014-10-27 22:03:16.580815
3627	Interpretation Status ID	Registry of DICOM Data Elements	16392	16392	530	530	InterpretationStatusID	CS	1	RET	2014-10-27 22:03:16.584395
3628	Impressions	Registry of DICOM Data Elements	16392	16392	768	768	Impressions	ST	1	RET	2014-10-27 22:03:16.696177
3629	Results Comments	Registry of DICOM Data Elements	16392	16392	16384	16384	ResultsComments	ST	1	RET	2014-10-27 22:03:16.699905
3630	Low Energy Detectors	Registry of DICOM Data Elements	16400	16400	1	1	LowEnergyDetectors	CS	1	DICOS	2014-10-27 22:03:16.704025
3631	High Energy Detectors	Registry of DICOM Data Elements	16400	16400	2	2	HighEnergyDetectors	CS	1	DICOS	2014-10-27 22:03:16.815782
3632	Detector Geometry Sequence	Registry of DICOM Data Elements	16400	16400	4	4	DetectorGeometrySequence	SQ	1	DICOS	2014-10-27 22:03:16.819384
3633	Threat ROI Voxel Sequence	Registry of DICOM Data Elements	16400	16400	4097	4097	ThreatROIVoxelSequence	SQ	1	DICOS	2014-10-27 22:03:16.822885
3634	Threat ROI Base	Registry of DICOM Data Elements	16400	16400	4100	4100	ThreatROIBase	FL	3	DICOS	2014-10-27 22:03:16.826498
3635	Threat ROI Extents	Registry of DICOM Data Elements	16400	16400	4101	4101	ThreatROIExtents	FL	3	DICOS	2014-10-27 22:03:16.938316
3636	Threat ROI Bitmap	Registry of DICOM Data Elements	16400	16400	4102	4102	ThreatROIBitmap	OB	1	DICOS	2014-10-27 22:03:16.941837
3637	Route Segment ID	Registry of DICOM Data Elements	16400	16400	4103	4103	RouteSegmentID	SH	1	DICOS	2014-10-27 22:03:16.945344
3638	Gantry Type	Registry of DICOM Data Elements	16400	16400	4104	4104	GantryType	CS	1	DICOS	2014-10-27 22:03:17.057113
3639	OOI Owner Type	Registry of DICOM Data Elements	16400	16400	4105	4105	OOIOwnerType	CS	1	DICOS	2014-10-27 22:03:17.060705
3640	Route Segment Sequence	Registry of DICOM Data Elements	16400	16400	4106	4106	RouteSegmentSequence	SQ	1	DICOS	2014-10-27 22:03:17.064308
3641	Potential Threat Object ID	Registry of DICOM Data Elements	16400	16400	4112	4112	PotentialThreatObjectID	US	1	DICOS	2014-10-27 22:03:17.176439
3642	Threat Sequence	Registry of DICOM Data Elements	16400	16400	4113	4113	ThreatSequence	SQ	1	DICOS	2014-10-27 22:03:17.179989
3643	Threat Category	Registry of DICOM Data Elements	16400	16400	4114	4114	ThreatCategory	CS	1	DICOS	2014-10-27 22:03:17.183519
3644	Threat Category Description	Registry of DICOM Data Elements	16400	16400	4115	4115	ThreatCategoryDescription	LT	1	DICOS	2014-10-27 22:03:17.187035
3645	ATD Ability Assessment	Registry of DICOM Data Elements	16400	16400	4116	4116	ATDAbilityAssessment	CS	1	DICOS	2014-10-27 22:03:17.299003
3646	ATD Assessment Flag	Registry of DICOM Data Elements	16400	16400	4117	4117	ATDAssessmentFlag	CS	1	DICOS	2014-10-27 22:03:17.302548
3647	ATD Assessment Probability	Registry of DICOM Data Elements	16400	16400	4118	4118	ATDAssessmentProbability	FL	1	DICOS	2014-10-27 22:03:17.306072
3648	Mass	Registry of DICOM Data Elements	16400	16400	4119	4119	Mass	FL	1	DICOS	2014-10-27 22:03:17.417738
3649	Density	Registry of DICOM Data Elements	16400	16400	4120	4120	Density	FL	1	DICOS	2014-10-27 22:03:17.421309
3650	Z Effective	Registry of DICOM Data Elements	16400	16400	4121	4121	ZEffective	FL	1	DICOS	2014-10-27 22:03:17.424888
3651	Boarding Pass ID	Registry of DICOM Data Elements	16400	16400	4122	4122	BoardingPassID	SH	1	DICOS	2014-10-27 22:03:17.538027
3652	Center of Mass	Registry of DICOM Data Elements	16400	16400	4123	4123	CenterOfMass	FL	3	DICOS	2014-10-27 22:03:17.541591
3653	Center of PTO	Registry of DICOM Data Elements	16400	16400	4124	4124	CenterOfPTO	FL	3	DICOS	2014-10-27 22:03:17.54511
3654	Bounding Polygon	Registry of DICOM Data Elements	16400	16400	4125	4125	BoundingPolygon	FL	6-n	DICOS	2014-10-27 22:03:17.656847
3655	Route Segment Start Location ID	Registry of DICOM Data Elements	16400	16400	4126	4126	RouteSegmentStartLocationID	SH	1	DICOS	2014-10-27 22:03:17.660441
3656	Route Segment End Location ID	Registry of DICOM Data Elements	16400	16400	4127	4127	RouteSegmentEndLocationID	SH	1	DICOS	2014-10-27 22:03:17.663966
3657	Route Segment Location ID Type	Registry of DICOM Data Elements	16400	16400	4128	4128	RouteSegmentLocationIDType	CS	1	DICOS	2014-10-27 22:03:17.775942
3658	Abort Reason	Registry of DICOM Data Elements	16400	16400	4129	4129	AbortReason	CS	1-n	DICOS	2014-10-27 22:03:17.779768
3659	Volume of PTO	Registry of DICOM Data Elements	16400	16400	4131	4131	VolumeOfPTO	FL	1	DICOS	2014-10-27 22:03:17.783456
3660	Abort Flag	Registry of DICOM Data Elements	16400	16400	4132	4132	AbortFlag	CS	1	DICOS	2014-10-27 22:03:17.787073
3661	Route Segment Start Time	Registry of DICOM Data Elements	16400	16400	4133	4133	RouteSegmentStartTime	DT	1	DICOS	2014-10-27 22:03:17.898889
3662	Route Segment End Time	Registry of DICOM Data Elements	16400	16400	4134	4134	RouteSegmentEndTime	DT	1	DICOS	2014-10-27 22:03:17.90296
3663	TDR Type	Registry of DICOM Data Elements	16400	16400	4135	4135	TDRType	CS	1	DICOS	2014-10-27 22:03:17.906517
3664	International Route Segment	Registry of DICOM Data Elements	16400	16400	4136	4136	InternationalRouteSegment	CS	1	DICOS	2014-10-27 22:03:18.018388
3665	Threat Detection Algorithm and Version	Registry of DICOM Data Elements	16400	16400	4137	4137	ThreatDetectionAlgorithmandVersion	LO	1-n	DICOS	2014-10-27 22:03:18.021954
3666	Assigned Location	Registry of DICOM Data Elements	16400	16400	4138	4138	AssignedLocation	SH	1	DICOS	2014-10-27 22:03:18.0255
3667	Alarm Decision Time	Registry of DICOM Data Elements	16400	16400	4139	4139	AlarmDecisionTime	DT	1	DICOS	2014-10-27 22:03:18.137317
3668	Alarm Decision	Registry of DICOM Data Elements	16400	16400	4145	4145	AlarmDecision	CS	1	DICOS	2014-10-27 22:03:18.140869
3669	Number of Total Objects	Registry of DICOM Data Elements	16400	16400	4147	4147	NumberOfTotalObjects	US	1	DICOS	2014-10-27 22:03:18.144421
3670	Number of Alarm Objects	Registry of DICOM Data Elements	16400	16400	4148	4148	NumberOfAlarmObjects	US	1	DICOS	2014-10-27 22:03:18.256116
3671	PTO Representation Sequence	Registry of DICOM Data Elements	16400	16400	4151	4151	PTORepresentationSequence	SQ	1	DICOS	2014-10-27 22:03:18.259652
3672	ATD Assessment Sequence	Registry of DICOM Data Elements	16400	16400	4152	4152	ATDAssessmentSequence	SQ	1	DICOS	2014-10-27 22:03:18.263165
3673	TIP Type	Registry of DICOM Data Elements	16400	16400	4153	4153	TIPType	CS	1	DICOS	2014-10-27 22:03:18.267151
3674	DICOS Version	Registry of DICOM Data Elements	16400	16400	4154	4154	DICOSVersion	CS	1	DICOS	2014-10-27 22:03:18.379089
3675	OOI Owner Creation Time	Registry of DICOM Data Elements	16400	16400	4161	4161	OOIOwnerCreationTime	DT	1	DICOS	2014-10-27 22:03:18.382623
3676	OOI Type	Registry of DICOM Data Elements	16400	16400	4162	4162	OOIType	CS	1	DICOS	2014-10-27 22:03:18.386153
3677	OOI Size	Registry of DICOM Data Elements	16400	16400	4163	4163	OOISize	FL	3	DICOS	2014-10-27 22:03:18.497837
3678	Acquisition Status	Registry of DICOM Data Elements	16400	16400	4164	4164	AcquisitionStatus	CS	1	DICOS	2014-10-27 22:03:18.501381
3679	Basis Materials Code Sequence	Registry of DICOM Data Elements	16400	16400	4165	4165	BasisMaterialsCodeSequence	SQ	1	DICOS	2014-10-27 22:03:18.504903
3680	Phantom Type	Registry of DICOM Data Elements	16400	16400	4166	4166	PhantomType	CS	1	DICOS	2014-10-27 22:03:18.616552
3681	OOI Owner Sequence	Registry of DICOM Data Elements	16400	16400	4167	4167	OOIOwnerSequence	SQ	1	DICOS	2014-10-27 22:03:18.620118
3682	Scan Type	Registry of DICOM Data Elements	16400	16400	4168	4168	ScanType	CS	1	DICOS	2014-10-27 22:03:18.623654
3683	Itinerary ID	Registry of DICOM Data Elements	16400	16400	4177	4177	ItineraryID	LO	1	DICOS	2014-10-27 22:03:18.627163
3684	Itinerary ID Type	Registry of DICOM Data Elements	16400	16400	4178	4178	ItineraryIDType	SH	1	DICOS	2014-10-27 22:03:18.739409
3685	Itinerary ID Assigning Authority	Registry of DICOM Data Elements	16400	16400	4179	4179	ItineraryIDAssigningAuthority	LO	1	DICOS	2014-10-27 22:03:18.742947
3686	Route ID	Registry of DICOM Data Elements	16400	16400	4180	4180	RouteID	SH	1	DICOS	2014-10-27 22:03:18.746466
3687	Route ID Assigning Authority	Registry of DICOM Data Elements	16400	16400	4181	4181	RouteIDAssigningAuthority	SH	1	DICOS	2014-10-27 22:03:18.858121
3688	Inbound Arrival Type	Registry of DICOM Data Elements	16400	16400	4182	4182	InboundArrivalType	CS	1	DICOS	2014-10-27 22:03:18.861633
3689	Carrier ID	Registry of DICOM Data Elements	16400	16400	4184	4184	CarrierID	SH	1	DICOS	2014-10-27 22:03:18.865168
3690	Carrier ID Assigning Authority	Registry of DICOM Data Elements	16400	16400	4185	4185	CarrierIDAssigningAuthority	CS	1	DICOS	2014-10-27 22:03:18.976889
3691	Source Orientation	Registry of DICOM Data Elements	16400	16400	4192	4192	SourceOrientation	FL	3	DICOS	2014-10-27 22:03:18.980584
3692	Source Position	Registry of DICOM Data Elements	16400	16400	4193	4193	SourcePosition	FL	3	DICOS	2014-10-27 22:03:18.984124
3693	Belt Height	Registry of DICOM Data Elements	16400	16400	4194	4194	BeltHeight	FL	1	DICOS	2014-10-27 22:03:18.987659
3694	Algorithm Routing Code Sequence	Registry of DICOM Data Elements	16400	16400	4196	4196	AlgorithmRoutingCodeSequence	SQ	1	DICOS	2014-10-27 22:03:19.099861
3695	Transport Classification	Registry of DICOM Data Elements	16400	16400	4199	4199	TransportClassification	CS	1	DICOS	2014-10-27 22:03:19.104064
3696	OOI Type Descriptor	Registry of DICOM Data Elements	16400	16400	4200	4200	OOITypeDescriptor	LT	1	DICOS	2014-10-27 22:03:19.216274
3697	Total Processing Time	Registry of DICOM Data Elements	16400	16400	4201	4201	TotalProcessingTime	FL	1	DICOS	2014-10-27 22:03:19.220158
3698	Detector Calibration Data	Registry of DICOM Data Elements	16400	16400	4204	4204	DetectorCalibrationData	OB	1	DICOS	2014-10-27 22:03:19.223699
3699	Additional Screening Performed	Registry of DICOM Data Elements	16400	16400	4205	4205	AdditionalScreeningPerformed	CS	1	DICOS	2014-10-27 22:03:19.227236
3700	Additional Inspection Selection Criteria	Registry of DICOM Data Elements	16400	16400	4206	4206	AdditionalInspectionSelectionCriteria	CS	1	DICOS	2014-10-27 22:03:19.339122
3701	Additional Inspection Method Sequence	Registry of DICOM Data Elements	16400	16400	4207	4207	AdditionalInspectionMethodSequence	SQ	1	DICOS	2014-10-27 22:03:19.342666
3702	AIT Device Type	Registry of DICOM Data Elements	16400	16400	4208	4208	AITDeviceType	CS	1	DICOS	2014-10-27 22:03:19.346205
3703	QR Measurements Sequence	Registry of DICOM Data Elements	16400	16400	4209	4209	QRMeasurementsSequence	SQ	1	DICOS	2014-10-27 22:03:19.458308
3704	Target Material Sequence	Registry of DICOM Data Elements	16400	16400	4210	4210	TargetMaterialSequence	SQ	1	DICOS	2014-10-27 22:03:19.462026
3705	SNR Threshold	Registry of DICOM Data Elements	16400	16400	4211	4211	SNRThreshold	FD	1	DICOS	2014-10-27 22:03:19.465621
3706	Image Scale Representation	Registry of DICOM Data Elements	16400	16400	4213	4213	ImageScaleRepresentation	DS	1	DICOS	2014-10-27 22:03:19.577933
3707	Referenced PTO Sequence	Registry of DICOM Data Elements	16400	16400	4214	4214	ReferencedPTOSequence	SQ	1	DICOS	2014-10-27 22:03:19.581483
3708	Referenced TDR Instance Sequence	Registry of DICOM Data Elements	16400	16400	4215	4215	ReferencedTDRInstanceSequence	SQ	1	DICOS	2014-10-27 22:03:19.585018
3709	PTO Location Description	Registry of DICOM Data Elements	16400	16400	4216	4216	PTOLocationDescription	ST	1	DICOS	2014-10-27 22:03:19.696689
3710	Anomaly Locator Indicator Sequence	Registry of DICOM Data Elements	16400	16400	4217	4217	AnomalyLocatorIndicatorSequence	SQ	1	DICOS	2014-10-27 22:03:19.700281
3711	Anomaly Locator Indicator	Registry of DICOM Data Elements	16400	16400	4218	4218	AnomalyLocatorIndicator	FL	3	DICOS	2014-10-27 22:03:19.703891
3712	PTO Region Sequence	Registry of DICOM Data Elements	16400	16400	4219	4219	PTORegionSequence	SQ	1	DICOS	2014-10-27 22:03:19.70747
3713	Inspection Selection Criteria	Registry of DICOM Data Elements	16400	16400	4220	4220	InspectionSelectionCriteria	CS	1	DICOS	2014-10-27 22:03:19.81975
3714	Secondary Inspection Method Sequence	Registry of DICOM Data Elements	16400	16400	4221	4221	SecondaryInspectionMethodSequence	SQ	1	DICOS	2014-10-27 22:03:19.823409
3715	PRCS to RCS Orientation	Registry of DICOM Data Elements	16400	16400	4222	4222	PRCSToRCSOrientation	DS	6	DICOS	2014-10-27 22:03:19.826997
3716	MAC Parameters Sequence	Registry of DICOM Data Elements	20478	20478	1	1	MACParametersSequence	SQ	1		2014-10-27 22:03:19.939007
3717	Curve Dimensions	Registry of DICOM Data Elements	20480	20735	5	5	CurveDimensions	US	1	RET	2014-10-27 22:03:19.943241
3718	Number of Points	Registry of DICOM Data Elements	20480	20735	16	16	NumberOfPoints	US	1	RET	2014-10-27 22:03:19.946787
3719	Type of Data	Registry of DICOM Data Elements	20480	20735	32	32	TypeOfData	CS	1	RET	2014-10-27 22:03:20.058872
3720	Curve Description	Registry of DICOM Data Elements	20480	20735	34	34	CurveDescription	LO	1	RET	2014-10-27 22:03:20.062545
3721	Axis Units	Registry of DICOM Data Elements	20480	20735	48	48	AxisUnits	SH	1-n	RET	2014-10-27 22:03:20.06608
3722	Axis Labels	Registry of DICOM Data Elements	20480	20735	64	64	AxisLabels	SH	1-n	RET	2014-10-27 22:03:20.178012
3723	Data Value Representation	Registry of DICOM Data Elements	20480	20735	259	259	DataValueRepresentation	US	1	RET	2014-10-27 22:03:20.181682
3724	Minimum Coordinate Value	Registry of DICOM Data Elements	20480	20735	260	260	MinimumCoordinateValue	US	1-n	RET	2014-10-27 22:03:20.185264
3725	Maximum Coordinate Value	Registry of DICOM Data Elements	20480	20735	261	261	MaximumCoordinateValue	US	1-n	RET	2014-10-27 22:03:20.297179
3726	Curve Range	Registry of DICOM Data Elements	20480	20735	262	262	CurveRange	SH	1-n	RET	2014-10-27 22:03:20.300997
3727	Curve Data Descriptor	Registry of DICOM Data Elements	20480	20735	272	272	CurveDataDescriptor	US	1-n	RET	2014-10-27 22:03:20.304645
3728	Coordinate Start Value	Registry of DICOM Data Elements	20480	20735	274	274	CoordinateStartValue	US	1-n	RET	2014-10-27 22:03:20.417012
3729	Coordinate Step Value	Registry of DICOM Data Elements	20480	20735	276	276	CoordinateStepValue	US	1-n	RET	2014-10-27 22:03:20.420623
3730	Curve Activation Layer	Registry of DICOM Data Elements	20480	20735	4097	4097	CurveActivationLayer	CS	1	RET	2014-10-27 22:03:20.424192
3731	Audio Type	Registry of DICOM Data Elements	20480	20735	8192	8192	AudioType	US	1	RET	2014-10-27 22:03:20.427761
3732	Audio Sample Format	Registry of DICOM Data Elements	20480	20735	8194	8194	AudioSampleFormat	US	1	RET	2014-10-27 22:03:20.539851
3733	Number of Channels	Registry of DICOM Data Elements	20480	20735	8196	8196	NumberOfChannels	US	1	RET	2014-10-27 22:03:20.543417
3734	Number of Samples	Registry of DICOM Data Elements	20480	20735	8198	8198	NumberOfSamples	UL	1	RET	2014-10-27 22:03:20.54697
3735	Sample Rate	Registry of DICOM Data Elements	20480	20735	8200	8200	SampleRate	UL	1	RET	2014-10-27 22:03:20.658987
3736	Total Time	Registry of DICOM Data Elements	20480	20735	8202	8202	TotalTime	UL	1	RET	2014-10-27 22:03:20.662589
3737	Audio Sample Data	Registry of DICOM Data Elements	20480	20735	8204	8204	AudioSampleData	OB or OW	1	RET	2014-10-27 22:03:20.666186
3738	Audio Comments	Registry of DICOM Data Elements	20480	20735	8206	8206	AudioComments	LT	1	RET	2014-10-27 22:03:20.778012
3739	Curve Label	Registry of DICOM Data Elements	20480	20735	9472	9472	CurveLabel	LO	1	RET	2014-10-27 22:03:20.782115
3740	Curve Referenced Overlay Sequence	Registry of DICOM Data Elements	20480	20735	9728	9728	CurveReferencedOverlaySequence	SQ	1	RET	2014-10-27 22:03:20.785648
3741	Curve Referenced Overlay Group	Registry of DICOM Data Elements	20480	20735	9744	9744	CurveReferencedOverlayGroup	US	1	RET	2014-10-27 22:03:20.897345
3742	Curve Data	Registry of DICOM Data Elements	20480	20735	12288	12288	CurveData	OB or OW	1	RET	2014-10-27 22:03:20.900891
3743	Shared Functional Groups Sequence	Registry of DICOM Data Elements	20992	20992	37417	37417	SharedFunctionalGroupsSequence	SQ	1		2014-10-27 22:03:20.904445
3744	Per-frame Functional Groups Sequence	Registry of DICOM Data Elements	20992	20992	37424	37424	PerFrameFunctionalGroupsSequence	SQ	1		2014-10-27 22:03:20.907988
3745	Waveform Sequence	Registry of DICOM Data Elements	21504	21504	256	256	WaveformSequence	SQ	1		2014-10-27 22:03:21.019697
3746	Channel Minimum Value	Registry of DICOM Data Elements	21504	21504	272	272	ChannelMinimumValue	OB or OW	1		2014-10-27 22:03:21.023228
3747	Channel Maximum Value	Registry of DICOM Data Elements	21504	21504	274	274	ChannelMaximumValue	OB or OW	1		2014-10-27 22:03:21.026665
3748	Waveform Bits Allocated	Registry of DICOM Data Elements	21504	21504	4100	4100	WaveformBitsAllocated	US	1		2014-10-27 22:03:21.138545
3749	Waveform Sample Interpretation	Registry of DICOM Data Elements	21504	21504	4102	4102	WaveformSampleInterpretation	CS	1		2014-10-27 22:03:21.14213
3750	Waveform Padding Value	Registry of DICOM Data Elements	21504	21504	4106	4106	WaveformPaddingValue	OB or OW	1		2014-10-27 22:03:21.146449
3751	Waveform Data	Registry of DICOM Data Elements	21504	21504	4112	4112	WaveformData	OB or OW	1		2014-10-27 22:03:21.258286
3752	First Order Phase Correction Angle	Registry of DICOM Data Elements	22016	22016	16	16	FirstOrderPhaseCorrectionAngle	OF	1		2014-10-27 22:03:21.261836
3753	Spectroscopy Data	Registry of DICOM Data Elements	22016	22016	32	32	SpectroscopyData	OF	1		2014-10-27 22:03:21.265419
3754	Overlay Rows	Registry of DICOM Data Elements	24576	24831	16	16	OverlayRows	US	1		2014-10-27 22:03:21.377175
3755	Overlay Columns	Registry of DICOM Data Elements	24576	24831	17	17	OverlayColumns	US	1		2014-10-27 22:03:21.380875
3756	Overlay Planes	Registry of DICOM Data Elements	24576	24831	18	18	OverlayPlanes	US	1	RET	2014-10-27 22:03:21.384508
3757	Number of Frames in Overlay	Registry of DICOM Data Elements	24576	24831	21	21	NumberOfFramesInOverlay	IS	1		2014-10-27 22:03:21.388087
3758	Overlay Description	Registry of DICOM Data Elements	24576	24831	34	34	OverlayDescription	LO	1		2014-10-27 22:03:21.500041
3759	Overlay Type	Registry of DICOM Data Elements	24576	24831	64	64	OverlayType	CS	1		2014-10-27 22:03:21.503597
3760	Overlay Subtype	Registry of DICOM Data Elements	24576	24831	69	69	OverlaySubtype	LO	1		2014-10-27 22:03:21.507111
3761	Overlay Origin	Registry of DICOM Data Elements	24576	24831	80	80	OverlayOrigin	SS	2		2014-10-27 22:03:21.619706
3762	Image Frame Origin	Registry of DICOM Data Elements	24576	24831	81	81	ImageFrameOrigin	US	1		2014-10-27 22:03:21.623259
3763	Overlay Plane Origin	Registry of DICOM Data Elements	24576	24831	82	82	OverlayPlaneOrigin	US	1	RET	2014-10-27 22:03:21.626828
3764	Overlay Compression Code	Registry of DICOM Data Elements	24576	24831	96	96	OverlayCompressionCode	CS	1	RET	2014-10-27 22:03:21.738603
3765	Overlay Compression Originator	Registry of DICOM Data Elements	24576	24831	97	97	OverlayCompressionOriginator	SH	1	RET	2014-10-27 22:03:21.742148
3766	Overlay Compression Label	Registry of DICOM Data Elements	24576	24831	98	98	OverlayCompressionLabel	SH	1	RET	2014-10-27 22:03:21.745705
3767	Overlay Compression Description	Registry of DICOM Data Elements	24576	24831	99	99	OverlayCompressionDescription	CS	1	RET	2014-10-27 22:03:21.857385
3768	Overlay Compression Step Pointers	Registry of DICOM Data Elements	24576	24831	102	102	OverlayCompressionStepPointers	AT	1-n	RET	2014-10-27 22:03:21.860942
3769	Overlay Repeat Interval	Registry of DICOM Data Elements	24576	24831	104	104	OverlayRepeatInterval	US	1	RET	2014-10-27 22:03:21.864586
3770	Overlay Bits Grouped	Registry of DICOM Data Elements	24576	24831	105	105	OverlayBitsGrouped	US	1	RET	2014-10-27 22:03:21.868197
3771	Overlay Bits Allocated	Registry of DICOM Data Elements	24576	24831	256	256	OverlayBitsAllocated	US	1		2014-10-27 22:03:21.980121
3772	Overlay Bit Position	Registry of DICOM Data Elements	24576	24831	258	258	OverlayBitPosition	US	1		2014-10-27 22:03:21.984264
3773	Overlay Format	Registry of DICOM Data Elements	24576	24831	272	272	OverlayFormat	CS	1	RET	2014-10-27 22:03:21.987737
3774	Overlay Location	Registry of DICOM Data Elements	24576	24831	512	512	OverlayLocation	US	1	RET	2014-10-27 22:03:22.099543
3775	Overlay Code Label	Registry of DICOM Data Elements	24576	24831	2048	2048	OverlayCodeLabel	CS	1-n	RET	2014-10-27 22:03:22.103102
3776	Overlay Number of Tables	Registry of DICOM Data Elements	24576	24831	2050	2050	OverlayNumberOfTables	US	1	RET	2014-10-27 22:03:22.106677
3777	Overlay Code Table Location	Registry of DICOM Data Elements	24576	24831	2051	2051	OverlayCodeTableLocation	AT	1-n	RET	2014-10-27 22:03:22.218592
3778	Overlay Bits For Code Word	Registry of DICOM Data Elements	24576	24831	2052	2052	OverlayBitsForCodeWord	US	1	RET	2014-10-27 22:03:22.22229
3779	Overlay Activation Layer	Registry of DICOM Data Elements	24576	24831	4097	4097	OverlayActivationLayer	CS	1		2014-10-27 22:03:22.225882
3780	Overlay Descriptor - Gray	Registry of DICOM Data Elements	24576	24831	4352	4352	OverlayDescriptorGray	US	1	RET	2014-10-27 22:03:22.337778
3781	Overlay Descriptor - Red	Registry of DICOM Data Elements	24576	24831	4353	4353	OverlayDescriptorRed	US	1	RET	2014-10-27 22:03:22.341483
3782	Overlay Descriptor - Green	Registry of DICOM Data Elements	24576	24831	4354	4354	OverlayDescriptorGreen	US	1	RET	2014-10-27 22:03:22.34664
3783	Overlay Descriptor - Blue	Registry of DICOM Data Elements	24576	24831	4355	4355	OverlayDescriptorBlue	US	1	RET	2014-10-27 22:03:22.458435
3784	Overlays - Gray	Registry of DICOM Data Elements	24576	24831	4608	4608	OverlaysGray	US	1-n	RET	2014-10-27 22:03:22.462173
3785	Overlays - Red	Registry of DICOM Data Elements	24576	24831	4609	4609	OverlaysRed	US	1-n	RET	2014-10-27 22:03:22.46575
3786	Overlays - Green	Registry of DICOM Data Elements	24576	24831	4610	4610	OverlaysGreen	US	1-n	RET	2014-10-27 22:03:22.577417
3787	Overlays - Blue	Registry of DICOM Data Elements	24576	24831	4611	4611	OverlaysBlue	US	1-n	RET	2014-10-27 22:03:22.580975
3788	ROI Area	Registry of DICOM Data Elements	24576	24831	4865	4865	ROIArea	IS	1		2014-10-27 22:03:22.58457
3789	ROI Mean	Registry of DICOM Data Elements	24576	24831	4866	4866	ROIMean	DS	1		2014-10-27 22:03:22.588131
3790	ROI Standard Deviation	Registry of DICOM Data Elements	24576	24831	4867	4867	ROIStandardDeviation	DS	1		2014-10-27 22:03:22.700286
3791	Overlay Label	Registry of DICOM Data Elements	24576	24831	5376	5376	OverlayLabel	LO	1		2014-10-27 22:03:22.703855
3792	Overlay Data	Registry of DICOM Data Elements	24576	24831	12288	12288	OverlayData	OB or OW	1		2014-10-27 22:03:22.707407
3793	Overlay Comments	Registry of DICOM Data Elements	24576	24831	16384	16384	OverlayComments	LT	1	RET	2014-10-27 22:03:22.820035
3794	Pixel Data	Registry of DICOM Data Elements	32736	32736	16	16	PixelData	OB or OW	1		2014-10-27 22:03:22.823684
3795	Coefficients SDVN	Registry of DICOM Data Elements	32736	32736	32	32	CoefficientsSDVN	OW	1	RET	2014-10-27 22:03:22.827218
3796	Coefficients SDHN	Registry of DICOM Data Elements	32736	32736	48	48	CoefficientsSDHN	OW	1	RET	2014-10-27 22:03:22.939102
3797	Coefficients SDDN	Registry of DICOM Data Elements	32736	32736	64	64	CoefficientsSDDN	OW	1	RET	2014-10-27 22:03:22.942658
3798	Variable Pixel Data	Registry of DICOM Data Elements	32512	32767	16	16	VariablePixelData	OB or OW	1	RET	2014-10-27 22:03:22.946228
3799	Variable Next Data Group	Registry of DICOM Data Elements	32512	32767	17	17	VariableNextDataGroup	US	1	RET	2014-10-27 22:03:23.05795
3800	Variable Coefficients SDVN	Registry of DICOM Data Elements	32512	32767	32	32	VariableCoefficientsSDVN	OW	1	RET	2014-10-27 22:03:23.061545
3801	Variable Coefficients SDHN	Registry of DICOM Data Elements	32512	32767	48	48	VariableCoefficientsSDHN	OW	1	RET	2014-10-27 22:03:23.065121
3802	Variable Coefficients SDDN	Registry of DICOM Data Elements	32512	32767	64	64	VariableCoefficientsSDDN	OW	1	RET	2014-10-27 22:03:23.176869
3803	Digital Signatures Sequence	Registry of DICOM Data Elements	65530	65530	65530	65530	DigitalSignaturesSequence	SQ	1		2014-10-27 22:03:23.180548
3804	Data Set Trailing Padding	Registry of DICOM Data Elements	65532	65532	65532	65532	DataSetTrailingPadding	OB	1		2014-10-27 22:03:23.184578
3805	Item	Registry of DICOM Data Elements	65534	65534	57344	57344	Item	See Note 2	1		2014-10-27 22:03:23.18813
3806	Item Delimitation Item	Registry of DICOM Data Elements	65534	65534	57357	57357	ItemDelimitationItem	See Note 2	1		2014-10-27 22:03:23.299927
3807	Sequence Delimitation Item	Registry of DICOM Data Elements	65534	65534	57565	57565	SequenceDelimitationItem	See Note 2	1		2014-10-27 22:03:23.303489
3808	File Meta Information Group Length	Registry of DICOM File Meta Elements	2	2	0	0	FileMetaInformationGroupLength	UL	1		2014-10-27 22:03:23.307038
3809	File Meta Information Version	Registry of DICOM File Meta Elements	2	2	1	1	FileMetaInformationVersion	OB	1		2014-10-27 22:03:23.418833
3810	Media Storage SOP Class UID	Registry of DICOM File Meta Elements	2	2	2	2	MediaStorageSOPClassUID	UI	1		2014-10-27 22:03:23.422413
3811	Media Storage SOP Instance UID	Registry of DICOM File Meta Elements	2	2	3	3	MediaStorageSOPInstanceUID	UI	1		2014-10-27 22:03:23.425967
3812	Transfer Syntax UID	Registry of DICOM File Meta Elements	2	2	16	16	TransferSyntaxUID	UI	1		2014-10-27 22:03:23.537772
3813	Implementation Class UID	Registry of DICOM File Meta Elements	2	2	18	18	ImplementationClassUID	UI	1		2014-10-27 22:03:23.541338
3814	Implementation Version Name	Registry of DICOM File Meta Elements	2	2	19	19	ImplementationVersionName	SH	1		2014-10-27 22:03:23.544898
3815	Source Application Entity Title	Registry of DICOM File Meta Elements	2	2	22	22	SourceApplicationEntityTitle	AE	1		2014-10-27 22:03:23.657087
3816	Sending Application Entity Title	Registry of DICOM File Meta Elements	2	2	23	23	SendingApplicationEntityTitle	AE	1		2014-10-27 22:03:23.660808
3817	Receiving Application Entity Title	Registry of DICOM File Meta Elements	2	2	24	24	ReceivingApplicationEntityTitle	AE	1		2014-10-27 22:03:23.664362
3818	Private Information Creator UID	Registry of DICOM File Meta Elements	2	2	256	256	PrivateInformationCreatorUID	UI	1		2014-10-27 22:03:23.667944
3819	Private Information	Registry of DICOM File Meta Elements	2	2	258	258	PrivateInformation	OB	1		2014-10-27 22:03:23.779928
\.


--
-- Name: data_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dcmdb_user
--

SELECT pg_catalog.setval('data_element_id_seq', 3819, true);


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: dcmdb_user
--

COPY image (id, uid, series_id, filename, transfer_syntax_uid, image_number, image_orientation_patient, image_position_patient, patient_position, content_date, created) FROM stdin;
\.


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dcmdb_user
--

SELECT pg_catalog.setval('image_id_seq', 1, false);


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: dcmdb_user
--

COPY series (id, uid, study_id, modality, description, institution_name, manufacturer, series_number, body_part_examined, laterality, series_date, created) FROM stdin;
\.


--
-- Name: series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dcmdb_user
--

SELECT pg_catalog.setval('series_id_seq', 1, false);


--
-- Data for Name: study; Type: TABLE DATA; Schema: public; Owner: dcmdb_user
--

COPY study (id, uid, study_id, sop_class_uid, study_date, accession_number, description, created) FROM stdin;
\.


--
-- Name: study_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dcmdb_user
--

SELECT pg_catalog.setval('study_id_seq', 1, false);


--
-- Name: data_element_pkey; Type: CONSTRAINT; Schema: public; Owner: dcmdb_user; Tablespace: 
--

ALTER TABLE ONLY data_element
    ADD CONSTRAINT data_element_pkey PRIMARY KEY (id);


--
-- Name: image_pkey; Type: CONSTRAINT; Schema: public; Owner: dcmdb_user; Tablespace: 
--

ALTER TABLE ONLY image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);


--
-- Name: series_pkey; Type: CONSTRAINT; Schema: public; Owner: dcmdb_user; Tablespace: 
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_pkey PRIMARY KEY (id);


--
-- Name: study_pkey; Type: CONSTRAINT; Schema: public; Owner: dcmdb_user; Tablespace: 
--

ALTER TABLE ONLY study
    ADD CONSTRAINT study_pkey PRIMARY KEY (id);


--
-- Name: image_series_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dcmdb_user
--

ALTER TABLE ONLY image
    ADD CONSTRAINT image_series_id_fkey FOREIGN KEY (series_id) REFERENCES series(id);


--
-- Name: series_study_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: dcmdb_user
--

ALTER TABLE ONLY series
    ADD CONSTRAINT series_study_id_fkey FOREIGN KEY (study_id) REFERENCES study(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

