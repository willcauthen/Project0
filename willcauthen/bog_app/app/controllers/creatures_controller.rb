class CreaturesController < ApplicationController
	# show all the creatures
	def index
		@creatures = Creature.all
		render :index
	end
	def new
		@creature = Creature.new
		render :new
	end
	def create
		creature_params = params.require(:creature).permit(:name, :description)
		# create a new creature with those parameters
		creature = Creature.new(creature_params)
		# check it was saved
		if creature.save
			redirect_to creature
		end
	end
	def show
		id = params[:id]
		@creature = Creature.find(id)
		render :show
	end
	def edit
		id = params[:id]
		@creature = Creature.find(id)
		render :edit
	end
	def update
		creature_id = params[:id]
		creature = Creature.find(creature_id)
		updated_attributes = params.require(:creature).permit(:name, :description)
		creature.update_attributes(updated_attributes)
		redirect_to creature
	end
	def destroy
		id = params[:id]
		creature = Creature.find(id)
		creature.destroy
		redirect_to creatures_path
	end
end
