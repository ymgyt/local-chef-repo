================================
local development environment
================================



install
=====

.. code-block:: bash

   make init

Some sensitive data is provided from environment variables, so config your environment variable according to `.envrc.template`.
I prefer direnv, but it is not only way :)

run
===

.. code-block:: bash

   [sudo -AE] chef-client -o "role[workstation-a]" -c client.rb
