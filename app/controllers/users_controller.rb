class UsersController < ApplicationController
  def index
    @users = [
      User.new(
        id: 1,
        name: 'Vadim',
        username: 'installero',
        avatar_url: 'https://secure.gravatar.com/avatar/' \
          '71269686e0f757ddb4f73614f43ae445?s=100'
      ),
      User.new(id: 2, name: 'Misha', username: 'aristofun'),
      User.new(id: 3, name: '@Sergey', username: 'fernal9301')
    ]
  end
  
  def new
  end
  
  def edit
  end
  
  def show
    @user = User.new(
      name: 'Sergey',
      username: 'fernal9301',
      avatar_url: nil
    )
  
    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'В чем смысл жизни?', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'Вопрос 3', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'Вопрос 4', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'Вопрос 5', created_at: Date.parse('27.03.2016'))
    ]
  
    @new_question = Question.new
    end
end
