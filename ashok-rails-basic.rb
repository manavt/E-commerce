Http-verb              Template     Action
get         index        True       True                # display all the records

get         new          True       True                # holds a  form for new product onboard
|
post        create       Flase      True                 # takes all the user input from new page and save the record into table

get         edit         True       True                 # holds a  form for existing product
|
put/patch   update       False      True                 # takes all the user input from edit page and update the record into table

get         show         True       True                 # to display individual record

delete      destroy      False      True                 #  deleting the existing object



To create a form we are having a helper(method) form_for which need an object
to create the form .

How to get object .

Initialize the class for which you are going to create the form .
