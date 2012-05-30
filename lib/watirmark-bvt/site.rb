module Watirmark
  module BVT
    class << self
      def hostname=(x)
        @@hostname = x
      end

      def hostname
        @@hostname ||= 'bvt.corp.convio.com'
      end
    end

    class Database
      include RestClientHelpers

      attr_reader :username, :password, :url, :sid, :port

      def initialize(tablespace_id)
        tablespace = tablespace_entries(tablespace_id)
        @username = tablespace['name']
        @password = tablespace['name']
        @url      = tablespace['database']['host']
        @sid      = tablespace['database']['sid']
        @port     = tablespace['database']['port']
      end

      def tablespace_entries(id)
        rest_request("tablespaces/#{id}")
      end
    end

    class Site
      include RestClientHelpers

      attr_reader :site_id, :configuration

      def initialize(url)
        @url = url
        @configuration = site_data_entries
        @site_id = @configuration['siteId']
        @tablespace_id = @configuration['tablespace']
      end


      def database
        @database ||= Database.new(@tablespace_id)
      end

      def site_data_entries
        json = rest_request('sites/search', :url=>@url)
        raise RestClientError, "Unable to get site information from #{@url}" if json.empty?
        json.first
      end
    end
  end
end

