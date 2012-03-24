module FeedTools
    class FeedItem::GdacsResource
        def initialize
            super
            @feed_data = nil
            @feed_data_type = :xml
            @xml_document = nil
            @root_node = nil
            @time = Time.now.gmtime
            @version = FeedTools::FEED_TOOLS_VERSION::STRING
        end

        def dispose()
            @feed_data = nil
            @feed_data_type = nil
            @xml_document = nil
            @root_node = nil
            @time = nil
            @version = nil
        end

        def full_parse
            self.xml_document
            self.root_node

            self.feed_type
            self.feed_version

            self.link
            self.type
            self.source

            self.gdacs_title
            self.gdacs_description
            self.gdacs_accesslevel
            self.gdacs_acknowledgements
            self.gdacs_xslt
        end

        def feed_data
            return @feed_data
        end

        def feed_data=(new_feed_data)
            @time = nil
            @feed_data = new_feed_data
        end

        def feed_data_type
            return @feed_data_type
        end

        def feed_data_type=(new_feed_data_type)
            @feed_data_type = new_feed_data_type
            if self.feed_data_type != :xml
                @xml_document = nil
            end
        end

        def xml_document
            if @xml_document.nil?
                return nil if self.feed_data.blank?
                if self.feed_data_type != :xml
                    @xml_document = nil
                else
                    @xml_document = REXML::Document.new(self.feed_data)
                end
            end
            return @xml_document
        end

        def root_node
            if @root_node.nil?
                if self.xml_document.nil?
                    return nil
                end
                @root_node = self.xml_document.root
            end
            return @root_node
        end

        def root_node=(new_root_node)
            @root_node = new_root_node
        end

        def link
            if @link.nil?
                @link = FeedTools::HtmlHelper.unescape_entities(
                    FeedTools::XmlHelper.try_xpaths(self.root_node,
                                                    ["@url"], :select_result_value => true))
                if @link.start_with?("[gdacs]")
                    @link["[gdacs]"] = "http://gdacs.org"
                end
            end
            return @link
        end

        def link=(new_link)
            @link = new_link
        end

        def type
            if @type.nil?
                @type = FeedTools::HtmlHelper.unescape_entities(
                    FeedTools::XmlHelper.try_xpaths(self.root_node,
                                                    ["@type"], :select_result_value => true))
            end
            return @type
        end

        def type=(new_type)
            @type = new_type
        end

        def source
            if @source.nil?
                @source = FeedTools::HtmlHelper.unescape_entities(
                    FeedTools::XmlHelper.try_xpaths(self.root_node,
                                                    ["@source"], :select_result_value => true))
            end
            return @source
        end

        def source=(new_source)
            @source = new_source
        end

        def gdacs_title
            if @gdacs_title.nil?
                @gdacs_title = FeedTools::HtmlHelper.unescape_entities(
                    FeedTools::XmlHelper.try_xpaths(self.root_node,
                                                    ["gdacs:title/text()"], :select_result_value => true))
            end
            return @gdacs_title
        end

        def gdacs_title=(new_gdacs_title)
            @gdacs_title = new_gdacs_title
        end

        def gdacs_description
            if @gdacs_description.nil?
                @gdacs_description = FeedTools::HtmlHelper.unescape_entities(
                    FeedTools::XmlHelper.try_xpaths(self.root_node,
                                                    ["gdacs:description/text()"], :select_result_value => true))
            end
            return @gdacs_description
        end

        def gdacs_description=(new_gdacs_description)
            @gdacs_description = new_gdacs_description
        end

        def gdacs_accesslevel
            if @gdacs_accesslevel.nil?
                @gdacs_accesslevel = FeedTools::HtmlHelper.unescape_entities(
                    FeedTools::XmlHelper.try_xpaths(self.root_node,
                                                    ["gdacs:accesslevel/text()"], :select_result_value => true))
            end
            return @gdacs_accesslevel
        end

        def gdacs_accesslevel=(new_gdacs_accesslevel)
            @gdacs_accesslevel = new_gdacs_accesslevel
        end

        def gdacs_acknowledgements
            if @gdacs_acknowledgements.nil?
                @gdacs_acknowledgements = FeedTools::HtmlHelper.unescape_entities(
                    FeedTools::XmlHelper.try_xpaths(self.root_node,
                                                    ["gdacs:acknowledgements/text()"], :select_result_value => true))
            end
            return @gdacs_acknowledgements
        end

        def gdacs_acknowledgements=(new_gdacs_acknowledgements)
            @gdacs_acknowledgements = new_gdacs_acknowledgements
        end

        def gdacs_xslt
            if @gdacs_xslt.nil?
                @gdacs_xslt = FeedTools::HtmlHelper.unescape_entities(
                    FeedTools::XmlHelper.try_xpaths(self.root_node,
                                                    ["gdacs:xslt/text()"], :select_result_value => true))
            end
            return @gdacs_xslt
        end

        def gdacs_xslt=(new_gdacs_xslt)
            @gdacs_xslt = new_gdacs_xslt
        end

        def inspect
            return "#<FeedTools::FeedItem::GdacsResource:0x#{self.object_id.to_s(16)} " +
                "LINK:#{self.link}>"
        end
    end
end
