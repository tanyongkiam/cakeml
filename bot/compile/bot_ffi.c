#include <csetjmp>
#include <stdint.h>
#include <assert.h>
#include <string.h>

// For calling to/from CakeML
extern "C" int cml_main(int argc, char **argv);
extern "C" void cml_exit(void);
std::jmp_buf env;

// Expose FFIs to CakeML
extern "C" void ffiget_const (int32_t *c, long clen, int32_t *a, long alen);
extern "C" void ffiget_sensor(int32_t *c, long clen, int32_t *a, long alen);
extern "C" void ffiget_ctrl (int32_t *c, long clen, int32_t *a, long alen);
extern "C" void ffiactuate(char *c, long clen, int32_t *a, long alen);
extern "C" void ffihas_next(int32_t *c, long clen, int8_t *a, long alen);
extern "C" void ffiviolation(char *c, long clen, int32_t *a, long alen);

void ffiget_const (int32_t *c, long clen, int32_t *a, long alen) {
  assert(clen == 0);
  assert(alen == 2 * 4);

 /*
  * Insert code for computing the constants here
  */

  // Set the values of constants
  a[0] = V; // sets V
  a[1] = ep; // sets ep
}

void ffiget_sensor(int32_t *c, long clen, int32_t *a, long alen) {
  assert(clen == 0);
  assert(alen == 2 * 4);

 /*
  * Insert code for computing the current sensor values here
  */

  // Set the current sensor values
  a[0] = d; // sets d
  a[1] = t; // sets t
}

void ffiget_ctrl(int32_t *c, long clen, int32_t *a, long alen) {
  assert(clen == 4 * 4);
  assert(alen == 2 * 4);

  // the constants
  int32_t V = c[0]; // the current V
  int32_t ep = c[1]; // the current ep
  // the current sensor values
  int32_t d = c[2]; // the current d
  int32_t t = c[3]; // the current t

 /*
  * Insert code for computing the (unverified) control values here
  */

  // Set the control values
  a[0] = t; // sets t
  a[1] = v; // sets v
}

void ffiactuate(char *c, long clen, int32_t *a, long alen) {
  assert(alen == 2 * 4);

  // the actuation values
  int32_t t = a[0]; // the current t
  int32_t v = a[1]; // the current v

  const char* how = (const char *)c; // distinguish between normal OK and fallback
  if (strncmp(how,"OK",clen) == 0) {
    // Control monitor OK
  } else if (strncmp(how,"Control Violation",clen) == 0) {
    // Control monitor violated
  } else {
    // Unknown string -- should never occur
    assert(false);
  }

 /*
  * Insert code for actuating the controls
  */
}

void ffihas_next(int32_t *c, long clen, int8_t *a, long alen) {
  assert(clen == 0);
  assert(alen == 1);

  bool has_next = true;

  /*
   * Insert code for deciding whether to continue running here
   */

  if (has_next)
    a[0] = 1;
  else
    a[0] = 0;
}

void ffiviolation(char *c, long clen, int32_t *a, long alen) {
  assert(alen == 0);

  const char* how = (const char *)c; // distinguish between normal OK and fallback
  if (strncmp(how,"Init Violation",clen) == 0) {
    // Initial conditions violated
  } else if (strncmp(how,"Plant Violation",clen) == 0) {
    // Plant monitor violated
  }  else {
    // Unknown string -- should never occur
    assert(false);
  }

  /*
   * Insert code for handling violation here
   */
}


void cml_exit(void) {
  longjmp(env,1);
}

int main (int argc, char **argv) {

  /*
   * Insert initialization code here
   */

  // Passing control to CakeML
  int sj = 0;
  sj = setjmp(env);
  if (sj == 0) {
    int ret = cml_main(argc,argv);
    // CakeML return value is stored in ret
  }

  /*
   * Insert cleanup code here
   */
}