class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = Track.all
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  def edit
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new
    xD = track_params[:xDistanceN].to_i
    puts "x distance is " || xD
    @track.player_id = track_params[:player_id]
    @track.notes =  ""
    @track.raided = false
    if(track_params[:xDirectionN] == "East")
      @track.xMaxN=track_params[:xN].to_i+track_params[:xDistanceN].to_i
      @track.xMinN=@track.xMaxN.to_i-track_params[:xNarrowN].to_i
      @track.xN=@track.xMaxN.to_i- (track_params[:xNarrowN].to_i/2)
      @track.xPN = @track.xN.to_i/8.0
    else
      @track.xMinN=track_params[:xN].to_i - xD
      @track.xMaxN=@track.xMinN.to_i+track_params[:xNarrowN].to_i
      @track.xN=@track.xMaxN.to_i- (track_params[:xNarrowN].to_i/2)
      @track.xPN = @track.xN.to_i/8.0
    end
    if(track_params[:zDirectionN] == "South")
      @track.zMaxN=track_params[:zN].to_i+track_params[:zDistanceN].to_i
      @track.zMinN=@track.zMaxN.to_i-track_params[:zNarrowN].to_i
      @track.zN=@track.zMaxN.to_i- (track_params[:zNarrowN].to_i/2)
      @track.zPN = @track.zN.to_i/8.0
    else
      @track.zMinN=track_params[:zN].to_i-track_params[:zDistanceN].to_i
      @track.zMaxN=@track.zMinN.to_i+track_params[:zNarrowN].to_i
      @track.zN=@track.zMaxN.to_i- (track_params[:zNarrowN].to_i/2)
      @track.zPN = @track.zN.to_i/8.0
    end
    @track.x=0
    @track.z=0
    @track.xMax=0
    @track.zMax=0
    @track.xMin=0
    @track.zMin=0
    @track.xP=0
    @track.zP=0

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { redirect_to players_path }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  def mark_raided
    tr = Track.find(params[:id])
    tr.raided = true
    tr.save()
    redirect_to tr
  end
  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    xD = track_params[:xDistanceN].to_i
    if(!track_params[:notes].nil?)
      @track.notes = track_params[:notes]
    else
      if(track_params[:xDirectionN] == "East")
        @track.xMaxN=track_params[:xN].to_i+track_params[:xDistanceN].to_i
        @track.xMinN=@track.xMaxN.to_i-track_params[:xNarrowN].to_i
        @track.xN=@track.xMaxN.to_i- (track_params[:xNarrowN].to_i/2)
        @track.xPN = @track.xN.to_i/8.0
      else
        @track.xMinN=track_params[:xN].to_i - xD
        @track.xMaxN=@track.xMinN.to_i+track_params[:xNarrowN].to_i
        @track.xN=@track.xMaxN.to_i- (track_params[:xNarrowN].to_i/2)
        @track.xPN = @track.xN.to_i/8.0
      end
      if(track_params[:zDirectionN] == "South")
        @track.zMaxN=track_params[:zN].to_i+track_params[:zDistanceN].to_i
        @track.zMinN=@track.zMaxN.to_i-track_params[:zNarrowN].to_i
        @track.zN=@track.zMaxN.to_i- (track_params[:zNarrowN].to_i/2)
        @track.zPN = @track.zN.to_i/8.0
      else
        @track.zMinN=track_params[:zN].to_i-track_params[:zDistanceN].to_i
        @track.zMaxN=@track.zMinN.to_i+track_params[:zNarrowN].to_i
        @track.zN=@track.zMaxN.to_i- (track_params[:zNarrowN].to_i/2)
        @track.zPN = @track.zN.to_i/8.0
      end
      end
      respond_to do |format|
        if @track.save()
          format.html { redirect_to @track, notice: 'Track was successfully updated.' }
          format.json { render :show, status: :ok, location: @track }
        else
          format.html { render :edit }
          format.json { render json: @track.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /tracks/1
    # DELETE /tracks/1.json
    def destroy
      @track.destroy
      respond_to do |format|
        format.html { redirect_to @track.player, notice: 'Track was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:player_id, :x, :z, :xMax, :zMax, :xMin, :zMin, :xP, :zP, :xN, :zN, :zMaxN, :xMaxN, :xMinN, :zMinN,:xDistanceN, :xNarrowN, :xDirectionN, :zDistanceN, :zNarrowN, :zDirectionN, :xPN, :zPN, :raided, :notes)
    end
  end
