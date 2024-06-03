# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# 3boards, c/u con 4 states y al menos 5 tasks, y 3 users
User.delete_all
Board.delete_all
Task.delete_all
State.delete_all

fb = User.create(
    name: 'Freddy Bacigalupo',
    email: 'fbc@example.com',
    password: 'frocks007',
)
gb = User.create(
    name: 'Gianfranco Bobadilla',
    email: 'gbr@example.com',
    password: 'gianfrancobob02',
)
cb = User.create(
    name: 'Clemente Barros',
    email: 'cbb@example.com',
    password: 'cbspasskey',
)


b1 = Board.create(
    title: 'My First board',
    description: 'This board will be used for college assignments',
)
b2 = Board.create(
    title: 'My Second board',
    description: 'This board will be used for work assignments',
)
b3 = Board.create(
    title: 'My Third board',
    description: 'This board will be used for at home tasks',
)

b4 = Board.create(
    title: 'My fourth board',
    description: 'This board will be used for...',
)

b1.users << cb
b1.users << fb
b1.users << gb

b2.users << cb
b2.users << fb


b4.users << cb
b4.users << fb
b4.users << gb


st1 = State.create(name: 'Not started', board_id: 1)
st2 = State.create(name: 'Early stages', board_id: 1)
st3 = State.create(name: 'In progress', board_id: 1)
st4 = State.create(name: 'Finished', board_id: 1)

st11 = State.create(name: 'Not started yet', board_id: 2)
st22 = State.create(name: 'Early stages 2', board_id: 2)
st33 = State.create(name: 'In progress 2', board_id: 2)
st44 = State.create(name: 'Finished 2', board_id: 2)

st111 = State.create(name: 'Not started 3', board_id: 3)
st222 = State.create(name: 'Early stages 3', board_id: 3)
st333 = State.create(name: 'In progress 3', board_id: 3)
st444 = State.create(name: 'Finished 3', board_id: 3)

as1 = AsigneeTask.create(user_id: 1)
as2 = AsigneeTask.create(user_id: 2)
as3 = AsigneeTask.create(user_id: 3)

task1_c = Task.create(
  title: 'Avanzar en web',
  description: 'Navegar las olas del código y explorar nuevas tecnologías.',
  priority: 'High',
  custom_attributes: '',
  state_id: 1,
  user_id: 3,
  asignee_task_id: 1,
)

task2_c = Task.create(
  title: 'Empezar proyecto A01!',
  description: 'Iniciar la travesía hacia la creación de un nuevo proyecto innovador.',
  priority: 'Medium',
  custom_attributes: '',
  state_id: 1,
  user_id: 1,
  asignee_task_id: 2,
)

task3_c = Task.create(
  title: 'Destruir base de datos de la clase',
  description: 'Desmantelar las estructuras de datos con habilidad destructora.',
  priority: 'High',
  custom_attributes: '',
  state_id: 2,
  user_id: 2,
  asignee_task_id: 1,
)

task4_c = Task.create(
  title: 'Hacer modelos relacionales',
  description: 'Construir conexiones sólidas entre datos para dar forma a un modelo robusto.',
  priority: 'Medium',
  custom_attributes: '',
  state_id: 4,
  user_id: 3,
  asignee_task_id: 2,
)

task5_c = Task.create(
  title: 'Contactar al profesor',
  description: 'Buscar orientación y sabiduría del maestro en momentos de incertidumbre.',
  priority: 'Low',
  custom_attributes: '',
  state_id: 3,
  user_id: 1,
  asignee_task_id: 3,
)

task6_c = Task.create(
  title: 'Contactar al ayudante',
  description: 'Solicitar la asistencia del compañero en la lucha contra los desafíos del día a día.',
  priority: 'Low',
  custom_attributes: '',
  state_id: 4,
  user_id: 1,
  asignee_task_id: 2,
)


task1_w = Task.create(
  title: 'Empezar proyecto',
  description: 'Iniciar la travesía hacia la creación de algo nuevo y emocionante.',
  priority: 'High',
  custom_attributes: '',
  state_id: 5,
  user_id: 2,
  asignee_task_id: 3,
)

task2_w = Task.create(
  title: 'Crear base de datos',
  description: 'Dar forma a los cimientos de la información, construyendo un espacio organizado para los datos.',
  priority: 'Medium',
  custom_attributes: '',
  state_id: 5,
  user_id: 2,
  asignee_task_id: 3,
)

task3_w = Task.create(
  title: 'Reunión general',
  description: 'Unir fuerzas y alinear objetivos en una asamblea de camaradería y colaboración.',
  priority: 'High',
  custom_attributes: '',
  state_id: 6,
  user_id: 3,
  asignee_task_id: 1,
)

task4_w = Task.create(
  title: 'Probar códigos',
  description: 'Explorar los laberintos del código en busca de errores y mejoras.',
  priority: 'Medium',
  custom_attributes: '',
  state_id: 7,
  user_id: 2,
  asignee_task_id: 1,
)

task5_w = Task.create(
  title: 'Capacitar a los nuevos',
  description: 'Guiar a los recién llegados por el camino hacia la maestría y la excelencia.',
  priority: 'Low',
  custom_attributes: '',
  state_id: 8,
  user_id: 2,
  asignee_task_id: 3,
)

task6_w = Task.create(
  title: 'Retirar paquetes',
  description: 'Limpiar el área de trabajo eliminando los residuos y preparándola para nuevas aventuras.',
  priority: 'Low',
  custom_attributes: '',
  state_id: 5,
  user_id: 3,
  asignee_task_id: 2,
)

task7_w = Task.create(
  title: 'Avanzar en presentaciones',
  description: 'Dar un paso adelante en la creación de impactantes presentaciones que inspiren y cautiven.',
  priority: 'High',
  custom_attributes: '',
  state_id: 7,
  user_id: 3,
  asignee_task_id: 2,
)


task1_h = Task.create(
  title: 'Secar ropa',
  description: 'Poner fin a la humedad y devolver la frescura a las prendas recién lavadas.',
  priority: 'Low',
  custom_attributes: '',
  state_id: 9,
  user_id: 3,
  asignee_task_id: 2,
)

task2_h = Task.create(
  title: 'Hacer mi almuerzo',
  description: 'Crear un festín para satisfacer el hambre y recargar energías para el resto del día.',
  priority: 'Medium',
  custom_attributes: '',
  state_id: 10,
  user_id: 1,
  asignee_task_id: 2,
)

task3_h = Task.create(
  title: 'Ducharse',
  description: 'Sumergirse en las aguas revitalizantes para refrescar el cuerpo y la mente.',
  priority: 'High',
  custom_attributes: '',
  state_id: 10,
  user_id: 1,
  asignee_task_id: 3,
)

task4_h = Task.create(
  title: 'Lavarse los dientes',
  description: 'Eliminar las impurezas y mantener la sonrisa radiante y saludable.',
  priority: 'High',
  custom_attributes: '',
  state_id: 11,
  user_id: 2,
  asignee_task_id: 1,
)

task5_h = Task.create(
  title: 'Pasear al perro',
  description: 'Explorar el mundo exterior junto a tu leal compañero de cuatro patas.',
  priority: 'Medium',
  custom_attributes: '',
  state_id: 12,
  user_id: 2,
  asignee_task_id: 3,
)

