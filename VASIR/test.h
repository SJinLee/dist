#if BUILDING_LIBFOO && HAVE_VISIBILITY
  #define LIBFOO_DLL_EXPORTED extern "C" __attribute__((__visibility__("default")))
#else
  #define LIBFOO_DLL_EXPORTED
#endif

struct image2 {
  int hsize[2];
  unsigned char* data;
};

struct templ {
  int hsize[2];
  int* template1;
  int* mask;
};

LIBFOO_DLL_EXPORTED struct image2* readimage(const char * name);

LIBFOO_DLL_EXPORTED struct templ* createTemplate2(const char* filename);

