class PatientsController < ApplicationController

  require 'csv'

  def new
    # binding.pry
    @user = User.find_by(id: params[:user_id])
    @patient = Patient.new
    render "new"
  end


  def create
    binding.pry
    if params[:leads]
      CSV.foreach(params[:leads].path, headers: true) do |lead|
        @patient = Patient.create(name: lead[0] + " " + lead[1], dob: lead[2], height: lead[3], weight: lead[4], health_history: lead[5], medical_history: lead[6], sex: lead[7], age: lead[8], email: lead[9], phone_number: lead[10], address: lead[11])
        @patient.user_id = current_user.id
      end
  else
    @patient = Patient.create(patient_params)
    @patient.user_id = current_user.id
  end
  redirect_to patient_path(@patient)
end


  def show
    @patient = Patient.find_by(id: params[:id])
  end


  def index
    @user = User.find_by(id: params[:user_id])
  end




  private

  def patient_params
    params.require(:patient).permit(:name, :height, :weight, :sex, :phone_number, :address, :email, :health_history, :medical_history, :note)

  end





end