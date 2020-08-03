class QuizzesController < ApplicationController

  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
  before_action :authenticate_admin!, only: [:index, :edit]
  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  def  question
    @quiz = Quiz.find_by(category_id: params[:category_id], group_id: params[:group_id], order: params[:order_id])
    @video = Video.find_by(category_id: params[:category_id], group_id: params[:group_id])
  end

  def check
    @quiz = Quiz.find(params[:id])
    @video = Video.find(params[:video_id])
    next_quiz_order = @quiz.order+1

    if @quiz.answer == params[:answer]
      if Quiz.find_by(category_id: @quiz.category_id, group_id: @quiz.group_id, order: next_quiz_order)
        flash[:answer_message] = "正解！"
        redirect_to "/quiz/#{@quiz.category_id}/#{@quiz.group_id}/#{next_quiz_order}"
      else
        flash[:answer_message] = "Quiz of this Lesson Completed！"
        redirect_to "/categories/#{@quiz.category_id}"
      end
      #redirect_to root_path
    else
      flash[:wrong_message] = "はずれ！！"
      render 'quizzes/question'
    end

  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def authenticate_user
      if !user_signed_in?
        redirect_to root_path
      end
    end

    def authenticate_admin!
      authenticate_user!
      redirect_to root_path  unless current_user.admin?
    end

    # Only allow a list of trusted parameters through.
    def quiz_params
      params.require(:quiz).permit(:content, :answer, :category_id, :group_id, :order)
    end
end
