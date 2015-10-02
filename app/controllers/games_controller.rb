class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    render :form
  end

  def create
    @game = Game.create(game_params)

    if @game.valid?
      redirect_to action: :edit, id: @game.id
    else
      render :form
    end
  end

  def edit
    @game = Game.find(params[:id])
    render :form
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      redirect_to action: :edit, id: @game.id
    else
      render :form
    end
  end

  def destroy
    Game.find(params[:id]).destroy!
    redirect_to action: :index
  end

  protected

  def breadcrumbs_for(action)
    super('edit') + case action
                    when 'index'
                      [['Games', games_path]]
                    when 'new'
                      [['Games', games_path], ['New', new_game_path]]
                    when 'edit'
                      id = params[:game_id] || params[:id]
                      [['Games', games_path], [id, edit_game_path(id)]]
                    end
  end

  private

  def game_params
    params.require(:game).permit(:name)
  end
end
