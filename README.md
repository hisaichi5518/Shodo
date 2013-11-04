# NAME

Shodo - Auto-generate documents from HTTP::Request and HTTP::Response

# SYNOPSIS

    use HTTP::Request::Common;
    use HTTP::Response;
    use Shodo;

    my $shodo = Shodo->new();
    my $suzuri = $shodo->new_suzuri('An endpoint method.');

    my $req = POST '/entry', [ id => 1, message => 'Hello Shodo' ];
    $suzuri->request($req);
    my $res = HTTP::Response->new(200);
    $res->content('{ "message" : "success" }');
    $suzuri->response($res);

    print $suzuri->document(); # print document as Markdown format

# DESCRIPTION

Shodo generates Web API documents as Markdown format automatically and validates parameters using HTTP::Request/Response.

__THIS IS A DEVELOPMENT RELEASE. API MAY CHANGE WITHOUT NOTICE__.

# Methods of "Shodo" Module

## new

    my $shodo = Shodo->new(
        document_root => 'doc'
    );

Create and return new Shodo object. "document\_root" is optional parameter for your document root directory.

## template

    $shodo->template($tmpl);

Set custom template.

## document\_root

    $shodo->document_root('doc');

Set document root directory.

## new\_suzuri

    my $suzuri = $shodo->new_suzuri('This is description.');

Create and return new Suzuri object with the description.

## stock

    $shodo->stock($suzuri->doc());

Stock text of documents for writing later. The parameter document is anything ok, but Markdown based is recommended.

## write

    $shodo->write('output.md');

Write the documentation in stocks to the file and make the stock empty.

# Methods of "Suzuri" Module

## request

    $suzuri->request($req);

Set HTTP::Request object.

## response

    $suzuri->response($res);

Set HTTP::Response object.

## params

    $suzuri->params(
        category => { isa => 'Str', documentation => 'Category of articles.' },
        limit => { isa => 'Int', default => 20, optional => 1, documentation => 'Limitation numbers per page.' },
        page => { isa => 'Int', default => 1, optional => 1, documentation => 'Page number you want to get.' }
    );

Parameters for validation and documentation. These rules are based on [Data::Validator](http://search.cpan.org/perldoc?Data::Validator)'s interfaces.

## validate

    $suzuri->validate($params);

Validate with the rules defined by "params" method. Parameter must be HASH ref.

## doc

    $suzuri->doc();

Return the Markdown formatted document for Web API.

# SEE ALSO

"autodoc": [https://github.com/r7kamura/autodoc](https://github.com/r7kamura/autodoc)

[Test::JsonAPI::Autodoc](http://search.cpan.org/perldoc?Test::JsonAPI::Autodoc)

What is Shodo?: [http://en.wikipedia.org/wiki/Shodo](http://en.wikipedia.org/wiki/Shodo)

# THANKS

Songmu for naming as "Shodo". It's pretty.

Moznion for making Test::JsonAPI::Autodoc.

Hachioji.pm for advising.

# LICENSE

Copyright (C) Yusuke Wada.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Yusuke Wada <yusuke@kamawada.com>
