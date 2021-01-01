class User < ApplicationRecord
    #before_save { self.email = email.downcase }#右式のselfは省略可能、左式は省略不可。そのため右式はself.email.downcaseと同じ
    before_save { email.downcase! }#破壊的メソッドには「！」が付きます。これは呼び出し元の変数が変わってしまう可能性を含むメソッドのこと。
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :name,presence: true,length:{maximum: 50}
    validates :email,presence: true,length:{maximum: 255},format: {with: VALID_EMAIL_REGEX},uniqueness: { case_sensitive: false }
end