.PHONY: man
man:
	echo "help"

wc:
	cd 01wc \
	&& flex fb1-1.l \
	&& gcc lex.yy.c -o wc

e2a:
	cd 02e2a \
	&& flex fb1-2.l \
	&& gcc lex.yy.c -o e2a

str2exp:
	cd 03str2exp \
	&& flex fb1-3.l \
	&& gcc lex.yy.c -o str2exp

calc: 05calc/fb1-5.l 05calc/fb1-5.y
	cd 05calc \
	&& bison -d fb1-5.y \
	&& flex fb1-5.l \
	&& gcc fb1-5.tab.c lex.yy.c -o $@ -lfl

calcast:
	cd 06calcast \
	&& bison -d fb3-1.y \
	&& flex fb3-1.l \
	&& gcc fb3-1.h fb3-1.tab.c fb3-1.tab.h lex.yy.c fb3-1.c -o $@ -lfl

supercalc:
	cd 07supercalc \
	&& bison -d fb3-2.y --report=all \
	&& flex fb3-2.l \
	&& gcc fb3-2.h fb3-2.tab.c fb3-2.tab.h lex.yy.c fb3-2func.c -o $@ -lfl -lm

.PHONY: clean
clean:
	-rm **/*.yy.c
	-rm **/*.tab.c **/*.tab.h
	-rm 01wc/wc
	-rm 02e2a/e2a
	-rm 03str2exp/str2exp
	-rm 05calc/calc
	-rm 06calcast/calcast
	-rm 07supercalc/supercalc
