class User < ApplicationRecord

 has_secure_password validations: true
 validates :mail, presence: true, uniqueness: true

 has_many :todos

 has_many :todos, :dependent => :destroy
# 退会ユーザーに紐づくTODOを削除する


  def self.new_remember_token
      SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
      Digest::SHA256.hexdigest(token.to_s)
  end

end
