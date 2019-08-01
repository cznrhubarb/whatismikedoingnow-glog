# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Whatismikedoingnow.Repo.insert!(%Whatismikedoingnow.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Whatismikedoingnow.GameDesign.Note
alias Whatismikedoingnow.GameDesign.Link
alias Whatismikedoingnow.Accounts.User
alias Whatismikedoingnow.Content.Type
alias Whatismikedoingnow.Content.Item
alias Whatismikedoingnow.Content.Comment
alias Whatismikedoingnow.Repo

Repo.delete_all(Link)
Repo.delete_all(Note)
Repo.delete_all(User)

mike = %User{name: "Mike", level: -1} |> Repo.insert!
mech_note = %Note{text: "this is an idea for a mechanic", x: 10.0, y: 10.0, color: 0xff0000, user: mike} |> Repo.insert!
them_note = %Note{text: "this is an idea for a theme", x: 300.0, y: 100.0, color: 0x00ff00, user: mike} |> Repo.insert!
real_note = %Note{text: "A game where you start with 100vp and the only scoring in the game is losing VP. Most VP still wins at the end of the game.", x: 150.0, y: 400.0, color: 0x0000ff, user: mike} |> Repo.insert!
%Link{text: "", left_note: mech_note, right_note: real_note, user: mike} |> Repo.insert! #TODO: color: 0x00ffff
%Link{text: "", left_note: them_note, right_note: real_note, user: mike} |> Repo.insert! #TODO: color: 0xff00ff

%Type{name: "Music", icon: "fa-music"} |> Repo.insert!
picture = %Type{name: "Picture", icon: "fa-camera-retro"} |> Repo.insert!
%Type{name: "Video", icon: "fa-video"} |> Repo.insert!
%Type{name: "Game", icon: "fa-gamepad"} |> Repo.insert!
%Type{name: "Article", icon: "fa-feather-alt"} |> Repo.insert!
%Type{name: "News", icon: "fa-newspaper"} |> Repo.insert!
%Type{name: "Game Design", icon: "fa-dice"} |> Repo.insert!

minifield = %Item{blurb: "Minifield|Chris \"The Pain Train\" Minifield.\nFor paint club November 2018", thumbnail: "minifield_thumb.png", payload: "mayfield.jpg", type: picture} |> Repo.insert!

%Comment{body: "It almost looks like the real thing!", author: mike, content_item: minifield} |> Repo.insert!