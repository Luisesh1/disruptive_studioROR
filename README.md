# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Documentación del Proyecto Ruby on Rails v7
Preparativos
Asegúrate de seguir estos preparativos antes de ejecutar tu proyecto Ruby on Rails v7:

Instalación de Dependencias
Ejecuta el siguiente comando para instalar todas las dependencias de tu proyecto:

shell
Copy code
bundle install
Migración de la Base de Datos
Asegúrate de que tu base de datos esté actualizada. Ejecuta las migraciones con el siguiente comando:

shell
Copy code
rails db:migrate
Importación de Datos desde un Archivo CSV
Si deseas importar datos desde un archivo CSV, utiliza la tarea personalizada csv_import:import. Asegúrate de proporcionar la ruta completa al archivo CSV como argumento. Por ejemplo:

shell
Copy code
rake csv_import:import['public/csvs/origen.csv']
Precompilación de Recursos Assets
Para compilar los recursos de tu aplicación, ejecuta el siguiente comando:

shell
Copy code
rake assets:precompile
Configuración de API Key
Edición de Credenciales
Para configurar tu API Key en el proyecto, utiliza las credenciales de Rails. Ejecuta el siguiente comando para editar las credenciales:

shell
Copy code
rails credentials:edit
Agregar la API Key
Dentro del archivo de credenciales, agrega tu API Key en el siguiente formato:

yaml
Copy code
coinapi_key: xxxxxxxxxxxxxxxxxxxx
Iniciar el Proyecto
Una vez que hayas realizado todos los preparativos y configurado tu API Key, puedes iniciar tu proyecto Ruby on Rails v7 con el siguiente comando:

shell
Copy code
rails s
¡Tu proyecto estará en funcionamiento y listo para su uso!

¡Disfruta de tu desarrollo con Ruby on Rails v7!




