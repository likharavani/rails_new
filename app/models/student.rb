class Student < ApplicationRecord
# after_commit :download_pdf
after_create :send_welcome_email

scope :solve, -> (name){ where("name=?",name)}
scope :solve1, -> (name){where("name=?",name)}

def download_pdf
  puts "hiiiiiii"
  client = Student.find(1)
  puts "////////////"
  send_data generate_pdf(client),
            filename: "#{client.name}.pdf",
            type: "application/pdf"
end
private
def generate_pdf(client)
  Prawn::Document.new do
    text client.name, align: :center
    text "Address: #{client.address}"

  end.render
end


def send_welcome_email
  SendEmailsJob.perform_now(self)
end
end
