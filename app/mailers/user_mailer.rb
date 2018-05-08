class UserMailer < ActionMailer::Base
  default from: "support@streetfeast.in"
  def ticket_email_user(user,ticket)
    @user = user.first
    @ticket_id = ticket.id
    mail(to: @user.email, subject: 'Issue raised')
  end
  def ticket_email_admin(user,support_ticket)
  	@user = user.first
  	@support_ticket = support_ticket
    @issue_type = IssueType.where("id=?",@support_ticket.issue_type_id).first
    @admin = User.where("is_admin=?",true).first
  	mail(to: "rahil.max41@gmail.com", subject: 'Issue raised')
  end
end
