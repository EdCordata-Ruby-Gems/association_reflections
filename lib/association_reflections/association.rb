# frozen_string_literal: true

module AssociationReflections
  class Association

    attr_accessor :params

    def initialize(params)
      @params = ::JSON.parse(params.to_json, symbolize_names: false)
    end

  end
end
