Ansible Role: Customize VMs
=========

Does very basic customization to VMs to prepare them for workload.
- Installs some basic APT packages
- Grows the root filesystem to fill the virtual disk

Requirements
------------

Ubuntu 18.x + VMs.

Role Variables
--------------

This role looks for the `skip_vm_check` variable which is set by `ansible-role-deploy-vms`.

Dependencies
------------

This role expects to run right after the [ansible-role-deploy-vms](https://github.com/jedimt/ansible-role-deploy-vms) role.

Example Playbook
----------------

    # ===========================================================================
    # Customize VMs
    # ===========================================================================
    - name: Customize deployed VMs
      hosts: servers
      gather_facts: false
      tags: play_customize_vms

      vars_files:
        # Ansible vault with all required passwords
        - "../../credentials.yml"

      roles:
        # If passwordless SSH not set up, use ansible_password to authenticate
        - { role: ansible-role-customize-vms,
            ansible_password: "{{ vault_ansible_password }}"
        }

License
-------

MIT

Author Information
------------------

Aaron Patten
aaronpatten@gmail.com
