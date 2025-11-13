#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';
use Cwd 'abs_path';
use WWW::Mechanize;

# -----------------------------
# Configuration
# -----------------------------
my $sid = 3075;
my $passfile = './vim_passfile';
my $vim_version = '7.4';  # choose desired Vim version

# -----------------------------
# Read username/password
# -----------------------------
sub get_user_password {
    open my $fh, '<', $passfile or die "Cannot open password file '$passfile': $!\n";
    chomp(my @lines = <$fh>);
    close $fh;

    die "Password file must contain at least two lines" unless @lines >= 2;
    return @lines[0,1];  # username, password
}

# -----------------------------
# Select latest .vmb file
# -----------------------------
sub select_latest_file {
    my $scriptversion = 0;
    my $file;

    my @files = glob('*.vmb');
    die "No .vmb files found in current directory!" unless @files;

    for my $f (@files) {
        next unless -f $f;
        if ($f =~ /(\d+)\.vmb$/) {
            my $version = $1;
            if ($version > $scriptversion) {
                $scriptversion = $version;
                $file = $f;
            }
        }
    }

    die "No suitable .vmb file found!" unless defined $file;
    return ($file, $scriptversion);
}

# -----------------------------
# Main
# -----------------------------
# Get comment from command-line
my $version_comment = shift @ARGV or die "Please provide a version comment!\n";
$version_comment .= "\n(automatically uploaded)";

# Get credentials
my ($username, $password) = get_user_password();

# Get latest file and version
my ($file, $scriptversion) = select_latest_file();
say "Selected file: $file (version $scriptversion)";

# -----------------------------
# Mechanize upload
# -----------------------------
my $mech = WWW::Mechanize->new(autocheck => 1);

# Login
$mech->get("http://www.vim.org/login.php");
$mech->submit_form(
    form_name => 'login',
    with_fields => {
        userName => $username,
        password => $password,
    },
);

my $file_path = abs_path($file) or die "Cannot resolve full path of '$file'";

# set the timeout
$mech->timeout(30);
# Go to script page and upload
$mech->get("http://www.vim.org/scripts/script.php?script_id=$sid");
$mech->follow_link(text => 'upload new version');

# Select the upload form safely
$mech->form_name('script') or die "Upload form 'script' not found!";
# attach file explicitly
$mech->field( script_file => $file_path);
$mech->field(vim_version => $vim_version);
$mech->field(script_version => $scriptversion);
$mech->field(version_comment => $version_comment);

# Submit the upload button explicitly
$mech->click_button(value => 'upload');

say "Upload completed successfully!";
