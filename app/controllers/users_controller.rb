class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def download_pdf
    send_file(
      "#{Rails.root}/public/Practice_Fusion.pdf",
      filename: "Practice_fusion_pdf_downloaded_from_rails.pdf",
      type: "application/pdf"
    )
  end

  def feed
    ## @QRDA_file = IO.read("#{Rails.root}/db/QRDAs/CMS22v2_in_BP.xml")
    send_file(
      #@QRDA_file,
      "#{Rails.root}/db/QRDAs/CMS22v2_in_BP.xml",
      filename: "QRDA.xml"
    )
    
    #send to a paritcular address

    # not sure I liked this: @user.randomize.feedpts(user_params)
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
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
        UserMailer.welcome_email(@user).deliver_now
        format.html { redirect_to @user, notice: 'User was successfully created.' }
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
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :email, :password, :target, :rate)
    end
end
