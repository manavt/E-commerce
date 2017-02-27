resources # includes index
resource  # exclude index

*_url
redirect_to articles_url
http://localhost:3000/articles


*_path

redirect_to articles_path
add just uri after your site url
/articles


"#{articles_path}" # /articles

"#{articles_path}"


Session # storage in key and value format
          and used to store the user basic info at the server side  .

Cookies # storage in key and value format
          and used to store the user basic info at the client side  .


Filters : run before , after or around to an action .
Note : Available for only controllers .


Rails < 4
before_filter
after_filter
around_filter

Rails >= 4

before_action
after_action
around_action

syntax :

filter :method

def method
  logic
end
