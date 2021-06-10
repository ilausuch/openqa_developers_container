# open QA developers container

This repo has the objective to provide a container for open QA developers to test his/her or others forks and/or DB dumps inside a container.


## Basic execution of openQA web UI

Steps:

1. Build the image: `docker-compose build`
2. Execute the container: `docker-compose up -d`
3. Access to the container: `docker-compose exec openqa bash`
4. Change user: `su openqa`
5. Launch the DB and web UI: `~/launch_webui_with_db.sh`
6. Open in a browser: http://localhost:9526


### Preload a dumped BD

Follow the previous steps since 4 and then continue with:

5. Copy your dump to the container: `docker cp <dump_path> openqa_devel_openqa_1:/home/openqa`
6. Launch the DB `~/launch_db.sh`
7. This step is only necessary if you need to create roles. Open the postgres console and create the roles:
   - `psql --host=/home/openqa/openQA-dev/db --dbname=openqa_test`
   - `# create ROLE postgres LOGIN;`
   - `# create ROLE geekotest LOGIN;`
8. Restore your DB `pg_restore --host=/home/openqa/openQA-dev/db --dbname=openqa_test -c <dump_path>`
9. Launch the web UI `~/launch_webui.sh`


### Prepare the repos for PR testing

It is possible to add your fork and branches into the web UI application

1. Go to `~/openqa-dev/repos/openQA`
2. Add you repo `git remote add <name> <url>`
3. Fetch `git fetch --all`
4. Change to your branch `git checkout <branch name>`
5. Reset the web UI


## Roadmap

- web UI (completed)
- worker