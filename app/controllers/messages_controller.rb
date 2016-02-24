class MessagesController < ApplicationController

  def new
    @currentuser = User.find(session[:id])
    @temp_users = User.where("is_admin = ?", false)
    @users =[]
    @temp_users.each do |user|
      if user.email != @currentuser.email
        @users << user
      end
    end
  end

  def create
    @message = Message.new(message_params)
    @message.sender_email = User.find(session[:id]).email
    if @message.save
      flash[:notice]="Message was successfully sent."
      redirect_to(:controller => 'messages', :action => 'show')
    else
      flash[:notice]="Message creation failed"
      redirect_to(:controller => 'messages', :action => 'new')
    end
  end

  def show
    @currentuser = User.find(session[:id])
    @to_messages = Message.where("sender_email = ?", @currentuser.email)
    @from_messages = Message.where("reciever_email = ?", @currentuser.email)
  end

  def showreply

  end

  def reply
    @currentuser = User.find(session[:id])
    @reciever_user = User.find(params[:id])
    @message = Message.new(message_params)
    @message.sender_email = @currentuser.email
    @message.reciever_email = @reciever_user.email

    if @message.save
      flash[:notice]="Message was successfully sent."
      redirect_to(:controller => 'messages', :action => 'show')
    else
      flash[:notice]="Message creation failed"
      redirect_to(:controller => 'messages', :action => 'new')
    end

  end

  private
  def set_message
    @message = Message.find_by_id(params[:id])
  end

  def message_params
    params.require(:message).permit(:sender_email, :reciever_email, :msg_text, :is_req)
  end

end
