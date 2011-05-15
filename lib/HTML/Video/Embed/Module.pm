package HTML::Video::Embed::Module;
use Moose::Role;

has 'domain_reg' => (
    'is' => 'ro',
    'isa' => 'RegexpRef',
    'init_arg' => undef,
    'lazy_build' => 1,
    'lazy' => 1,
);

has 'validate_reg' => (
    'is' => 'ro',
    'isa' => 'RegexpRef',
    'init_arg' => undef,
    'lazy_build' => 1,
    'lazy' => 1,
);

requires '_build_domain_reg';
requires '_build_validate_reg';
requires 'process';

1;
