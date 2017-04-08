module Webmanager
  class FormResponse < ApplicationRecord
    belongs_to :form
    serialize :response, Hash
    before_save :serialize_response

    def serialize_response
      serializable_hash(only: :response)
      # abort(serializable_hash(only: :response).inspect)
    end
  end
end
