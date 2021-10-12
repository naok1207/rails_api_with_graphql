module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :content, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :label, LabelType, null: true
  end
end
