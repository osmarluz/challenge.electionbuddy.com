class VotersController < ApplicationController
  before_action :authenticate_user!, except: [:ballot, :submit, :election_history]
  before_action :set_voter, only: [:show, :edit, :update, :destroy, :election_history]
  before_action :set_election, only: [:index, :new, :create]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render 'record_not_found'
  end

  # GET /voters
  # GET /voters.json
  def index
    @voters = @election.voters
  end

  # GET /voters/1
  # GET /voters/1.json
  def show
  end

  # GET /voters/new
  def new
    @voter = Voter.new
  end

  # GET /voters/1/edit
  def edit
  end

  # POST /voters
  # POST /voters.json
  def create
    @voter = Voter.new(voter_params.merge(election: @election))

    respond_to do |format|
      if @voter.save
        format.html { redirect_to @voter, notice: 'Voter was successfully created.' }
        format.json { render :show, status: :created, location: @voter }
      else
        format.html { render :new }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /voters/1
  # PATCH/PUT /voters/1.json
  def update
    respond_to do |format|
      if @voter.update(voter_params)
        format.html { redirect_to @voter, notice: 'Voter was successfully updated.' }
        format.json { render :show, status: :ok, location: @voter }
      else
        format.html { render :edit }
        format.json { render json: @voter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /voters/1
  # DELETE /voters/1.json
  def destroy
    election = @voter.election
    @voter.destroy
    respond_to do |format|
      format.html { redirect_to election_voters_url(election), notice: 'Voter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ballot; end

  def submit; end

  def election_history
    @election = @voter.election
    @user = @election.user
    @audits = @election.audits
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voter
      @voter = Voter.find(params[:id])
    end

    def set_election
      @election = Election.find(params[:election_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voter_params
      params.require(:voter).permit(:name, :email, :election_id)
    end
end
