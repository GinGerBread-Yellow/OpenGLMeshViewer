# INCFLAGS  = -I /usr/include/GL
# INCFLAGS += -I /mit/6.837/public/include/vecmath

# LINKFLAGS  = -lglut -lGL -lGLU
# LINKFLAGS += -L /mit/6.837/public/lib -lvecmath
# mac
INCFLAGS = -I vecmath/include/

FRAMEWORKS = -framework Glut
FRAMEWORKS += -framework OpenGL

LINKFLAGS = -L vecmath/lib/ -lvecmath

CFLAGS    = -O2
CC        = g++
SRCS      = main.cpp
OBJS      = $(SRCS:.cpp=.o)
PROG      = a0

all: $(SRCS) $(PROG)

$(PROG): $(OBJS)
	$(CC) -w $(FRAMEWORKS) $(CFLAGS) $(OBJS) -o $@ $(INCFLAGS) $(LINKFLAGS)

.cpp.o:
	$(CC) -w $(CFLAGS) $< -c -o $@ $(INCFLAGS)

depend:
	makedepend $(INCFLAGS) -Y $(SRCS)

clean:
	rm $(OBJS) $(PROG)

