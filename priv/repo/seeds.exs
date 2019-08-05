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

# Order matters
Repo.delete_all(Link)
Repo.delete_all(Note)
Repo.delete_all(Comment)
Repo.delete_all(Item)
Repo.delete_all(Type)
Repo.delete_all(User)

mike = %User{name: "Mike", level: -1} |> Repo.insert!
mech_note = %Note{text: "this is an idea for a mechanic", x: 10.0, y: 10.0, color: 0xff0000, user: mike} |> Repo.insert!
them_note = %Note{text: "this is an idea for a theme", x: 300.0, y: 100.0, color: 0x00ff00, user: mike} |> Repo.insert!
real_note = %Note{text: "A game where you start with 100vp and the only scoring in the game is losing VP. Most VP still wins at the end of the game.", x: 150.0, y: 400.0, color: 0x0000ff, user: mike} |> Repo.insert!
%Link{text: "", left_note: mech_note, right_note: real_note, user: mike} |> Repo.insert! #TODO: color: 0x00ffff
%Link{text: "", left_note: them_note, right_note: real_note, user: mike} |> Repo.insert! #TODO: color: 0xff00ff

music_type = %Type{name: "Music", icon: "fa-music"} |> Repo.insert!
picture_type = %Type{name: "Picture", icon: "fa-camera-retro"} |> Repo.insert!
video_type = %Type{name: "Video", icon: "fa-video"} |> Repo.insert!
game_type = %Type{name: "Game", icon: "fa-gamepad"} |> Repo.insert!
article_type = %Type{name: "Article", icon: "fa-feather-alt"} |> Repo.insert!
news_type = %Type{name: "News", icon: "fa-newspaper"} |> Repo.insert!
design_type = %Type{name: "Game Design", icon: "fa-dice"} |> Repo.insert!
book_type = %Type{name: "Book", icon: "fa-book"} |> Repo.insert!
link_type = %Type{name: "Link", icon: "fa-link"} |> Repo.insert!
travel_type = %Type{name: "Travel", icon: "fa-route"} |> Repo.insert!

minifield = %Item{title: "Minifield", blurb: "Chris _\"The Pain Train\"_ Minifield.\nFor paint club November 2018", thumbnail: "/images/mayfield.jpg", payload: "mayfield.jpg", type: picture_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "Minifield", blurb: "Chris _\"The Pain Train\"_ Minifield.\nFor paint club November 2018", thumbnail: "/images/mayfield.jpg", payload: "mayfield.jpg", type: picture_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "The Prince", blurb: "Finished reading Machiavelli's masterpiece. Ready to try out some new management techniques! :triumph:", type: book_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "Minifield", blurb: "Chris _\"The Pain Train\"_ Minifield.\nFor paint club November 2018", thumbnail: "/images/mayfield.jpg", payload: "mayfield.jpg", type: picture_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "Minifield", blurb: "Chris _\"The Pain Train\"_ Minifield.\nFor paint club November 2018", thumbnail: "/images/mayfield.jpg", payload: "mayfield.jpg", type: picture_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "The Prince", blurb: "Finished reading Machiavelli's masterpiece. Ready to try out some new management techniques! :triumph:", type: book_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "The Prince", blurb: "Finished reading Machiavelli's masterpiece. Ready to try out some new management techniques! :triumph:", type: book_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "Minifield", blurb: "Chris _\"The Pain Train\"_ Minifield.\nFor paint club November 2018", thumbnail: "/images/mayfield.jpg", payload: "mayfield.jpg", type: picture_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "Modular Games", blurb: "Working on a new framework for analyzing games, and as a side effect, designing games.", type: book_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "Minifield", blurb: "Chris _\"The Pain Train\"_ Minifield.\nFor paint club November 2018", thumbnail: "/images/mayfield.jpg", payload: "mayfield.jpg", type: picture_type} |> Repo.insert!
:timer.sleep(1000)
%Item{title: "Last Card", blurb: "Chris _\"The Pain Train\"_ Minifield.\nFor paint club November 2018", thumbnail: "/images/mayfield.jpg", payload: "mayfield.jpg", type: picture_type} |> Repo.insert!



%Comment{body: "It almost looks like the real thing!", author: mike, content_item: minifield} |> Repo.insert!