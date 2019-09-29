# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Commune.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE COMMUNES_id_seq RESTART WITH 1")
Load.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE LOADS_id_seq RESTART WITH 1")
Service.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE SERVICES_id_seq RESTART WITH 1")
Vehicle.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE VEHICLES_id_seq RESTART WITH 1")
Driver.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE DRIVERS_id_seq RESTART WITH 1")
Route.destroy_all
ActiveRecord::Base.connection.execute("ALTER SEQUENCE ROUTES_id_seq RESTART WITH 1")

c1 = Commune.create(name: "Conchalí")
c2 = Commune.create(name: "El Bosque")
c3 = Commune.create(name: "Huechuraba")
c4 = Commune.create(name: "Independencia")
c5 = Commune.create(name: "La Florida")
c6 = Commune.create(name: "Las Condes")
c7 = Commune.create(name: "Lo Barnechea")
c8 = Commune.create(name: "Macul")
c9 = Commune.create(name: "Maipú")
c10 = Commune.create(name: "Ñuñoa")
c11 = Commune.create(name: "Pedro Aguirre Cerda")
c12 = Commune.create(name: "Peñalolén")
c13 = Commune.create(name: "Providencia")
c14 = Commune.create(name: "Santiago")
c15 = Commune.create(name: "Vitacura")

lg = Load.create(type_load: "General")
lf = Load.create(type_load: "freezer")

Service.create(type_service: "Buscar encomienda", address: "Aurelio Gonzalez 3778", weight: 0.8, commune: c15, route_id: nil, load: lg)
Service.create(type_service: "Retirar encomienda", address: "Av. Manquehue Nte. 1919", weight: 1, commune: c15, route_id: nil, load: lf)
Service.create(type_service: "Retirar encomienda", address: "Vicuña mackenna 881", weight: 22, commune: c14, route_id: nil, load: lg)
Service.create(type_service: "Buscar encomienda", address: "Coquimbo 12", weight: 10, commune: c14, route_id: nil, load: lg)
Service.create(type_service: "Retirar encomienda", address: "Regimiento cazadores 1222", weight: 120, commune: c13, route_id: nil, load: lg)
Service.create(type_service: "Buscar encomienda", address: "Colombia 2312", weight: 120, commune: c10, route_id: nil, load: lf)
Service.create(type_service: "Buscar encomienda", address: "Camino Agricola 3466", weight: 80, commune: c8, route_id: nil, load: lg)
Service.create(type_service: "Retirar encomienda", address: "Nueva Florida 23", weight: 60, commune: c5, route_id: nil, load: lf)
Service.create(type_service: "Buscar encomienda", address: "Cristobal Colon 347", weight: 27, commune: c6, route_id: nil, load: lg)
Service.create(type_service: "Retirar encomienda", address: "Camino al Alba 45", weight: 45, commune: c13, route_id: nil, load: lf)

Vehicle.create(load: lg, driver_id: nil, capacity: 350.0, vehicle_patent: "CVTB-27")
Vehicle.create(load: lg, driver_id: nil, capacity: 350.0, vehicle_patent: "RTFD-96")
Vehicle.create(load: lf, driver_id: nil, capacity: 200.0, vehicle_patent: "CRTH-78")
Vehicle.create(load: lf, driver_id: nil, capacity: 200.0, vehicle_patent: "ASLR-44")
v1 = Vehicle.create(load: lg, driver_id: nil, capacity: 350.0, vehicle_patent: "LSRT-56")

Driver.create(name: "Juan Manuel", last_name: "Valles", phone: "+5699258796", email: "Juan@mail.com", vehicle_id: nil)
Driver.create(name: "Carlos", last_name: "Rios", phone: "+5699258796", email: "carlos@mail.com", vehicle_id: nil)
Driver.create(name: "Pedro Antonio", last_name: "Cerrano", phone: "+5699258796", email: "pedro@mail.com", vehicle_id: nil)
d1 = Driver.create(name: "Camila", last_name: "Aranda", phone: "+5699258796", email: "cami@mail.com", vehicle: v1)
v1.update(driver: d1)
