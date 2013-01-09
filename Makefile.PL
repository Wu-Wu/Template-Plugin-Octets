use 5.008009;
use ExtUtils::MakeMaker;

my $meta_merge = {
    META_MERGE => {
        resources => {
            repository => 'https://github.com/Wu-Wu/Template-Plugin-Octets',
            bugtracker => 'https://github.com/Wu-Wu/Template-Plugin-Octets/issues',
        },
    }
};

my %options = (
    NAME          => 'Template::Plugin::Octets',
    AUTHOR        => 'Anton Gerasimov <chim@cpan.org>',
    VERSION_FROM  => 'lib/Template/Plugin/Octets.pm',
    ABSTRACT_FROM => 'lib/Template/Plugin/Octets.pm',
    LICENSE       => 'perl',
    PREREQ_PM     => {
        'Template' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => '0.98',
        'Test::Pod'  => '1.22',
    },
    MIN_PERL_VERSION => '5.8.9',
    test => {
        'TESTS' => 't/*.t',
    },
    clean => {
        'FILES' => '*.tar.gz',
    },
    $ExtUtils::MakeMaker::VERSION >= 6.50 ? (%$meta_merge) : (),
);

WriteMakefile(%options);
