module Webmanager
  module FormFieldsHelper
    def field_types
      [['Select a field type',nil],['Short Answer','string'],['Long Answer','text'],['Email Field','email'], ['URL','url'], ['Phone Number','tel'],
      ['Seleect List','select'],['Radio Button','radio_buttons'],['Checkbox List','check_list'],['Checkbox','boolean'], ['Date','date'],['Date & Time','datetime'],
      ['Number (Decimal)','decimal'],['Number (Integer)','integer'],['Number (Floating Point)','float']]
    end
  end
end
