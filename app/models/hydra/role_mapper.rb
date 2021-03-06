require 'yaml'
module Hydra::RoleMapper
  extend ActiveSupport::Concern

  module ClassMethods
    def role_names
      map.keys
    end
    def roles(username)
      byname[username]||[]
    end
    
    def whois(r)
      map[r]||[]
    end

    def map
      @map ||= YAML.load(File.open(File.join(Rails.root, "config/role_map_#{Rails.env}.yml")))
    end


    def byname
      return @byname if @byname
      m = Hash.new{|h,k| h[k]=[]}
      @byname = map.inject(m) do|memo, (role,usernames)| 
        ((usernames if usernames.respond_to?(:each)) || [usernames]).each { |x| memo[x]<<role}
        memo
      end
    end
  end
end

