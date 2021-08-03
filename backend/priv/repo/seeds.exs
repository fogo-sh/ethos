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

jacks_space =
  Ethos.Repo.insert!(%Ethos.Data.Tenant{
    name: "jacks space",
    icon: "cherries"
  })

jacks_space_doc_1 =
  Ethos.Repo.insert!(%Ethos.Data.Document{
    tenant_id: jacks_space.id,
    name: "how to build a house",
    icon: "brick"
  })

jacks_space_doc_2 =
  Ethos.Repo.insert!(%Ethos.Data.Document{
    tenant_id: jacks_space.id,
    name: "stories from a balloon",
    icon: "balloon"
  })

void =
  Ethos.Repo.insert!(%Ethos.Data.Tenant{
    name: "void",
    icon: "pear"
  })

ether =
  Ethos.Repo.insert!(%Ethos.Data.Tenant{
    name: "ether",
    icon: "strawberry"
  })

ether_doc_1 =
  Ethos.Repo.insert!(%Ethos.Data.Document{
    tenant_id: ether.id,
    name: "potato",
    icon: "potato"
  })
