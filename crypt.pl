#!/usr/bin/perl
# Utility to decrypt an encrypted file to stdout 

require "xcrypt.pl";

#$tmp = "./tmp~$$";
#print "tmp file = $tmp\n";

$encrypt = 0;
$verbose = 0;
$stdin = 0;
$comline = 0;

#--------------------------------------------------------------------------
# Parse arguments:

while(1)
    {
    my ($tmp, $sloop);

    $sloop = 0;
    if($ARGV[$aloop] eq "" || $ARGV[$aloop] eq "\r")
        {last;}

    $tmp = substr($ARGV[$aloop], $sloop++, 1);
    if ($tmp ne "-") {last;}

    while(1)
        {
        $tmp = substr($ARGV[$aloop], $sloop++, 1);
        if ($tmp eq "" || $tmp eq "\r") {$aloop++; last};

        # Option crunch
        if    ($tmp eq "e") {  $encrypt = 1; }
        elsif ($tmp eq "v") {  $verbose = 1;}
        elsif ($tmp eq "s") {  $stdin = 1;}
        #elsif ($tmp eq "c") {  $comline = 1;}

       # Option with argument
        elsif($tmp eq "d"){$sloop=0;$aloop++;$date = $ARGV[$aloop++]; last;}
        #elsif($tmp eq "t"){$sloop=0;$aloop++;$depth = $ARGV[$aloop]; }

        else  { print "Unknown option: -$tmp.\n"; exit(0);}
        }
}

    if($stdin)
	{
	print STDERR "Enter phrase to encrypt: ";
	$line = <STDIN>;
    $line = $line . "\n";
	#print "Res: '" . $line . "'\n";
	$enc = xcrypt::encrypt($line, "1234");
	print	$enc;
	exit;
	}

   $aa = @ARGV[$aloop];

   if ($aa eq "")
	{
        print "Decrypt file to stdout.\n"; 
	    print "Usage: crypt [options] filename\n"; 
    	print "   Options:\n"; 
    	print "   	-e 	encrypt\n"; 
    	print "   	-s 	pass on stdin\n"; 
    	#print "   	-c 	encrypt from comline\n"; 
    	print "   	-v 	verbose\n"; 
	exit;
	}

	if($encrypt)
		{
        #if ($comline)
        #    {
        #    $enc = xcrypt::encrypt($sum, "1234");
        #	print	$enc;
        #    }
        #else    
        #    { 
		    encrypt($aa);
        #     }
		}
	else
		{
		decrypt($aa);
		}

	exit(0);

# --------------------------------------------

sub encrypt

{
	#print "encryptiong\n";

    my($fname) = @_;

    if (!open(keytab, $fname))
    	{
	print "Cannot open file: '$fname' $!\n"; 
	exit;
    	}

    while (<keytab>)
    	{
	if($_ eq "") { last ; }                  #empty line
	$sum = $sum . $_;
    	}

    	close(keytab); 

	$enc = xcrypt::encrypt($sum, "1234");
	print	$enc;
}

# ----------------------------------------------------

sub decrypt

{	
    my($fname) = @_;

    if (!open(keytab, $fname))
    	{
	print "Cannot open file: '$fname' $!\n"; 
	exit;
    	}

    while (<keytab>)
    	{
	if($_ eq "") { last ; }                  #empty line
	$nn++;

	$sum = $sum . $_;
    	}
    close(keytab); 

	print	$_;
	$dec = xcrypt::decrypt($sum, "1234");
	print	$dec;

}

# --------------------------------------------------------------
# Set file properties back to original
# use: fileprop $filename, @tempstat

sub fileprop

{
    my($fname, @co) = @_;
    #print "$fname size = $co[7]\n";

    if(!chown($co[4], $co[5], $fname))
    	{
		print "Warning: Cannot change owner/group on $fname $!\n";
    	}
    if(!utime($co[8], $co[9], $fname))
    	{
		print "Cannot change time/date on $fname $!\n";
    	}
    if(!chmod($co[2], $fname))
    	{
		print "Cannot change mode on $fname $1\n";
    	}
    1;
}










