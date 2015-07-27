class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :invite, :uninvite, :check_invite, :decline_invite, :check_decline_invite, :check_game_started]

  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User #{@user.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /users/1/invite.js.erb
  def invite
    is_update = false
    inv_user = User.find(params[:invited_user_id])
    if inv_user.invited_user.nil?
      inv_user.invited_user = @user
      is_update = true if inv_user.save
    end

    respond_to do |format|
      if is_update
        format.js
      else
        format.js { render js: "alert('This user already invited!!!');" }
      end
    end
  end

  # POST /users/1/uninvite.js.erb
  def uninvite
    @user.clear_game

    respond_to do |format|
      format.js
    end
  end

  # POST /users/1/check_invite.js.erb
  def check_invite
    respond_to do |format|
      unless @user.invited_user.nil?
        @user_name = @user.invited_user.name
        format.js
      else
        format.js { render js: "$('.invited').hide();" }
      end
    end
  end

  # POST /users/1/decline_invite.js.erb
  def decline_invite
    @user.update(invited_user: nil)

    respond_to do |format|
      format.js { render nothing: true }
    end
  end

  # POST /users/1/check_decline_invite.js.erb
  def check_decline_invite
    respond_to do |format|
      unless User.where(invited_user: @user).any?
        format.js { render :uninvite, layout: false }
      else
        format.js { render nothing: true }
      end
    end
  end

  # POST /users/1/check_game_started.js.erb
  def check_game_started
    respond_to do |format|
      unless @user.game.nil?
        format.js
      else
        format.js { render nothing: true }
      end
    end
  end

  def get_active
    render layout: false
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
