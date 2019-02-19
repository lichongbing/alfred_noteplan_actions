=begin

Produces JSON for the Alfred script filter input to search all headings
contained in all NotePlan files:

    print NotePlan::WikiLinks.new.json

Takes the first top-level heading found in each note.

=end
module NotePlan
  class QuickOpen < Base
    def alfred_items
      [].tap do |array|
        for_each_note do |note_file|
          array << Alfred::Item.new(
            note_file.heading,
            subtitle: note_file.basename,
            arg: note_file.filename
          )
        end
      end.uniq.sort_by(&:title)
    end
  end
end