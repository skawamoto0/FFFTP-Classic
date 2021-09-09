open(FILE, '<e_os.h');
@data = <FILE>;
close(FILE);
open(FILE, '>e_os.h');
for(@data)
{
	print FILE $_;
}
print FILE "#undef AI_PASSIVE\n";
print FILE "#define OPENSSL_USE_NODELETE\n";
close(FILE);
open(FILE, '<crypto\\threads_win.c');
@data = <FILE>;
close(FILE);
open(FILE, '>crypto\\threads_win.c');
print FILE "#define _WIN32_WINNT 0x0500\n";
for(@data)
{
	print FILE $_;
	if($_ =~ /#include <openssl\/crypto.h>/)
	{
		print FILE "LONG64 InterlockedOr64(LONG64 volatile *a, LONG64 b)\n";
		print FILE "{\n";
		print FILE "    LONG64 c;\n";
		print FILE "    do\n";
		print FILE "    {\n";
		print FILE "        c = *a;\n";
		print FILE "    }\n";
		print FILE "    while(_InterlockedCompareExchange64(a, b | c, c) != c);\n";
		print FILE "    return c;\n";
		print FILE "}\n";
	}
}
close(FILE);
exit(0);
