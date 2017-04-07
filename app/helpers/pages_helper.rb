module PagesHelper
    def link_to_blank(body, url_options = {}, html_options = {})
        link_to(body, url_options, html_options.merge(target: "_blank"))
    end
end