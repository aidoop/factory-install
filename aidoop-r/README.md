## AIdoop-r

- AIdoop : Solution family brand of ai-doop.com(http://www.ai-doop.com)
- r : Robotics (Robot Automation Solution)

## Prerequisites

- need the docker engine to install 
### Install Docker Engine
- please refer to the following link and install the docker engine
- https://docs.docker.com/engine/install/


## Install AIdoop-R from docker

### AIdoop-r installation script

- create a folder for the application and change directory to your folder.
- the script will download & install aidoop-r

  ```bash
  # install normal aidoop-r 
  curl -fsSL https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/install.sh | bash -s
  ```
- the script will download & install aidoop-r for china

  ```bash
  # install normal aidoop-r for china
  curl -fsSL https://raw.githubusercontent.com/aidoop/factory-install/master/aidoop-r/install-cn.sh | bash -s
  ```
- run 'start.sh' to start aidoop-r and 'stop.sh' to stop the running applicaton.

### Login Preset ID/Password

```
ID: admin@ai-doop.com
PW: admin
```

### Before first application run
- should run 'migrate.sh' first to migrate database.
- Please run the following scripts sequentially

```bash
# data migration
$ ./start.sh
$ ./migrate.sh
$ ./stop.sh

# restart with service port no.  
$ ./start.sh 80
```

## Use usb camera & display of host

- limited to linux host like Ubunut
- uncomment the lines below **'# usb & display access for linux'** in docker-compose.yml as the following
  ```yml
    app:
    container_name: aidoop-r
    image: aidoop/aidoop-r:latest
    privileged: true
    volumes:
      - ./logs:/app/logs
      - ./config.production.js:/app/config.production.js
      - ./license.json:/app/license.json
      # usb & display access for linux
      - /tmp/.X11-unix:/tmp/.X11-unix
      - /dev/bus/usb:/dev/bus/usb
    # environment:
       - DISPLAY=unix$DISPLAY**
  ```


## Use AIdoop-r license file

- rename your license file **'license.json'** to run aidoop-r without any license issue
- For a license file, please contact the license manager (jinwon@ai-doop.com)
