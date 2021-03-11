
module Authors
  class ElementsController < AuthorsController
    before_action :set_element, only: [:update, :destroy]
    before_action :set_post

    # POST /elements
    # def create
    #   @element = @post.elements.build(element_params)

    #   if @element.save
    #     redirect_to edit_post_path(@post)
    #   else
    #     redirect_to edit_post_path(@post), notice: @element.errors.full_messages.join(". ") << "."
    #   end
    # end
    def create
      @element = @post.elements.build(element_params)

      if @element.save
        notice = nil
      else
        notice = @element.errors.full_messages.join(". ") << "."
      end
      redirect_to edit_post_path(@post), notice: notice
    end

    # PATCH/PUT /elements/1
    def update
     @element.update(element_params)
        redirect_to edit_post_path(@element.post)
    end

    # DELETE /elements/1
    def destroy
      @element.destroy
      redirect_to edit_post_path(@element.post)
    end

    private
      def set_element
        @element = Element.find(params[:id])
      end
  
      def set_post
        @post = current_author.posts.find(params[:post_id])
      end

      def element_params
        params.require(:element).permit(:element_type, :content, :image)
      end
  end
end