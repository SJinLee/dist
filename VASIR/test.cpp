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


