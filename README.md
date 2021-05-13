# Cassandra compose-cluster

## Usage

- Rename `.env.sample` -> `.env` and tweak if needed. 

- Run the following commands:
  ``` bash
  $ make setup
  $ make start-all
  ```
### make setup
Make setup does 3 things:
  - create compose volume directories;
  - pull cassandra image && runs temp container;
  - copies config files from the temp container, into the compose volume directories;

this allows for easy customization.

### data directory:
Contains persisted data from each service (/var/lib/cassandra)

### etc directory:
Contains configuration file for each service (/etc/cassandra)
