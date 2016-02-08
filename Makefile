# bfw
# See LICENSE file for copyright and license details.

include config.mk

all:

dist:
	@echo creating dist tarball
	@mkdir -p bfw-${VERSION}
	@cp -R LICENSE Makefile README config.mk etc bin bfw-${VERSION}
	@tar -cf bfw-${VERSION}.tar bfw-${VERSION}
	@gzip bfw-${VERSION}.tar
	@rm -rf bfw-${VERSION}

install: all
	@echo installing script to ${DESTDIR}${PREFIX}/bin
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f bin/bfw ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/bfw
#	@echo installing manual page to ${DESTDIR}${MANPREFIX}/man1
#	@mkdir -p ${DESTDIR}${MANPREFIX}/man1
#	@sed "s/VERSION/${VERSION}/g" < st.1 > ${DESTDIR}${MANPREFIX}/man1/st.1
#	@chmod 644 ${DESTDIR}${MANPREFIX}/man1/st.1

uninstall:
	@echo removing script from ${DESTDIR}${PREFIX}/bin
	@rm -f ${DESTDIR}${PREFIX}/bin/bfw

.PHONY: all dist install uninstall
