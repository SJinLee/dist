CC = g++
AR = ar

SRC = adjgamma.cpp canny.cpp circlecoordinates.cpp createiristemplate.cpp \
    encode.cpp findcircle.cpp findline.cpp gaborconvolve.cpp gauss.cpp \
    gethammingdistance.cpp houcircle.cpp hysthresh.cpp imread.cpp \
    imwrite.cpp interp2.cpp linecoords.cpp mymat.cpp nonmaxsup.cpp \
    normalizeiris.cpp radon.cpp saveiristemplate.cpp segmentiris.cpp \
    shiftbits.cpp utility.cpp

OBJ = $(SRC:%.cpp=%.o)

CFLAGS = -fpic

LIB = -lc

TARGET = libmasekalg.a

OPT = rcs

all : $(TARGET)

$(TARGET) : $(OBJ)
	$(AR) $(OPT) $(TARGET) $(OBJ)

$(OBJ) :
	$(CC) $(CFLAGS) -c -o $@ $(@:.o=.cpp)

depend:
	$(CC) $(CFLAGS) -MM $(SRC) > dependfile

clean:
	rm -f $(OBJ) $(TARGET)

include dependfile
