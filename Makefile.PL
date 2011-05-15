use inc::Module::Install;

all_from('lib/HTML/Video/Embed.pm');

requires 'Moose';
requires 'namespace::autoclean';
requires 'Moose::Role';
requires 'URI';
requires 'URI::QueryParam';
requires 'URI::Escape::XS';

requires 'Data::Validate::URI';
requires 'Module::Find';
test_requires 'Test::More';

auto_install;
WriteAll;
