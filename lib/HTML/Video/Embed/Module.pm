package HTML::Video::Embed::Module;
use Moo::Role;

has 'domain_reg' => (
    'is' => 'lazy',
    'init_arg' => undef,
);

has 'validate_reg' => (
    'is' => 'lazy',
    'init_arg' => undef,
);

requires '_build_domain_reg';
requires '_build_validate_reg';
requires 'process';

1;
