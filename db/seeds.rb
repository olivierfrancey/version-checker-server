# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create({ first_name: 'Olivier',
              last_name: 'Francey',
              firme: 'miscere',
              email: 'olivier.francey@miscere.ch',
              admin: 2,
              password: 'mickey'})

Group.create({name: '2602',
              project_name: 'Projet test',
              firme: 'miscere'})

Doc.create({  number: '1236',
              title: 'Murs du sous-sol',
              sub_title: 'coffrage',
              comments: '',
              author: 'of',
              version: 4,
              last_version: true,
              doc_type: 'plan',
              size: 'A1',
              group_id: '1',
              doc_date: {2=>2017, 1=>6, 0=>12}})

Doc.create({  number: '1236',
              title: 'Murs du sous-sol',
              sub_title: 'coffrage',
              comments: '',
              author: 'of',
              version: 3,
              last_version: false,
              doc_type: 'plan',
              size: 'A1',
              group_id: '1',
              doc_date: {2=>2017, 1=>5, 0=>2}})
