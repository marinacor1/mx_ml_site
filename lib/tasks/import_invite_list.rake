namespace :wedding do
  desc "Import invite list"
  task :import_invites=> :environment do
    filename = 'lib/assets/invite_list.csv'
    CSV.foreach(filename, headers: true) do |row|
      clean_row = row.to_h.delete_if {|k,v| k.nil? }
      Guest.create(clean_row)
      puts "Invite #{{row.to_h}} created."
  end
end
