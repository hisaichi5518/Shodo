requires 'perl', '5.008001';

requires 'HTTP::Message';
requires 'JSON';
requires 'Text::MicroTemplate';
requires 'Try::Tiny';

on 'test' => sub {
    requires 'Test::More', '0.98';
};
