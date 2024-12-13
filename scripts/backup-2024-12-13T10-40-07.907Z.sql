--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: thesodeon
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO thesodeon;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: thesodeon
--

COMMENT ON SCHEMA public IS '';


--
-- Name: Day; Type: TYPE; Schema: public; Owner: thesodeon
--

CREATE TYPE public."Day" AS ENUM (
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY'
);


ALTER TYPE public."Day" OWNER TO thesodeon;

--
-- Name: UserSex; Type: TYPE; Schema: public; Owner: thesodeon
--

CREATE TYPE public."UserSex" AS ENUM (
    'MALE',
    'FEMALE'
);


ALTER TYPE public."UserSex" OWNER TO thesodeon;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Admin; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Admin" (
    id text NOT NULL,
    username text NOT NULL
);


ALTER TABLE public."Admin" OWNER TO thesodeon;

--
-- Name: Announcement; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Announcement" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    "classId" integer
);


ALTER TABLE public."Announcement" OWNER TO thesodeon;

--
-- Name: Announcement_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Announcement_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Announcement_id_seq" OWNER TO thesodeon;

--
-- Name: Announcement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Announcement_id_seq" OWNED BY public."Announcement".id;


--
-- Name: Assignment; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Assignment" (
    id integer NOT NULL,
    title text NOT NULL,
    "startDate" timestamp(3) without time zone NOT NULL,
    "dueDate" timestamp(3) without time zone NOT NULL,
    "lessonId" integer NOT NULL
);


ALTER TABLE public."Assignment" OWNER TO thesodeon;

--
-- Name: Assignment_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Assignment_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Assignment_id_seq" OWNER TO thesodeon;

--
-- Name: Assignment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Assignment_id_seq" OWNED BY public."Assignment".id;


--
-- Name: Attendance; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Attendance" (
    id integer NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    present boolean NOT NULL,
    "studentId" text NOT NULL,
    "lessonId" integer NOT NULL
);


ALTER TABLE public."Attendance" OWNER TO thesodeon;

--
-- Name: Attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Attendance_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Attendance_id_seq" OWNER TO thesodeon;

--
-- Name: Attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Attendance_id_seq" OWNED BY public."Attendance".id;


--
-- Name: Class; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Class" (
    id integer NOT NULL,
    name text NOT NULL,
    capacity integer NOT NULL,
    "supervisorId" text,
    "gradeId" integer NOT NULL
);


ALTER TABLE public."Class" OWNER TO thesodeon;

--
-- Name: Class_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Class_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Class_id_seq" OWNER TO thesodeon;

--
-- Name: Class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Class_id_seq" OWNED BY public."Class".id;


--
-- Name: Event; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Event" (
    id integer NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "classId" integer
);


ALTER TABLE public."Event" OWNER TO thesodeon;

--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Event_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Event_id_seq" OWNER TO thesodeon;

--
-- Name: Event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Event_id_seq" OWNED BY public."Event".id;


--
-- Name: Exam; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Exam" (
    id integer NOT NULL,
    title text NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "lessonId" integer NOT NULL
);


ALTER TABLE public."Exam" OWNER TO thesodeon;

--
-- Name: Exam_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Exam_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Exam_id_seq" OWNER TO thesodeon;

--
-- Name: Exam_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Exam_id_seq" OWNED BY public."Exam".id;


--
-- Name: Grade; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Grade" (
    id integer NOT NULL,
    level integer NOT NULL
);


ALTER TABLE public."Grade" OWNER TO thesodeon;

--
-- Name: Grade_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Grade_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Grade_id_seq" OWNER TO thesodeon;

--
-- Name: Grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Grade_id_seq" OWNED BY public."Grade".id;


--
-- Name: Lesson; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Lesson" (
    id integer NOT NULL,
    name text NOT NULL,
    day public."Day" NOT NULL,
    "startTime" timestamp(3) without time zone NOT NULL,
    "endTime" timestamp(3) without time zone NOT NULL,
    "subjectId" integer NOT NULL,
    "classId" integer NOT NULL,
    "teacherId" text NOT NULL
);


ALTER TABLE public."Lesson" OWNER TO thesodeon;

--
-- Name: Lesson_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Lesson_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Lesson_id_seq" OWNER TO thesodeon;

--
-- Name: Lesson_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Lesson_id_seq" OWNED BY public."Lesson".id;


--
-- Name: Parent; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Parent" (
    id text NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    patronymic text,
    email text,
    phone text NOT NULL,
    address text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Parent" OWNER TO thesodeon;

--
-- Name: Result; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Result" (
    id integer NOT NULL,
    score integer NOT NULL,
    "examId" integer,
    "assignmentId" integer,
    "studentId" text NOT NULL
);


ALTER TABLE public."Result" OWNER TO thesodeon;

--
-- Name: Result_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Result_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Result_id_seq" OWNER TO thesodeon;

--
-- Name: Result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Result_id_seq" OWNED BY public."Result".id;


--
-- Name: Student; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Student" (
    id text NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    patronymic text,
    email text,
    phone text NOT NULL,
    address text NOT NULL,
    img text DEFAULT '/avatar.png'::text NOT NULL,
    "discountPercent" integer DEFAULT 0 NOT NULL,
    sex public."UserSex" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "parentId" text NOT NULL,
    "classId" integer NOT NULL,
    "gradeId" integer NOT NULL,
    birthday timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Student" OWNER TO thesodeon;

--
-- Name: Subject; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Subject" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Subject" OWNER TO thesodeon;

--
-- Name: Subject_id_seq; Type: SEQUENCE; Schema: public; Owner: thesodeon
--

CREATE SEQUENCE public."Subject_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Subject_id_seq" OWNER TO thesodeon;

--
-- Name: Subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thesodeon
--

ALTER SEQUENCE public."Subject_id_seq" OWNED BY public."Subject".id;


--
-- Name: Teacher; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."Teacher" (
    id text NOT NULL,
    username text NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    patronymic text,
    email text,
    phone text NOT NULL,
    address text NOT NULL,
    img text DEFAULT '/avatar.png'::text NOT NULL,
    sex public."UserSex" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    birthday timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Teacher" OWNER TO thesodeon;

--
-- Name: _SubjectToTeacher; Type: TABLE; Schema: public; Owner: thesodeon
--

CREATE TABLE public."_SubjectToTeacher" (
    "A" integer NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_SubjectToTeacher" OWNER TO thesodeon;

--
-- Name: Announcement id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Announcement" ALTER COLUMN id SET DEFAULT nextval('public."Announcement_id_seq"'::regclass);


--
-- Name: Assignment id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Assignment" ALTER COLUMN id SET DEFAULT nextval('public."Assignment_id_seq"'::regclass);


--
-- Name: Attendance id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Attendance" ALTER COLUMN id SET DEFAULT nextval('public."Attendance_id_seq"'::regclass);


--
-- Name: Class id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Class" ALTER COLUMN id SET DEFAULT nextval('public."Class_id_seq"'::regclass);


--
-- Name: Event id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Event" ALTER COLUMN id SET DEFAULT nextval('public."Event_id_seq"'::regclass);


--
-- Name: Exam id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Exam" ALTER COLUMN id SET DEFAULT nextval('public."Exam_id_seq"'::regclass);


--
-- Name: Grade id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Grade" ALTER COLUMN id SET DEFAULT nextval('public."Grade_id_seq"'::regclass);


--
-- Name: Lesson id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Lesson" ALTER COLUMN id SET DEFAULT nextval('public."Lesson_id_seq"'::regclass);


--
-- Name: Result id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Result" ALTER COLUMN id SET DEFAULT nextval('public."Result_id_seq"'::regclass);


--
-- Name: Subject id; Type: DEFAULT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Subject" ALTER COLUMN id SET DEFAULT nextval('public."Subject_id_seq"'::regclass);


--
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Admin" (id, username) FROM stdin;
admin1	admin1
admin2	admin2
\.


--
-- Data for Name: Announcement; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Announcement" (id, title, description, date, "classId") FROM stdin;
1	Announcement 1	Description for Announcement 1	2024-12-06 23:20:10.382	2
2	Announcement 2	Description for Announcement 2	2024-12-06 23:20:10.386	3
3	Announcement 3	Description for Announcement 3	2024-12-06 23:20:10.388	4
4	Announcement 4	Description for Announcement 4	2024-12-06 23:20:10.39	5
5	Announcement 5	Description for Announcement 5	2024-12-06 23:20:10.392	1
\.


--
-- Data for Name: Assignment; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Assignment" (id, title, "startDate", "dueDate", "lessonId") FROM stdin;
1	Assignment 1	2024-12-07 00:20:10.294	2024-12-07 23:20:10.294	2
2	Assignment 2	2024-12-07 00:20:10.298	2024-12-07 23:20:10.298	3
3	Assignment 3	2024-12-07 00:20:10.3	2024-12-07 23:20:10.3	4
4	Assignment 4	2024-12-07 00:20:10.303	2024-12-07 23:20:10.303	5
5	Assignment 5	2024-12-07 00:20:10.305	2024-12-07 23:20:10.305	6
6	Assignment 6	2024-12-07 00:20:10.307	2024-12-07 23:20:10.307	7
7	Assignment 7	2024-12-07 00:20:10.31	2024-12-07 23:20:10.31	8
8	Assignment 8	2024-12-07 00:20:10.312	2024-12-07 23:20:10.312	9
9	Assignment 9	2024-12-07 00:20:10.314	2024-12-07 23:20:10.314	10
10	Assignment 10	2024-12-07 00:20:10.316	2024-12-07 23:20:10.316	11
\.


--
-- Data for Name: Attendance; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Attendance" (id, date, present, "studentId", "lessonId") FROM stdin;
1	2024-12-06 23:20:10.343	t	student1	2
2	2024-12-06 23:20:10.347	t	student2	3
3	2024-12-06 23:20:10.349	t	student3	4
4	2024-12-06 23:20:10.351	t	student4	5
5	2024-12-06 23:20:10.354	t	student5	6
6	2024-12-06 23:20:10.356	t	student6	7
7	2024-12-06 23:20:10.358	t	student7	8
8	2024-12-06 23:20:10.36	t	student8	9
9	2024-12-06 23:20:10.362	t	student9	10
10	2024-12-06 23:20:10.365	t	student10	11
\.


--
-- Data for Name: Class; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Class" (id, name, capacity, "supervisorId", "gradeId") FROM stdin;
5	5A	20	teacher10	5
6	6A	15	teacher11	6
1	1A	17	teacher12	1
2	2A	20	teacher13	2
3	3A	18	teacher14	3
4	4A	17	teacher15	4
\.


--
-- Data for Name: Event; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Event" (id, title, description, "startTime", "endTime", "classId") FROM stdin;
1	Event 1	Description for Event 1	2024-12-07 00:20:10.367	2024-12-07 01:20:10.367	2
2	Event 2	Description for Event 2	2024-12-07 00:20:10.37	2024-12-07 01:20:10.37	3
3	Event 3	Description for Event 3	2024-12-07 00:20:10.375	2024-12-07 01:20:10.375	4
4	Event 4	Description for Event 4	2024-12-07 00:20:10.378	2024-12-07 01:20:10.378	5
6	Олимпиада БИБН		1970-01-01 00:00:00	1970-01-01 00:00:00	\N
\.


--
-- Data for Name: Exam; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Exam" (id, title, "startTime", "endTime", "lessonId") FROM stdin;
1	Exam 1	2024-12-07 00:20:10.267	2024-12-07 01:20:10.267	2
2	Exam 2	2024-12-07 00:20:10.271	2024-12-07 01:20:10.271	3
3	Exam 3	2024-12-07 00:20:10.274	2024-12-07 01:20:10.274	4
4	Exam 4	2024-12-07 00:20:10.277	2024-12-07 01:20:10.277	5
5	Exam 5	2024-12-07 00:20:10.28	2024-12-07 01:20:10.28	6
6	Exam 6	2024-12-07 00:20:10.282	2024-12-07 01:20:10.282	7
8	Exam 8	2024-12-07 00:20:10.287	2024-12-07 01:20:10.287	9
9	Exam 9	2024-12-07 00:20:10.29	2024-12-07 01:20:10.29	10
11	Пробник №1	2024-12-17 09:00:00	2025-01-02 10:00:00	29
10	Exam 10	2024-12-13 07:00:00	2024-12-13 09:30:00	28
\.


--
-- Data for Name: Grade; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Grade" (id, level) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
\.


--
-- Data for Name: Lesson; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Lesson" (id, name, day, "startTime", "endTime", "subjectId", "classId", "teacherId") FROM stdin;
1	Lesson1	MONDAY	2024-12-07 00:20:09.999	2024-12-07 02:20:09.999	2	2	teacher2
2	Lesson2	WEDNESDAY	2024-12-07 00:20:10.003	2024-12-07 02:20:10.003	3	3	teacher3
3	Lesson3	MONDAY	2024-12-07 00:20:10.006	2024-12-07 02:20:10.006	4	4	teacher4
4	Lesson4	WEDNESDAY	2024-12-07 00:20:10.009	2024-12-07 02:20:10.009	5	5	teacher5
6	Lesson6	WEDNESDAY	2024-12-07 00:20:10.014	2024-12-07 02:20:10.014	7	1	teacher7
7	Lesson7	TUESDAY	2024-12-07 00:20:10.017	2024-12-07 02:20:10.017	8	2	teacher8
8	Lesson8	TUESDAY	2024-12-07 00:20:10.019	2024-12-07 02:20:10.019	9	3	teacher9
9	Lesson9	FRIDAY	2024-12-07 00:20:10.022	2024-12-07 02:20:10.022	10	4	teacher10
10	Lesson10	TUESDAY	2024-12-07 00:20:10.025	2024-12-07 02:20:10.025	1	5	teacher11
11	Lesson11	MONDAY	2024-12-07 00:20:10.028	2024-12-07 02:20:10.028	2	6	teacher12
12	Lesson12	THURSDAY	2024-12-07 00:20:10.03	2024-12-07 02:20:10.03	3	1	teacher13
13	Lesson13	THURSDAY	2024-12-07 00:20:10.034	2024-12-07 02:20:10.034	4	2	teacher14
14	Lesson14	FRIDAY	2024-12-07 00:20:10.036	2024-12-07 02:20:10.036	5	3	teacher15
15	Lesson15	TUESDAY	2024-12-07 00:20:10.039	2024-12-07 02:20:10.039	6	4	teacher1
16	Lesson16	TUESDAY	2024-12-07 00:20:10.042	2024-12-07 02:20:10.042	7	5	teacher2
17	Lesson17	TUESDAY	2024-12-07 00:20:10.044	2024-12-07 02:20:10.044	8	6	teacher3
18	Lesson18	WEDNESDAY	2024-12-07 00:20:10.047	2024-12-07 02:20:10.047	9	1	teacher4
19	Lesson19	TUESDAY	2024-12-07 00:20:10.049	2024-12-07 02:20:10.049	10	2	teacher5
21	Lesson21	MONDAY	2024-12-07 00:20:10.054	2024-12-07 02:20:10.054	2	4	teacher7
22	Lesson22	FRIDAY	2024-12-07 00:20:10.056	2024-12-07 02:20:10.056	3	5	teacher8
23	Lesson23	FRIDAY	2024-12-07 00:20:10.058	2024-12-07 02:20:10.058	4	6	teacher9
24	Lesson24	MONDAY	2024-12-07 00:20:10.061	2024-12-07 02:20:10.061	5	1	teacher10
25	Lesson25	TUESDAY	2024-12-07 00:20:10.063	2024-12-07 02:20:10.063	6	2	teacher11
26	Lesson26	FRIDAY	2024-12-07 00:20:10.065	2024-12-07 02:20:10.065	7	3	teacher12
27	Lesson27	WEDNESDAY	2024-12-07 00:20:10.067	2024-12-07 02:20:10.067	8	4	teacher13
28	Lesson28	WEDNESDAY	2024-12-07 00:20:10.069	2024-12-07 02:20:10.069	9	5	teacher14
29	Lesson29	THURSDAY	2024-12-07 00:20:10.071	2024-12-07 02:20:10.071	10	6	teacher15
30	Lesson30	WEDNESDAY	2024-12-07 00:20:10.074	2024-12-07 02:20:10.074	1	1	teacher1
20	Архитектура	FRIDAY	2024-12-10 14:00:00.052	2024-12-10 15:00:00.052	1	5	user_2pt64E0QLDPRvV99DNVgghcemUR
5	Математика	THURSDAY	2024-12-12 09:00:00.011	2024-12-12 10:00:10.011	6	5	user_2pt64E0QLDPRvV99DNVgghcemUR
\.


--
-- Data for Name: Parent; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Parent" (id, username, name, surname, patronymic, email, phone, address, "createdAt") FROM stdin;
parentId1	parentId1	PName 1	PSurname 1	Владимирович	parent1@example.com	123-456-7891	Address1	2024-12-06 23:20:10.077
parentId3	parentId3	PName 3	PSurname 3	Владимирович	parent3@example.com	123-456-7893	Address3	2024-12-06 23:20:10.083
parentId4	parentId4	PName 4	PSurname 4	Владимирович	parent4@example.com	123-456-7894	Address4	2024-12-06 23:20:10.085
parentId5	parentId5	PName 5	PSurname 5	Владимирович	parent5@example.com	123-456-7895	Address5	2024-12-06 23:20:10.087
parentId6	parentId6	PName 6	PSurname 6	Владимирович	parent6@example.com	123-456-7896	Address6	2024-12-06 23:20:10.09
parentId7	parentId7	PName 7	PSurname 7	Владимирович	parent7@example.com	123-456-7897	Address7	2024-12-06 23:20:10.092
parentId8	parentId8	PName 8	PSurname 8	Владимирович	parent8@example.com	123-456-7898	Address8	2024-12-06 23:20:10.095
parentId9	parentId9	PName 9	PSurname 9	Владимирович	parent9@example.com	123-456-7899	Address9	2024-12-06 23:20:10.097
parentId10	parentId10	PName 10	PSurname 10	Владимирович	parent10@example.com	123-456-78910	Address10	2024-12-06 23:20:10.099
parentId11	parentId11	PName 11	PSurname 11	Владимирович	parent11@example.com	123-456-78911	Address11	2024-12-06 23:20:10.101
parentId12	parentId12	PName 12	PSurname 12	Владимирович	parent12@example.com	123-456-78912	Address12	2024-12-06 23:20:10.104
parentId13	parentId13	PName 13	PSurname 13	Владимирович	parent13@example.com	123-456-78913	Address13	2024-12-06 23:20:10.106
parentId14	parentId14	PName 14	PSurname 14	Владимирович	parent14@example.com	123-456-78914	Address14	2024-12-06 23:20:10.107
parentId15	parentId15	PName 15	PSurname 15	Владимирович	parent15@example.com	123-456-78915	Address15	2024-12-06 23:20:10.11
parentId16	parentId16	PName 16	PSurname 16	Владимирович	parent16@example.com	123-456-78916	Address16	2024-12-06 23:20:10.112
parentId17	parentId17	PName 17	PSurname 17	Владимирович	parent17@example.com	123-456-78917	Address17	2024-12-06 23:20:10.114
parentId18	parentId18	PName 18	PSurname 18	Владимирович	parent18@example.com	123-456-78918	Address18	2024-12-06 23:20:10.116
parentId19	parentId19	PName 19	PSurname 19	Владимирович	parent19@example.com	123-456-78919	Address19	2024-12-06 23:20:10.118
parentId20	parentId20	PName 20	PSurname 20	Владимирович	parent20@example.com	123-456-78920	Address20	2024-12-06 23:20:10.12
parentId21	parentId21	PName 21	PSurname 21	Владимирович	parent21@example.com	123-456-78921	Address21	2024-12-06 23:20:10.122
parentId22	parentId22	PName 22	PSurname 22	Владимирович	parent22@example.com	123-456-78922	Address22	2024-12-06 23:20:10.123
parentId23	parentId23	PName 23	PSurname 23	Владимирович	parent23@example.com	123-456-78923	Address23	2024-12-06 23:20:10.125
parentId24	parentId24	PName 24	PSurname 24	Владимирович	parent24@example.com	123-456-78924	Address24	2024-12-06 23:20:10.127
parentId25	parentId25	PName 25	PSurname 25	Владимирович	parent25@example.com	123-456-78925	Address25	2024-12-06 23:20:10.129
user_2pt6ugC1XIeCBuZItxzy3hn92fv	parentId2	Тимур	Нестеренко	Сергеевна	parent2@example.com	123-456-7892	Курск, Межевая, д.15	2024-12-06 23:20:10.081
\.


--
-- Data for Name: Result; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Result" (id, score, "examId", "assignmentId", "studentId") FROM stdin;
1	90	1	\N	student1
2	90	2	\N	student2
3	90	3	\N	student3
4	90	4	\N	student4
5	90	5	\N	student5
6	90	\N	1	student6
7	90	\N	2	student7
8	90	\N	3	student8
9	90	\N	4	student9
10	90	\N	5	student10
\.


--
-- Data for Name: Student; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Student" (id, username, name, surname, patronymic, email, phone, address, img, "discountPercent", sex, "createdAt", "parentId", "classId", "gradeId", birthday) FROM stdin;
student1	student1	Вадим1	Ливенский 1	Николаевич	student1@example.com	987-654-3211	Address1	/avatar.png	0	FEMALE	2024-12-06 23:20:10.131	parentId1	2	2	2014-12-06 23:20:10.13
student2	student2	Вадим2	Ливенский 2	Николаевич	student2@example.com	987-654-3212	Address2	/avatar.png	0	MALE	2024-12-06 23:20:10.135	parentId1	3	3	2014-12-06 23:20:10.134
student5	student5	Вадим5	Ливенский 5	Николаевич	student5@example.com	987-654-3215	Address5	/avatar.png	0	FEMALE	2024-12-06 23:20:10.143	parentId3	6	6	2014-12-06 23:20:10.142
student6	student6	Вадим6	Ливенский 6	Николаевич	student6@example.com	987-654-3216	Address6	/avatar.png	0	MALE	2024-12-06 23:20:10.145	parentId3	1	1	2014-12-06 23:20:10.144
student7	student7	Вадим7	Ливенский 7	Николаевич	student7@example.com	987-654-3217	Address7	/avatar.png	0	FEMALE	2024-12-06 23:20:10.148	parentId4	2	2	2014-12-06 23:20:10.146
student8	student8	Вадим8	Ливенский 8	Николаевич	student8@example.com	987-654-3218	Address8	/avatar.png	0	MALE	2024-12-06 23:20:10.15	parentId4	3	3	2014-12-06 23:20:10.148
student9	student9	Вадим9	Ливенский 9	Николаевич	student9@example.com	987-654-3219	Address9	/avatar.png	0	FEMALE	2024-12-06 23:20:10.152	parentId5	4	4	2014-12-06 23:20:10.151
student10	student10	Вадим10	Ливенский 10	Николаевич	student10@example.com	987-654-32110	Address10	/avatar.png	0	MALE	2024-12-06 23:20:10.155	parentId5	5	5	2014-12-06 23:20:10.154
student11	student11	Вадим11	Ливенский 11	Николаевич	student11@example.com	987-654-32111	Address11	/avatar.png	0	FEMALE	2024-12-06 23:20:10.157	parentId6	6	6	2014-12-06 23:20:10.156
student12	student12	Вадим12	Ливенский 12	Николаевич	student12@example.com	987-654-32112	Address12	/avatar.png	0	MALE	2024-12-06 23:20:10.16	parentId6	1	1	2014-12-06 23:20:10.159
student13	student13	Вадим13	Ливенский 13	Николаевич	student13@example.com	987-654-32113	Address13	/avatar.png	0	FEMALE	2024-12-06 23:20:10.163	parentId7	2	2	2014-12-06 23:20:10.161
student14	student14	Вадим14	Ливенский 14	Николаевич	student14@example.com	987-654-32114	Address14	/avatar.png	0	MALE	2024-12-06 23:20:10.165	parentId7	3	3	2014-12-06 23:20:10.164
student15	student15	Вадим15	Ливенский 15	Николаевич	student15@example.com	987-654-32115	Address15	/avatar.png	0	FEMALE	2024-12-06 23:20:10.167	parentId8	4	4	2014-12-06 23:20:10.166
student17	student17	Вадим17	Ливенский 17	Николаевич	student17@example.com	987-654-32117	Address17	/avatar.png	0	FEMALE	2024-12-06 23:20:10.173	parentId9	6	6	2014-12-06 23:20:10.172
student18	student18	Вадим18	Ливенский 18	Николаевич	student18@example.com	987-654-32118	Address18	/avatar.png	0	MALE	2024-12-06 23:20:10.176	parentId9	1	1	2014-12-06 23:20:10.175
student19	student19	Вадим19	Ливенский 19	Николаевич	student19@example.com	987-654-32119	Address19	/avatar.png	0	FEMALE	2024-12-06 23:20:10.179	parentId10	2	2	2014-12-06 23:20:10.177
student20	student20	Вадим20	Ливенский 20	Николаевич	student20@example.com	987-654-32120	Address20	/avatar.png	0	MALE	2024-12-06 23:20:10.181	parentId10	3	3	2014-12-06 23:20:10.18
student21	student21	Вадим21	Ливенский 21	Николаевич	student21@example.com	987-654-32121	Address21	/avatar.png	0	FEMALE	2024-12-06 23:20:10.184	parentId11	4	4	2014-12-06 23:20:10.182
student22	student22	Вадим22	Ливенский 22	Николаевич	student22@example.com	987-654-32122	Address22	/avatar.png	0	MALE	2024-12-06 23:20:10.186	parentId11	5	5	2014-12-06 23:20:10.185
student23	student23	Вадим23	Ливенский 23	Николаевич	student23@example.com	987-654-32123	Address23	/avatar.png	0	FEMALE	2024-12-06 23:20:10.189	parentId12	6	6	2014-12-06 23:20:10.188
student24	student24	Вадим24	Ливенский 24	Николаевич	student24@example.com	987-654-32124	Address24	/avatar.png	0	MALE	2024-12-06 23:20:10.192	parentId12	1	1	2014-12-06 23:20:10.19
student25	student25	Вадим25	Ливенский 25	Николаевич	student25@example.com	987-654-32125	Address25	/avatar.png	0	FEMALE	2024-12-06 23:20:10.194	parentId13	2	2	2014-12-06 23:20:10.193
student26	student26	Вадим26	Ливенский 26	Николаевич	student26@example.com	987-654-32126	Address26	/avatar.png	0	MALE	2024-12-06 23:20:10.197	parentId13	3	3	2014-12-06 23:20:10.196
student27	student27	Вадим27	Ливенский 27	Николаевич	student27@example.com	987-654-32127	Address27	/avatar.png	0	FEMALE	2024-12-06 23:20:10.199	parentId14	4	4	2014-12-06 23:20:10.198
student28	student28	Вадим28	Ливенский 28	Николаевич	student28@example.com	987-654-32128	Address28	/avatar.png	0	MALE	2024-12-06 23:20:10.203	parentId14	5	5	2014-12-06 23:20:10.201
student29	student29	Вадим29	Ливенский 29	Николаевич	student29@example.com	987-654-32129	Address29	/avatar.png	0	FEMALE	2024-12-06 23:20:10.206	parentId15	6	6	2014-12-06 23:20:10.205
student30	student30	Вадим30	Ливенский 30	Николаевич	student30@example.com	987-654-32130	Address30	/avatar.png	0	MALE	2024-12-06 23:20:10.209	parentId15	1	1	2014-12-06 23:20:10.208
student31	student31	Вадим31	Ливенский 31	Николаевич	student31@example.com	987-654-32131	Address31	/avatar.png	0	FEMALE	2024-12-06 23:20:10.212	parentId16	2	2	2014-12-06 23:20:10.211
student32	student32	Вадим32	Ливенский 32	Николаевич	student32@example.com	987-654-32132	Address32	/avatar.png	0	MALE	2024-12-06 23:20:10.214	parentId16	3	3	2014-12-06 23:20:10.213
student33	student33	Вадим33	Ливенский 33	Николаевич	student33@example.com	987-654-32133	Address33	/avatar.png	0	FEMALE	2024-12-06 23:20:10.217	parentId17	4	4	2014-12-06 23:20:10.216
student34	student34	Вадим34	Ливенский 34	Николаевич	student34@example.com	987-654-32134	Address34	/avatar.png	0	MALE	2024-12-06 23:20:10.22	parentId17	5	5	2014-12-06 23:20:10.219
student35	student35	Вадим35	Ливенский 35	Николаевич	student35@example.com	987-654-32135	Address35	/avatar.png	0	FEMALE	2024-12-06 23:20:10.223	parentId18	6	6	2014-12-06 23:20:10.222
student36	student36	Вадим36	Ливенский 36	Николаевич	student36@example.com	987-654-32136	Address36	/avatar.png	0	MALE	2024-12-06 23:20:10.226	parentId18	1	1	2014-12-06 23:20:10.225
student37	student37	Вадим37	Ливенский 37	Николаевич	student37@example.com	987-654-32137	Address37	/avatar.png	0	FEMALE	2024-12-06 23:20:10.229	parentId19	2	2	2014-12-06 23:20:10.227
student38	student38	Вадим38	Ливенский 38	Николаевич	student38@example.com	987-654-32138	Address38	/avatar.png	0	MALE	2024-12-06 23:20:10.231	parentId19	3	3	2014-12-06 23:20:10.23
student3	student3	Вадим3	Ливенский 3	Николаевич	student3@example.com	987-654-3213	Address3	/avatar.png	0	FEMALE	2024-12-06 23:20:10.138	user_2pt6ugC1XIeCBuZItxzy3hn92fv	4	4	2014-12-06 23:20:10.137
student39	student39	Вадим39	Ливенский 39	Николаевич	student39@example.com	987-654-32139	Address39	/avatar.png	0	FEMALE	2024-12-06 23:20:10.234	parentId20	4	4	2014-12-06 23:20:10.233
student40	student40	Вадим40	Ливенский 40	Николаевич	student40@example.com	987-654-32140	Address40	/avatar.png	0	MALE	2024-12-06 23:20:10.238	parentId20	5	5	2014-12-06 23:20:10.236
student41	student41	Вадим41	Ливенский 41	Николаевич	student41@example.com	987-654-32141	Address41	/avatar.png	0	FEMALE	2024-12-06 23:20:10.241	parentId21	6	6	2014-12-06 23:20:10.24
student42	student42	Вадим42	Ливенский 42	Николаевич	student42@example.com	987-654-32142	Address42	/avatar.png	0	MALE	2024-12-06 23:20:10.244	parentId21	1	1	2014-12-06 23:20:10.242
student43	student43	Вадим43	Ливенский 43	Николаевич	student43@example.com	987-654-32143	Address43	/avatar.png	0	FEMALE	2024-12-06 23:20:10.246	parentId22	2	2	2014-12-06 23:20:10.245
student44	student44	Вадим44	Ливенский 44	Николаевич	student44@example.com	987-654-32144	Address44	/avatar.png	0	MALE	2024-12-06 23:20:10.249	parentId22	3	3	2014-12-06 23:20:10.248
student45	student45	Вадим45	Ливенский 45	Николаевич	student45@example.com	987-654-32145	Address45	/avatar.png	0	FEMALE	2024-12-06 23:20:10.252	parentId23	4	4	2014-12-06 23:20:10.251
student46	student46	Вадим46	Ливенский 46	Николаевич	student46@example.com	987-654-32146	Address46	/avatar.png	0	MALE	2024-12-06 23:20:10.255	parentId23	5	5	2014-12-06 23:20:10.254
student47	student47	Вадим47	Ливенский 47	Николаевич	student47@example.com	987-654-32147	Address47	/avatar.png	0	FEMALE	2024-12-06 23:20:10.258	parentId24	6	6	2014-12-06 23:20:10.256
student48	student48	Вадим48	Ливенский 48	Николаевич	student48@example.com	987-654-32148	Address48	/avatar.png	0	MALE	2024-12-06 23:20:10.26	parentId24	1	1	2014-12-06 23:20:10.259
student49	student49	Вадим49	Ливенский 49	Николаевич	student49@example.com	987-654-32149	Address49	/avatar.png	0	FEMALE	2024-12-06 23:20:10.263	parentId25	2	2	2014-12-06 23:20:10.262
student50	student50	Вадим50	Ливенский 50	Николаевич	student50@example.com	987-654-32150	Address50	/avatar.png	0	MALE	2024-12-06 23:20:10.266	parentId25	3	3	2014-12-06 23:20:10.264
student4	student4	Вадим4	Ливенский 4	Николаевич	student4@example.com	987-654-3214	Address4	/avatar.png	0	MALE	2024-12-06 23:20:10.14	user_2pt6ugC1XIeCBuZItxzy3hn92fv	5	5	2014-12-06 23:20:10.139
user_2pt6ze8FyLTrD8UFJfkcuRNrhPd	student16	Вадим16	Ливенский 16	Николаевич	student16@example.com	987-654-32116	Address16	/avatar.png	0	MALE	2024-12-06 23:20:10.171	parentId8	5	5	2014-12-06 00:00:00
user_2q5ZTKdNOy4jFSmhCWpAH8hohir	sofika	София	Нестеренко	Тимуровна	sofika17@gmail.com	+79513371281	Белгород, Костюкова, д. 44	/avatar.png	21	FEMALE	2024-12-11 22:00:02.649	parentId1	6	6	2004-12-17 00:00:00
user_2q5qfkBorATVvKKPLBiWBR3P6ht	livenSONYA	Софья	Ливенская	Николаевна	thesodeon04@gmail.com	+79952710701	Курск, 50 лет октября	/avatar.png	25	FEMALE	2024-12-12 00:21:28.583	user_2pt6ugC1XIeCBuZItxzy3hn92fv	4	4	2004-02-07 00:00:00
\.


--
-- Data for Name: Subject; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Subject" (id, name) FROM stdin;
2	Русский язык
3	Английский язык
4	История
5	География
6	Физика
8	Биология
9	Информатика
10	Архитектура
7	Органика
12	Химия
1	Мат анализ
\.


--
-- Data for Name: Teacher; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."Teacher" (id, username, name, surname, patronymic, email, phone, address, img, sex, "createdAt", birthday) FROM stdin;
teacher1	teacher1	Максим1	Панченко1	Владимирович	teacher1@example.com	123-456-7891	Address1	/avatar.png	FEMALE	2024-12-06 23:20:09.904	1994-12-06 23:20:09.901
teacher2	teacher2	Максим2	Панченко2	Владимирович	teacher2@example.com	123-456-7892	Address2	/avatar.png	MALE	2024-12-06 23:20:09.915	1994-12-06 23:20:09.913
teacher3	teacher3	Максим3	Панченко3	Владимирович	teacher3@example.com	123-456-7893	Address3	/avatar.png	FEMALE	2024-12-06 23:20:09.922	1994-12-06 23:20:09.921
teacher4	teacher4	Максим4	Панченко4	Владимирович	teacher4@example.com	123-456-7894	Address4	/avatar.png	MALE	2024-12-06 23:20:09.928	1994-12-06 23:20:09.927
teacher5	teacher5	Максим5	Панченко5	Владимирович	teacher5@example.com	123-456-7895	Address5	/avatar.png	FEMALE	2024-12-06 23:20:09.934	1994-12-06 23:20:09.933
teacher7	teacher7	Максим7	Панченко7	Владимирович	teacher7@example.com	123-456-7897	Address7	/avatar.png	FEMALE	2024-12-06 23:20:09.946	1994-12-06 23:20:09.945
teacher8	teacher8	Максим8	Панченко8	Владимирович	teacher8@example.com	123-456-7898	Address8	/avatar.png	MALE	2024-12-06 23:20:09.952	1994-12-06 23:20:09.951
teacher9	teacher9	Максим9	Панченко9	Владимирович	teacher9@example.com	123-456-7899	Address9	/avatar.png	FEMALE	2024-12-06 23:20:09.958	1994-12-06 23:20:09.956
teacher10	teacher10	Максим10	Панченко10	Владимирович	teacher10@example.com	123-456-78910	Address10	/avatar.png	MALE	2024-12-06 23:20:09.963	1994-12-06 23:20:09.962
teacher11	teacher11	Максим11	Панченко11	Владимирович	teacher11@example.com	123-456-78911	Address11	/avatar.png	FEMALE	2024-12-06 23:20:09.968	1994-12-06 23:20:09.967
teacher12	teacher12	Максим12	Панченко12	Владимирович	teacher12@example.com	123-456-78912	Address12	/avatar.png	MALE	2024-12-06 23:20:09.974	1994-12-06 23:20:09.973
teacher13	teacher13	Максим13	Панченко13	Владимирович	teacher13@example.com	123-456-78913	Address13	/avatar.png	FEMALE	2024-12-06 23:20:09.98	1994-12-06 23:20:09.978
teacher14	teacher14	Максим14	Панченко14	Владимирович	teacher14@example.com	123-456-78914	Address14	/avatar.png	MALE	2024-12-06 23:20:09.986	1994-12-06 23:20:09.984
teacher15	teacher15	Максим15	Панченко15	Владимирович	teacher15@example.com	123-456-78915	Address15	/avatar.png	FEMALE	2024-12-06 23:20:09.993	1994-12-06 23:20:09.991
user_2pt64E0QLDPRvV99DNVgghcemUR	teacher6	Максим6	Панченко6	Владимирович	teacher6@example.com	123-456-7896	Address6	/avatar.png	MALE	2024-12-06 23:20:09.941	1994-12-06 23:20:09.939
user_2q5Fx5IPOFTymsNFyBqTca3qwr0	maxi	Максим	Панч	Владимирович	test@ya.ru	+795124578	Белгород, Костюкова, д. 44	/avatar.png	MALE	2024-12-11 19:19:33.247	2000-01-07 00:00:00
user_2q5GT7O2UVqU4XV8CTOpE9hBlxV	bonda	Татьяна	Бондаренко	Владимировна	bondarenko@yandex.ru	+79517198452	Белгород, Костюкова, д. 44	/avatar.png	FEMALE	2024-12-11 19:23:48.522	1982-02-04 00:00:00
\.


--
-- Data for Name: _SubjectToTeacher; Type: TABLE DATA; Schema: public; Owner: thesodeon
--

COPY public."_SubjectToTeacher" ("A", "B") FROM stdin;
2	teacher1
3	teacher2
4	teacher3
5	teacher4
6	teacher5
8	teacher7
9	teacher8
10	teacher9
2	teacher11
3	teacher12
4	teacher13
5	teacher14
6	teacher15
7	teacher2
7	teacher3
12	teacher1
12	teacher2
12	teacher3
4	user_2q5GT7O2UVqU4XV8CTOpE9hBlxV
7	user_2q5GT7O2UVqU4XV8CTOpE9hBlxV
1	teacher2
1	teacher4
\.


--
-- Name: Announcement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Announcement_id_seq"', 5, true);


--
-- Name: Assignment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Assignment_id_seq"', 10, true);


--
-- Name: Attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Attendance_id_seq"', 10, true);


--
-- Name: Class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Class_id_seq"', 8, true);


--
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Event_id_seq"', 6, true);


--
-- Name: Exam_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Exam_id_seq"', 12, true);


--
-- Name: Grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Grade_id_seq"', 6, true);


--
-- Name: Lesson_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Lesson_id_seq"', 30, true);


--
-- Name: Result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Result_id_seq"', 10, true);


--
-- Name: Subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thesodeon
--

SELECT pg_catalog.setval('public."Subject_id_seq"', 12, true);


--
-- Name: Admin Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (id);


--
-- Name: Announcement Announcement_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Announcement"
    ADD CONSTRAINT "Announcement_pkey" PRIMARY KEY (id);


--
-- Name: Assignment Assignment_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Assignment"
    ADD CONSTRAINT "Assignment_pkey" PRIMARY KEY (id);


--
-- Name: Attendance Attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_pkey" PRIMARY KEY (id);


--
-- Name: Class Class_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_pkey" PRIMARY KEY (id);


--
-- Name: Event Event_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (id);


--
-- Name: Exam Exam_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_pkey" PRIMARY KEY (id);


--
-- Name: Grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Grade"
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY (id);


--
-- Name: Lesson Lesson_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_pkey" PRIMARY KEY (id);


--
-- Name: Parent Parent_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Parent"
    ADD CONSTRAINT "Parent_pkey" PRIMARY KEY (id);


--
-- Name: Result Result_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_pkey" PRIMARY KEY (id);


--
-- Name: Student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (id);


--
-- Name: Subject Subject_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Subject"
    ADD CONSTRAINT "Subject_pkey" PRIMARY KEY (id);


--
-- Name: Teacher Teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Teacher"
    ADD CONSTRAINT "Teacher_pkey" PRIMARY KEY (id);


--
-- Name: _SubjectToTeacher _SubjectToTeacher_AB_pkey; Type: CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."_SubjectToTeacher"
    ADD CONSTRAINT "_SubjectToTeacher_AB_pkey" PRIMARY KEY ("A", "B");


--
-- Name: Admin_username_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Admin_username_key" ON public."Admin" USING btree (username);


--
-- Name: Class_name_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Class_name_key" ON public."Class" USING btree (name);


--
-- Name: Grade_level_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Grade_level_key" ON public."Grade" USING btree (level);


--
-- Name: Parent_email_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Parent_email_key" ON public."Parent" USING btree (email);


--
-- Name: Parent_phone_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Parent_phone_key" ON public."Parent" USING btree (phone);


--
-- Name: Parent_username_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Parent_username_key" ON public."Parent" USING btree (username);


--
-- Name: Student_email_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Student_email_key" ON public."Student" USING btree (email);


--
-- Name: Student_phone_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Student_phone_key" ON public."Student" USING btree (phone);


--
-- Name: Student_username_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Student_username_key" ON public."Student" USING btree (username);


--
-- Name: Subject_name_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Subject_name_key" ON public."Subject" USING btree (name);


--
-- Name: Teacher_email_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Teacher_email_key" ON public."Teacher" USING btree (email);


--
-- Name: Teacher_phone_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Teacher_phone_key" ON public."Teacher" USING btree (phone);


--
-- Name: Teacher_username_key; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE UNIQUE INDEX "Teacher_username_key" ON public."Teacher" USING btree (username);


--
-- Name: _SubjectToTeacher_B_index; Type: INDEX; Schema: public; Owner: thesodeon
--

CREATE INDEX "_SubjectToTeacher_B_index" ON public."_SubjectToTeacher" USING btree ("B");


--
-- Name: Announcement Announcement_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Announcement"
    ADD CONSTRAINT "Announcement_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Assignment Assignment_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Assignment"
    ADD CONSTRAINT "Assignment_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Attendance Attendance_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Attendance Attendance_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Attendance"
    ADD CONSTRAINT "Attendance_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public."Student"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Class Class_gradeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_gradeId_fkey" FOREIGN KEY ("gradeId") REFERENCES public."Grade"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Class Class_supervisorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Class"
    ADD CONSTRAINT "Class_supervisorId_fkey" FOREIGN KEY ("supervisorId") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Event Event_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Event"
    ADD CONSTRAINT "Event_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Exam Exam_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Exam"
    ADD CONSTRAINT "Exam_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public."Lesson"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Lesson Lesson_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Lesson Lesson_subjectId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Lesson Lesson_teacherId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Lesson"
    ADD CONSTRAINT "Lesson_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Result Result_assignmentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_assignmentId_fkey" FOREIGN KEY ("assignmentId") REFERENCES public."Assignment"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Result Result_examId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_examId_fkey" FOREIGN KEY ("examId") REFERENCES public."Exam"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Result Result_studentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Result"
    ADD CONSTRAINT "Result_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES public."Student"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_classId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_classId_fkey" FOREIGN KEY ("classId") REFERENCES public."Class"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_gradeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_gradeId_fkey" FOREIGN KEY ("gradeId") REFERENCES public."Grade"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Student Student_parentId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."Student"
    ADD CONSTRAINT "Student_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES public."Parent"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _SubjectToTeacher _SubjectToTeacher_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."_SubjectToTeacher"
    ADD CONSTRAINT "_SubjectToTeacher_A_fkey" FOREIGN KEY ("A") REFERENCES public."Subject"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _SubjectToTeacher _SubjectToTeacher_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: thesodeon
--

ALTER TABLE ONLY public."_SubjectToTeacher"
    ADD CONSTRAINT "_SubjectToTeacher_B_fkey" FOREIGN KEY ("B") REFERENCES public."Teacher"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: thesodeon
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

