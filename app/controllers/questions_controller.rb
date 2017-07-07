class QuestionsController < ApplicationController
  before_action :load_question, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, except: [:create]

  def edit
  end

  def create
    @question = Question.new(question_params)

    @question.author = current_user

    if check_captcha(@question) && @question.save
      redirect_to user_path(@question.user), notice: 'Вопрос задан.'
    else
      render :edit
    end
  end

  def update
    begin
      if @question.update(question_params)
        redirect_to user_path(@question.user), notice: 'Вопрос сохранен'
      else
        render :edit
      end
    rescue ActiveRecord::StaleObjectError
      flash.now[:alert] = "Вопрос был изменен пока вы его редактировали"
      render :edit, status: :conflict
    end
  end

  def destroy
    user = @question.user
    @question.destroy
    redirect_to user_path(user), notice: 'Вопрос удален :('
  end

  private

  def load_question
    @question = Question.find(params[:id])
  end

  def authorize_user
    reject_user unless @question.user == current_user
  end

  def question_params
    if current_user.present? && params[:question][:user_id].to_i == current_user.id
      params.require(:question).permit(:user_id, :text, :answer, :lock_version)
    else
      params.require(:question).permit(:user_id, :text)
    end
  end

  def check_captcha(model)
    if current_user.present?
      true
    else
      verify_recaptcha(model: model, message: I18n.t(:not_a_robot))
    end
  end
end

