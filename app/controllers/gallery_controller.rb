class GalleryController < ApplicationController
  def index
    @client = YouTubeIt::Client.new(:dev_key => "AI39si7BEqkz7hc8-oMyq_Pxkt11Z3dloRjfV22LN7sv-y14E6drJwd5IMoCDPbKCgr4BTu6pWrY-mA3uO6LhufAfQ8sVs8BaA")
    
    user = 'ctfxc'
    vids_per_page = 50
    
    @user = @client.videos_by(:user => user, :per_page => 1)    
    
    @total_pages = 2#(Float(@user.total_result_count) / Float(vids_per_page)).ceil

    pbar = ProgressBar.new("Gallery progress", @total_pages)

    i = 1;    
    @vids = []
    
    (1..@total_pages).each do
      @vids << @client.gallery_videos(:user => user,:page => i, :per_page => vids_per_page).videos
      
      pbar.set(i)
      i += 1
    end
 
=begin
    while i <= @total_pages
      @vids << @client.gallery_videos(:user => 'CTFxC',:page => i, :per_page => vids_per_page).videos
      
      pbar.set(i)
      i += 1
    end 
=end    
    pbar.finish 
       
  end
  def test
    @client = YouTubeIt::Client.new(:dev_key => "AI39si7BEqkz7hc8-oMyq_Pxkt11Z3dloRjfV22LN7sv-y14E6drJwd5IMoCDPbKCgr4BTu6pWrY-mA3uO6LhufAfQ8sVs8BaA")
     
    @user = @client.gallery_videos(:user => 'CTFxC',:page => 1, :per_page => 50)
    
    @total_pages = (Float(@user.total_result_count) / Float(@user.max_result_count)).ceil

    pbar = ProgressBar.new("Gallery progress", @total_pages)

    i = 1;    
    @vids = []
    while i <= @total_pages
      @vids << @client.videos_by(:user => 'CTFxC',:page => i, :per_page => 50).videos
      
      pbar.set(i)
      i += 1
    end 
    pbar.finish

  end
end
