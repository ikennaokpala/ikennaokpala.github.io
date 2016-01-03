#! /bin/bash
git checkout master
git push
hugo -t freelancer
cp -r public/* .

# echo www.ikennaokpala.com > CNAME
git add --all
git commit -m "updated $(date)"
git push
echo "deployed to http://www.ikennaokpala.com"
