module Webmanager
  module FormFieldsHelper
    def field_types
      [['Short Answer','string'],['Long Answer','text'],['Email Field','email'], ['URL','url'], ['Phone Number','tel'],
      ['Select List','select'],['Radio Button','radio_buttons'],['Checkbox List','check_list'],['Checkbox','boolean'], ['Date','date'],['Date & Time','datetime'],
      ['Number (Decimal)','decimal'],['Number (Integer)','integer'],['Number (Floating Point)','float']]
    end
  end
end
