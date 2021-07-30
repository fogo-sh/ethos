require "athena"

class Ethos::Controller::ExampleController < ART::Controller
  @[ARTA::Get("/")]
  def index : String
    "Hello World"
  end
end
