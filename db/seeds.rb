# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

[
  'open',
  'money laundering passed',
  'solicitor found',
  'solicitor paid',
  'memorandum created',
  'transaction form provided',
  'enquiry in progress',
  'mortgage report',
  'documents signed',
  'deposit paid',
  'full amount paid',
  'closed'
].each_with_index do |state, index|
  Status.create(title: state, order_id: index + 1)
end
