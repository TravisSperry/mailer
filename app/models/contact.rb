class Contact < ActiveRecord::Base

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :format => { :with => /\A\S+@\S+\.\S+\z/ }, :allow_blank => false, :presence => true, :uniqueness => true

  def self.accessible_attributes
   ["first_name", "last_name", "email"]
  end

  def name
    first_name + " " + last_name
  end

  # Access token for a user
  def access_token
    Contact.create_access_token(self)
  end

  # Verifier based on our application secret
  def self.verifier
    ActiveSupport::MessageVerifier.new(Mailer::Application.config.secret_token)
  end

  # Get a user from a token
  def self.read_access_token(signature)
    id = verifier.verify(signature)
    Contact.find_by_id id
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      contact = find_by_id(row["id"]) || new
      contact.attributes = row.to_hash.slice(*accessible_attributes)
      begin
        contact.save!
      rescue ActiveRecord::RecordInvalid => e
        false
      end
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |contact|
        csv << contact.attributes.values_at(*column_names)
      end
    end
  end

  # Class method for token generation
  def self.create_access_token(user)
    verifier.generate(user.id)
  end
end
