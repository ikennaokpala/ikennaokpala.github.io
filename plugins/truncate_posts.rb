module Jekyll
  module Filters
    def summarize(str, moreLink, moreText, splitstr = /\s*<span id="end-intro"/)
      text = str.split(splitstr)
      text.length == 1 ? str : text[0] + "<a href=\"" + moreLink + "\">" + moreText + "</a></p>"
    end
  end
end