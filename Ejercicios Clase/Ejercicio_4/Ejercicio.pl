#!/bin/perl

($porcentaje) = @ARGV;

print "Ingrese 10 valores separados por coma \n";

$entrada = <STDIN>;

@lista_entrada = split(",", $entrada);

@salida;

for (my $var = 0; $var < @lista_entrada; $var++) {
    $salida[$var] = (@lista_entrada[$var] * $porcentaje) / 100;
}

foreach my $x (@salida) {
    print $x . "\n";
}

