class ItemsController < ApplicationController
	before_action :find_item, only: [:show, :edit, :update, :destroy]

	def index
		if user_signed_in?
		  @items = Item.where(:user_id => current_user.id).order(:position)
		end	
	end

	def new
		@item = current_user.items.build
	end

	def create
		@item = current_user.items.build(item_parameters)
		if @item.save
			redirect_to root_path
		else 
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @item.update(item_parameters)
			redirect_to item_path(@item)
		else
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		redirect_to root_path
	end

	def complete
		@item = Item.find(params[:id])
		@item.update_attribute(:completed_at, Time.now)
		redirect_to root_path
	end

	def sort
		params[:item].each_with_index do |id, index|
			Item.where(id: id).update_all(position: index + 1)
		end
		head :ok
	end



	private

		def item_parameters
			params.require(:item).permit(:title, :description, :due_date)
		end

		def find_item
			@item = Item.find(params[:id])
		end
	end

