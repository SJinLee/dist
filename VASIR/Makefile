# http://developinghappiness.com/?page_id=222
CC = gcc

SRC = AlignLRPupilPos.cpp CreateTemplate.cpp EdgeDensity.cpp \
      EncodeLee.cpp EyeDetection.cpp EyeRegionExtraction.cpp \
      FindEyelidCurve.cpp FindHighLights.cpp FindIrisCircle.cpp \
      FindPupilCircleNew.cpp FindTwoPupilCircles.cpp GaborConvolve.cpp \
      GetHammingDistance.cpp ImageQuality.cpp ImageUtility.cpp \
      MasekLee.cpp MatchAlg.cpp MatchingTemplate.cpp Normalization.cpp \
      Shifts.cpp test.cpp

OBJ = $(SRC:%.cpp=%.o)

CFLAGS = -fPIC -march=native -O2 \
         -I ../MasekAlg -DBUILDING_LIBFOO -DHAVE_VISIBILITY

LIB = -fvisibility=hidden -lc -L ../MasekAlg -lmasekalg -lopencv_core -lopencv_imgproc -lopencv_highgui -lopencv_ml -lopencv_video -lopencv_features2d -lopencv_calib3d -lopencv_objdetect -lopencv_contrib -lopencv_legacy -lopencv_flann

TARGET = libvasir.so

OPT = -shared -Wl,-soname,libvasir.so.1

all : $(TARGET)

$(TARGET) : $(OBJ)
	$(CC) $(OPT) -o $(TARGET).1 $(OBJ) $(LIB)
	if [ ! -e "$(TARGET)" ]; then ln -s $(TARGET).1 $(TARGET); fi

$(OBJ) :
	$(CC) $(CFLAGS) -c -o $@ $(@:.o=.cpp)

depend:
	$(CC) $(CFLAGS) -MM $(SRC) > dependfile

clean:
	rm -f $(OBJ) $(TARGET).1

ifneq ($(MAKECMDGOALS), clean)
ifneq ($(MAKECMDGOALS), depend)
ifneq ($(SRC),)
-include dependfile;
endif
endif
endif
