use inc::Module::Install;
name 'Cwd-Guard';
all_from 'lib/Cwd/Guard.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
