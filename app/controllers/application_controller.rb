require "prawn"
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # before_action :authenticate

  USERS = { "lifo" => "world" }

  def pdf_test(st)
    require "prawn"
    Prawn::Document.generate("#{st.name}.pdf") do
    text "Hello World!"
    end
  end


  private
    def require_login
      http_basic_authenticate_with name: "humbaba", password: "5baa61e4"
    end
    def generate_pdf(student)
      Prawn::Document.new do
        text student.name, align: :center
        text "Address: #{student.address}"
        text "Name: #{student.name}"
      end.render
    end

    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end
    def record_not_found
      render plain: "404 Not Found", status: 404
    end
end
