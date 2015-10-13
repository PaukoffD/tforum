class TopicsController < ApplicationController
#before_filter :find_forum, only: [:show, :edit, :update, :destroy]
before_action :set_topic, only: [:show, :edit, :update, :destroy]
  

  def index
    
    @topics = Topic.all
	@topics.order(:created_at).last
  end

 
  def show
   @topic = Topic.find(params[:id])
   @post = Post.find_by topic_id: @topic.id
   @topic.views_count=@topic.views_count+1
   @topic.save
  end

  
  def new
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new
	
	@topic.posts.build
  end

  # GET /topics/1/edit
  def edit
  @topic = Topic.find(params[:id])
  end

  
  def create
 @topic = Topic.new(topic_params)

	#topic_params.merge
	# if @topic.save
    #@topic = Topic.new(:name => params[:topic][:name], :last_post_at => Time.now, :forum_id => params[:topic][:forum_id])
 
    #if @post.save
   #   flash[:notice] = "Successfully created topic."
    # redirect_to forum_topics_path(:forum_id)
    #else
   #   redirect :action => 'new'
   # end
  #else
   # render :action => 'new'
  #end
	
	
	
	
	@post = Post.new 
    @topic.last_post_at = Time.now
	@topic.user_id = current_user.id
	@topic.forum_id = params[:forum_id]
	@topic.save
	#@post.content = params[:topic][:posts_attributes][:content]
	@post.topic_id=@topic.id
	@post.user_id = current_user.id
	#@post.save
    respond_to do |format|
    #  if @topic.save
        format.html { redirect_to topic_path(@topic.id), notice: 'Topic was successfully created.' }
       
      #else
      #  format.html { render :new }
       
      end
    end


  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:subject, :user_id, :last_post_at, :forum_id, :topic_id, posts_attributes: [:id,[:text]] )
    end
end
