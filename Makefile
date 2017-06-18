# Created by: Jov <amutu@amutu.com>
# $FreeBSD$

PORTNAME=	pgloader3
PORTVERSION=	3.3.2
DISTVERSIONPREFIX=	v
CATEGORIES=	databases

MAINTAINER=	amutu@amutu.com
COMMENT=	Data loading tool for PostgreSQL,using the COPY command

LICENSE=	PostgreSQL

BUILD_DEPENDS=	ccl:lang/ccl
LIB_DEPENDS=	libsqlite3.so:databases/sqlite3 \
		libtdsodbc.so:databases/freetds

CONFLICTS=	pgloader-2*

USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	dimitri
GH_PROJECT=	pgloader
GH_TUPLE=	amutu:quicklisp_offline:e9008cc:qlp/build/quicklisp

PLIST_FILES=	bin/pgloader \
		bin/pgloader3 \
		man/man1/pgloader.1.gz

MAKE_ARGS=	CL=ccl
MAKE_ENV=	ASDF_OUTPUT_TRANSLATIONS=/:

# stripping can break lisp binaries
STRIP=

post-patch:
	${LN} ${WRKSRC}/build/quicklisp/quicklisp.lisp ${WRKSRC}/build

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/build/bin/pgloader ${STAGEDIR}${PREFIX}/bin/pgloader3
	${INSTALL_SCRIPT} ${WRKSRC}/pgloader_wrapper.sh ${STAGEDIR}${PREFIX}/bin/pgloader
	${INSTALL_MAN} ${WRKSRC}/pgloader.1 ${STAGEDIR}${MANPREFIX}/man/man1

.include <bsd.port.mk>
