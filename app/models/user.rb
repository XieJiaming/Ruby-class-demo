class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true, format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
    validates :password, presence: true, confirmation: true, length: {minimum: 4}
    validates :nickname, presence: true

    before_create :encrypt_password
    
    has_many :posts

    def self.login(u)
        pwd = u[:password]
        pw = Digest::SHA1.hexdigest("a#{pwd}z")
        User.find_by(email: u[:email], password: pw)
    end        


    private
    def encrypt_password
        # .password方法是因為superclass中有設定attr_accessor，所以可以直接用發法取用資料
        self.password = Digest::SHA1.hexdigest("a#{self.password}z")
    end
end

# @user = User.find(1)
# @user.encrypt_password
# @user.password = Digest::SHA1.hexdigest("a#{@user.password}z")