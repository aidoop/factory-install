## aidoop-r

- aidoop : Solution family brand of ai-doop.com(http://www.ai-doop.com)
- r : Robotics (Robot Automation Solution)

## prerequisites

- nodejs version 14

## install from docker

- aidoop-r installation script

  - create a folder for the application and change directory to your folder.
  - the script will download a& install aidoop-r

    ```
    # install script for aidoop-r
    curl -fsSL https://raw.githubusercontent.com/things-factory/things-factory/master/packages/aidoop-r/installer/install.sh | bash -s
    ```

  - run 'start.sh' to start aidoop-r and 'stop.sh' to stop the running applicaton.
  - on initial start, run 'migrate.sh' first to migrate database.

  ```
  # data migration
  $ ./start.sh
  $ ./migrate.sh
  $ ./stop.sh

  # restart with service port no.
  $ ./start.sh 80
  ```
