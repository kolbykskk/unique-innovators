class ConversationsController < ApplicationController

  before_action :authenticate_user!

  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @recipients = @conversation.recipients - [current_user]
    @conversations = current_user.mailbox.conversations
  end

  def new
    @recipients = User.all - [current_user]
    @conversations = current_user.mailbox.conversations
  end

  def create
    recipients = User.where(id: params[:user_id])
    receipt = current_user.send_message(recipients, params[:body], params[:subject])
    redirect_to conversation_path(receipt.conversation)
  end
end
