requires 'parent';
requires 'Exporter';
requires 'if';
requires 'Cwd';
on build => sub {
    requires 'Test::More';
    required 'Test::Requires';
};
