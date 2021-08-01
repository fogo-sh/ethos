# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ethos.Repo.insert!(%Ethos.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Ethos.Repo.insert!(%Ethos.Data.Tenant{
  name: "jacks space",
  icon: "apple"
})

Ethos.Repo.insert!(%Ethos.Data.Tenant{
  name: "void",
  icon: "pear"
})

Ethos.Repo.insert!(%Ethos.Data.Tenant{
  name: "ether",
  icon: "strawberry"
})
