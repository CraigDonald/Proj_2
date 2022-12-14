# File: lib/diary.rb
class Diary
    def initialize
      @entries = []
    end
  
    def add(entry) # entry is an instance of DiaryEntry
      @entries << entry
      # Returns nothing
    end
  
    def all
      # Returns a list of instances of DiaryEntry
      return @entries
    end
  
    def count_words
      # Returns the number of words in all diary entries
      # HINT: This method should make use of the `count_words` method on DiaryEntry.
      return @entries.sum(&:count_words)
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # if the user were to read all entries in the diary.
      fail "WPM must be > 0" unless wpm.positive?
      return (count_words / wpm.to_f).ceil
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
      fail "WPM must be > 0" unless wpm.positive?
      readable_entries(wpm, minutes).max_by(&:count_words)
    end

    private

    def readable_entries(wpm, minutes)
      return @entries.filter do |entry|
        entry.reading_time(wpm) <= minutes
      end
    end
  end
  
