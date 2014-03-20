namespace :app do

  desc "Populate Months with data"
  task :populate_months => :environment do

    #INSERT THESE
    [
      {:title => "Inspect and Grease Cooling Towers", :completed => false},
      {:title => "Inspect and Grease Water Pumps", :completed => false},
      {:title => "Inspect and Grease Liebert CRAC Units", :completed => false},
      {:title => "Spot Check inside of Liebert CRAC Units + Filter Check", :completed => false},
      {:title => "Check Gaseous Fire Suppression", :completed => false},
      {:title => "Check Fire Extinguishers", :completed => false},
    ].each do |attributes|
      Month.create(attributes)
    end
  end
end