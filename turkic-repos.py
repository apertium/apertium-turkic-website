#!/usr/bin/env python3
#% vim: set noexpandtab tabstop=3 softtabstop=0 shiftwidth=0:

# before running this script, the following should be run:
#curl -u "user:pass" "https://api.github.com/orgs/apertium/teams/apertium-turkic/repos?per_page=500" > repos.json
#curl -O https://apertium.projectjj.com/pkgs.php

import json
import csv
import os

script_dir = os.path.dirname(__file__)

packages = []
with open(os.path.join(script_dir, "pkgs.php")) as f:
	data = csv.DictReader(f, delimiter='\t')
	for line in data:
		packages.append(line['Package'])

with open(os.path.join(script_dir, "repos.json")) as f:
	data = json.load(f)
	for repo in data:
		if 'name' in repo:
			if repo['name'] in packages:
				print(repo['name'])
#			else:
#				print(repo['name'], "not in nightlies")
#		else:
#			print("HARGLE", data)
