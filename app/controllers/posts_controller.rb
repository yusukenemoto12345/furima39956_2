class PostsController < ApplicationController
    def index
      @posts = Post
    end
end

