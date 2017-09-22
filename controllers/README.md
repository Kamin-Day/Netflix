In the controllers/ directory, you want to have various files containing route handling (the `get "/page" do...` stuff in Sinatra).

Each controller file in this directory should encapsulate one "bucket" of pages. Sometimes you end up with one controller file per model (from models/). But that's not always the case, which is okay.