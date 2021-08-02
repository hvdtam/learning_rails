class UserDecorator
  attr_reader :user, :view_context

  delegate :username, :email, :user_role?, :superadmin_role?, to: :user

  def initialize(user, view_context)
    @user = user
    @view_context = view_context
  end

  def name
    "#{username} #{email.first}."
  end
  def staff_badge
    view_context.content_tag :span, "Staff", class: "badge badge-success" if user_role?
  end
  def admin_badge
    view_context.content_tag :span, "Admin", class: "badge badge-primary" if superadmin_role?
  end
end