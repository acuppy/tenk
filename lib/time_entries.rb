require 'hashie'

module Tenk
  # API methods for TimeEntries resources, which represent time that users are
  # tracking against projects or phases
  class TimeEntries < ::Tenk::Resource
    # Valid parameters for time entry list requests
    class ListRequest < ::Hashie::Trash
      property :from
      property :to
      property :with_suggestions
      property :fields
    end

    # Valid parameters for a time entry get requests
    class GetRequest < ::Hashie::Trash; end

    # Valid parameters for a time entry create requests
    class CreateRequest < ::Hashie::Trash
      property :user_id
      property :assignable_id
      property :project_id
      property :leave_type_id
      property :date
      property :hours
      property :task
      property :notes
    end

    # Valid parameters for a time entry update requests
    class UpdateRequest < CreateRequest; end

    def list(opts = {})
      super(ListRequest.new(opts))
    end

    def get(id)
      super(id, {})
    end

    def create(opts = {})
      super(CreateRequest.new(opts))
    end

    def update(id, opts = {})
      super(id, UpdateRequest.new(opts))
    end
  end
end
