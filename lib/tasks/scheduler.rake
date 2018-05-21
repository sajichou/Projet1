desc "This task is called by the Heroku scheduler add-on"



task :afficher => :environment do

  ContactusMailer.contact("Scheduler","email de rake","sujet de rake","message de rake").deliver

end

task :rappel_avant_cours => :environment do

  wday = {"lundi":1, "mardi":2, "mercredi":3, "jeudi":4, "vendredi":5,
   "samedi":6, "dimanche":7}

  Cour.all.each do |cour|
  	if  cour.jour.present?
  		if (Date.today.wday + 1) % 7 == wday[cour.jour.to_sym] 
        TeacherMailer.rappel_avant_cours(cour.teacher, cour).deliver
  			cour.inscriptions.each do |inscription|
          UserMailer.rappel_avant_cours(User.find(inscription.user_id), cour).deliver
  		  end
      end
  	end 	  	  	  	  		  	  	  	  		 	 	  	  	  	  	  	
  end
end

task :rappel_apres_cours_prof => :environment do

  wday = {"lundi":1, "mardi":2, "mercredi":3, "jeudi":4, "vendredi":5,
   "samedi":6, "dimanche":7}

  Cour.all.each do |cour|
    if  cour.jour.present?
      if (Date.today.wday == wday[cour.jour.to_sym] and Time.now.hour > (cour.heure+1) and Time.now.hour < (cour.heure+2))
        TeacherMailer.rappel_apres_cours(cour.teacher, cour).deliver
      end
    end                                                               
  end
end

