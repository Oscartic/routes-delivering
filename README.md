# README

Las gemas instaladas en el proyecto no requieren ninguna configuracion especial, 
salvo figaro para configurar variables de ambiente (usado solamente para configurar heroku). 
Para hacer correr el proyecto se requiere tener una coexion a postgreSQL solamente.   
#Version de Ruby: 
* 2.5.3
#Version de Rails:
* 5.2.3
#Gemas Anexas: 
* gem 'bootstrap', '~> 4.3.1'
* gem 'autoprefixer-rails', '~> 9.1', '>= 9.1.4'
* gem 'jquery-rails'
* gem 'rails-ujs', '~> 0.1.0'
* gem 'will_paginate-bootstrap4'
* gem 'bootstrap4-datetime-picker-rails'
* gem 'figaro'
* gem pry (en ambiente de desarrollo)
#Comandos necesarios para ejecutar la app:
* rails db:create 
* rails db:migrate
* rails db:seed (para cargar alguna data inicial)

Nota: El archivo de seeds se puede ejecutar nuevamente para limpiar la data y retornar a un estado inicial en caso de ser requerido.

Atento a sus comentarios. 
 ___________________________________________________