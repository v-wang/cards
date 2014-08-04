class CardsController < ApplicationController
	before_action :set_project, only: [:new, :create, :edit]
  def new
  	@card = Card.new
  end

  def create
  	@card = Card.new(card_params)
  	@card.body = "Put your text here..."
  	@card.project = Project.find(params[:project_id])
    if @project.cards.last
        @card.position = @project.cards.last.position + 1
    else
        @card.position = 1
    end  
    

  	if @card.save
  		respond_to do |format|
  			format.html { redirect_to new_project_card_path(@card.project), notice: 
  			"New card created" }
  			format.js 
  		end
  	else 
  		respond_to do |format|
  			format.html { render :new }	
  			format.js 
  		end
  	end
  end

  def edit
  	@card = Card.find(params[:id])
  end

  def update
  	@card = Card.find(params[:id])
  	if @card.update(card_params)
  		respond_to do |format|
  			format.html {redirect_to project_path(@card.project), notice: "Card updated"}
  			format.json { respond_with_bip(@card) }
  		end
  	else
  		respond_to do |format|
  			format.html { render :edit }
  			format.json { respond_with_bip(@card) }	
  		end
  	end
  end

  def destroy
  	@card = Card.find(params[:id])
  	@card.destroy
  	respond_to do |format|
  		format.html { redirect_to project_path(@card.project), notice: "Card deleted"}
  		format.js { head :no_content }
  	end
  end

  def sort
    cards = params[:card]
    cards.each.with_index do |card, index|
      Card.find(card).update(position: (index + 1))
    end
    respond_to do |format|
      format.js { head :no_content }
    end
  end

  private
  def card_params
  	params.require(:card).permit(:project_id, :body, :title, :position)
  end

  def set_project
  	@project = Project.find(params[:project_id])
  end
end
