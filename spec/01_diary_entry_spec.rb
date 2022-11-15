require 'diary_entry'

RSpec.describe "DiaryEntry" do
    context "Initialization" do
        it "constructs" do
            de = DiaryEntry.new("Title", "Contents")
            expect(de.title).to eq "Title"
            expect(de.contents).to eq "Contents"
        end
    end

    describe "#count_words" do
        it "counts 0 if no words in Contents" do
            de = DiaryEntry.new("Title", "")
            expect(de.count_words).to eq 0
        end
        
        it "returns 2 if contents has 2 words" do
            de = DiaryEntry.new("Title", "Contents here")
            expect(de.count_words).to eq 2
        end

        it "returns 3 if contents has 3 words" do
            de = DiaryEntry.new("Title", "Contents go here")
            expect(de.count_words).to eq 3
        end
    end

    describe "#reading_time" do

        it "fails if the wpm is zero" do
            de = DiaryEntry.new("My title", "my contents")
            expect {de.reading_time(0)}.to raise_error "WPM must be > 0"
        end

        it "returns zero if no words in Contents" do
            de = DiaryEntry.new("Title", "")
            expect(de.reading_time(2)).to eq 0
        end
        
        it "returns 1 if contents has 2 words and wpm 2" do
            de = DiaryEntry.new("Title", "Contents here")
            expect(de.reading_time(2)).to eq 1
        end

        it "returns 3 if contents has 3 words and wpm 2" do
            de = DiaryEntry.new("Title", "Contents will go here")
            expect(de.reading_time(2)).to eq 2
        end
    end
end