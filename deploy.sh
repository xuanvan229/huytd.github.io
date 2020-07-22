#!/usr/bin/env bash
git add -A
git commit -m "Auto deploy"
git push -f >> ~/auto-deploy.log
