# frozen_string_literal: true

module AssociationReflections
  module Concern
    require 'active_support/concern'

    extend ActiveSupport::Concern

    included do

      attr_accessor :association_reflections

      def create(params)
        self.association_reflections = ::AssociationReflections::Association.new(params)
        super
      end

      def update(params)
        self.association_reflections = ::AssociationReflections::Association.new(params)
        super
      end

    end
  end
end
