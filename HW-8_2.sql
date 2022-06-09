--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: book_status; Type: TYPE; Schema: public; Owner: gb_user
--

CREATE TYPE public.book_status AS ENUM (
    'standing_by',
    'in_work',
    'in_archive'
);


ALTER TYPE public.book_status OWNER TO gb_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    middle_name character varying(50),
    phone character varying(15) NOT NULL,
    email character varying(50)
);


ALTER TABLE public.authors OWNER TO gb_user;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO gb_user;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    book_format_id integer NOT NULL,
    authors_wishes character varying(255) NOT NULL,
    status public.book_status
);


ALTER TABLE public.books OWNER TO gb_user;

--
-- Name: books_authors; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.books_authors (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.books_authors OWNER TO gb_user;

--
-- Name: books_authors_author_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.books_authors_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_authors_author_id_seq OWNER TO gb_user;

--
-- Name: books_authors_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.books_authors_author_id_seq OWNED BY public.books_authors.author_id;


--
-- Name: books_authors_book_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.books_authors_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_authors_book_id_seq OWNER TO gb_user;

--
-- Name: books_authors_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.books_authors_book_id_seq OWNED BY public.books_authors.book_id;


--
-- Name: books_files; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.books_files (
    book_id integer NOT NULL,
    manuscript character varying(150) NOT NULL,
    interim_version character varying(150) NOT NULL,
    finished_version character varying(150) NOT NULL
);


ALTER TABLE public.books_files OWNER TO gb_user;

--
-- Name: books_files_book_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.books_files_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_files_book_id_seq OWNER TO gb_user;

--
-- Name: books_files_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.books_files_book_id_seq OWNED BY public.books_files.book_id;


--
-- Name: books_formats; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.books_formats (
    id integer NOT NULL,
    book_format character(20)
);


ALTER TABLE public.books_formats OWNER TO gb_user;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO gb_user;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: deadlines; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.deadlines (
    production_id integer NOT NULL,
    start_date date,
    interim_date date,
    finish_date date
);


ALTER TABLE public.deadlines OWNER TO gb_user;

--
-- Name: deadlines_production_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.deadlines_production_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deadlines_production_id_seq OWNER TO gb_user;

--
-- Name: deadlines_production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.deadlines_production_id_seq OWNED BY public.deadlines.production_id;


--
-- Name: output_information; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.output_information (
    book_id integer NOT NULL,
    isbn_or_issn character varying(13),
    order_number integer,
    conv_print_sheets numeric(5,2),
    publishing_sheets numeric(5,2),
    publishing_date date
);


ALTER TABLE public.output_information OWNER TO gb_user;

--
-- Name: output_information_book_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.output_information_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.output_information_book_id_seq OWNER TO gb_user;

--
-- Name: output_information_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.output_information_book_id_seq OWNED BY public.output_information.book_id;


--
-- Name: production; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.production (
    id integer NOT NULL,
    book_id integer NOT NULL,
    staff_id integer NOT NULL
);


ALTER TABLE public.production OWNER TO gb_user;

--
-- Name: production_book_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.production_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.production_book_id_seq OWNER TO gb_user;

--
-- Name: production_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.production_book_id_seq OWNED BY public.production.book_id;


--
-- Name: production_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.production_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.production_id_seq OWNER TO gb_user;

--
-- Name: production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.production_id_seq OWNED BY public.production.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.profiles (
    id integer NOT NULL,
    staff_id integer,
    date_of_birth date,
    education character varying(100),
    started_at date,
    address character varying(100)
);


ALTER TABLE public.profiles OWNER TO gb_user;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO gb_user;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: staff; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    position_id integer,
    profile_id integer
);


ALTER TABLE public.staff OWNER TO gb_user;

--
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO gb_user;

--
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- Name: staff_positions; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.staff_positions (
    id integer NOT NULL,
    "position" character varying(15)
);


ALTER TABLE public.staff_positions OWNER TO gb_user;

--
-- Name: staff_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.staff_positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staff_positions_id_seq OWNER TO gb_user;

--
-- Name: staff_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.staff_positions_id_seq OWNED BY public.staff_positions.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: books_authors book_id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.books_authors ALTER COLUMN book_id SET DEFAULT nextval('public.books_authors_book_id_seq'::regclass);


--
-- Name: books_authors author_id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.books_authors ALTER COLUMN author_id SET DEFAULT nextval('public.books_authors_author_id_seq'::regclass);


--
-- Name: books_files book_id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.books_files ALTER COLUMN book_id SET DEFAULT nextval('public.books_files_book_id_seq'::regclass);


--
-- Name: deadlines production_id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.deadlines ALTER COLUMN production_id SET DEFAULT nextval('public.deadlines_production_id_seq'::regclass);


--
-- Name: output_information book_id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.output_information ALTER COLUMN book_id SET DEFAULT nextval('public.output_information_book_id_seq'::regclass);


--
-- Name: production id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.production ALTER COLUMN id SET DEFAULT nextval('public.production_id_seq'::regclass);


--
-- Name: production book_id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.production ALTER COLUMN book_id SET DEFAULT nextval('public.production_book_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- Name: staff_positions id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.staff_positions ALTER COLUMN id SET DEFAULT nextval('public.staff_positions_id_seq'::regclass);


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.authors (id, first_name, last_name, middle_name, phone, email) FROM stdin;
1	Cindi	Cecchi	Arda	178-101-4335	acecchi0@cargocollective.com
2	Cal	Leming	Izzy	224-211-9177	ileming1@bbc.co.uk
3	Kiri	Dies	Clyve	506-494-9547	cdies2@desdev.cn
4	Sallie	Antoszczyk	Verene	656-186-3696	vantoszczyk3@g.co
5	Kanya	Ramalho	Ervin	195-110-2467	eramalho4@dell.com
6	Mandie	Cayley	Linzy	482-398-5587	lcayley5@typepad.com
7	Guthry	Dansie	Bethena	417-521-2845	bdansie6@slideshare.net
8	Veronike	Grishagin	Tiphanie	124-613-9524	tgrishagin7@comcast.net
9	Obed	Dupree	Brigham	900-483-6093	bdupree8@wordpress.com
10	Charisse	Realy	Lenore	345-126-9207	lrealy9@prnewswire.com
11	Nat	Belchamber	Theadora	988-252-1835	tbelchambera@abc.net.au
12	Roxie	Sheal	Tommi	275-680-4219	tshealb@upenn.edu
13	Newton	Baythorp	Luciana	559-448-6071	lbaythorpc@irs.gov
14	Pierre	Treadger	Rebecca	603-601-1997	rtreadgerd@github.io
15	Mackenzie	Ginger	Aurore	217-640-9527	agingere@theglobeandmail.com
16	Darcee	Almon	Beilul	738-915-0017	balmonf@goo.ne.jp
17	Emery	Woodwind	Demetrius	516-935-1650	dwoodwindg@jugem.jp
18	Vi	Briddock	Gabbie	681-727-5258	gbriddockh@ebay.com
19	Kayla	Snalom	Babette	996-796-3016	bsnalomi@paginegialle.it
20	Lorne	Really	Mellie	601-612-5093	mreallyj@xing.com
21	Vittorio	Garroch	Herminia	305-813-1818	hgarrochk@google.com.hk
22	Chico	Matthai	Chris	864-754-1429	cmatthail@ebay.co.uk
23	Gearard	Fuke	Dotty	433-791-3810	dfukem@i2i.jp
24	Mable	O' Concannon	Marcos	782-203-1350	moconcannonn@joomla.org
25	Carola	Harwick	Tamqrah	548-505-4584	tharwicko@gov.uk
26	Rosamond	Leel	Isis	891-627-3142	ileelp@ning.com
27	Anson	Winney	Natal	207-332-5793	nwinneyq@statcounter.com
28	Arny	Mallison	Estrella	101-212-4820	emallisonr@artisteer.com
29	Silvan	Antognozzii	Thornton	650-434-7200	tantognozziis@csmonitor.com
30	Jaimie	Ferrarini	Aeriela	995-384-7063	aferrarinit@phpbb.com
31	Teddie	Forde	Kleon	539-495-4164	kfordeu@xinhuanet.com
32	Aguste	Apps	Ezmeralda	445-291-4293	eappsv@nyu.edu
33	Torin	Woodrup	Omar	868-326-1985	owoodrupw@dedecms.com
34	Sapphira	Ellacott	Cristiano	624-101-4388	cellacottx@devhub.com
35	Cariotta	Morphey	Mair	555-300-7008	mmorpheyy@themeforest.net
36	Byrle	Castelletti	Alan	333-759-4305	acastellettiz@nature.com
37	Cosme	Weston	Ofilia	835-163-1549	oweston10@1688.com
38	Abra	Fuchs	Patricia	343-228-9437	pfuchs11@alibaba.com
39	Orel	McCauley	Augy	192-808-3001	amccauley12@cbsnews.com
40	Radcliffe	True	Boy	564-351-8154	btrue13@sciencedirect.com
41	Wendie	Scalia	Currie	167-620-9595	cscalia14@macromedia.com
42	Danny	Gathercole	Elia	668-501-3019	egathercole15@miibeian.gov.cn
43	Auguste	Norkett	Tracee	714-796-0631	tnorkett16@yelp.com
44	Kahaleel	Surman	Lonni	819-486-1645	lsurman17@dailymotion.com
45	Megan	Chappell	Ugo	673-129-5709	uchappell18@state.tx.us
46	Sherwin	Chappel	Sinclare	789-441-8583	schappel19@google.ru
47	Regan	Grannell	Vivianne	501-527-8159	vgrannell1a@toplist.cz
48	Bone	Ealden	Hildagarde	399-358-5530	healden1b@shinystat.com
49	Albertina	Trayling	Abdul	154-940-4512	atrayling1c@google.com
50	Dimitri	Amos	Rosalinde	387-880-3210	ramos1d@shareasale.com
51	Natalee	Jumeau	Kylie	538-152-2703	kjumeau1e@behance.net
52	Robena	Kryszkiecicz	Kania	966-287-7408	kkryszkiecicz1f@phpbb.com
53	Demetra	Brownstein	Orion	819-473-8116	obrownstein1g@bloglovin.com
54	Sigmund	Gotthard.sf	Port	991-255-1252	pgotthardsf1h@sfgate.com
55	Ax	Dwire	Alexandre	629-859-6613	adwire1i@hugedomains.com
56	Marketa	Scotchmor	Ava	363-657-2982	ascotchmor1j@webs.com
57	Sophia	Pickwell	Cristen	243-635-3013	cpickwell1k@ezinearticles.com
58	Raven	Kayne	Ingar	484-559-5424	ikayne1l@xing.com
59	Konstantin	Pottberry	Wendall	938-995-5432	wpottberry1m@virginia.edu
60	Suki	Sprackling	Leonanie	455-763-2467	lsprackling1n@bizjournals.com
61	Finn	Staines	Geoffry	593-704-0687	gstaines1o@e-recht24.de
62	Ellene	Passler	Jada	724-241-3560	jpassler1p@ezinearticles.com
63	Read	Staples	Eliza	861-935-1654	estaples1q@google.ca
64	Wittie	Thys	Lorne	354-848-1749	lthys1r@blog.com
65	Karilynn	Freke	Carlo	511-728-9565	cfreke1s@utexas.edu
66	Welch	Dargavel	Duff	110-926-3817	ddargavel1t@hibu.com
67	Ed	Kefford	Maison	171-194-9274	mkefford1u@about.me
68	Freeland	Letten	Netta	167-430-4886	nletten1v@github.com
69	Shaine	Nerger	Karisa	886-783-9122	knerger1w@google.ru
70	Norine	Exell	Kaylee	680-204-7477	kexell1x@bing.com
71	Malory	Line	Bette-ann	595-514-1133	bline1y@cpanel.net
72	Sallyann	Critchley	Harold	779-492-5936	hcritchley1z@google.ru
73	Loydie	McKeand	Melody	244-122-7081	mmckeand20@globo.com
74	Marian	Mosco	Felicio	866-759-4197	fmosco21@state.tx.us
75	Janey	Fetter	Malcolm	597-788-8224	mfetter22@spotify.com
76	Shurlock	Swan	Gherardo	848-715-7712	gswan23@wordpress.org
77	Dede	Ilyuchyov	Abraham	276-191-0645	ailyuchyov24@yale.edu
78	Marlyn	Lyal	Thedrick	783-215-3699	tlyal25@flavors.me
79	Nadia	Kopje	Archibaldo	179-243-0061	akopje26@usgs.gov
80	Ferne	Kibbel	Leanora	334-865-4495	lkibbel27@1und1.de
81	Edithe	Dedenham	Krishnah	665-128-0780	kdedenham28@people.com.cn
82	Bailey	Filipowicz	Giustina	225-409-0978	gfilipowicz29@feedburner.com
83	Winfield	Moreinis	Nathanael	512-618-5289	nmoreinis2a@ucla.edu
84	Branden	Pipping	Dante	671-950-5518	dpipping2b@google.it
85	Tibold	Willson	Fulvia	843-638-4314	fwillson2c@google.de
86	Denny	Sore	Wainwright	316-609-9890	wsore2d@seattletimes.com
87	Sunny	Heliet	Kinnie	355-135-7623	kheliet2e@blogtalkradio.com
88	Justin	Metson	Normy	140-243-4167	nmetson2f@cnn.com
89	Thea	Akrigg	Faulkner	869-623-6930	fakrigg2g@flavors.me
90	Laurel	Hesser	Urson	420-157-0786	uhesser2h@nps.gov
91	Emma	Mewes	Hagan	598-337-1524	hmewes2i@tripadvisor.com
92	Vonny	Darby	Waylin	771-508-5662	wdarby2j@infoseek.co.jp
93	Jorie	Sturt	Pam	735-417-3325	psturt2k@tripadvisor.com
94	Enrica	Dilke	Tobye	319-895-6853	tdilke2l@uiuc.edu
95	Chris	Ravenhills	Anatola	453-670-1124	aravenhills2m@friendfeed.com
96	Evey	Demann	Dulcy	658-624-2170	ddemann2n@walmart.com
97	Kaycee	Cholton	Cecile	336-130-4094	ccholton2o@cbslocal.com
98	Joann	Thurber	Kamilah	627-657-1639	kthurber2p@npr.org
99	Colleen	Pattisson	Kennith	816-901-2167	kpattisson2q@blogspot.com
100	Cobby	Burle	Alyson	465-646-5022	aburle2r@meetup.com
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.books (id, title, book_format_id, authors_wishes, status) FROM stdin;
1	Into the Woods	5	in quis justo maecenas rhoncus aliquam lacus morbi quis tortor id nulla	in_archive
2	Won Ton Ton: The Dog Who Saved Hollywood	6	turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan	in_archive
3	Kickboxer	8	proin eu mi nulla ac enim in tempor turpis nec euismod	in_archive
4	Common Man, A	5	etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa id	in_work
5	Grimm Love (Rohtenburg)	3	faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec	in_archive
6	Snows of Kilimanjaro, The (Neiges du Kilimandjaro, Les)	9	erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu	in_work
7	Gertie the Dinosaur	8	duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus	in_archive
8	Tom Horn	10	luctus rutrum nulla tellus in sagittis dui vel nisl duis	standing_by
9	Creation	2	nam congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend	standing_by
10	Feeding Frenzy	9	eu mi nulla ac enim in tempor turpis nec euismod scelerisque	standing_by
11	Wallace & Gromit: The Best of Aardman Animation	8	erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam	in_archive
12	Unmistaken Child	9	et ultrices posuere cubilia curae mauris viverra diam vitae quam	standing_by
13	In a Lonely Place	5	nam congue risus semper porta volutpat quam pede lobortis ligula sit	in_work
14	Dodes'ka-den (Clickety-Clack)	4	nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida	standing_by
15	Ray Harryhausen: Special Effects Titan	3	enim in tempor turpis nec euismod scelerisque quam turpis adipiscing lorem vitae mattis	standing_by
16	Veronika Decides to Die	6	magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus	in_archive
17	Franz Kafka's a Country Doctor	4	augue luctus tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at	in_archive
18	Diaries of Vaslav Nijinsky, The	7	sit amet erat nulla tempus vivamus in felis eu sapien cursus vestibulum proin eu	standing_by
19	Peacekeeper, The	2	proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque quam turpis adipiscing	standing_by
20	Sound City	7	lectus pellentesque eget nunc donec quis orci eget orci vehicula condimentum curabitur in libero	in_work
21	Langoliers, The	5	posuere cubilia curae mauris viverra diam vitae quam suspendisse potenti nullam porttitor lacus at turpis	in_archive
22	I Am the Law	7	imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed	in_archive
23	Tales from the Organ Trade	5	in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae	in_work
24	Road Home, The (Wo de fu qin mu qin)	9	lacus morbi quis tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus nec	in_work
25	Modigliani	1	volutpat dui maecenas tristique est et tempus semper est quam	in_archive
26	Hot Tub Time Machine	10	duis faucibus accumsan odio curabitur convallis duis consequat dui nec nisi	standing_by
27	Heights	3	ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo	in_archive
28	Bread and Roses	4	ut volutpat sapien arcu sed augue aliquam erat volutpat in congue	in_archive
29	LennoNYC	3	in hac habitasse platea dictumst maecenas ut massa quis augue luctus	in_work
30	Wedding Song, The 	4	vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum	in_work
31	The True Story of Puss 'n Boots	4	congue risus semper porta volutpat quam pede lobortis ligula sit	standing_by
32	How to Stuff a Wild Bikini	7	iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut	standing_by
33	Code 46	7	suscipit nulla elit ac nulla sed vel enim sit amet nunc viverra	in_archive
34	Quiet City	4	sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui	in_archive
35	Prince of the City	1	lobortis sapien sapien non mi integer ac neque duis bibendum	standing_by
36	Star Trek II: The Wrath of Khan	7	in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed	in_work
37	Loving Story, The	8	dui vel sem sed sagittis nam congue risus semper porta volutpat quam pede lobortis ligula	in_archive
38	Mafioso	3	vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id	standing_by
39	Fog Over Frisco	8	pellentesque ultrices mattis odio donec vitae nisi nam ultrices libero non mattis	in_archive
40	Albuquerque	3	felis eu sapien cursus vestibulum proin eu mi nulla ac enim	standing_by
41	I Hope They Serve Beer in Hell	10	sit amet consectetuer adipiscing elit proin interdum mauris non ligula pellentesque ultrices	in_archive
42	Kickboxer 3: The Art of War (Kickboxer III: The Art of War)	7	pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper	standing_by
43	G.I. Joe: The Rise of Cobra	2	at vulputate vitae nisl aenean lectus pellentesque eget nunc donec quis orci eget orci	in_work
44	Oxygen	5	placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede	in_archive
45	41-Year-Old Virgin Who Knocked Up Sarah Marshall and Felt Superbad About It, The	8	sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean	standing_by
46	Thr3e (Three)	5	urna ut tellus nulla ut erat id mauris vulputate elementum	standing_by
47	Twist of Faith	1	et tempus semper est quam pharetra magna ac consequat metus sapien	standing_by
48	Any Day Now	1	sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet	standing_by
49	What's the Matter with Helen?	6	donec ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies	standing_by
50	Hard to Be a God	7	viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien	in_archive
51	The Tomb	7	luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum	standing_by
52	Heathcliff: The Movie	3	consequat varius integer ac leo pellentesque ultrices mattis odio donec vitae nisi nam	in_archive
53	Billy Liar	2	placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris	in_archive
54	National Gallery	6	vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id	standing_by
55	S. Darko (S. Darko: A Donnie Darko Tale)	9	vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem praesent id massa	in_archive
56	Forest for the Trees, The (Der Wald vor lauter Bäumen)	3	quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst aliquam augue	in_work
57	Black Angel	3	lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin at	standing_by
58	Indiscreet	7	eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet	in_archive
59	Unearthly, The	3	convallis duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus	in_work
60	3 on a Couch (Three on a Couch)	6	velit vivamus vel nulla eget eros elementum pellentesque quisque porta volutpat	in_archive
61	Boys	7	blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci	standing_by
62	Rush Hour 3	3	in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat	standing_by
63	The Kiss	10	iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut	in_archive
64	Ballermann 6	10	lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh in	in_archive
65	6ixtynin9 (Ruang Talok 69)	9	imperdiet et commodo vulputate justo in blandit ultrices enim lorem ipsum dolor sit amet consectetuer	in_work
66	Fifty-Fifty (a.k.a. Schizo) (Shiza)	1	eget orci vehicula condimentum curabitur in libero ut massa volutpat convallis morbi	in_archive
67	Honeymoons	1	metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit amet	in_work
68	Archangel	8	ante vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere	in_archive
69	The Divine Woman	2	et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec	standing_by
70	Dinotopia	3	potenti nullam porttitor lacus at turpis donec posuere metus vitae ipsum aliquam non mauris	in_work
71	Little Secrets	3	volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium	in_work
72	Hidden Assassin (Shooter, The)	1	convallis eget eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum	in_work
73	Tom at the Farm (Tom à la ferme)	10	ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna	in_archive
74	3 Sailors and a Girl (Three Sailors and a Girl)	5	etiam faucibus cursus urna ut tellus nulla ut erat id	in_work
75	I Got Next	6	sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor	in_archive
76	Preacher, The (De dominee)	6	iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque	in_archive
77	Cyberjack (Virtual Assassin)	2	vehicula condimentum curabitur in libero ut massa volutpat convallis morbi odio odio elementum eu interdum	in_archive
78	Peacock	9	velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium	in_archive
79	Children of Hiroshima (Gembaku no ko)	2	massa volutpat convallis morbi odio odio elementum eu interdum eu tincidunt in leo	standing_by
80	She	3	rutrum at lorem integer tincidunt ante vel ipsum praesent blandit lacinia	in_work
81	Romance & Cigarettes	3	in sapien iaculis congue vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean	standing_by
82	Get Smart	6	pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla	in_work
83	Get Real	7	duis consequat dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam	in_work
84	Addicted to Love	4	accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit	in_work
85	Committed	8	venenatis turpis enim blandit mi in porttitor pede justo eu massa donec	in_archive
86	Business as Usual	6	nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna	in_work
87	Girl from Monday, The	9	accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas	standing_by
88	Celebrity	5	in felis donec semper sapien a libero nam dui proin leo odio porttitor id	in_work
89	Angel on My Shoulder	6	dui maecenas tristique est et tempus semper est quam pharetra magna	in_work
90	Hitting Home	9	pellentesque ultrices phasellus id sapien in sapien iaculis congue vivamus	standing_by
91	Can't Help Singing	7	pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo	standing_by
92	Christmas Story, A	8	nisl duis ac nibh fusce lacus purus aliquet at feugiat non pretium quis lectus	in_work
93	Joe the King	4	sapien placerat ante nulla justo aliquam quis turpis eget elit	in_archive
94	Necessary War, The	8	nullam sit amet turpis elementum ligula vehicula consequat morbi a ipsum integer a nibh in	in_work
95	Ladrón que roba a ladrón	10	mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus ultricies eu	standing_by
96	Day's Pleasure, A (Ford Story, A)	6	ut massa volutpat convallis morbi odio odio elementum eu interdum eu	in_archive
97	Journey, The (El viaje)	5	vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae	standing_by
98	One Nine Nine Four	6	nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis	in_archive
99	Blue	1	in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum	in_archive
100	Brother's War	5	praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit	in_work
\.


--
-- Data for Name: books_authors; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.books_authors (book_id, author_id) FROM stdin;
67	38
26	99
15	82
36	7
93	65
34	51
75	44
2	33
24	7
72	45
53	72
16	10
74	97
45	45
90	99
36	40
9	30
8	70
14	26
82	30
32	86
52	7
62	42
56	82
8	55
4	35
66	46
44	47
66	100
49	42
32	98
64	82
31	90
2	3
72	75
71	36
91	63
58	27
12	83
59	86
36	100
10	56
97	83
92	18
80	55
3	72
73	7
80	45
48	95
39	31
77	61
100	83
42	81
73	14
58	19
44	34
22	70
10	37
49	88
20	34
43	15
37	6
56	90
9	90
34	3
71	33
63	26
95	81
47	41
86	19
71	70
25	77
21	68
19	78
56	9
63	78
55	13
10	23
94	52
30	55
69	2
13	77
83	4
56	98
100	9
46	84
60	51
94	13
32	27
87	10
72	72
70	81
2	86
28	37
67	45
3	8
5	35
91	87
26	23
10	83
\.


--
-- Data for Name: books_files; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.books_files (book_id, manuscript, interim_version, finished_version) FROM stdin;
19	/eu/mi/nulla.html	/suspendisse.json	/elit/proin/risus/praesent/lectus/vestibulum.xml
95	/vitae/mattis.html	/dui/maecenas/tristique/est.json	/tristique.png
92	/a/feugiat/et/eros.js	/sociis/natoque.png	/non/quam/nec/dui.js
88	/at/vulputate/vitae/nisl.json	/blandit.aspx	/ligula/in/lacus/curabitur/at/ipsum.jpg
31	/luctus/cum/sociis/natoque/penatibus/et.html	/porttitor/lorem/id/ligula/suspendisse.json	/erat/curabitur/gravida/nisi/at.xml
12	/sem/fusce/consequat/nulla/nisl/nunc.js	/sapien/quis/libero/nullam.html	/dui/nec/nisi/volutpat/eleifend.png
84	/tristique.js	/magna/vestibulum/aliquet.js	/morbi/non/quam/nec/dui/luctus.jpg
64	/eget/congue/eget/semper/rutrum/nulla.js	/nec.jsp	/nec.json
62	/vel/pede/morbi/porttitor/lorem/id.json	/dictumst/morbi/vestibulum/velit/id/pretium.aspx	/dolor/morbi/vel/lectus/in/quam.html
95	/orci/pede/venenatis/non/sodales/sed.jsp	/enim/lorem/ipsum/dolor/sit.json	/volutpat/eleifend/donec/ut.png
30	/venenatis.json	/cras/mi/pede/malesuada/in/imperdiet/et.jpg	/nibh/fusce/lacus/purus/aliquet/at/feugiat.html
72	/eros/suspendisse/accumsan/tortor/quis.png	/ut/suscipit.aspx	/porttitor/lorem/id/ligula/suspendisse/ornare/consequat.jsp
46	/volutpat/eleifend/donec/ut/dolor/morbi/vel.html	/eu/felis/fusce/posuere/felis.png	/donec/vitae/nisi/nam/ultrices/libero/non.png
91	/imperdiet/et.html	/augue.aspx	/mauris/non/ligula/pellentesque.json
32	/rutrum/nulla/nunc/purus/phasellus.html	/libero.jpg	/elementum.js
81	/felis/sed/interdum/venenatis.html	/nisl/duis/bibendum.js	/leo/odio/porttitor/id/consequat/in/consequat.html
75	/vivamus/vel/nulla/eget/eros/elementum.jsp	/tempus/vel.jpg	/curabitur/in/libero.xml
79	/ante.jsp	/aenean/sit/amet/justo/morbi.xml	/augue/vestibulum/rutrum/rutrum/neque/aenean.jsp
56	/nulla.json	/donec/dapibus/duis/at/velit/eu/est.html	/orci/vehicula/condimentum/curabitur/in.png
89	/ut/erat/curabitur/gravida/nisi/at/nibh.xml	/luctus/ultricies.xml	/tellus.aspx
80	/pede/malesuada.jsp	/duis/at/velit/eu.aspx	/praesent/blandit/lacinia/erat/vestibulum/sed/magna.js
57	/aliquet/ultrices/erat.json	/rutrum/at/lorem.html	/vestibulum/ante.png
61	/duis.xml	/magnis/dis/parturient/montes/nascetur.jsp	/neque/vestibulum/eget/vulputate.xml
73	/at/turpis/donec/posuere.json	/mus/vivamus/vestibulum/sagittis.html	/metus/sapien/ut/nunc/vestibulum.jsp
21	/pulvinar/nulla/pede.aspx	/ultrices/posuere/cubilia/curae/donec/pharetra/magna.html	/ac/enim/in/tempor/turpis.aspx
66	/orci/eget/orci/vehicula/condimentum/curabitur.aspx	/viverra/dapibus/nulla/suscipit/ligula.jpg	/sit/amet/sapien.html
22	/ipsum.aspx	/augue/aliquam/erat.jsp	/mi/nulla/ac/enim/in/tempor/turpis.json
10	/erat/curabitur/gravida/nisi.html	/nisi.html	/libero/nullam/sit/amet.xml
61	/quis/justo.aspx	/penatibus/et/magnis/dis/parturient/montes/nascetur.jsp	/magna/bibendum/imperdiet/nullam/orci/pede.xml
48	/dictumst.jsp	/tempus/vel.json	/eget/elit/sodales/scelerisque.aspx
88	/felis/donec/semper/sapien.aspx	/congue/diam/id/ornare/imperdiet.json	/justo/morbi/ut/odio.jsp
5	/justo/lacinia.json	/massa/id.json	/tempus/sit/amet.png
42	/enim.xml	/suspendisse/accumsan/tortor/quis/turpis/sed/ante.aspx	/pulvinar/sed/nisl/nunc/rhoncus.jpg
70	/molestie/nibh/in/lectus.js	/nulla/suspendisse/potenti/cras/in/purus.html	/integer/a/nibh.aspx
77	/iaculis/diam/erat.xml	/nunc/proin.json	/vulputate/nonummy/maecenas/tincidunt/lacus/at/velit.aspx
58	/in/tempor/turpis/nec/euismod.json	/augue/vestibulum/ante/ipsum/primis/in/faucibus.png	/aliquam/lacus/morbi/quis/tortor/id/nulla.js
29	/luctus/et.aspx	/eros/vestibulum.xml	/blandit/mi/in/porttitor/pede/justo.json
47	/pellentesque/viverra.png	/nisl/duis/ac.html	/quis/odio.js
65	/vel/nisl/duis/ac.json	/potenti/cras/in/purus/eu.jsp	/integer/ac/neque/duis/bibendum/morbi.png
96	/vestibulum/vestibulum.jsp	/ridiculus/mus.jpg	/natoque/penatibus/et/magnis.js
37	/nulla/facilisi/cras.js	/consectetuer/adipiscing/elit.png	/adipiscing/lorem/vitae/mattis/nibh/ligula/nec.json
69	/volutpat/quam/pede/lobortis/ligula/sit.png	/in/hac/habitasse/platea/dictumst/maecenas.png	/eu/nibh/quisque.js
100	/tortor/quis/turpis/sed/ante/vivamus/tortor.jpg	/sed/vel/enim/sit/amet/nunc.xml	/ligula/nec/sem/duis.png
84	/ipsum/ac.png	/vulputate/elementum/nullam/varius/nulla.json	/purus/eu/magna/vulputate.json
24	/auctor/gravida/sem/praesent/id/massa/id.png	/iaculis/justo/in/hac/habitasse/platea/dictumst.png	/risus/praesent/lectus/vestibulum/quam.xml
76	/in/tempor/turpis/nec/euismod/scelerisque/quam.json	/in/imperdiet.xml	/eu/felis/fusce/posuere/felis/sed/lacus.jsp
29	/ultrices/posuere/cubilia/curae.jpg	/mattis/odio/donec/vitae/nisi/nam.jsp	/congue/vivamus/metus/arcu/adipiscing.js
62	/suspendisse.xml	/tellus/semper/interdum.aspx	/ultrices/erat/tortor.html
58	/ligula/nec/sem/duis.jpg	/proin/eu.jsp	/integer.jpg
87	/penatibus/et/magnis/dis/parturient/montes.jsp	/nibh/quisque/id.png	/nascetur/ridiculus.js
15	/tincidunt/eu/felis.png	/interdum/mauris/ullamcorper.jsp	/nam/nulla/integer/pede/justo.png
93	/dis/parturient.jpg	/nunc/viverra.aspx	/ligula/suspendisse/ornare/consequat/lectus/in/est.jsp
30	/pellentesque/ultrices/phasellus/id/sapien.png	/cum/sociis/natoque/penatibus/et/magnis/dis.js	/massa/volutpat.js
3	/maecenas/rhoncus/aliquam.js	/orci/vehicula/condimentum/curabitur/in/libero.json	/mus/etiam/vel/augue/vestibulum/rutrum.aspx
16	/sed/tincidunt/eu/felis.aspx	/eleifend/luctus/ultricies/eu/nibh/quisque/id.xml	/suscipit/nulla.jpg
65	/et/eros/vestibulum.xml	/sed.jsp	/vel/accumsan/tellus/nisi/eu.png
4	/turpis/nec/euismod/scelerisque/quam/turpis/adipiscing.js	/orci/luctus/et/ultrices/posuere.xml	/risus/auctor/sed/tristique/in/tempus/sit.html
44	/libero.aspx	/amet/erat/nulla/tempus.js	/proin/interdum/mauris/non/ligula.xml
75	/sapien/cursus/vestibulum/proin/eu/mi/nulla.json	/venenatis.jpg	/id/nulla/ultrices/aliquet/maecenas/leo/odio.html
93	/blandit/mi.json	/sapien/cum/sociis/natoque/penatibus.jsp	/venenatis/turpis/enim/blandit/mi/in/porttitor.aspx
9	/velit/id/pretium/iaculis/diam.js	/quis/orci/eget.jpg	/urna/ut/tellus.aspx
81	/semper/interdum/mauris/ullamcorper/purus/sit.jpg	/quis/turpis.xml	/turpis/nec/euismod/scelerisque/quam.png
79	/praesent.png	/ut/nunc/vestibulum/ante/ipsum/primis.aspx	/amet/consectetuer/adipiscing/elit/proin.js
89	/donec/dapibus/duis/at.jpg	/sapien/cum/sociis/natoque/penatibus/et.jsp	/placerat/ante/nulla/justo.jpg
93	/non/mauris/morbi/non/lectus.json	/in/magna/bibendum/imperdiet/nullam/orci.jpg	/mauris/enim/leo.jpg
3	/sagittis/dui/vel.js	/sapien/in/sapien/iaculis/congue/vivamus.html	/ut/erat/curabitur/gravida/nisi.html
35	/in/quis/justo/maecenas/rhoncus/aliquam/lacus.xml	/lacinia/erat/vestibulum.js	/id/consequat/in/consequat.png
66	/sagittis.html	/dui.json	/odio/consequat.aspx
41	/donec/pharetra/magna/vestibulum/aliquet.html	/et/eros/vestibulum/ac.js	/posuere/metus/vitae/ipsum.aspx
34	/penatibus/et/magnis.html	/at/nulla/suspendisse.json	/sed/tristique/in/tempus/sit/amet/sem.xml
48	/dictumst/aliquam/augue/quam/sollicitudin/vitae.html	/lacus.jsp	/nec/condimentum/neque/sapien.aspx
77	/sed/accumsan.jsp	/sem/mauris/laoreet.jsp	/ipsum/primis.xml
51	/lectus/suspendisse/potenti.html	/non/interdum/in.xml	/lectus/in.jsp
28	/justo/sollicitudin/ut/suscipit.aspx	/molestie/hendrerit/at/vulputate.jsp	/non/velit.png
74	/aenean/sit/amet/justo/morbi/ut.jpg	/etiam.html	/morbi/vel.jsp
97	/nullam/orci.aspx	/elit/ac/nulla/sed/vel/enim.jpg	/sapien/sapien/non.json
34	/non/pretium/quis/lectus/suspendisse.png	/vel/ipsum/praesent/blandit/lacinia.jsp	/sapien/iaculis/congue.png
2	/at/diam/nam/tristique.png	/mi/nulla/ac/enim/in/tempor/turpis.json	/nulla/suscipit/ligula/in.jsp
76	/lectus/in/est/risus/auctor.png	/erat/tortor/sollicitudin.jsp	/ut/blandit/non.png
40	/placerat/praesent.html	/gravida/nisi/at/nibh.html	/enim/blandit/mi/in/porttitor/pede.html
85	/quam/turpis.aspx	/sem/mauris.js	/diam/erat/fermentum.png
87	/vulputate/elementum/nullam.jsp	/justo/pellentesque/viverra/pede.json	/libero/nullam/sit/amet/turpis.jpg
65	/eget/eros/elementum/pellentesque/quisque.js	/lacinia/eget/tincidunt/eget/tempus/vel/pede.xml	/at/nulla.jpg
90	/mauris/sit.html	/vestibulum/vestibulum/ante/ipsum/primis/in/faucibus.jsp	/vivamus.jsp
65	/cubilia/curae/mauris/viverra.aspx	/mi/nulla.html	/velit.json
12	/orci/mauris/lacinia/sapien/quis/libero.png	/id/nulla/ultrices.xml	/quisque/id/justo/sit/amet/sapien/dignissim.png
58	/non/lectus.aspx	/eros/suspendisse.json	/nisi/nam/ultrices.jsp
21	/quam/pharetra/magna/ac.aspx	/amet/lobortis.jsp	/cras/mi.png
96	/nascetur/ridiculus.aspx	/metus/sapien/ut/nunc/vestibulum/ante.json	/platea/dictumst/aliquam/augue.html
7	/pellentesque.js	/justo/in/hac.js	/lorem.jpg
68	/adipiscing/molestie.js	/eu.json	/congue.xml
75	/nisl/duis/ac/nibh.jsp	/in/congue/etiam/justo/etiam/pretium.aspx	/ac/enim/in/tempor/turpis/nec.jsp
2	/feugiat.aspx	/elementum/eu/interdum/eu/tincidunt.jpg	/posuere/cubilia/curae/nulla/dapibus/dolor.png
11	/praesent/lectus/vestibulum/quam/sapien/varius/ut.html	/justo/nec/condimentum/neque/sapien/placerat.jpg	/integer/ac/neque/duis.jsp
6	/vestibulum/sit/amet/cursus/id.json	/quam/pharetra/magna/ac/consequat.png	/nullam.xml
90	/integer/ac/leo.jsp	/luctus/et/ultrices/posuere/cubilia/curae.xml	/suscipit/ligula.jpg
55	/rhoncus/dui/vel/sem/sed.js	/quam/a/odio.aspx	/cubilia/curae.jpg
80	/viverra/pede/ac/diam.aspx	/integer/non.xml	/in.aspx
42	/sapien/sapien/non.xml	/tempus/semper/est/quam.json	/aliquet/maecenas.aspx
86	/nullam/sit/amet/turpis/elementum/ligula/vehicula.jsp	/sodales.json	/id/ligula/suspendisse/ornare/consequat/lectus.json
\.


--
-- Data for Name: books_formats; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.books_formats (id, book_format) FROM stdin;
1	60х90/8             
2	70х100/16           
3	60х90/8             
4	84х108/32           
5	70х100/16           
6	70х100/32           
7	84х108/32           
8	60х84/32            
9	60х90/16            
10	60х90/16            
\.


--
-- Data for Name: deadlines; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.deadlines (production_id, start_date, interim_date, finish_date) FROM stdin;
1	2021-10-22	2021-01-21	2021-03-18
2	2021-04-23	2021-10-14	2021-06-14
3	2021-04-19	2021-05-29	2021-03-21
4	2021-02-17	2021-01-23	2021-03-25
5	2021-09-27	2021-03-17	2021-06-19
6	2021-08-18	2021-07-20	2021-01-21
7	2021-09-06	2021-06-08	2021-09-01
8	2021-01-23	2021-11-01	2021-01-07
9	2021-12-04	2021-03-16	2021-03-25
10	2021-12-13	2021-09-16	2021-07-13
11	2021-09-12	2021-07-18	2021-05-18
12	2021-07-18	2021-05-22	2021-10-13
13	2021-07-05	2021-05-13	2021-11-21
14	2021-08-12	2021-03-10	2021-08-04
15	2021-05-23	2021-10-16	2021-04-05
16	2021-10-12	2021-01-28	2021-10-23
17	2021-09-15	2021-07-07	2021-10-13
18	2021-12-15	2021-08-16	2021-11-25
19	2021-06-25	2021-11-18	2021-11-22
20	2021-12-03	2021-06-29	2021-10-05
21	2021-05-13	2021-10-30	2021-06-22
22	2021-01-14	2021-05-10	2021-10-05
23	2021-11-10	2021-05-26	2021-02-10
24	2021-11-27	2021-08-14	2021-04-07
25	2021-03-20	2021-06-01	2021-12-13
26	2021-05-17	2021-11-15	2021-11-24
27	2021-07-09	2021-06-17	2021-08-07
28	2021-06-16	2021-05-28	2021-04-20
29	2021-11-27	2021-05-03	2021-06-15
30	2021-10-31	2021-04-16	2021-02-19
31	2021-10-24	2021-10-12	2021-11-07
32	2021-07-08	2021-02-09	2021-02-11
33	2021-02-09	2021-02-04	2021-07-21
34	2021-10-06	2021-05-22	2021-08-05
35	2021-05-30	2021-11-17	2021-08-24
36	2021-02-22	2021-02-27	2021-10-22
37	2021-07-25	2021-01-24	2021-12-11
38	2021-06-01	2021-09-11	2021-02-17
39	2021-10-05	2021-07-18	2021-02-13
40	2021-01-09	2021-11-21	2021-01-26
41	2021-12-10	2021-07-17	2021-08-25
42	2021-01-23	2021-09-09	2021-11-08
43	2021-08-05	2021-06-17	2021-01-23
44	2021-04-17	2021-04-30	2021-01-04
45	2021-10-16	2021-10-13	2021-05-31
46	2021-03-14	2021-07-08	2021-12-18
47	2021-07-12	2021-11-04	2021-03-26
48	2021-07-17	2021-03-23	2021-10-18
49	2021-12-06	2021-02-24	2021-06-20
50	2021-02-21	2021-12-03	2021-07-01
51	2021-07-23	2021-06-19	2021-11-20
52	2021-08-04	2021-08-04	2021-02-25
53	2021-12-20	2021-12-10	2021-11-02
54	2021-09-22	2021-07-12	2021-03-14
55	2021-05-16	2021-09-17	2021-01-26
56	2021-01-28	2021-06-19	2021-06-12
57	2021-01-14	2021-04-25	2021-03-07
58	2021-04-27	2021-08-24	2021-05-14
59	2021-10-24	2021-10-14	2021-06-22
60	2021-02-07	2021-02-04	2021-11-23
61	2021-08-11	2021-06-26	2021-06-16
62	2021-02-15	2021-06-04	2021-06-26
63	2021-07-09	2021-02-22	2021-10-21
64	2021-11-15	2021-07-20	2021-10-31
65	2021-12-10	2021-06-16	2021-08-21
66	2021-02-18	2021-08-21	2021-02-07
67	2021-04-16	2021-10-13	2021-03-13
68	2021-10-25	2021-06-14	2020-12-30
69	2021-01-03	2021-06-12	2021-05-01
70	2021-09-01	2021-10-07	2021-02-20
71	2021-10-08	2021-11-28	2021-11-08
72	2021-08-01	2021-04-11	2021-01-23
73	2021-05-21	2021-06-29	2021-03-14
74	2021-04-10	2021-06-24	2021-01-21
75	2021-04-23	2021-08-25	2021-01-01
76	2021-01-20	2021-07-28	2021-08-30
77	2021-02-09	2021-09-30	2021-10-24
78	2021-06-15	2021-02-08	2021-11-08
79	2021-01-25	2021-01-26	2021-10-23
80	2021-05-07	2021-06-03	2021-03-17
81	2021-05-29	2021-11-22	2021-05-21
82	2021-01-11	2021-01-21	2021-05-05
83	2021-04-01	2021-12-17	2021-04-17
84	2021-11-18	2021-06-02	2021-03-14
85	2021-02-04	2021-02-08	2021-04-04
86	2021-07-21	2021-07-06	2021-11-29
87	2021-03-23	2021-03-14	2021-12-21
88	2021-12-08	2021-05-05	2021-05-30
89	2021-11-04	2021-04-12	2020-12-28
90	2021-09-12	2021-10-01	2021-09-20
91	2021-01-27	2021-08-27	2021-10-24
92	2021-10-21	2021-07-10	2021-10-30
93	2021-11-13	2021-04-20	2021-01-27
94	2021-10-17	2021-03-30	2021-05-23
95	2021-02-09	2021-02-04	2021-02-05
96	2021-12-02	2021-07-20	2021-12-17
97	2021-08-15	2021-08-11	2021-10-11
98	2021-02-21	2021-04-26	2021-04-18
99	2021-03-04	2021-04-15	2021-08-09
100	2021-09-11	2021-02-05	2021-07-28
\.


--
-- Data for Name: output_information; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.output_information (book_id, isbn_or_issn, order_number, conv_print_sheets, publishing_sheets, publishing_date) FROM stdin;
1	9921061336383	323	122.79	129.37	2019-01-27
2	9429197302391	710	146.67	90.03	2007-10-07
3	9069771580559	271	120.51	186.93	2006-10-17
4	9345902361059	749	132.80	153.19	2020-07-27
5	9144448019211	44	115.34	196.81	2017-04-21
6	9867495401613	696	75.56	12.61	2007-10-12
7	9575943749077	286	33.33	108.65	2019-03-14
8	9682751158524	735	97.78	53.31	2014-07-13
9	9440875870657	941	156.82	91.30	2011-07-30
10	9220391254119	599	103.49	127.26	2006-05-21
11	9367977624910	507	3.46	146.89	2011-01-11
12	9233079734000	890	20.39	129.67	2015-08-02
13	9834250227558	8	94.27	144.82	2021-08-19
14	9939295412479	779	184.83	47.88	2018-10-31
15	9437872843331	322	14.37	183.07	2008-02-21
16	9929127752746	879	105.90	38.24	2005-11-01
17	9574907109213	417	116.68	75.49	2020-02-20
18	9319934186757	720	85.36	134.65	2012-04-16
19	9780207175481	165	14.11	75.93	2007-04-14
20	9590594669543	510	183.81	5.45	2016-07-29
21	9503628554543	858	197.69	57.03	2015-06-10
22	9609666359886	671	87.46	135.75	2009-02-09
23	9613863828432	852	124.70	82.03	2020-11-25
24	9970651690278	212	157.62	136.55	2018-11-03
25	9631484390351	736	44.36	10.08	2011-03-14
26	9120823839465	286	59.13	57.78	2009-07-09
27	9000645395902	367	150.89	132.55	2016-12-19
28	9163193082244	118	161.76	120.19	2020-11-28
29	9356839263570	229	20.07	21.88	2018-07-22
30	9669424545865	144	163.45	17.50	2006-02-21
31	9906354865202	278	107.19	135.87	2008-10-06
32	9947959954930	880	40.31	43.63	2019-07-09
33	9755360341578	342	174.03	104.65	2010-01-10
34	9757269385495	789	65.49	24.58	2021-11-11
35	9049944835252	158	87.49	151.93	2011-09-28
36	9482737447883	711	170.99	34.88	2009-09-15
37	9979739347022	757	192.35	1.73	2019-06-14
38	9377889802252	308	191.08	54.95	2014-12-09
39	9283958159749	470	18.26	149.33	2006-02-13
40	9347029056082	607	21.07	70.86	2014-04-30
41	9986294606410	106	70.66	183.92	2009-08-21
42	9309766774436	731	110.43	14.65	2015-02-01
43	9023554928599	309	172.74	81.72	2005-10-08
44	9973641902006	833	60.02	89.08	2006-01-02
45	9602120825568	39	118.72	91.23	2014-05-26
46	9233246487745	855	190.17	145.63	2020-02-21
47	9975414600707	10	191.82	92.40	2008-01-06
48	9043434947861	18	29.13	114.26	2021-09-24
49	9023559773887	100	178.46	46.48	2007-05-05
50	9499650051511	101	105.90	145.89	2008-12-16
51	9405611289921	824	51.76	160.29	2020-12-28
52	9101693927028	717	32.99	58.25	2008-09-13
53	9401993428908	254	181.01	129.73	2010-11-12
54	9299017110869	535	81.37	157.70	2019-07-06
55	9788828914496	889	90.21	147.09	2011-07-22
56	9482840770677	186	60.91	192.65	2009-10-04
57	9452974846383	635	170.09	125.39	2017-02-03
58	9493670697942	795	136.73	197.95	2009-07-19
59	9815944067621	313	4.52	174.69	2012-08-12
60	9986686334277	569	37.12	155.53	2006-03-07
61	9479656276857	534	144.67	84.01	2020-01-16
62	9457751927249	86	120.44	184.56	2004-08-22
63	9522131619133	340	56.71	142.87	2008-04-27
64	9426354835774	222	6.97	27.06	2005-05-03
65	9841058997887	925	141.87	193.67	2011-01-23
66	9727569977774	238	188.63	97.55	2007-12-20
67	9838020080535	754	152.30	151.96	2018-12-02
68	9579752973090	941	192.02	186.74	2010-05-10
69	9195723451173	734	144.92	83.26	2012-06-29
70	9737200629742	725	77.37	172.44	2018-05-04
71	9045078416845	548	143.70	60.99	2006-03-04
72	9361829149029	551	146.20	35.33	2017-05-04
73	9443329691830	478	133.47	116.13	2017-02-10
74	9781443957562	638	160.01	67.24	2009-02-16
75	9582753209412	511	117.44	161.67	2018-08-04
76	9873540000991	746	189.55	88.50	2019-06-08
77	9964697094042	953	40.95	155.33	2014-08-15
78	9806449572092	636	103.10	197.74	2005-05-25
79	9559248828230	633	141.20	191.62	2004-07-17
80	9325843531115	1000	66.20	51.46	2005-05-27
81	9545910527912	371	186.38	58.30	2015-12-11
82	9444380158445	301	194.21	80.16	2007-05-27
83	9153906240813	265	16.76	182.70	2021-10-18
84	9032233955990	754	61.52	68.89	2006-07-09
85	9890469918306	574	100.91	9.24	2012-07-03
86	9446585890195	344	39.51	36.93	2020-02-13
87	9223514230271	105	154.35	177.66	2011-03-04
88	9797565871948	544	183.40	191.79	2011-01-21
89	9659449149486	820	67.22	23.89	2008-05-30
90	9385446872328	443	193.77	53.03	2014-09-23
91	9687153141741	628	149.63	82.62	2009-06-30
92	9642386342867	86	115.64	16.62	2015-03-02
93	9345381037606	162	125.93	51.50	2014-10-01
94	9477704757187	998	19.51	196.39	2007-08-17
95	9304007458220	649	68.14	68.09	2015-01-31
96	9674414444894	214	123.61	65.55	2011-01-08
97	9896651777141	38	104.98	94.52	2019-04-30
98	9850153672770	66	33.98	24.76	2016-06-05
99	9744229070161	536	194.15	101.59	2008-10-11
100	9919276316177	79	151.97	13.95	2004-07-31
\.


--
-- Data for Name: production; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.production (id, book_id, staff_id) FROM stdin;
1	54	10
2	61	2
3	34	9
4	63	5
5	18	7
6	25	7
7	51	5
8	65	9
9	58	9
10	10	7
11	25	10
12	18	5
13	87	6
14	75	5
15	78	1
16	88	10
17	70	6
18	77	2
19	92	1
20	30	5
21	35	3
22	40	3
23	94	2
24	80	2
25	14	6
26	91	10
27	13	9
28	76	1
29	15	4
30	16	3
31	83	7
32	42	9
33	1	1
34	26	2
35	95	3
36	32	10
37	80	7
38	51	8
39	3	2
40	39	6
41	97	9
42	13	9
43	70	8
44	10	8
45	20	9
46	49	10
47	36	10
48	32	8
49	42	1
50	91	3
51	70	6
52	16	8
53	83	3
54	79	1
55	14	8
56	45	10
57	66	6
58	54	5
59	75	5
60	17	9
61	40	3
62	82	3
63	17	10
64	9	1
65	26	7
66	62	9
67	8	8
68	14	8
69	4	1
70	6	7
71	34	4
72	16	6
73	76	7
74	50	2
75	6	7
76	90	2
77	31	6
78	18	2
79	54	10
80	94	7
81	11	9
82	53	2
83	13	1
84	73	2
85	15	5
86	7	5
87	95	2
88	77	6
89	47	7
90	56	8
91	75	8
92	39	4
93	35	4
94	93	8
95	77	2
96	18	3
97	47	1
98	12	7
99	35	6
100	86	3
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.profiles (id, staff_id, date_of_birth, education, started_at, address) FROM stdin;
1	2	1971-07-03	Southwest University of Political Science and Law	2004-07-29	57815 American Court
2	3	1973-05-08	Universidade Estadual do Maranhão	2016-10-07	42 1st Place
3	9	1988-09-18	Central Saint Martins College of Art & Design	2011-10-07	724 Morning Circle
4	8	1977-12-11	Marij State Technical University	2014-12-31	08 Utah Park
5	4	1998-08-17	Fachhochschule Brandenburg	2008-03-30	6 Victoria Park
6	10	1975-10-20	American University of Paris	2006-05-25	853 Kingsford Way
7	3	1999-02-06	Philippine Christian University	2008-07-03	2089 Dexter Plaza
8	5	1985-01-17	Moscow State Institute of International Relations MFA Russia (MGIMO-University)	2011-05-11	48859 Dixon Street
9	8	1972-10-04	Pennsylvania State University - Berks-Lehigh Valley College	2014-10-13	70871 Dottie Junction
10	3	1986-04-11	VanderCook College of Music	2013-11-28	4880 Independence Parkway
11	8	1984-10-10	Kwangju University	2012-08-31	38 Clemons Plaza
12	1	1975-04-21	Fountain University	2017-09-02	463 Claremont Trail
13	10	1969-01-20	Universitas Amir Hamzah	2011-09-21	5 Barnett Crossing
14	10	1984-03-11	Politeknik Negeri Sambas	2008-04-19	549 Graedel Trail
15	2	1972-08-10	Rand Graduate School of Policy Studies	2010-12-31	49883 Kedzie Lane
16	3	1984-12-14	Seikei University	2012-12-28	7 Vermont Drive
17	2	2002-06-29	Salisbury State University	2008-07-04	204 Lakewood Place
18	7	1983-01-04	Islamic Azad University, Varamin	2006-11-19	82 Walton Crossing
19	10	1981-05-30	University of North Carolina at Asheville	2008-10-31	8643 Banding Crossing
20	3	1974-12-27	IE University	2016-04-23	2455 Anzinger Hill
21	2	1978-03-14	Miyazaki Municipal University	2020-02-13	38712 Nancy Pass
22	7	1976-01-29	College of Education Ikere	2019-08-31	25148 Badeau Place
23	10	1996-05-21	Lane College	2013-01-23	966 Esker Terrace
24	3	1970-01-30	Southern Nazarene University	2006-08-08	71281 Buena Vista Crossing
25	4	1989-07-28	International University Institute of Luxembourg	2017-06-02	4 Pawling Park
26	6	1996-02-03	Taegu University	2011-10-14	04 Mendota Road
27	1	1982-08-07	Universitas Negeri Gorontalo	2004-01-18	3 Linden Avenue
28	3	1984-03-21	Jewish University in Moscow	2003-11-07	8271 Norway Maple Court
29	5	1985-07-23	University of Maiduguri	2017-06-21	5 Twin Pines Drive
30	4	1968-05-01	Halmstad University College	2017-03-21	5 Mayfield Center
31	5	1995-06-20	Amman Arab University for Higher Studies	2020-09-18	3073 Continental Point
32	9	1997-11-20	Morehouse School of Medicine	2007-12-24	42260 Dixon Drive
33	1	1971-05-16	Sapporo Gakuin University	2005-02-20	833 Moose Park
34	1	1973-03-25	California School of Professional Psychology - San Diego	2016-01-21	24434 Donald Court
35	1	1996-02-13	Universidad de La Rioja	2003-12-23	09827 Vermont Parkway
36	6	1987-09-30	American World University	2002-09-08	56220 Anniversary Crossing
37	7	1994-04-16	Universidad Nacional Federico Villarreal	2004-02-21	25304 Vidon Trail
38	4	1983-06-19	Arizona State University, Polytechnic Campus	2006-07-15	1942 Rutledge Junction
39	1	2002-02-27	Universidad San Sebastian	2004-08-11	4856 Mallard Parkway
40	7	1994-06-01	Universidad Iberoamericana	2012-01-06	98 Gulseth Pass
41	5	1974-07-22	University of Central Punjab	2015-10-03	0415 Mockingbird Plaza
42	7	1987-02-01	Linfield College	2020-01-11	78 Main Court
43	3	1991-10-22	Universitas Klabat	2020-11-05	91915 Moland Pass
44	7	1976-06-01	Hemchandracharay North Gujarat University	2014-06-25	8402 Linden Parkway
45	7	1981-01-16	University of Nueva Caceres	2003-03-25	09090 Fieldstone Trail
46	7	1997-03-20	Yunnan University	2020-01-03	82 Warner Road
47	2	1995-10-31	Universität Duisburg-Essen	2020-04-28	618 Schiller Circle
48	5	1970-10-08	Université de Jendouba	2006-12-02	149 Ruskin Place
49	8	1995-04-19	Tokushima University	2003-08-29	233 Golf Course Plaza
50	9	1971-05-05	Hokkaigakuen University of Kitami	2017-11-19	82 Dovetail Street
51	6	1976-09-28	Université de Savoie	2005-04-13	9175 Oneill Trail
52	5	1966-08-17	MacMurray College	2017-07-27	42 Scoville Parkway
53	3	1976-11-01	Buena Vista University	2005-02-27	97128 Bayside Park
54	7	1995-02-28	Reformed Bible College	2020-12-21	85023 Northfield Hill
55	9	1988-10-31	Manchester College	2018-04-18	0358 Grasskamp Alley
56	5	1976-12-17	Mutesa 1 Royal University	2006-05-06	20395 Bowman Crossing
57	9	1982-07-13	St.Cyril and Methodius University	2015-10-10	13 Westerfield Parkway
58	8	1971-07-31	World University of Bangladesh	2005-12-02	1 Nancy Park
59	6	1993-03-14	Islamic Azad University, Falavarjan 	2020-09-18	42 Linden Pass
60	9	1967-02-26	University of Islamic Studies	2003-05-11	64819 Warbler Road
61	6	1977-12-28	Southeastern Bible College	2014-12-04	478 Old Shore Avenue
62	9	1966-04-05	University of New South Wales	2015-10-18	397 Forest Point
63	9	1995-10-13	Kobe Women's University	2005-05-12	8 Orin Crossing
64	8	1982-09-22	Moldova State Agricultural University	2006-10-30	34219 Bluejay Trail
65	6	1998-07-25	Silver Lake College	2005-07-13	2067 Macpherson Circle
66	8	1995-04-21	Business School Lausanne (BSL)	2013-11-04	30 Bultman Way
67	2	1990-02-05	Universidade Federal da Grande Dourados	2013-09-03	36 Schmedeman Lane
68	7	1977-09-25	International Academy of  Merchandising and Design Tampa	2012-02-29	481 Lien Road
69	10	1998-04-28	American Graduate School in Paris	2016-06-20	2 Marcy Street
70	10	1969-04-26	Music Academy in Cracow	2003-12-27	90629 Arkansas Trail
71	1	1988-10-12	Emeq Yizrael College	2016-03-04	30883 Welch Trail
72	7	1981-11-05	Warsaw School of Information Technology	2007-08-13	9 Main Lane
73	8	1996-10-13	DIPLOMA-Fachhochschule Ölsnitz/Vogtland	2002-06-10	395 Rigney Point
74	1	1982-07-20	University of Papua New Guinea	2003-10-10	9612 Delladonna Drive
75	1	1996-05-22	Ural State University of Economics	2017-10-05	50947 Clyde Gallagher Plaza
76	8	1981-04-09	Showa University	2008-02-17	8126 Melody Circle
77	10	1980-01-18	Moscow International Higher Business School (MIRBIS)	2016-02-16	76864 Hoffman Trail
78	4	1985-09-08	Pontificia Universidade Católica do Paraná	2012-12-05	3953 Marcy Place
79	2	1992-03-16	Milligan College	2010-06-02	16 Eastwood Parkway
80	5	1984-01-23	Victoria University	2020-05-07	16660 Fisk Place
81	2	1974-10-01	Mount Aloysius College	2002-11-01	29845 Becker Lane
82	2	1977-02-06	Hebei University of Economics and Trade	2015-07-06	642 Londonderry Court
83	6	2001-01-17	Adams State College	2014-02-16	42 Green Ridge Circle
84	6	1990-07-25	Karlshochschule International University	2012-08-15	778 Karstens Point
85	5	1985-05-24	Patna University	2017-06-10	827 Carey Court
86	6	1993-04-04	National Changhua University of Education	2011-07-19	86850 Thompson Way
87	8	1993-05-25	Rhode Island College	2006-02-13	573 Maryland Parkway
88	7	1977-04-28	Turin Polytechnic University In Tashkent	2012-12-08	5 Shopko Lane
89	2	1999-06-20	University of Perpetual Help, System Dalta	2017-09-24	54899 Shoshone Circle
90	8	1992-03-17	Osaka Electro-Communication University	2002-03-28	5 Morningstar Lane
91	3	1986-02-14	Dominion College	2014-01-23	5 Holmberg Place
92	10	1990-02-25	University of Italian Studies for Foreigners of Perugia	2002-05-17	4 Pine View Place
93	1	1996-12-23	University of Al-Qadisiyah	2006-02-03	5 Crowley Point
94	1	1980-11-28	Moscow State Textile University A.N. Kosygin	2004-02-13	2 Pepper Wood Parkway
95	9	1978-03-14	Yasar University	2008-02-04	05 Carey Road
96	3	1968-01-26	Yazd University	2002-11-02	83821 Harbort Way
97	6	1970-06-15	4th Military Medical University	2007-07-15	9277 Holy Cross Way
98	9	1979-08-10	Virginia Wesleyan College	2015-08-20	6 Scofield Crossing
99	4	1969-09-17	Evangelische Fachhochschule Ludwigshafen Hochschule für Sozial- und Gesundheitswesen	2020-08-26	0 Buhler Crossing
100	1	2000-01-22	University of Papua New Guinea	2008-06-27	5 Gulseth Trail
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.staff (id, first_name, last_name, position_id, profile_id) FROM stdin;
1	Griz	Douce	4	10
2	Lorelle	Poytheras	2	6
3	Cyndie	Ephson	1	7
4	Sheffield	Annand	1	2
5	Emlyn	Kunze	4	7
6	Tersina	Aburrow	4	8
7	Kristyn	Joinson	2	2
8	Violetta	Enticknap	4	10
9	Irvine	Wellan	2	9
10	Michaela	Tue	3	10
\.


--
-- Data for Name: staff_positions; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.staff_positions (id, "position") FROM stdin;
1	layout_maker
2	layout_maker
3	proofreader
4	chief_editor
\.


--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.authors_id_seq', 1, false);


--
-- Name: books_authors_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.books_authors_author_id_seq', 1, false);


--
-- Name: books_authors_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.books_authors_book_id_seq', 1, false);


--
-- Name: books_files_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.books_files_book_id_seq', 1, false);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.books_id_seq', 1, false);


--
-- Name: deadlines_production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.deadlines_production_id_seq', 1, false);


--
-- Name: output_information_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.output_information_book_id_seq', 1, false);


--
-- Name: production_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.production_book_id_seq', 1, false);


--
-- Name: production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.production_id_seq', 1, false);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.profiles_id_seq', 1, false);


--
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.staff_id_seq', 1, false);


--
-- Name: staff_positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.staff_positions_id_seq', 1, false);


--
-- Name: authors authors_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_email_key UNIQUE (email);


--
-- Name: authors authors_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_phone_key UNIQUE (phone);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books_formats books_formats_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.books_formats
    ADD CONSTRAINT books_formats_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: production production_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.production
    ADD CONSTRAINT production_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- Name: staff_positions staff_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.staff_positions
    ADD CONSTRAINT staff_positions_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

