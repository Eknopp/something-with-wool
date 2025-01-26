# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

---

### To edit the credentials.yml.enc file (master.key in config dir is necessary):

In the terminal:

```sh
docker compose up
docker exec -it something-with-wool-rails-1 bash
EDITOR=vim rails credentials:edit
```

#### Vim editor keys:

- Normal Mode: Press Esc to enter Normal mode.
  In- sert Mode: Press i to enter Insert mode.
- Type :w and press Enter to save the file.
- :q to quit
- :q! to quit without saving.

---

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
