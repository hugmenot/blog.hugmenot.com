require 'open-uri'

module Jekyll
  module Filters
    def first_paragraph(contents)
      contents.grep(/.*\n/)[0]
    end

    def distance_of_time_in_words_to_now(date)
      distance_of_time_in_words(date, Time.now)
    end

    def gist(id) # From new-bamboo fork
      js = open("http://gist.github.com/#{id}.js").read
      a = js.match(/document.write\('(<div.+)'\)/)[1].gsub(/\\n/, '').gsub(/\\"/, '"').gsub(/\\\//, '/')
      print a
      a
    end

    private

    def distance_of_time_in_words(from_time, to_time)
      from_time = from_time.to_time if from_time.respond_to?(:to_time)
      to_time = to_time.to_time if to_time.respond_to?(:to_time)
      distance_in_minutes = (((to_time - from_time).abs) / 60).round
      distance_in_seconds = ((to_time - from_time).abs).round

      return case distance_in_minutes
        when 0: 'Less than a minute ago'
        when 1: 'About a minute ago'
        when 2..44: "About #{distance_in_minutes} minutes ago"
        when 45..89: 'About an hour ago'
        when 90..1439: "About #{(distance_in_minutes.to_f / 60.0).round} hours ago"
        when 1440..2879: 'Yesterday'
        when 2880..43199: "#{(distance_in_minutes / 1440).round} days ago"
        when 43200..86399: 'A month ago'
        when 86400..525599: "#{(distance_in_minutes / 43200).round} months ago"
        when 525600..1051199: 'Over a year ago'
        else "Over #{(distance_in_minutes / 525600).round} years ago"
      end
    end
  end
end