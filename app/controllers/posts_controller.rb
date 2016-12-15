class PostsController < ApplicationController
  def index
  	# gets reference to all mode objects
  	@posts = Post.all
  end

  # run when we open the base page to create a new form
  def new
  	#creates a new single object from the model
  	@post = Post.new
  end

  # run when the submit button is clicked
  # adds the data to the db
  def create
  	# this data must be permitted via the private function "post_params" in this case. see below
  	@post = Post.new(post_params)
  	if @post.save
  		# runs show
  		redirect_to @post
  	# otherwise redirect back to the form again
  	else
  		render 'new'
  	end
  end

  # run when the submit button is clicked (after create)
  # redirects to a new url to display the model object in the view with it's given id in the url
  def show
  	@post = Post.find(params[:id])
  end

  private
  # this private function will permit certain fields to be added to the db table. in this case the title and the body
  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
