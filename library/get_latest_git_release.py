#!/usr/bin/python

import requests
from ansible.module_utils.basic import AnsibleModule

def get_latest_release(repo_slug):
    url = f"https://api.github.com/repos/{repo_slug}/releases/latest"
    response = requests.get(url)

    # Check if the request was successful
    if response.status_code == 200:
        return response.json()['tag_name']
    else:
        return None

def main():
    module_args = {
        'repo_slug': {'type': 'str', 'required': True},
    }

    module = AnsibleModule(argument_spec=module_args)

    repo_slug = module.params['repo_slug']
    latest_version = get_latest_release(repo_slug)

    if latest_version:
        module.exit_json(changed=False, latest_version=latest_version)
    else:
        module.fail_json(msg=f"Failed to retrieve the latest release for '{repo_slug}'")

if __name__ == '__main__':
    main()
