--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: CHI_TIET_NHAN_UNG_HO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CHI_TIET_NHAN_UNG_HO" (
    "MaDotNhanUngHo" character varying NOT NULL,
    "MaHinhThucUH" character varying NOT NULL,
    "SoLuongNhanUngHo" integer,
    "DonViTinh" character varying
);


ALTER TABLE public."CHI_TIET_NHAN_UNG_HO" OWNER TO postgres;

--
-- Name: CHI_TIET_UNG_HO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CHI_TIET_UNG_HO" (
    "MaDotUngHo" character varying NOT NULL,
    "MaHinhThucUH" character varying NOT NULL,
    "SoLuongUngHo" integer,
    "DonViTinh" character varying
);


ALTER TABLE public."CHI_TIET_UNG_HO" OWNER TO postgres;

--
-- Name: DON_VI_UNG_HO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DON_VI_UNG_HO" (
    "MaDVUH" character varying NOT NULL,
    "HoTenNguoiDaiDien" character varying,
    "DiaChiNguoiDaiDien" character varying,
    "SoDienThoaiLienLac" character varying,
    "SoCMNDNguoiDaiDien" character varying,
    "SoTaiKhoanNganHang" character varying,
    "TenNganHang" character varying,
    "ChiNhanhNganHang" character varying,
    "TenChuTKNganHang" character varying
);


ALTER TABLE public."DON_VI_UNG_HO" OWNER TO postgres;

--
-- Name: DOT_NHAN_UNG_HO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DOT_NHAN_UNG_HO" (
    "MaDotNhanUngHo" character varying NOT NULL,
    "MaHoDan" character varying,
    "NgayNhanUngHo" timestamp without time zone
);


ALTER TABLE public."DOT_NHAN_UNG_HO" OWNER TO postgres;

--
-- Name: DOT_UNG_HO; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DOT_UNG_HO" (
    "MaDotUngHo" character varying NOT NULL,
    "MaDVUH" character varying NOT NULL,
    "NgayUngHo" timestamp without time zone
);


ALTER TABLE public."DOT_UNG_HO" OWNER TO postgres;

--
-- Name: HINH_THUC_UH; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HINH_THUC_UH" (
    "MaHinhThucUH" character varying NOT NULL,
    "TenHinhThucUngHo" character varying
);


ALTER TABLE public."HINH_THUC_UH" OWNER TO postgres;

--
-- Name: HO_DAN; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HO_DAN" (
    "MaHoDan" character varying NOT NULL,
    "HoTenChuHo" character varying,
    "ToDanPho" character varying,
    "KhoiHoacThon" character varying,
    "SoDienThoai" character varying,
    "DiaChiNha" character varying,
    "SoNhanKhau" integer,
    "DienGiaDinh" character varying,
    "LaHoNgheo" boolean
);


ALTER TABLE public."HO_DAN" OWNER TO postgres;

--
-- Data for Name: CHI_TIET_NHAN_UNG_HO; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CHI_TIET_NHAN_UNG_HO" ("MaDotNhanUngHo", "MaHinhThucUH", "SoLuongNhanUngHo", "DonViTinh") FROM stdin;
NhanUH001	HT01	5000	USD
NhanUH003	HT01	10000000	VND
NhanUH003	HT02	25	Thung
NhanUH003	HT03	70	Bo
NhanUH001	HT02	50	Thung
NhanUH002	HT03	100	Bo
\.


--
-- Data for Name: CHI_TIET_UNG_HO; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CHI_TIET_UNG_HO" ("MaDotUngHo", "MaHinhThucUH", "SoLuongUngHo", "DonViTinh") FROM stdin;
UH001	HT01	6000	USD
UH002 	HT02	50	Thung
UH003	HT01	100000	JPY
UH004	HT01	100000	USD
UH005	HT03	100	Bo
UH003	HT03	200	Bo
\.


--
-- Data for Name: DON_VI_UNG_HO; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DON_VI_UNG_HO" ("MaDVUH", "HoTenNguoiDaiDien", "DiaChiNguoiDaiDien", "SoDienThoaiLienLac", "SoCMNDNguoiDaiDien", "SoTaiKhoanNganHang", "TenNganHang", "ChiNhanhNganHang", "TenChuTKNganHang") FROM stdin;
CN002	Nguyen Van A2 	Phong Dien, Thua Thien Hue	0905121122	124898001	65874001\n	TienPhong Bank	Da Nang	\N
CTY01	Nguyen Van A3	Tam Dao, Vinh Phuc	0905121123	124898002 	65874002	VietCom Bank	Quang Nam	\N
CTY02	Nguyen Van A4 	Ba To, Quang Ngai 	0905121124 	124898003	65874003	DongA Bank	Thua Thien Hue	\N
CN001	Nguyen Van A1	Nui Thanh, Quang Nam	0905121121	124898000 	65874000\n	Mbank	Gia Lai	\N
\.


--
-- Data for Name: DOT_NHAN_UNG_HO; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DOT_NHAN_UNG_HO" ("MaDotNhanUngHo", "MaHoDan", "NgayNhanUngHo") FROM stdin;
NhanUH001	HD003	2016-11-11 00:00:00
NhanUH002	HD001	2016-11-18 00:00:00
NhanUH003	HD003	2016-11-20 00:00:00
\.


--
-- Data for Name: DOT_UNG_HO; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DOT_UNG_HO" ("MaDotUngHo", "MaDVUH", "NgayUngHo") FROM stdin;
UH003	CTY02	2015-08-10 00:00:00
UH001	CN002	2019-05-21 00:00:00
UH005	CTY02	2016-11-11 00:00:00
UH002	CTY01	2015-11-19 00:00:00
UH004	CTY02	2015-10-20 00:00:00
\.


--
-- Data for Name: HINH_THUC_UH; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HINH_THUC_UH" ("MaHinhThucUH", "TenHinhThucUngHo") FROM stdin;
HT01	Tien mat
HT02	Mi tom
HT03	Quan ao
\.


--
-- Data for Name: HO_DAN; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HO_DAN" ("MaHoDan", "HoTenChuHo", "ToDanPho", "KhoiHoacThon", "SoDienThoai", "DiaChiNha", "SoNhanKhau", "DienGiaDinh", "LaHoNgheo") FROM stdin;
HD001	Tran Van B1	10	5	0915222000	12 Tran Van On	5	Cong nhan vien chuc	t
HD003	Tran Van B3	12	7	0915222002	14 Phan Chu Trinh	2	Cong nhan vien chuc	f
HD004	Tran Van B4	13	7	0915222003	15 Phan Chu Trinh	6	Thuong binh	t
HD002	Tran Van B2	11	6	0915222001	13 Nguyen Huu Tho	1	Me VNAH	t
\.


--
-- Name: CHI_TIET_NHAN_UNG_HO CHI_TIET_NHAN_UNG_HO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CHI_TIET_NHAN_UNG_HO"
    ADD CONSTRAINT "CHI_TIET_NHAN_UNG_HO_pkey" PRIMARY KEY ("MaDotNhanUngHo", "MaHinhThucUH");


--
-- Name: CHI_TIET_UNG_HO CHI_TIET_UNG_HO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CHI_TIET_UNG_HO"
    ADD CONSTRAINT "CHI_TIET_UNG_HO_pkey" PRIMARY KEY ("MaDotUngHo", "MaHinhThucUH");


--
-- Name: DON_VI_UNG_HO DON_VI_UNG_HO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DON_VI_UNG_HO"
    ADD CONSTRAINT "DON_VI_UNG_HO_pkey" PRIMARY KEY ("MaDVUH");


--
-- Name: DOT_NHAN_UNG_HO DOT_NHAN_UNG_HO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOT_NHAN_UNG_HO"
    ADD CONSTRAINT "DOT_NHAN_UNG_HO_pkey" PRIMARY KEY ("MaDotNhanUngHo");


--
-- Name: DOT_UNG_HO DOT_UNG_HO_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DOT_UNG_HO"
    ADD CONSTRAINT "DOT_UNG_HO_pkey" PRIMARY KEY ("MaDotUngHo");


--
-- Name: HINH_THUC_UH HINH_THUC_UH_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HINH_THUC_UH"
    ADD CONSTRAINT "HINH_THUC_UH_pkey" PRIMARY KEY ("MaHinhThucUH");


--
-- Name: HO_DAN HO_DAN_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HO_DAN"
    ADD CONSTRAINT "HO_DAN_pkey" PRIMARY KEY ("MaHoDan");


--
-- PostgreSQL database dump complete
--

