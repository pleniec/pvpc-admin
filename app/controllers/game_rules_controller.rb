class GameRulesController < GamesController
  before_action :set_game

  def index
    @game_rules = @game.game_rules.to_a
  end

  def new
    @game_rule = @game.game_rules.build
    render :form
  end

  def create
    @game_rule = @game.game_rules.create(game_rule_params)

    if @game_rule.valid?
      redirect_to action: :edit, id: @game_rule.id
    else
      render :form
    end
  end

  def edit
    @game_rule = @game.game_rules.find(params[:id])
    render :form
  end

  def update
    @game_rule = @game.game_rules.find(params[:id])

    if @game_rule.valid?
      redirect_to action: :edit, id: @game_rule.id
    else
      render :form
    end
  end

  def destroy
    @game.game_rules.find(params[:id]).destroy!
    redirect_to action: :index
  end

  protected

  def breadcrumbs_for(action)
    super('edit') + case action
                    when 'index'
                      [['Rules', game_game_rules_path(params[:game_id])]]
                    when 'new'
                      [
                        ['Rules', game_game_rules_path(params[:game_id])],
                        ['New', new_game_game_rule_path(params[:game_id])]
                      ]
                    when 'edit'
                      [
                        ['Rules', game_game_rules_path(params[:game_id])],
                        [params[:id], edit_game_game_rule_path(params[:game_id], params[:id])]
                      ]
                    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def game_rule_params
    params.require(:game_rule).permit(:description)
  end
end
