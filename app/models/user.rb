class User < ActiveRecord::Base
  hse_secure_password validations: false
end
