puts 'required mongoid/embedded_with'

module Mongoid
  module EmbeddedWith
    extend ActiveSupport::Concern

    included do
      puts 'Mongoid::EmbeddedWith included'
    end

    module ClassMethods

      # Adds the relation from an embedded document to its siblings. 
      # The name of the relation needs to be a pluralized form of the
      # child class name.
      #
      # @example Define the relation.
      #   class School
      #     include Mongoid::Document
      #     embeds_many :teachers
      #     embeds_many :students
      #   end
      #
      #   class Teacher
      #     include Mongoid::Document
      #     include Mongoid::EmbeddedWith
      #     embedded_in :school
      #     embedded_with_many :students
      #   end
      #
      #   class Student
      #     include Mongoid::Document
      #     include Mongoid::EmbeddedWith
      #     embedded_in :school
      #     embedded_with_many :teachers
      #   end
      #
      # @param [ Symbol ] name The name of the relation.
      # @param [ Hash ] options The relation options.
      # @param [ Proc ] block Optional block for defining extensions.
      def embedded_with_many(name, options = {}, &block)
        meta = characterize(name, Mongoid::Relations::EmbeddedWith::Many, options, &block)
        self.cyclic = true if options[:cyclic]
        relate(name, meta)
        embed(name, meta)
        validates_relation(meta)
        meta
      end
    end # ClassMethods
  end # EmbeddedWith
end # Mongoid
