Inaccessible Attributes
=======================

This plugin disables mass assignment by default, and prevents the use of attr\_protected. Attributes safe for mass assignment must be specified using attr\_accessible. Logging is also improved to help prevent attr\_accessible-related errors:

* A message is displayed during migrations as a reminder to use attr\_accessible for newly added attributes.
* Exceptions are raised on mass assignment of unsafe attributes

Disabling Inaccessible Attributes
=================================
Some third party/legacy code may not play nice with this plugin.
The behavior can be disabled with the <tt>disable\_mass\_assignment</tt> method:

    ThirdPartyModel.send(:disable\_mass\_assignment, false)

In your own classes, the plugin must be disabled before the offending code is mixed in.

    class MyModel < ActiveRecord::Base
      disable_mass_assignment false
      include BehaviorWithAttrProtected 

      ...
    end

Copyright (c) 2008 Eric Chapweske, released under the MIT license
