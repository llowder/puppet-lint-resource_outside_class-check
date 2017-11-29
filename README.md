# puppet-lint-resource_outside_class-check
Adds a new puppet-lint check to see if resources exist outside of a class or defined type.

##Installation
`gem install puppet-lint-resource_outside_class-check`

##Usage

This check will detect if resources exist outside of a class or defined types.

Conditions caught:
 - resource before start of a class or defined type definiton
 - resources after the close of a class or defined type definition
 - resources in a manifest that do not have a class or defiend type definition



