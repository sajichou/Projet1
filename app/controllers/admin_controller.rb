class AdminController < ApplicationController

  before_action :admin_validated

  def candidates
    roles = Role.where(power:0)
    @candidates = []
    roles.each do |r|
      @candidates << Teacher.find(r.teacher_id)
    end
  end

  def validate
    Role.where(teacher_id:params[:id]).last.update(power:1)
    TeacherMailer.validated(Teacher.find(params[:id])).deliver
    redirect_to '/admin/candidates'
  end

  def validated
    roles = Role.where(power:1)
    @validated = []
    roles.each do |r|
      @validated << Teacher.find(r.teacher_id)
    end
  end

  def invalidate
    Role.where(teacher_id:params[:id]).last.update(power:0)
    redirect_to '/admin/validated'
  end

  def teacher_profile
    id = params[:id]
    @infoteacher = Infoteacher.find_by_teacher_id(id)
  end 

  def detruire_prof
    Teacher.find(params[:id]).destroy
    redirect_to '/admin/validated'
  end

  def eleves
    @users=User.all
  end

  def detruire_eleve
    User.find(params[:id]).destroy
    redirect_to '/admin/eleves'
  end


  private

  def admin_validated
    unless (teacher_signed_in? and Role.where(teacher_id: current_teacher.id).last.power==2)
    #unless (teacher_signed_in? and current_teacher.id==1)
      redirect_to root_path
    end
  end
end
