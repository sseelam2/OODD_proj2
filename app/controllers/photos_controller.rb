class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create

    # build a photo and pass it into a block to set other attributes
    @photo = Photo.new(photo_params) do |t|
      if params[:photo][:data]
        t.data      = params[:photo][:data].read
        t.filename  = params[:photo][:data].original_filename
        t.mime_type = params[:photo][:data].content_type
      end
    end
    puts "????????????????????????????????????"
    puts session[:house_id]
    @photo.house_id=session[:house_id]
    # normal save
    if @photo.save
      redirect_to(@photo, :notice => 'Photo was successfully created.')
    else
      render :action => "new"
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to(photos_url)
  end
def getphoto
  puts params[:id] =3
  redirect_to :action => 'serve', :id => params[:id]
end
  def serve
    @photo = Photo.find(params[:id])
    send_data(@photo.data, :type => @photo.mime_type, :filename => "#{@photo.name}.jpg", :disposition => "inline")
  end
  private

  def photo_params
    # same as using "params[:realtor]", except that it:
    # - raises an error if :realtor is not present
    # - allows listed attributes to be mass-assigned
    params.require(:photo).permit(:name, :data, :filename, :mime_type,:house_id)
  end

end