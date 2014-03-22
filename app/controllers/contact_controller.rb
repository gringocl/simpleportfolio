class ContactController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new contact_params

    if @message.valid?
      ContactMailer.contact_message(@message).deliver
      redirect_to root_path, notice: "Your Message has been successfully sent!"
    else
      flash.now.alert = "Please fill in all fields."
      render :new
    end
  end

  private

    def contact_params
      params.require(:message).permit(:name, :email, :subject, :body)
    end
end
