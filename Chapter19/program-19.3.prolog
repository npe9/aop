/*
        The grammar for the declarative part of a Pascal program.
*/
        declarative_part -->
            const_declaration, type_declaration,
            var_declaration, procedure_declaration.

%        Constant declarations

        const_declaration --> [ ].
        const_declaration -->
            [const], const_definition, [;], const_definitions.

        const_definitions --> [ ].
        const_definitions -->
            const_definition, [;], const_definitions.

        const_definition --> identifier, [=], constant.

        identifier --> [X], {atom(X)}.

        constant --> [X], {constant(X)}.

%        Type declarations

        type_declaration --> [ ].
        type_declaration -->
            [type], type_definition, [;], type_definitions.

        type_definitions --> [ ].
        type_definitions --> type_definition, [;], type_definitions.

        type_definition --> identifier, [=], type.

        type --> [`INTEGER'].
        type --> [`REAL'].
        type --> [`BOOLEAN'].
        type --> [`CHAR'].

%        Variable declarations

        var_declaration --> [ ].
        var_declaration -->
            [var], var_definition, [;], var_definitions.

        var_definitions --> [ ].
        var_definitions --> var_definition, [;], var_definitions.
        var_definition --> identifiers, [:], type.

        identifiers --> identifier.
        identifiers --> identifier, [,], identifiers.

%        Procedure declarations

        procedure_declaration --> [ ].
        procedure_declaration --> procedure_heading, [;], block.

        procedure_heading -->
            [procedure], identifier, formal_parameter_part.

        formal_parameter_part --> [ ].
        formal_parameter_part --> [(], formal_parameter_section, [)].

        formal_parameter_section --> formal_parameters.
        formal_parameter_section -->
            formal_parameters, [;], formal_parameter_section.

        formal_parameters --> value_parameters.

        formal_parameters --> variable_parameters.

        value_parameters --> var_definition.

        variable_parameters --> [var], var_definition.

%     Program 19.3:  Parsing the declarative part of a Pascal block