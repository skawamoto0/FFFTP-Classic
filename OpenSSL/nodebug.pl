open(FILE, '<makefile');
@data = <FILE>;
close(FILE);
open(FILE, '>makefile');
for(@data)
{
	$_ =~ s/ \/debug//g;
	$_ =~ s/\$\(MTOUTFLAG\)libssl-3-x64\.dll/\$\(MTOUTFLAG\)libssl-3-x64\.dll;#2/g;
	$_ =~ s/\$\(MTOUTFLAG\)libcrypto-3-x64\.dll/\$\(MTOUTFLAG\)libcrypto-3-x64\.dll;#2/g;
	$_ =~ s/\$\(MTOUTFLAG\)libssl-3\.dll/\$\(MTOUTFLAG\)libssl-3\.dll;#2/g;
	$_ =~ s/\$\(MTOUTFLAG\)libcrypto-3\.dll/\$\(MTOUTFLAG\)libcrypto-3\.dll;#2/g;
	$_ =~ s/\"-DENGINESDIR=/\"-DENGINESDIR=\\\"\.\\\"\" \"-D_ENGINESDIR=/g;
	$_ =~ s/\"-DOPENSSLDIR=/\"-DOPENSSLDIR=\\\"\.\\\"\" \"-D_OPENSSLDIR=/g;
	print FILE $_;
}
close(FILE);
exit(0);
