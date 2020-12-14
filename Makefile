FLAT_TEXT_FONT?=	Bangers
FLAT_TEXT_1?=	Default text 1
FLAT_TEXT_2?=	Default text 2
FLAT_TEXT_FLAGS?=
FLAT_TEXT_HOLDER_FLAGS?=

OPENSCADPATH=   ""
OPENSCAD_BIN?=   openscad

TARGETS=	flat_text.stl flat_text.png flat_text_holder.stl flat_text_holder.png

all:	${TARGETS}

flat_text.stl flat_text.png: flat_text.scad
	env OPENSCADPATH=${OPENSCADPATH} ${OPENSCAD_BIN} --render \
		-o ${.TARGET} \
		-D flat_text_font='"${FLAT_TEXT_FONT}"' \
		-D flat_text_1='"${FLAT_TEXT_1}"' \
		-D flat_text_2='"${FLAT_TEXT_2}"' \
		${FLAT_TEXT_FLAGS} \
		flat_text.scad

flat_text_holder.stl flat_text_holder.png: flat_text_holder.scad
	env OPENSCADPATH=${OPENSCADPATH} ${OPENSCAD_BIN} --render \
		-o ${.TARGET} \
		${FLAT_TEXT_HOLDER_FLAGS} \
		flat_text_holder.scad

clean:
	# XXX openscad dumps core at exit
	rm -f ${TARGETS} openscad.core

show-fonts:
	fc-list -f "%-60{{%{family[0]}%{:style[0]=}}}%{file}\n" | sort
# vim: noexpandtab
