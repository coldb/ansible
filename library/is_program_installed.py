#!/usr/bin/python

from ansible.module_utils.basic import AnsibleModule
import subprocess

def is_program_installed(name):
    try:
        subprocess.check_output(["which", name], stderr=subprocess.STDOUT)
        return True
    except subprocess.CalledProcessError:
        return False

def main():
    module = AnsibleModule(
        argument_spec={
            "name": {"type": "str", "required": True}
        },
        supports_check_mode=True
    )

    program_name = module.params["name"]
    program_installed = is_program_installed(program_name)

    module.exit_json(
        changed=False,
        name=program_name,
        exists=program_installed
    )

if __name__ == '__main__':
    main()
