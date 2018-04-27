class LikeController < ApplicationController
  def pic_like
    pic_id = params[:id]
    @pic_like = Like.where("picture_id=? and user_id =? and is_liked =?",pic_id,current_user.id,true)
    if @pic_like.present?
      render text: "true"
    else
      @like = Like.create(:user_id=>current_user.id,:picture_id => pic_id,:is_liked =>true)
      render text: "false"
    end
  end
end
