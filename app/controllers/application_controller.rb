class ApplicationController < ActionController::Base
    


private

def counts(admin)
  @count_packages = admin.packages.count
end

end

