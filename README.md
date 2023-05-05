### Automatizacion PSQL con DB DV RENTAL
Se creo un automatización usando docker compose para levantar una DB psql y un administrador PGADMIN en dos contenedores. 

#### PSQL Container
Se copian los archivos de respaldo de la db DVDRENTAL dentro de la carpeta `entrypoint-initdb.d`. 
Se copia un archivo bash para iniciar el script restore.sql.
Se crea un volumen db-data para respaldar y persistir los cambios que se hagan en el contenedor.

```
version: '3.8'
services:
  db:
    container_name: pg_container
    volumes:
      - db-data:/var/lib/postgresql/data
      - ./db:/docker-entrypoint-initdb.d
      - ./init_db_bash.sh:/data/init_db_bash.sh
    image: postgres
    restart: always
    environment:
      POSTGRES_USER: root
      POSTGRES_PASSWORD: root
      POSTGRES_DB: test_db
    ports:
      - "5432:5432"
#    command: bash  /data/init_db_bash.sh
  pgadmin:
    container_name: pgadmin4_container
    image: dpage/pgadmin4
    restart: always
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@admin.com
      PGADMIN_DEFAULT_PASSWORD: root
    ports:
      - "5050:80"
```

