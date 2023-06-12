class ProfilesController < ApplicationController
    def show
        @profile = Profile.find(params[:id])
    end

    def new
        @profile = current_user.profile.new
    end

    def create
        @profile = current_user.profile.new(profile_params)

        if @profile.save
            redirect_to @profile
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit 
        @profile = Profile.find(params[:id])
    end

    def update
        @profile = Profile.find(params[:id])

        if @profile.update(profile_params)
            redirect_to @profile
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def profile_params
        params.require(:profile).permit(:name, :gender, :birth, :location)
    end
end
