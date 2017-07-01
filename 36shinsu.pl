local $word;
my $cnt =0;

while(<>){

    chomp;
        $word = $word . $_;
        $cnt++;
        if($cnt >= 5){
                change_36($word).$/;
                $cnt =0;
        }
}

sub change_36($word){
        my $symb;
        $symb = $word;
         $symb =~ s/[\#]/1/g;
        $symb =~ s/[\.]/0/g;
#print $symb;

#my $num10 = unpack("C" ,pack("B8",$symb));
my $num10 = oct "0b" . $symb;
#print $num10;
my $num16 = sprintf("%x",$num10);
$num10 = hex($num16);
my $answer = convCardinalNum($num10,36);
        #printf("$answer\n");

        return 0;
}
sub convCardinalNum{
my ($dec, $cn) = @_;
my @ch = (0..9, 'a'..'z');
my $str = '';

while ($dec){
$str = $ch[$dec % $cn] . $str;
$dec = int($dec / $cn);
}
return $str;
}
