#!/usr/bin/python

import requests
from ansible.module_utils.basic import AnsibleModule

def get_latest_release(repo_slug):
    url = f"https://api.github.com/repos/{repo_slug}/releases/latest"
    response = requests.get(url)

    if response.status_code == 200:
        release_data = response.json()
        tag_name = release_data.get('tag_name', '').lstrip('v')

        # Extract assets
        assets = [
            {"name": asset["name"], "url": asset["browser_download_url"]}
            for asset in release_data.get('assets', [])
        ]

        return tag_name, assets
    else:
        return None, None

def main():
    module_args = {
        'repo_slug': {'type': 'str', 'required': True},
    }

    module = AnsibleModule(argument_spec=module_args)

    repo_slug = module.params['repo_slug']
    latest_version, assets = get_latest_release(repo_slug)

    if latest_version:
        module.exit_json(changed=False, latest_version=latest_version, assets=assets)
    else:
        module.fail_json(msg=f"Failed to retrieve the latest release for '{repo_slug}'")

if __name__ == '__main__':
    main()
