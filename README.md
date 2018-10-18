# Rideshare Installation Guide

### Clone repostiory
Clone the git repository into your projects folder. In terminal:
```
git clone https://github.com/danielchen115/rideshare.git
cd rideshare
```

### Install Docker
Follow the steps on Docker's installation page.

https://docs.docker.com/docker-for-mac/install/

Make sure Docker is 'up and running.'

### Build Project
Generates Rails skeleton.
```
docker-compose run web rails new . --force --database=postgresql
```

Rebuild image with the new Gemfile generated by the previous command.
```
docker-compose build
```

### Install Postgresql
Postgresql is a relational database management system, popular with Rails.
```
brew install postgresql
```
__NOTE__: If Homebrew is not installed, install it first.
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Connect Database
Boot up the app. 
```
docker-compose up
```
This will continue running in the background. Open up a new tab in Terminal.

Create databases.
```
docker-compose run web rake db:create
```
To enter the container's shell, run
```
sudo docker exec -i -t {CONTAINER_ID} bash
```
The CONTAINER_ID can be found using 
```
docker container ls
```
while the container is running.

Migrate database. While in `myapp#`, run 
```
rails db:migrate
```
Visit http://localhost:3000 on a web browser. You should see the Rails default landing page.

To end connection, run
```
docker-compose down
```

To reconnect, run
```
docker-compose up
```
