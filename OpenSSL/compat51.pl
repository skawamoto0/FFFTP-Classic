open(FILE, '<crypto\\threads_win.c');
@data = <FILE>;
close(FILE);
open(FILE, '>crypto\\threads_win.c');
print FILE "#define _WIN32_WINNT 0x0501\n";
for(@data)
{
	print FILE $_;
}
close(FILE);
exit(0);
