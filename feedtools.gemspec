$:.push File.expand_path("../lib", __FILE__)

require "feed_tools"

Gem::Specification.new do |s|
    s.name        = "feedtools"
    s.version     = FeedTools::FEED_TOOLS_VERSION::STRING
    s.authors     = ["Bob Aman", "Alex Oberhauser"]
    s.email       = ["bob@sporkmonger.com", "alex.oberhauser@sigimera.org"]
    s.homepage    = "https://github.com/obale/feedtools"
    s.summary     = "Parsing, generation, and caching system for xml news feeds."
    s.description = "Implements a simple system for handling xml news feeds with caching."
    s.files       = Dir["{app,config,db,lib}/**/*"] + ["CHANGELOG.rdoc", "Rakefile", "README.rdoc"]

    s.add_dependency 'activerecord'
    s.add_dependency 'uuidtools'
    s.add_dependency 'builder'
    #s.add_dependency 'activerecord', '>= 1.10.1'
    #s.add_dependency 'uuidtools', '>= 1.0.0'
    #s.add_dependency 'builder', '>= 1.2.4'
end
