require 'rails/railtie'

module PublishedByPeriod

  # Extend ActiveRecord::Base to enable the +publishable+ DSL.
  class Railtie < Rails::Railtie
    initializer 'published_by_period.initialize' do |app|
      ActiveRecord::Base.extend PublishedByPeriod::ClassMethods
    end
  end
end