# frozen_string_literal: true

# app/controllers/person_controller.rb
class PeopleController < ApplicationController
  # GET /people or /people.json
  def index
    @people = Person.includes(:employments).order(created_at: :desc)
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to root_url, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(
      :first_name, :last_name, :nickname, :phone, :personal_info, :email,
      :street, :city, :state, :zip,
      employments_attributes: %i[id employer date_started date_ended]
    )
  end
end
