#include <stdio.h>
#include "test.h"
#include "Masek.h"
#include "CreateTemplate.h"


LIBFOO_DLL_EXPORTED struct image2* readimage(const char * name)
{
  Masek ms;
  Masek::IMAGE *img = ms.imread(name);
  if (img == NULL) return 0;
  return (struct image2*)img;
}

/*	ICE2005_IRIS_LG2200             01 (CODE: ICE)
        MBGC_IRIS_LG2200                02 (CODE: MIL)
        MBGC_FACE_IOM                   03 (CODE: MFI)
        ND_IRIS20_LG4000                04 (CODE: N20)
        ND_IRIS48_LGICAM                05 (CODE: N48)
        ND_IRIS49_IRISGUARD             06 (CODE: N49)
        ND_IRIS59_CFAIRS                07 (CODE: N59)*/
LIBFOO_DLL_EXPORTED struct templ* createTemplate2(const char* filename)
{
  int *template1=NULL;
  int *mask=NULL;
  int width=10, height=10;
  struct templ* res = (struct templ*)malloc(sizeof(struct templ));
  CreateTemplate::newCreateIrisTemplate(filename, &template1, &mask,
    &width, &height, 01);
  res->template1 = template1;
  res->mask = mask;
printf("%d,%d\n",width,height);
  res->hsize[0] = height;
  res->hsize[1] = width;
  return res;
}


