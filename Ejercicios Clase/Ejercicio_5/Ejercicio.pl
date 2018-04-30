#!/bin/perl

($nombre_archivo) = @ARGV;

#print "Nombre del archivo: $nombre_archivo \n";

open(ENTRADA, "<$nombre_archivo") || die "ERROR: no se pudo abrir el archivo $nombre_archivo";

%hash;

while ($linea = <ENTRADA>)
{
	#print $linea . "\n";

	@pareja = split(",", $linea);	

	#print "Clave: $pareja[0]; Valor: $pareja[1] \n"

	$hash{$pareja[0]} = $pareja[1];
}

@claves = keys(%hash);
@valores = values(%hash);

print "Claves: \n \n";

foreach my $clave (@claves) {
	print $clave . "\n";
}

print "\n";
print "Valores: \n \n";

foreach my $valor (@valores) {
	print $valor;
}

close(ENTRADA);