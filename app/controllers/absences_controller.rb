class AbsencesController < ApplicationController


	def ponctuelle

		#On check l eligibilité
		if Absencesponctuelle.where(user_id:current_user.id, cour_id:params[:id]).length < 1
			date_derniere_abs = 0
		else
			derniere_abs = Absencesponctuelle.where(user_id:current_user.id, cour_id:params[:id]).last
			date_derniere_abs = Lesson.find(derniere_abs.lesson_id).date.to_date
		end

		if (Time.zone.today - date_derniere_abs) < 30
			flash[:info] = "Vous avez déjà signalé une absence dans le mois."
			redirect_to controller: 'cours', action: 'show_inscrit', id: params[:id]
		else

		#On enregistre l'absence
			lesson = Cour.find(params[:id]).lessons.last
			Absencesponctuelle.create(cour_id:params[:id], user_id:current_user.id, lesson_id:lesson.id)
		
		#On update la presence de l'eleve pour le prochain cours
			Presence.where(lesson_id:lesson.id, user_id:current_user.id).last.update(absence:true)
			flash[:info] = "Votre absence a bien été enregistrée."
			redirect_to controller: 'cours', action: 'show', id: params[:id]
		end
	end


end
