#include <stdio.h>

#include "../VASIR/test.h"

int main()
{
  struct image2* img;
  struct templ* tmp;
  img = readimage("../../ICE/Left/7004(R-1-0)288615_239279_E_S.bmp");
  printf("hsize=(%d,%d)\n",img->hsize[0],img->hsize[1]);
  tmp = createTemplate2("../../ICE/Left/7004(R-1-0)288615_239279_E_S.bmp");
  printf("Height=%d, Width=%d\n", tmp->hsize[0], tmp->hsize[1]);

  return 0;
}
