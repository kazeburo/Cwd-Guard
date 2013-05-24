use inc::Module::Install;
name 'Cwd-Guard';
all_from 'lib/Cwd/Guard.pm';

requires 'Cwd';
requires 'parent';
requires 'Exporter';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
test_requires 'File::Basename';
auto_set_repository;
WriteAll;
