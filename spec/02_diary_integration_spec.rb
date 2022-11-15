require 'diary_entry'
require 'Diary'

RSpec.describe "Integration tests" do
    context "When initialising" do
        it "Creates an instance of class diary" do
            diary = Diary.new
            expect(diary.all).to eq []
        end
    end

    context "Once initialized" do
        it "Adding a diary entry adds that entry to the array" do
            diary = Diary.new
            entry1 = DiaryEntry.new("Entry 1", "Text 1")
            entry2 = DiaryEntry.new("Entry 2", "Text 2")
            diary.add(entry1)
            diary.add(entry2)
            expect(diary.all).to eq [entry1, entry2]
        end
    end

    describe "#count_words" do
        it "returns 0 when no entries have been added" do
            diary = Diary.new
            expect(diary.count_words).to eq 0
        end

        it "counts the words in all diary entries" do
            diary = Diary.new
            entry1 = DiaryEntry.new("Entry 1", "Text 1")
            entry2 = DiaryEntry.new("Entry 2", "Text 2")
            diary.add(entry1)
            diary.add(entry2)
            expect(diary.count_words).to eq 4
        end
    end

    describe "Reading time behaviour" do

        it 'fails where wpm is 0' do
            diary = Diary.new
            de1 = DiaryEntry.new("Title", "Contents")
            diary.add(de1)
            expect {diary.reading_time(0)}.to raise_error "WPM must be > 0"
        end

        it "Calculates the reading time for all entries where it fits inexactly" do
            diary = Diary.new
            entry1 = DiaryEntry.new("Entry 1", "Text 1 here")
            entry2 = DiaryEntry.new("Entry 2", "Text 2 here")
            diary.add(entry1)
            diary.add(entry2)
            expect(diary.reading_time(2)).to eq 3
        end
    end            
    describe "Reading time behaviour" do
        it "Calculates the reading time for all entries where it fits exactly" do
            diary = Diary.new
            entry1 = DiaryEntry.new("Entry 1", "Text here")
            entry2 = DiaryEntry.new("Entry 2", "Text 2 here")
            diary.add(entry1)
            diary.add(entry2)
            expect(diary.reading_time(2)).to eq 3
        end
    end            

    describe "Best reading time behaviour" do

        it "fails when wpm is 0" do
            diary = Diary.new
            entry1 = DiaryEntry.new("Entry 1", "Text here is too long to read in the time")
            diary.add(entry1)
            expect{diary.find_best_entry_for_reading_time(0, 1)}.to raise_error "WPM must be > 0"
        end

        context "Where we have just one entry and it's readable in the time" do
            it "returns that entry" do
                diary = Diary.new
                entry1 = DiaryEntry.new("Entry 1", "Text here")
                diary.add(entry1)
                expect(diary.find_best_entry_for_reading_time(2, 1)).to eq entry1
            end
        end

        context "Where we have just one entry and it is not readable in the time" do
            it "returns nil" do
                diary = Diary.new
                entry1 = DiaryEntry.new("Entry 1", "Text here is too long to read in the time")
                diary.add(entry1)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq nil
            end
        end

        context "Where we have multiple entries" do
            it "returns the longest entry readable in th time given" do
                diary = Diary.new
                best_entry = DiaryEntry.new("Best", "Best entry")
                entry1 = DiaryEntry.new("Entry 1", "Text")
                entry2 = DiaryEntry.new("Entry 2", "Text 2 here")
                entry3 = DiaryEntry.new("Entry 3", "Text 3 goes in here")
                diary.add(entry1)
                diary.add(entry2)
                diary.add(entry3)
                diary.add(best_entry)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq best_entry
            end
        end


    end            
end