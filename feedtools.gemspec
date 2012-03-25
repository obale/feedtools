$:.push File.expand_path("../lib", __FILE__)

require "feed_tools/version"

Gem::Specification.new do |s|
    s.name        = "feedtools"
    s.version     = FeedTools::FEED_TOOLS_VERSION::STRING
    s.authors     = ["Bob Aman", "Alex Oberhauser"]
    s.email       = ["bob@sporkmonger.com", "alex.oberhauser@sigimera.org"]
    s.homepage    = "https://github.com/obale/feedtools"
    s.summary     = "Parsing, generation, and caching system for xml news feeds."
    s.description = "Implements a simple system for handling xml news feeds with caching."
    s.files       = Dir["{db,lib}/**/*"] + ["CHANGELOG.rdoc", "Rakefile", "README.rdoc"]

    s.require_paths = ["lib"]

    if s.respond_to? :specification_version then
        s.specification_version = 3

        if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
            s.add_runtime_dependency(%q<activerecord>, [">= 0"])
            s.add_runtime_dependency(%q<uuidtools>, [">= 1.0.0"])
            s.add_runtime_dependency(%q<builder>, [">= 1.2.4"])
        else
            s.add_dependency(%q<activerecord>, [">= 0"])
            s.add_dependency(%q<uuidtools>, [">= 1.0.0"])
            s.add_dependency(%q<builder>, [">= 1.2.4"])
        end
    else
        s.add_dependency(%q<activerecord>, [">= 0"])
        s.add_dependency(%q<uuidtools>, [">= 1.0.0"])
        s.add_dependency(%q<builder>, [">= 1.2.4"])
    end
    #    s.add_dependency 'activerecord'
    #    s.add_dependency 'uuidtools'
    #    s.add_dependency 'builder'
end
