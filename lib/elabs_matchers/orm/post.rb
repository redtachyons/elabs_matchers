require "active_model"

module ElabsMatchers
  module Orm
    class Post
      extend ActiveModel::Naming
      include ActiveModel::Validations

      attr_accessor :title
      validates_presence_of :title

      class << self
        def find(id)
          new(:title => @@persisted_post.title)
        end

        def create(attributes = {})
          @@persisted_post = new(attributes)
        end
      end

      def initialize(attributes = {})
        self.title = attributes[:title]
      end

      def save!
      end

      def id
      end
    end
  end
end
